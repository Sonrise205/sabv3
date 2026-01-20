local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = l_RunService_0:IsServer();
local v4 = l_RunService_0:IsClient();
local function _(v5) --[[ Line: 7 ]] --[[ Name: getToolPlayer ]]
    -- upvalues: l_Players_0 (copy)
    return v5:FindFirstAncestorOfClass("Player") or l_Players_0:GetPlayerFromCharacter(v5.Parent);
end;
return function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: RegisterTool ]]
    -- upvalues: v4 (copy), l_Players_0 (copy), l_CollectionService_0 (copy)
    if not v9 then
        local _ = {};
    end;
    local v11 = {};
    local function v27(v12) --[[ Line: 15 ]] --[[ Name: wrapTool ]]
        -- upvalues: v8 (copy), v11 (copy), v4 (ref), l_Players_0 (ref)
        assert(v12:IsA("Tool"), (("tried to wrap %*"):format(v12)));
        local v13 = nil;
        local function _() --[[ Line: 19 ]] --[[ Name: construct ]]
            -- upvalues: v13 (ref), v8 (ref), v12 (copy), v11 (ref)
            if v13 then
                return;
            else
                local v14 = v8(v12);
                assert(v14, (("no cleanup function given for tool %*"):format(v12)));
                v13 = v14;
                v11[v12] = v13;
                return;
            end;
        end;
        local function _() --[[ Line: 40 ]] --[[ Name: deconstruct ]]
            -- upvalues: v13 (ref), v11 (ref), v12 (copy)
            if v13 then
                task.spawn(v13);
                v13 = nil;
                v11[v12] = nil;
            end;
        end;
        if v4 then
            local function v19() --[[ Line: 49 ]] --[[ Name: checkConstructClient ]]
                -- upvalues: v12 (copy), l_Players_0 (ref), v13 (ref), v8 (ref), v11 (ref)
                local l_v12_0 = v12;
                if not l_v12_0:FindFirstAncestorOfClass("Player") then
                    local _ = l_Players_0:GetPlayerFromCharacter(l_v12_0.Parent);
                end;
                if v12.Parent and (v12.Parent == l_Players_0.LocalPlayer:FindFirstChild("Backpack") or v12.Parent == l_Players_0.LocalPlayer.Character) then
                    if v13 then
                        return;
                    else
                        l_v12_0 = v8(v12);
                        assert(l_v12_0, (("no cleanup function given for tool %*"):format(v12)));
                        v13 = l_v12_0;
                        v11[v12] = v13;
                        return;
                    end;
                else
                    if v13 then
                        task.spawn(v13);
                        v13 = nil;
                        v11[v12] = nil;
                    end;
                    return;
                end;
            end;
            if not v12:FindFirstAncestorOfClass("Player") then
                local _ = l_Players_0:GetPlayerFromCharacter(v12.Parent);
            end;
            if v12.Parent and (v12.Parent == l_Players_0.LocalPlayer:FindFirstChild("Backpack") or v12.Parent == l_Players_0.LocalPlayer.Character) then
                if not v13 then
                    local v21 = v8(v12);
                    assert(v21, (("no cleanup function given for tool %*"):format(v12)));
                    v13 = v21;
                    v11[v12] = v13;
                end;
            elseif v13 then
                task.spawn(v13);
                v13 = nil;
                v11[v12] = nil;
            end;
            v12.AncestryChanged:Connect(v19);
        else
            local function v24() --[[ Line: 60 ]] --[[ Name: checkConstructServer ]]
                -- upvalues: v12 (copy), l_Players_0 (ref), v13 (ref), v8 (ref), v11 (ref)
                local l_v12_1 = v12;
                local v23 = l_v12_1:FindFirstAncestorOfClass("Player") or l_Players_0:GetPlayerFromCharacter(l_v12_1.Parent);
                if v23 and (v12.Parent == v23.Character or v12.Parent == v23:FindFirstChild("Backpack")) then
                    if v13 then
                        return;
                    else
                        l_v12_1 = v8(v12);
                        assert(l_v12_1, (("no cleanup function given for tool %*"):format(v12)));
                        v13 = l_v12_1;
                        v11[v12] = v13;
                        return;
                    end;
                else
                    if v13 then
                        task.spawn(v13);
                        v13 = nil;
                        v11[v12] = nil;
                    end;
                    return;
                end;
            end;
            local v25 = v12:FindFirstAncestorOfClass("Player") or l_Players_0:GetPlayerFromCharacter(v12.Parent);
            if v25 and (v12.Parent == v25.Character or v12.Parent == v25:FindFirstChild("Backpack")) then
                if not v13 then
                    local v26 = v8(v12);
                    assert(v26, (("no cleanup function given for tool %*"):format(v12)));
                    v13 = v26;
                    v11[v12] = v13;
                end;
            elseif v13 then
                task.spawn(v13);
                v13 = nil;
                v11[v12] = nil;
            end;
            v12.AncestryChanged:Connect(v24);
        end;
    end;
    local v28 = ("Tool_%*"):format(v7);
    for _, v30 in l_CollectionService_0:GetTagged(v28) do
        task.spawn(v27, v30);
    end;
    l_CollectionService_0:GetInstanceAddedSignal(v28):Connect(v27);
    l_CollectionService_0:GetInstanceRemovedSignal(v28):Connect(function(v31) --[[ Line: 79 ]]
        -- upvalues: v11 (copy)
        if v11[v31] then
            v11[v31]();
            v11[v31] = nil;
        end;
    end);
end;