local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local v5 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v7 = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local v8 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v9 = {};
local v10 = v5.new();
local l_SkullEmoji_0 = l_Players_0.LocalPlayer.PlayerGui.SkullEmoji;
local l_CanvasGroup_0 = l_SkullEmoji_0.CanvasGroup;
local l_Skull_0 = l_CanvasGroup_0.Skull;
local v14 = {
    Center = UDim2.fromScale(0.5, 0.65), 
    Lower = UDim2.fromScale(0.5, 0.8), 
    Bottom = l_Skull_0.Position
};
local _ = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
local v16 = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out);
local function _(v17, v18, v19, v20) --[[ Line: 49 ]] --[[ Name: tweenFast ]]
    -- upvalues: v8 (copy), v10 (copy)
    local v21 = v8(v17, v18, v19, false);
    (v20 or v10):Add(v21);
    v21:Play();
    return v21;
end;
v9._playEffect = function(v23, v24, v25) --[[ Line: 60 ]] --[[ Name: _playEffect ]]
    -- upvalues: l_Lighting_0 (copy), v14 (copy), l_CanvasGroup_0 (copy), l_Skull_0 (copy), l_SkullEmoji_0 (copy), l_ReplicatedStorage_0 (copy), v16 (copy), v8 (copy), v10 (copy), v7 (copy), l_RunService_0 (copy), l_Debris_0 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_ExposureCompensation_0 = l_Lighting_0.ExposureCompensation;
    local v28 = v14[v25] or v14.Bottom;
    l_CanvasGroup_0.GroupTransparency = 1;
    l_Skull_0.Position = UDim2.fromScale(v28.X.Scale * 0.85, v28.Y.Scale * 1.1);
    l_Skull_0.Rotation = -5;
    l_SkullEmoji_0.Enabled = true;
    l_ReplicatedStorage_0.Sounds.Others.SkullEffect:Play();
    l_Lighting_0.ExposureCompensation = 4;
    local l_l_Lighting_0_0 = l_Lighting_0;
    local l_v16_0 = v16;
    local v31 = {
        ExposureCompensation = l_ExposureCompensation_0
    };
    local v32 = v8(l_l_Lighting_0_0, l_v16_0, v31, false);
    v10:Add(v32);
    v32:Play();
    l_l_Lighting_0_0 = l_CanvasGroup_0;
    l_v16_0 = TweenInfo.new(0.1, Enum.EasingStyle.Quart);
    v31 = {
        GroupTransparency = 0
    };
    v32 = v8(l_l_Lighting_0_0, l_v16_0, v31, false);
    v10:Add(v32);
    v32:Play();
    l_Skull_0.ImageTransparency = 0;
    l_l_Lighting_0_0 = l_Skull_0;
    l_v16_0 = TweenInfo.new(0.125, Enum.EasingStyle.Back);
    v31 = {
        Position = v28, 
        Rotation = 0
    };
    v32 = v8(l_l_Lighting_0_0, l_v16_0, v31, false);
    v10:Add(v32);
    v32:Play();
    l_l_Lighting_0_0 = v7.Explosion:Clone();
    l_l_Lighting_0_0.FadeInTime = 0;
    l_l_Lighting_0_0.Frequency = 0.3333333333333333;
    v10:Add(l_l_Lighting_0_0);
    v10:Add(v7.BindShakeToCamera(l_l_Lighting_0_0, l_CurrentCamera_0));
    l_l_Lighting_0_0:Start();
    l_v16_0 = v7.Bump:Clone();
    l_v16_0.FadeInTime = 0;
    l_v16_0.Sustain = true;
    v10:Add(l_v16_0);
    v10:Add(v7.BindShakeToCamera(l_v16_0, l_CurrentCamera_0));
    l_v16_0:Start();
    v10:Add(task.delay(0.125, function() --[[ Line: 110 ]]
        -- upvalues: l_RunService_0 (ref), l_v16_0 (copy), l_Skull_0 (ref), v28 (copy), v10 (ref)
        local v33 = time();
        local v34 = nil;
        v34 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 113 ]]
            -- upvalues: l_v16_0 (ref), l_Skull_0 (ref), v28 (ref), v33 (copy)
            debug.profilebegin("SkullEmojiEffect:Update");
            local v36, _ = l_v16_0:Update();
            if not l_v16_0:IsShaking() then
                debug.profileend();
                return;
            else
                local v38 = v36 * Vector3.new(1, 1, 1, 0) * 0.075;
                l_Skull_0.Position = UDim2.fromScale((1 + v38.X) * v28.X.Scale, (1 + v38.Y) * v28.Y.Scale);
                l_Skull_0.Rotation = math.sin(2 * (time() - v33)) * 5;
                debug.profileend();
                return;
            end;
        end);
        v10:Add(v34);
    end));
    v31 = Instance.new("ColorCorrectionEffect");
    v31.Parent = l_Lighting_0;
    l_Debris_0:AddItem(v31, v24);
    v32 = v16;
    local v39 = {
        Brightness = -0.2, 
        Contrast = 0.4, 
        Saturation = -0.7000000000000001
    };
    local v40 = v8(v31, v32, v39, false);
    v10:Add(v40);
    v40:Play();
    v10:Add(task.delay(v24 - 0.5, function() --[[ Line: 145 ]]
        -- upvalues: l_Lighting_0 (ref), v16 (ref), l_ExposureCompensation_0 (copy), v8 (ref), v10 (ref), l_v16_0 (copy), v31 (copy), l_Skull_0 (ref)
        l_Lighting_0.ExposureCompensation = 2.5;
        local l_l_Lighting_0_1 = l_Lighting_0;
        local l_v16_1 = v16;
        local v43 = {
            ExposureCompensation = l_ExposureCompensation_0
        };
        local v44 = v8(l_l_Lighting_0_1, l_v16_1, v43, false);
        v10:Add(v44);
        v44:Play();
        l_v16_0:StopSustain();
        l_l_Lighting_0_1 = v31;
        l_v16_1 = v16;
        v43 = {
            Brightness = 0, 
            Contrast = 0, 
            Saturation = 0
        };
        v44 = v8(l_l_Lighting_0_1, l_v16_1, v43, false);
        v10:Add(v44);
        v44:Play();
        l_l_Lighting_0_1 = l_Skull_0;
        l_v16_1 = TweenInfo.new(0.4, Enum.EasingStyle.Quart);
        v43 = {
            ImageTransparency = 1
        };
        v44 = v8(l_l_Lighting_0_1, l_v16_1, v43, false);
        v10:Add(v44);
        v44:Play();
    end));
    task.wait(v24);
    v23:Stop();
end;
v9.Play = function(v45, v46, v47) --[[ Line: 171 ]] --[[ Name: Play ]]
    if v45._isPlaying then
        v45:Stop();
    end;
    v45._isPlaying = true;
    task.spawn(v45._playEffect, v45, math.max(v46 or 3, 1.5), v47 or "Bottom");
end;
v9.Stop = function(v48) --[[ Line: 181 ]] --[[ Name: Stop ]]
    -- upvalues: l_SkullEmoji_0 (copy), v10 (copy)
    l_SkullEmoji_0.Enabled = false;
    v48._isPlaying = false;
    v10:Clean();
end;
v9.Start = function(_) --[[ Line: 187 ]] --[[ Name: Start ]]
    -- upvalues: l_SkullEmoji_0 (copy)
    l_SkullEmoji_0.Enabled = false;
end;
return v9;