local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v4 = {};
local l_Matteo_0 = l_ReplicatedStorage_0.Models.Events.Matteo;
local v6 = require(l_ReplicatedStorage_0.Packages.Net);
local v7 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v9 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v10 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v11 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v12 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v13 = require(l_ReplicatedStorage_0.Controllers.EventController);
local l_Name_0 = script.Name;
local v15 = v7.new();
local _ = workspace.CurrentCamera;
v4.OnStart = function(_) --[[ Line: 25 ]] --[[ Name: OnStart ]]
    -- upvalues: v13 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v12 (copy), v15 (copy), v10 (copy), v11 (copy), l_Matteo_0 (copy), v9 (copy), l_Players_0 (copy), v6 (copy)
    local l_v13_ActiveEventData_0 = v13:GetActiveEventData(l_Name_0);
    assert(l_v13_ActiveEventData_0);
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    l_ReplicatedStorage_0:SetAttribute("MatteoEvent", true);
    v12:UpdateOST();
    v15:Add(function() --[[ Line: 33 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v12 (ref)
        l_ReplicatedStorage_0:SetAttribute("MatteoEvent", nil);
        v12:UpdateOST();
    end);
    local v20 = false;
    v15:Add(function() --[[ Line: 39 ]]
        -- upvalues: v20 (ref)
        v20 = true;
    end);
    local v21 = l_v13_ActiveEventData_0.startedAt + 10 - l_workspace_ServerTimeNow_0;
    v15:Add(task.delay(v21, function() --[[ Line: 44 ]]
        -- upvalues: l_v13_ActiveEventData_0 (copy), l_workspace_ServerTimeNow_0 (copy), v10 (ref), v15 (ref), v11 (ref), l_Matteo_0 (ref), v20 (ref), v9 (ref), l_Players_0 (ref), v6 (ref)
        local v22 = l_v13_ActiveEventData_0.startedAt + 14 - l_workspace_ServerTimeNow_0;
        if v22 > 0 then
            local v23 = v10.Bump:Clone();
            v15:Add(v23);
            v23.Sustain = true;
            v15:Add(v10.BindShakeToCamera(v23, workspace.CurrentCamera));
            v23:Start();
            local l_v23_0 = v23 --[[ copy: 1 -> 27 ]];
            v15:Add(task.delay(v22, function() --[[ Line: 53 ]]
                -- upvalues: l_v23_0 (copy)
                l_v23_0:StopSustain();
            end));
            v15:Add(function() --[[ Line: 57 ]]
                -- upvalues: v10 (ref)
                local v25 = v10.Bump:Clone();
                v25.Sustain = true;
                local v26 = v10.BindShakeToCamera(v25, workspace.CurrentCamera);
                v25:Start();
                task.wait(4);
                v25:StopSustain();
                task.wait(2);
                v25:Destroy();
                v26();
            end);
        end;
        local v27 = v11:Wait("MatteoEvent");
        local v28 = v27:Get("IsRainbow");
        local v29 = l_v13_ActiveEventData_0.startedAt + 15 - l_workspace_ServerTimeNow_0;
        local v30 = if v28 then {
            l_Matteo_0.RainbowTrees.Tree1, 
            l_Matteo_0.RainbowTrees.Tree2, 
            l_Matteo_0.RainbowTrees.Tree3, 
            l_Matteo_0.RainbowTrees.Tree4, 
            l_Matteo_0.RainbowTrees.Tree5
        } else {
            l_Matteo_0.NormalTrees.Tree1, 
            l_Matteo_0.NormalTrees.Tree2, 
            l_Matteo_0.NormalTrees.Tree3, 
            l_Matteo_0.NormalTrees.Tree4, 
            l_Matteo_0.NormalTrees.Tree5
        };
        local v31 = {};
        local v32 = {};
        local v33 = script.WindParts:Clone();
        v33.Parent = workspace;
        v15:Add(function() --[[ Line: 87 ]]
            -- upvalues: v33 (copy)
            for _, v35 in v33:GetDescendants() do
                if v35:IsA("ParticleEmitter") then
                    v35.Enabled = false;
                end;
            end;
            task.wait(5);
            v33:Destroy();
        end);
        for v36, v37 in v27:Get("TreePositions") do
            local v38 = Random.new(v37.X * 100 // 1 + v37.Z * 100 // 1);
            local v39 = v38:NextInteger(1, #v30);
            local v40 = v38:NextNumber(0, 6.283185307179586);
            local v41 = v15:Extend();
            v31[v36] = v41;
            local v42 = v30[v39]:Clone();
            local l_v42_ExtentsSize_0 = v42:GetExtentsSize();
            local v44 = CFrame.new(v37) * CFrame.new(0, -l_v42_ExtentsSize_0.Y * 0.5, 0) * CFrame.Angles(0, v40, 0);
            local v45 = CFrame.new(v37) * CFrame.new(0, l_v42_ExtentsSize_0.Y * 0.485, 0) * CFrame.Angles(0, v40, 0);
            local v46 = v41:Clone(l_Matteo_0.SpawnVFX);
            v46.CFrame = CFrame.new(v37) * CFrame.Angles(0, v40, 0);
            v46.Parent = workspace;
            v41:Add(function() --[[ Line: 120 ]]
                -- upvalues: v20 (ref), v9 (ref), v42 (copy), v44 (copy)
                task.wait();
                if v20 then
                    local v47 = v9(v42, TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), v44 * CFrame.new(0, -1, 0));
                    v47:Play();
                    v47.Completed:Wait();
                    v42:Destroy();
                    return;
                else
                    v42:Destroy();
                    return;
                end;
            end);
            if v29 <= 1 then
                v42:PivotTo(v45);
                v46:Destroy();
            else
                v42:PivotTo(v44);
                v41:Add(v9(v42, TweenInfo.new(v29, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), v45)):Play();
                v41:Add(task.delay(v29 - 1, function() --[[ Line: 140 ]]
                    -- upvalues: v46 (copy), v41 (copy)
                    v46.ParticleEmitter.Enabled = false;
                    task.wait(1);
                    v41:Remove(v46);
                end));
            end;
            if v28 then
                for _, v49 in v42:GetChildren() do
                    if v49.Name ~= "Handle" then
                        v49:AddTag("RainbowModel");
                    end;
                end;
            end;
            v42.Parent = workspace;
            local l_Character_0 = l_Players_0.LocalPlayer.Character;
            if (v39 == 1 or v39 == 2 or v39 == 3) and (not l_Character_0 or not l_Character_0:GetAttribute("Matteo_CollectedTree")) then
                local v51 = v41:Clone(l_Matteo_0.ProximityPart);
                table.insert(v32, v51);
                v51.ProximityPrompt.Enabled = false;
                v41:Add(task.delay(v29 - 1, function() --[[ Line: 165 ]]
                    -- upvalues: v51 (copy)
                    v51.ProximityPrompt.Enabled = true;
                end));
                v51:PivotTo(CFrame.new(v37) * CFrame.new(0, 3, 0));
                v51.Parent = workspace;
                v41:Add(v51.ProximityPrompt.Triggered:Connect(function() --[[ Line: 172 ]]
                    -- upvalues: v6 (ref), v36 (copy), v32 (copy)
                    if not v6:Invoke("EventService/Matteo/CollectTree", v36) then
                        return;
                    else
                        for _, v53 in v32 do
                            v53:Destroy();
                        end;
                        table.clear(v32);
                        return;
                    end;
                end));
            end;
        end;
        v27:OnDictionaryRemoved("TreePositions", function(_, v55) --[[ Line: 187 ]]
            -- upvalues: v31 (copy)
            local v56 = v31[v55];
            if v56 then
                v56:Destroy();
                v31[v55] = nil;
            end;
        end);
    end));
end;
v4.OnStop = function(_) --[[ Line: 197 ]] --[[ Name: OnStop ]]
    -- upvalues: v15 (copy)
    v15:Destroy();
end;
v4.OnLoad = function(_) --[[ Line: 201 ]] --[[ Name: OnLoad ]]

end;
return v4;