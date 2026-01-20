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
local v10 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v14 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v15 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v16 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v19 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v20 = require(l_ReplicatedStorage_0.Packages.Observers);
local v21 = require(l_ReplicatedStorage_0.Datas.Mutations);
local v22 = require(l_ReplicatedStorage_0.Shared.Mutations);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v26 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local v29 = require(l_ReplicatedStorage_0.Packages.Spr);
local _ = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local v34 = v26.new();
local function _(v35, v36, v37) --[[ Line: 45 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v34 (copy)
    local v38 = v35:LoadAnimation(v36);
    (v37 or v34):Add(function() --[[ Line: 47 ]]
        -- upvalues: v38 (copy)
        v38:Stop(0);
        v38:Destroy();
    end);
    return v38;
end;
v8.OnStart = function(_) --[[ Line: 55 ]] --[[ Name: OnStart ]]
    -- upvalues: v15 (copy), l_Name_0 (copy), v34 (copy), v12 (copy), v16 (copy), v14 (copy), v19 (copy), v20 (copy), v10 (copy), v22 (copy), v21 (copy), v29 (copy)
    local l_v15_ActiveEventData_0 = v15:GetActiveEventData(l_Name_0);
    assert(l_v15_ActiveEventData_0);
    local function _(v42) --[[ Line: 59 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v15_ActiveEventData_0 (copy)
        return (math.max(l_v15_ActiveEventData_0.startedAt + v42 - workspace:GetServerTimeNow(), 0));
    end;
    v34:Add(function() --[[ Line: 63 ]]
        -- upvalues: v12 (ref), v16 (ref), v14 (ref)
        v12:Activate("Blink");
        v16:Update();
        v14:UpdateOST();
    end);
    local v44 = v34:Clone(script.FishingMap);
    v44.Parent = workspace;
    v12:Activate("Blink");
    v16:Update();
    v14:UpdateOST();
    local l_Pivot_0 = v44.Flood:GetPivot();
    v44.Flood:PivotTo(l_Pivot_0 - Vector3.new(0, 3, 0, 0));
    v34:Add(v19(v44.Flood, TweenInfo.new(l_v15_ActiveEventData_0.startedAt + 3 - workspace:GetServerTimeNow(), Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), l_Pivot_0)):Play();
    v34:Add(v20.observeTag("FishermanPrompt", function(v46) --[[ Line: 80 ]]
        -- upvalues: v10 (ref)
        local v47 = v46.Triggered:Connect(function() --[[ Line: 81 ]]
            -- upvalues: v10 (ref)
            v10:Toggle("RodsShop");
        end);
        return function() --[[ Line: 85 ]]
            -- upvalues: v47 (copy)
            v47:Disconnect();
        end;
    end));
    local function _(v48, v49) --[[ Line: 90 ]] --[[ Name: darken ]]
        v49 = math.clamp(v49, 0, 1);
        local v50, v51, v52 = v48:ToHSV();
        v52 = v52 * v49;
        return Color3.fromHSV(v50, v51, v52);
    end;
    local function v66() --[[ Line: 97 ]] --[[ Name: updateFloodColor ]]
        -- upvalues: v22 (ref), v21 (ref), v29 (ref), v44 (copy)
        local v54 = v22.get();
        if v54 then
            local v55 = v21[v54];
            v29.target(v44.Flood.TopWater["Water.001"], 1, 4, {
                Color = v55.MainColor
            });
            local l_target_0 = v29.target;
            local v57 = v44.Flood.Water["Water.001"];
            local v58 = 1;
            local v59 = 4;
            local v60 = {};
            local l_MainColor_0 = v55.MainColor;
            local v62 = math.clamp(0.5, 0, 1);
            local v63, v64, v65 = l_MainColor_0:ToHSV();
            v65 = v65 * v62;
            v60.Color = Color3.fromHSV(v63, v64, v65);
            l_target_0(v57, v58, v59, v60);
            return;
        else
            v29.target(v44.Flood.TopWater["Water.001"], 1, 4, {
                Color = Color3.fromRGB(73, 161, 255)
            });
            v29.target(v44.Flood.Water["Water.001"], 1, 4, {
                Color = Color3.fromRGB(0, 103, 172)
            });
            return;
        end;
    end;
    v34:Add(v22.watch(v66));
    v66();
end;
v8.OnStop = function(_) --[[ Line: 113 ]] --[[ Name: OnStop ]]
    -- upvalues: v34 (copy)
    v34:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 117 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy)
    task.spawn(pcall, function() --[[ Line: 118 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
end;
return v8;