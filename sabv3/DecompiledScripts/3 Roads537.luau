local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local _ = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local _ = require(l_ReplicatedStorage_0.Packages.Timer);
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local _ = script.Name;
v8.OnStart = function(_) --[[ Line: 41 ]] --[[ Name: OnStart ]]

end;
v8.OnStop = function(_) --[[ Line: 43 ]] --[[ Name: OnStop ]]

end;
v8.OnLoad = function(_) --[[ Line: 45 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), l_ReplicatedStorage_0 (copy), v11 (copy), v19 (copy)
    task.spawn(pcall, function() --[[ Line: 46 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    local v35 = nil;
    local v36 = nil;
    local function v44(v37) --[[ Line: 53 ]] --[[ Name: updateRoads ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v11 (ref), v35 (ref), v36 (ref), v19 (ref)
        if l_ReplicatedStorage_0:GetAttribute("3RoadsEvent") then
            if not v37 then
                v11:Activate("Blink");
            end;
            if v35 then
                v35();
                v35 = nil;
            end;
            if not v36 then
                v36 = v19.observeTag("HideIn3Roads", function(v38) --[[ Line: 65 ]]
                    local l_Parent_0 = v38.Parent;
                    v38.Parent = script;
                    return function() --[[ Line: 68 ]]
                        -- upvalues: v38 (copy), l_Parent_0 (copy)
                        pcall(function() --[[ Line: 69 ]]
                            -- upvalues: v38 (ref), l_Parent_0 (ref)
                            v38.Parent = l_Parent_0;
                        end);
                    end;
                end, {
                    workspace, 
                    script
                });
                return;
            end;
        else
            if not v37 then
                v11:Activate("Blink");
            end;
            if not v35 then
                v35 = v19.observeTag("ShowIn3Roads", function(v40) --[[ Line: 81 ]]
                    local l_Parent_1 = v40.Parent;
                    local v42 = false;
                    local v43 = l_Parent_1.Destroying:Once(function() --[[ Line: 85 ]]
                        -- upvalues: v42 (ref), v40 (copy)
                        v42 = true;
                        v40:Destroy();
                    end);
                    v40.Parent = script;
                    return function() --[[ Line: 91 ]]
                        -- upvalues: v43 (copy), v42 (ref), v40 (copy), l_Parent_1 (copy)
                        v43:Disconnect();
                        if not v42 then
                            pcall(function() --[[ Line: 94 ]]
                                -- upvalues: v40 (ref), l_Parent_1 (ref)
                                v40.Parent = l_Parent_1;
                            end);
                        end;
                    end;
                end, {
                    workspace, 
                    script
                });
            end;
            if v36 then
                v36();
                v36 = nil;
            end;
        end;
    end;
    l_ReplicatedStorage_0:GetAttributeChangedSignal("3RoadsEvent"):Connect(v44);
    task.spawn(v44, true);
end;
return v8;