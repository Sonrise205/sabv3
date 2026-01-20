local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
if l_RunService_0:IsServer() then
    return {
        apply = function(v2, v3) --[[ Line: 7 ]] --[[ Name: apply ]]
            local v4 = ("Gradients_%*"):format(v3);
            v2:AddTag(v4);
            return function() --[[ Line: 10 ]]
                -- upvalues: v2 (copy), v4 (copy)
                v2:RemoveTag(v4);
            end;
        end
    };
else
    local v5 = require(l_ReplicatedStorage_0.Packages.Observers);
    local v6 = require(l_ReplicatedStorage_0.Packages.FFlags);
    local v7 = {};
    local v8 = {};
    local v9 = {};
    for _, v11 in script.Effects:GetChildren() do
        v7[v11.Name] = require(v11);
        v8[v11.Name] = {};
        table.insert(v9, v11.Name);
    end;
    local function v23(v12, v13) --[[ Line: 39 ]] --[[ Name: apply ]]
        -- upvalues: v7 (copy), v8 (copy)
        assert(typeof(v13) == "string", "effect is not a string");
        local v14 = assert(v7[v13], "Effect not found").apply(v12, v13);
        local v15 = {
            enabled = true, 
            main = v14.main, 
            stroke = v14.stroke
        };
        table.insert(v8[v13], v15);
        local v16 = nil;
        local v17 = nil;
        local function v19() --[[ Line: 54 ]] --[[ Name: cleanup ]]
            -- upvalues: v16 (ref), v17 (ref), v8 (ref), v13 (copy), v15 (copy), v14 (ref)
            if v16 then
                v16:Disconnect();
                v16 = nil;
            end;
            if v17 then
                v17:Disconnect();
                v17 = nil;
            end;
            local v18 = table.find(v8[v13], v15);
            if v18 then
                table.remove(v8[v13], v18);
            end;
            if v14 and v14.cleanup then
                v14.cleanup();
                v14 = nil;
            end;
        end;
        local v20 = nil;
        local function v22() --[[ Line: 77 ]] --[[ Name: onAncestryUpdate ]]
            -- upvalues: v20 (ref), v12 (copy), v15 (copy)
            if v20 then
                v20:Disconnect();
                v20 = nil;
            end;
            local l_v12_FirstAncestorWhichIsA_0 = v12:FindFirstAncestorWhichIsA("LayerCollector");
            if not l_v12_FirstAncestorWhichIsA_0 then
                v15.enabled = true;
                return;
            else
                v15.enabled = l_v12_FirstAncestorWhichIsA_0.Enabled;
                v20 = l_v12_FirstAncestorWhichIsA_0:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 88 ]]
                    -- upvalues: v15 (ref), l_v12_FirstAncestorWhichIsA_0 (copy)
                    v15.enabled = l_v12_FirstAncestorWhichIsA_0.Enabled;
                end);
                return;
            end;
        end;
        v17 = v12.AncestryChanged:Connect(v22);
        v22();
        v16 = v12.Destroying:Connect(v19);
        return v19;
    end;
    local v24 = 1;
    l_RunService_0.PostSimulation:Connect(function(v25) --[[ Line: 102 ]]
        -- upvalues: v6 (copy), v9 (copy), v24 (ref), v8 (copy), v7 (copy)
        local l_v6_Instant_0 = v6:GetInstant("Gradients.DistributeLoad", true);
        local l_v6_Instant_1 = v6:GetInstant("Gradients.DistributeLoadBudget", 0.001);
        debug.profilebegin("Gradients:Simulate");
        local v28 = if l_v6_Instant_0 then l_v6_Instant_1 else 1e999;
        local v29 = 1;
        while v29 < #v9 and v28 > 0 do
            local v30 = v9[v24];
            v29 = v29 + 1;
            v24 = v24 + 1;
            if v24 > #v9 then
                v24 = 1;
            end;
            local v31 = v8[v30];
            if #v31 ~= 0 then
                debug.profilebegin(v30);
                debug.profilebegin("Simulate");
                local v32 = os.clock();
                local v33 = v7[v30].simulate(v25);
                debug.profileend();
                debug.profilebegin("Apply");
                for _, v35 in v31 do
                    if v35.enabled then
                        v35.main.Color = v33.main;
                        if v35.stroke and v33.stroke then
                            v35.stroke.Color = v33.stroke;
                        end;
                    end;
                end;
                v28 = v28 - (os.clock() - v32);
                debug.profileend();
                debug.profileend();
            end;
        end;
        debug.profileend();
    end);
    for v36 in v8 do
        v5.observeTag(("Gradients_%*"):format(v36), function(v37) --[[ Line: 151 ]]
            -- upvalues: v23 (copy), v36 (copy)
            return (v23(v37, v36));
        end);
    end;
    return {
        apply = v23
    };
end;