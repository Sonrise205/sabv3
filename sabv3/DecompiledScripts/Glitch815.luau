local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v4 = {};
local v5 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v6 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v7 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.FFlags);
local v10 = require(l_ReplicatedStorage_0.Packages.Trove);
local v11 = require(l_ReplicatedStorage_0.Packages.Net);
local v12 = require(l_ReplicatedStorage_0.Shared.VFX);
local v13 = v11:RemoteEvent("EventService/Glitch/HoleEffect");
local _ = script.Name;
local v15 = v10.new();
v4.OnStart = function(_) --[[ Line: 26 ]] --[[ Name: OnStart ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v15 (copy), v7 (copy), v6 (copy)
    local _ = Random.new();
    l_ReplicatedStorage_0:SetAttribute("GlitchEvent", true);
    v15:Add(function() --[[ Line: 30 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("GlitchEvent", nil);
    end);
    v7:Update();
    v6:UpdateOST();
end;
v4.OnStop = function(_) --[[ Line: 38 ]] --[[ Name: OnStop ]]
    -- upvalues: v15 (copy)
    v15:Destroy();
end;
v4.OnLoad = function(_) --[[ Line: 42 ]] --[[ Name: OnLoad ]]
    -- upvalues: v13 (copy), v5 (copy), v6 (copy), l_RunService_0 (copy), v12 (copy)
    v13.OnClientEvent:Connect(function(v20, v21) --[[ Line: 43 ]]
        -- upvalues: v5 (ref), v6 (ref), l_RunService_0 (ref), v12 (ref)
        local v22 = v5:GetAnimals()[v20];
        if not v22 then
            return;
        else
            local v23 = script.Hole:Clone();
            local l_Pivot_0 = v22.Instance:GetPivot();
            v23:PivotTo(CFrame.new(l_Pivot_0.X, -9.782 + v23.Size.Y * 0.5, l_Pivot_0.Z + v23.Size.Z * 0.5));
            v23.Parent = workspace;
            task.spawn(function() --[[ Line: 56 ]]
                -- upvalues: v6 (ref), v23 (copy)
                v6:PlaySound("Sounds.Events.Glitch.Hole", v23:GetPivot().Position);
            end);
            local l_Instance_0 = v22.Instance;
            local l_l_Instance_0_Pivot_0 = l_Instance_0:GetPivot();
            local function _(v27) --[[ Line: 65 ]] --[[ Name: simulateGravity ]]
                return v27 * v27 * 98.1;
            end;
            local v29 = nil;
            v29 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 72 ]]
                -- upvalues: v21 (copy), v29 (ref), v23 (copy), v12 (ref), l_Instance_0 (copy), l_l_Instance_0_Pivot_0 (copy)
                debug.profilebegin("Glitch:Hole");
                local v31 = workspace:GetServerTimeNow() - v21;
                local v32;
                if v31 < 0.15 then
                    v32 = 0;
                elseif v31 < 1 then
                    local v33 = math.clamp((v31 - 0.15) / 0.85, 0, 1);
                    v32 = -(v33 * v33 * 98.1);
                else
                    local v34 = 15.696000000000002;
                    local v35 = math.clamp((v31 - 1) / 0.5, 0, 1) * 0.4;
                    v32 = v34 - v35 * v35 * 98.1;
                end;
                if v31 >= 1.5 then
                    v29:Disconnect();
                    v23:Destroy();
                elseif v31 >= 1 then
                    v12.disable(v23);
                end;
                l_Instance_0:PivotTo(l_l_Instance_0_Pivot_0 + Vector3.new(0, v32, 0));
                debug.profileend();
            end);
            return;
        end;
    end);
end;
return v4;