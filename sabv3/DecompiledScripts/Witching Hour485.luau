local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v5 = {};
local v6 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v7 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Packages.Observers);
local v12 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.FFlags);
local v14 = require(l_ReplicatedStorage_0.Packages.Trove);
local v15 = require(l_ReplicatedStorage_0.Packages.Net);
local v16 = require(l_ReplicatedStorage_0.Packages.Spr);
local v17 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v19 = v15:RemoteEvent("EventService/WitchingHour/Projectile");
local v20 = v15:RemoteEvent("EventService/WitchingHour/Burst");
local v21 = v14.new();
v5.OnStart = function(_) --[[ Line: 30 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), l_Lighting_0 (copy), v21 (copy), v6 (copy), v11 (copy), v10 (copy), v8 (copy)
    assert((v9:GetActiveEventData(l_Name_0)));
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = script;
        v21:Add(function() --[[ Line: 37 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    v21:Clone(script.PurpleSky).Parent = l_Lighting_0;
    v6:Run("WitchingHourEvent", "GrassRecolor");
    v21:Add(function() --[[ Line: 45 ]]
        -- upvalues: v6 (ref)
        v6:Stop("WitchingHourEvent", "GrassRecolor");
    end);
    v6:Run("WitchingHourEvent", "WallRecolor");
    v21:Add(function() --[[ Line: 50 ]]
        -- upvalues: v6 (ref)
        v6:Stop("WitchingHourEvent", "WallRecolor");
    end);
    v6:Run("WitchingHourEvent", "WallBottomRecolor");
    v21:Add(function() --[[ Line: 55 ]]
        -- upvalues: v6 (ref)
        v6:Stop("WitchingHourEvent", "WallBottomRecolor");
    end);
    v21:Clone(script.Map).Parent = workspace;
    v21:Add(function() --[[ Line: 60 ]]
        -- upvalues: v6 (ref)
        v6:Activate("Blink");
    end);
    v21:Add(v11.observeTag("HideInWitchingHour", function(v24) --[[ Line: 64 ]]
        local l_Parent_0 = v24.Parent;
        v24.Parent = script;
        return function() --[[ Line: 67 ]]
            -- upvalues: v24 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 68 ]]
                -- upvalues: v24 (ref), l_Parent_0 (ref)
                v24.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v10:Update();
    v8:UpdateOST();
    v6:Activate("Blink");
end;
v5.OnStop = function(_) --[[ Line: 79 ]] --[[ Name: OnStop ]]
    -- upvalues: v21 (copy)
    v21:Destroy();
end;
v5.OnLoad = function(_) --[[ Line: 83 ]] --[[ Name: OnLoad ]]
    -- upvalues: v7 (copy), v19 (copy), l_RunService_0 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v12 (copy), v16 (copy), v20 (copy), v17 (copy)
    local _ = function(v28) --[[ Line: 84 ]] --[[ Name: getTargetPosition ]]
        -- upvalues: v7 (ref)
        local v29 = v7:GetAnimals()[v28];
        if not v29 then
            return (Vector3.new(0, 0, 0, 0));
        else
            local _ = nil;
            local l_AnimalModel_0 = v29.AnimalModel;
            return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
        end;
    end;
    v19.OnClientEvent:Connect(function(v33, v34, v35, v36, v37) --[[ Line: 102 ]]
        -- upvalues: l_RunService_0 (ref), v8 (ref), l_ReplicatedStorage_0 (ref), v7 (ref), v12 (ref), v16 (ref)
        local l_Model_0 = workspace.Events["Witching Hour"]:FindFirstChild("Model");
        local v39 = l_Model_0 and l_Model_0:FindFirstChild("Sammy");
        if not v39 then
            return;
        else
            local v40 = v39.Humanoid.Animator:LoadAnimation(script.Shoot);
            v40.Looped = false;
            v40:Play();
            v40.Ended:Once(function() --[[ Line: 112 ]]
                -- upvalues: v40 (copy)
                v40:Stop();
                v40:Destroy();
            end);
            local v41 = false;
            local l_WorldCFrame_0 = v39["Cylinder.001"].Attachment.WorldCFrame;
            local v43 = script.Projectile:Clone();
            v34 = v34 + v36;
            local v44 = v34 + v35;
            local v45 = math.min(v37 * 0.5, 50);
            local v46 = Random.new():NextUnitVector() * (Random.new():NextInteger(0, 1) * 2 - 1) * v45 * 0.65;
            v46 = Vector3.new(v46.X, Random.new():NextNumber(-2, 7) * (v45 / 50), v46.Z);
            local v47 = Random.new():NextUnitVector() * (Random.new():NextInteger(0, 1) * 2 - 1) * v45;
            v47 = Vector3.new(v47.X, Random.new():NextNumber(-2, 7) * (v45 / 50), v47.Z);
            if v37 <= 15 then
                v46 = Vector3.new(0, 0, 0, 0);
                v47 = Vector3.new(0, 0, 0, 0);
            end;
            local v48 = nil;
            v48 = l_RunService_0.PreRender:Connect(function() --[[ Line: 141 ]]
                -- upvalues: v44 (copy), v34 (ref), v35 (copy), v48 (ref), v43 (copy), v41 (ref), l_WorldCFrame_0 (ref), v39 (copy), v8 (ref), l_ReplicatedStorage_0 (ref), v33 (copy), v7 (ref), v12 (ref), v46 (ref), v47 (ref), v16 (ref)
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local v50 = math.max(v44 - l_workspace_ServerTimeNow_0, 0);
                local v51 = l_workspace_ServerTimeNow_0 < v34 and 0 or 1 - v50 / v35;
                if v51 >= 1 then
                    v48:Disconnect();
                    v43:Destroy();
                    return;
                else
                    if v51 > 0 and not v41 then
                        v41 = true;
                        l_WorldCFrame_0 = v39["Cylinder.001"].Attachment.WorldCFrame;
                        v43.Parent = workspace;
                        task.spawn(function() --[[ Line: 158 ]]
                            -- upvalues: v8 (ref), l_ReplicatedStorage_0 (ref), l_WorldCFrame_0 (ref)
                            v8:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Witching Hour"].Shot, l_WorldCFrame_0.Position);
                        end);
                    end;
                    local l_Position_0 = l_WorldCFrame_0.Position;
                    local l_v33_0 = v33;
                    local v54 = v7:GetAnimals()[l_v33_0];
                    local v55;
                    if not v54 then
                        v55 = Vector3.new(0, 0, 0, 0);
                    else
                        local _ = nil;
                        local l_AnimalModel_1 = v54.AnimalModel;
                        v55 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
                    end;
                    v43.CFrame = CFrame.new(v12.cubicBezier(v51, l_Position_0, l_Position_0:Lerp(v55, 0.4) + v46, l_Position_0:Lerp(v55, 0.8) + v47, v55));
                    l_v33_0 = v39.UpperTorso.Waist;
                    v54 = l_v33_0:GetAttribute("C0");
                    if not v54 then
                        v54 = l_v33_0.C0;
                        l_v33_0:SetAttribute("C0", v54);
                    end;
                    if v51 >= 0.8 then
                        v16.target(l_v33_0, 1, 2, {
                            C0 = v54
                        });
                        return;
                    else
                        local l_CFrame_0 = v39.HumanoidRootPart.CFrame;
                        local v59 = l_CFrame_0:VectorToObjectSpace((v55 - l_CFrame_0.Position).Unit);
                        local v60 = math.clamp(math.atan2(-v59.X, -v59.Z), -1.0471975511965976, 1.0471975511965976);
                        local v61 = math.clamp(math.asin((math.clamp(v59.Y, -1, 1))), -0.2617993877991494, 0.2617993877991494);
                        v16.target(l_v33_0, 1, 2, {
                            C0 = v54 * CFrame.Angles(v61, v60, 0)
                        });
                        return;
                    end;
                end;
            end);
            return;
        end;
    end);
    v20.OnClientEvent:Connect(function(v62) --[[ Line: 193 ]]
        -- upvalues: v7 (ref), v8 (ref), l_ReplicatedStorage_0 (ref), v17 (ref)
        local v63 = v7:GetAnimals()[v62];
        if not v63 then
            return;
        else
            local v64 = v7:GetAnimals()[v62];
            local v65;
            if not v64 then
                v65 = Vector3.new(0, 0, 0, 0);
            else
                local _ = nil;
                local l_AnimalModel_2 = v64.AnimalModel;
                v65 = (if l_AnimalModel_2.PrimaryPart then l_AnimalModel_2.PrimaryPart.CFrame else l_AnimalModel_2:GetPivot()).Position;
            end;
            task.spawn(function() --[[ Line: 201 ]]
                -- upvalues: v8 (ref), l_ReplicatedStorage_0 (ref), v65 (copy)
                v8:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Witching Hour"].Hit, v65);
            end);
            v64 = script.Burst:Clone();
            v64:PivotTo(CFrame.new(v65));
            v64.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v64;
            l_WeldConstraint_0.Part1 = v63.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v64;
            v64.Parent = workspace;
            v17.emit(v64);
            task.delay(5, function() --[[ Line: 218 ]]
                -- upvalues: v64 (copy)
                v64:Destroy();
            end);
            return;
        end;
    end);
end;
return v5;