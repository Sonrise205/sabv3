local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local _ = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local v20 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local v23 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v25 = require(l_ReplicatedStorage_0.Packages.Timer);
local v26 = require(l_ReplicatedStorage_0.Packages.Spr);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v31 = CFrame.new(-410.5, -8, -228.54);
local l_Name_0 = script.Name;
local v33 = v23.new();
local function v52() --[[ Line: 46 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v33 (copy), l_RunService_0 (copy), v19 (copy)
    local v34 = v33:Extend();
    local v35 = table.create(4);
    v34:Add(function() --[[ Line: 57 ]]
        -- upvalues: v35 (copy)
        table.clear(v35);
    end);
    local v36 = 0;
    v34:Add(l_RunService_0.PreRender:Connect(function(v37) --[[ Line: 62 ]]
        -- upvalues: v36 (ref), v35 (copy)
        debug.profilebegin("1x1x1x1 Event");
        v36 = v36 + v37;
        for v38, v39 in v35 do
            if v39.target and v39.targetAttachment then
                v39.beam.First.Enabled = true;
                v39.beam.Second.Enabled = true;
                local v40 = math.clamp(v36 - v38 + 1, 0, 1);
                local l_WorldPosition_0 = v39.beam.WorldPosition;
                v39.targetAttachment.Position = l_WorldPosition_0 + (v39.target:GetPivot().Position - l_WorldPosition_0) * v40;
            end;
        end;
        debug.profileend();
    end));
    v34:Add(v19.observeTag("1x1x1x1PlayerVFX", function(v42) --[[ Line: 84 ]]
        -- upvalues: v35 (copy), v19 (ref), v36 (ref)
        local v43 = v42:GetAttribute("1x1x1x1PlayerVFXVariant") or "Green";
        local v44 = script[("PlayerVFX_%*"):format(v43)];
        local v45 = v44.Beam:Clone();
        v45.Parent = v42;
        local v46 = v44.Torso:Clone();
        v46.Parent = v42;
        local l_v42_Attribute_0 = v42:GetAttribute("1x1x1x1Index");
        v35[l_v42_Attribute_0] = {
            beam = v45, 
            target = nil
        };
        local v51 = v19.observeTag("1x1x1x1PlayerVFX", function(v48) --[[ Line: 100 ]]
            -- upvalues: v42 (copy), v45 (copy), v35 (ref)
            if v48 == v42 then
                return nil;
            elseif v48:GetAttribute("1x1x1x1Index") ~= v42:GetAttribute("1x1x1x1Index") % 4 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v45.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v50 = v35[v42:GetAttribute("1x1x1x1Index")];
                v50.target = v48;
                v50.beam.First.Attachment0 = l_Attachment_0;
                v50.beam.Second.Attachment0 = l_Attachment_0;
                v50.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 119 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        v36 = 0;
        return function() --[[ Line: 126 ]]
            -- upvalues: v46 (copy), v45 (copy), v51 (copy), v35 (ref), l_v42_Attribute_0 (copy)
            v46:Destroy();
            v45:Destroy();
            v51();
            v35[l_v42_Attribute_0] = nil;
        end;
    end));
end;
local function _(v53, v54, v55) --[[ Line: 136 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v33 (copy)
    local v56 = v53:LoadAnimation(v54);
    (v55 or v33):Add(function() --[[ Line: 138 ]]
        -- upvalues: v56 (copy)
        v56:Stop(0);
        v56:Destroy();
    end);
    return v56;
end;
v8.OnStart = function(_) --[[ Line: 146 ]] --[[ Name: OnStart ]]
    -- upvalues: v14 (copy), l_Name_0 (copy), v33 (copy), v52 (copy)
    assert((v14:GetActiveEventData(l_Name_0)));
    v33:Add(task.spawn(v52));
end;
v8.OnStop = function(_) --[[ Line: 153 ]] --[[ Name: OnStop ]]
    -- upvalues: v33 (copy)
    v33:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 157 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v19 (copy), v23 (copy), v25 (copy), l_LocalPlayer_0 (copy), v20 (copy), l_CurrentCamera_0 (copy), v31 (copy), v26 (copy), v13 (copy)
    task.spawn(pcall, function() --[[ Line: 158 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v19.observeTag("1x1x1x1Map", function(v61) --[[ Line: 162 ]]
        -- upvalues: v23 (ref), v19 (ref), v25 (ref), l_LocalPlayer_0 (ref), v20 (ref), l_CurrentCamera_0 (ref), v31 (ref), v26 (ref), v13 (ref)
        local v62 = v23.new();
        v62:Add(v19.observeTag("HideIn1x1x1x1", function(v63) --[[ Line: 165 ]]
            local l_Parent_0 = v63.Parent;
            v63.Parent = script;
            return function() --[[ Line: 168 ]]
                -- upvalues: v63 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 169 ]]
                    -- upvalues: v63 (ref), l_Parent_0 (ref)
                    v63.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script
        }));
        local v65 = nil;
        v62:Add(v25.Simple(0.25, function() --[[ Line: 176 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v20 (ref), l_CurrentCamera_0 (ref), v31 (ref), v65 (ref), v19 (ref)
            if not l_LocalPlayer_0.Character then
                return;
            else
                if v20.isPointInVolume(l_CurrentCamera_0.CFrame.Position, v31, (Vector3.new(129, 52, 169.26400756835938, 0))) then
                    if not v65 then
                        v65 = v19.observeTag("MapVFX", function(v66) --[[ Line: 185 ]]
                            local l_Parent_1 = v66.Parent;
                            v66.Parent = script;
                            return function() --[[ Line: 188 ]]
                                -- upvalues: v66 (copy), l_Parent_1 (copy)
                                pcall(function() --[[ Line: 189 ]]
                                    -- upvalues: v66 (ref), l_Parent_1 (ref)
                                    v66.Parent = l_Parent_1;
                                end);
                            end;
                        end, {
                            workspace, 
                            script
                        });
                        return;
                    end;
                elseif v65 then
                    v65();
                    v65 = nil;
                end;
                return;
            end;
        end));
        v62:Add(function() --[[ Line: 203 ]]
            -- upvalues: v65 (ref)
            if v65 then
                v65();
                v65 = nil;
            end;
        end);
        v62:Add(v19.observeTag("1x1x1x1Latch", function(v68) --[[ Line: 210 ]]
            -- upvalues: v19 (ref), v26 (ref), v13 (ref)
            local l_v68_Pivot_0 = v68:GetPivot();
            return v19.observeAttribute(v68, "Open", function(v70) --[[ Line: 212 ]]
                -- upvalues: v26 (ref), v68 (copy), l_v68_Pivot_0 (copy), v13 (ref)
                if not v70 then
                    v26.target(v68, 0.75, 3.5, {
                        Pivot = l_v68_Pivot_0
                    });
                    v13:PlaySound(script.Door, l_v68_Pivot_0.Position, false);
                else
                    v26.target(v68, 0.75, 3.5, {
                        Pivot = l_v68_Pivot_0 * CFrame.Angles(0, -1.5707963267948966, 0)
                    });
                    v13:PlaySound(script.Door, l_v68_Pivot_0.Position, false);
                end;
                return function() --[[ Line: 221 ]]
                    -- upvalues: v68 (ref), v26 (ref), l_v68_Pivot_0 (ref), v13 (ref)
                    if v68:IsDescendantOf(workspace) then
                        v26.target(v68, 0.75, 3.5, {
                            Pivot = l_v68_Pivot_0
                        });
                        v13:PlaySound(script.Door, l_v68_Pivot_0.Position, false);
                    end;
                end;
            end);
        end, {
            v61
        }));
        return v62:WrapClean();
    end);
end;
return v8;