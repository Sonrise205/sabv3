local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v16 = require(l_ReplicatedStorage_0.Packages.Trove);
local v17 = require(l_ReplicatedStorage_0.Packages.Net);
local v18 = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = require(l_ReplicatedStorage_0.Shared.Snapshot);
local l_Name_0 = script.Name;
local v21 = v17:RemoteEvent("EventService/Water/Burst");
local v22 = v16.new();
local v23 = {};
local function v40() --[[ Line: 36 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v22 (copy), l_RunService_0 (copy), v14 (copy)
    local v24 = v22:Extend();
    local v25 = table.create(4);
    v24:Add(function() --[[ Line: 48 ]]
        -- upvalues: v25 (copy)
        table.clear(v25);
    end);
    local v26 = 0;
    v24:Add(l_RunService_0.PreRender:Connect(function(v27) --[[ Line: 53 ]]
        -- upvalues: v26 (ref), v25 (copy)
        debug.profilebegin("Water Event");
        v26 = v26 + v27;
        for v28, v29 in v25 do
            if v29.target and v29.targetAttachment then
                v29.beam.First.Enabled = true;
                v29.beam.Second.Enabled = true;
                local v30 = math.clamp(v26 - v28 + 1, 0, 1);
                local l_WorldPosition_0 = v29.beam.WorldPosition;
                v29.targetAttachment.Position = l_WorldPosition_0 + (v29.target:GetPivot().Position - l_WorldPosition_0) * v30;
            end;
        end;
        debug.profileend();
    end));
    v24:Add(v14.observeTag("WaterPlayerVFX", function(v32) --[[ Line: 75 ]]
        -- upvalues: v25 (copy), v14 (ref)
        local v33 = script.PlayerVFX.Beam:Clone();
        v33.Parent = v32;
        local v34 = script.PlayerVFX.Torso:Clone();
        v34.Parent = v32;
        local l_v32_Attribute_0 = v32:GetAttribute("WaterIndex");
        v25[l_v32_Attribute_0] = {
            beam = v33, 
            target = nil
        };
        local v39 = v14.observeTag("WaterPlayerVFX", function(v36) --[[ Line: 88 ]]
            -- upvalues: v32 (copy), v33 (copy), v25 (ref)
            if v36 == v32 then
                return nil;
            elseif v36:GetAttribute("WaterIndex") ~= v32:GetAttribute("WaterIndex") % 4 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v33.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v38 = v25[v32:GetAttribute("WaterIndex")];
                v38.target = v36;
                v38.beam.First.Attachment0 = l_Attachment_0;
                v38.beam.Second.Attachment0 = l_Attachment_0;
                v38.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 107 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 112 ]]
            -- upvalues: v34 (copy), v33 (copy), v39 (copy), v25 (ref), l_v32_Attribute_0 (copy)
            v34:Destroy();
            v33:Destroy();
            v39();
            v25[l_v32_Attribute_0] = nil;
        end;
    end));
end;
local function v59() --[[ Line: 122 ]] --[[ Name: createSharks ]]
    -- upvalues: v22 (copy), v14 (copy), v23 (copy), l_RunService_0 (copy)
    local v41 = {};
    v22:Add(v14.observeTag("WaterShark", function(v42) --[[ Line: 124 ]]
        -- upvalues: v23 (ref), v41 (copy)
        local v43 = v42:GetAttribute("SharkType") or "Orcalero Orcala";
        local v44 = script[v43];
        local v45 = v44:Clone();
        v45.PrimaryPart.Anchored = true;
        v45.Parent = v42;
        local v46 = if v44 == script["Orcalero Orcala"] then script.OrcaleroSwim else script.TralaleroSwim;
        local v47 = if v44 == script["Orcalero Orcala"] then script.OrcaleroAttack else script.TralaleroAttack;
        local v48 = v45.AnimationController.Animator:LoadAnimation(v46);
        v48.Priority = Enum.AnimationPriority.Action;
        local v49 = v45.AnimationController.Animator:LoadAnimation(v47);
        v49.Priority = Enum.AnimationPriority.Action4;
        v49.Looped = false;
        v48:Play();
        local function v50() --[[ Line: 144 ]]
            -- upvalues: v48 (copy), v49 (copy)
            v48:Stop(0);
            v48:Destroy();
            v49:Stop(0);
            v49:Destroy();
        end;
        local v51 = v42:GetAttributeChangedSignal("Attack"):Connect(function() --[[ Line: 152 ]]
            -- upvalues: v49 (copy)
            v49:Play();
        end);
        v23[v42.Name] = v45;
        table.insert(v41, v42);
        return function() --[[ Line: 159 ]]
            -- upvalues: v41 (ref), v42 (copy), v51 (copy), v45 (copy), v23 (ref), v50 (ref)
            local v52 = table.find(v41, v42);
            if v52 then
                table.remove(v41, v52);
            end;
            v51:Disconnect();
            v45:Destroy();
            v23[v42.Name] = nil;
            if type(v50) == "function" then
                v50();
                v50 = nil;
            end;
        end;
    end));
    v22:Add(l_RunService_0.PreRender:Connect(function(_) --[[ Line: 176 ]]
        -- upvalues: v41 (copy), v23 (ref)
        debug.profilebegin("WaterEvent:Update Sharks");
        local v54 = {};
        local v55 = {};
        for _, v57 in v41 do
            local v58 = v23[v57.Name];
            if v58 then
                table.insert(v54, v58.PrimaryPart);
                table.insert(v55, v57.CFrame);
            end;
        end;
        workspace:BulkMoveTo(v54, v55, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
    end));
end;
v6.OnStart = function(_) --[[ Line: 194 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v22 (copy), v7 (copy), v10 (copy), v9 (copy), v59 (copy), v14 (copy), l_RunService_0 (copy), v40 (copy)
    local l_v11_ActiveEventData_0 = v11:GetActiveEventData(l_Name_0);
    assert(l_v11_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("WaterEvent", true);
    v22:Add(function() --[[ Line: 199 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v7 (ref), l_Name_0 (ref), v10 (ref), v9 (ref)
        l_ReplicatedStorage_0:SetAttribute("WaterEvent", nil);
        v7:Activate("Blink");
        v7:Stop(l_Name_0, "GrassRecolor");
        v10:Update();
        v9:UpdateOST();
        v9:UpdateAmbience();
    end);
    v22:Add(task.delay(l_v11_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow(), function() --[[ Line: 209 ]]
        -- upvalues: v7 (ref), v22 (ref), l_Name_0 (ref), v10 (ref), v9 (ref), v59 (ref), v14 (ref), l_RunService_0 (ref)
        v7:Activate("Blink");
        local v62 = v22:Add(Instance.new("ColorCorrectionEffect"));
        v62.Brightness = 0.15;
        v62.Contrast = 0.1;
        v62.Saturation = -0.1;
        v62.TintColor = Color3.fromRGB(113, 186, 234);
        v62.Parent = workspace.CurrentCamera;
        v22:Clone(script.Water).Parent = workspace;
        v7:Run(l_Name_0, "GrassRecolor");
        v10:Update();
        v9:UpdateOST();
        v9:UpdateAmbience();
        v59();
        v22:Add(v14.observeCharacters(function(_, v64) --[[ Line: 230 ]]
            -- upvalues: v14 (ref)
            return v14.observeChildren(v64, function(v65) --[[ Line: 231 ]]
                -- upvalues: v14 (ref), v64 (copy)
                if v65.Name ~= "UpperTorso" then
                    return nil;
                else
                    local v66 = {};
                    for _, v68 in script.PlayerBubbles:GetChildren() do
                        local v69 = v68:Clone();
                        v69.Parent = v65;
                        table.insert(v66, v69);
                    end;
                    local v75 = v14.observeChildren(v64, function(v70) --[[ Line: 244 ]]
                        -- upvalues: v66 (copy)
                        if not v70:IsA("Humanoid") then
                            return nil;
                        else
                            local v74 = v70:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 249 ]]
                                -- upvalues: v70 (copy), v66 (ref)
                                local v71 = v70.MoveDirection ~= Vector3.new(0, 0, 0, 0);
                                for _, v73 in v66 do
                                    v73.Enabled = v71;
                                end;
                            end);
                            return function() --[[ Line: 256 ]]
                                -- upvalues: v74 (copy)
                                v74:Disconnect();
                            end;
                        end;
                    end);
                    return function() --[[ Line: 261 ]]
                        -- upvalues: v66 (copy), v75 (copy)
                        for _, v77 in v66 do
                            v77:Destroy();
                        end;
                        table.clear(v66);
                        v75();
                    end;
                end;
            end);
        end));
        v22:Add(function() --[[ Line: 272 ]]
            workspace.Gravity = 196.2;
        end);
        v22:Add(l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 276 ]]
            debug.profilebegin("Water:Gravity");
            workspace.Gravity = 29.429999999999996;
            debug.profileend();
        end));
    end));
    v22:Add(task.spawn(function() --[[ Line: 283 ]]
        -- upvalues: v40 (ref)
        v40();
    end));
end;
v6.OnStop = function(_) --[[ Line: 288 ]] --[[ Name: OnStop ]]
    -- upvalues: v22 (copy)
    v22:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 292 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v21 (copy), v8 (copy), v23 (copy), v12 (copy), v18 (copy), v9 (copy), l_ReplicatedStorage_0 (copy)
    task.spawn(pcall, function() --[[ Line: 293 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v21.OnClientEvent:Connect(function(v81, v82) --[[ Line: 297 ]]
        -- upvalues: v8 (ref), v23 (ref), v12 (ref), v18 (ref), v9 (ref), l_ReplicatedStorage_0 (ref)
        local v83 = v8:GetAnimals()[v82];
        if not v83 then
            return;
        else
            local v84 = v23[v81];
            if v84 then
                v84.Parent:SetAttribute("Attack", not v84.Parent:GetAttribute("Attack"));
            end;
            local v85 = script.Burst:Clone();
            v85.CFrame = CFrame.new(v12.getAnimalPosition(v82, {
                top = true
            }));
            v85.Anchored = false;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v85;
            l_WeldConstraint_0.Part1 = v83.AnimalModel.PrimaryPart;
            l_WeldConstraint_0.Parent = v85;
            v85.Parent = workspace;
            v18.emit(v85);
            v9:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Water["Brainrot Hit"], v85.Position);
            task.delay(3, function() --[[ Line: 323 ]]
                -- upvalues: v85 (copy)
                v85:Destroy();
            end);
            return;
        end;
    end);
end;
return v6;