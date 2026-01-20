local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Shake);
local v3 = {
    Bump = v2.new()
};
v3.Bump.Amplitude = 2.5;
v3.Bump.Frequency = 0.25;
v3.Bump.FadeInTime = 0.1;
v3.Bump.FadeOutTime = 0.75;
v3.Bump.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
v3.Bump.RotationInfluence = Vector3.new(1, 1, 1, 0);
v3.BumpS = v2.new();
v3.BumpS.Amplitude = 1.5;
v3.BumpS.Frequency = 0.25;
v3.BumpS.FadeInTime = 0.1;
v3.BumpS.FadeOutTime = 0.75;
v3.BumpS.PositionInfluence = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448, 0);
v3.BumpS.RotationInfluence = Vector3.new(1, 1, 1, 0);
v3.Explosion = v2.new();
v3.Explosion.Amplitude = 5;
v3.Explosion.Frequency = 0.1;
v3.Explosion.FadeInTime = 0;
v3.Explosion.FadeOutTime = 1.5;
v3.Explosion.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
v3.Explosion.RotationInfluence = Vector3.new(4, 1, 1, 0);
v3.Earthquake = v2.new();
v3.Earthquake.Amplitude = 0.6;
v3.Earthquake.Frequency = 0.2857142857142857;
v3.Earthquake.FadeInTime = 2;
v3.Earthquake.FadeOutTime = 10;
v3.Earthquake.PositionInfluence = Vector3.new(0.25, 0.25, 0.25, 0);
v3.Earthquake.RotationInfluence = Vector3.new(1, 1, 4, 0);
v3.BadTrip = v2.new();
v3.BadTrip.Amplitude = 10;
v3.BadTrip.Frequency = 6.666666666666667;
v3.BadTrip.FadeInTime = 5;
v3.BadTrip.FadeOutTime = 10;
v3.BadTrip.PositionInfluence = Vector3.new(0, 0, 0.15000000596046448, 0);
v3.BadTrip.RotationInfluence = Vector3.new(2, 1, 4, 0);
v3.HandheldCamera = v2.new();
v3.HandheldCamera.Amplitude = 1;
v3.HandheldCamera.Frequency = 0.25;
v3.HandheldCamera.FadeInTime = 5;
v3.HandheldCamera.FadeOutTime = 10;
v3.HandheldCamera.PositionInfluence = Vector3.new(0, 0, 0, 0);
v3.HandheldCamera.RotationInfluence = Vector3.new(1, 0.5, 0.5, 0);
v3.Vibration = v2.new();
v3.Vibration.Amplitude = 0.4;
v3.Vibration.Frequency = 0.05;
v3.Vibration.FadeInTime = 2;
v3.Vibration.FadeOutTime = 2;
v3.Vibration.PositionInfluence = Vector3.new(0, 0.15000000596046448, 0, 0);
v3.Vibration.RotationInfluence = Vector3.new(1.25, 0, 4, 0);
v3.RoughDriving = v2.new();
v3.RoughDriving.Amplitude = 1;
v3.RoughDriving.Frequency = 0.5;
v3.RoughDriving.FadeInTime = 1;
v3.RoughDriving.FadeOutTime = 1;
v3.RoughDriving.PositionInfluence = Vector3.new(0, 0, 0, 0);
v3.RoughDriving.RotationInfluence = Vector3.new(1, 1, 1, 0);
v3.BindShakeToCamera = function(v4, v5) --[[ Line: 74 ]] --[[ Name: BindShakeToCamera ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy)
    v5 = v5 or workspace.CurrentCamera;
    assert(v5, "camera not found");
    local v6 = nil;
    local v7 = nil;
    local v8 = true;
    v4:BindToRenderStep(v2.NextRenderName(), Enum.RenderPriority.Last.Value, function(v9, v10, v11) --[[ Line: 83 ]]
        -- upvalues: v6 (ref), v5 (ref), v8 (ref), v7 (ref)
        v6 = v5.CFrame;
        local l_v5_0 = v5;
        l_v5_0.CFrame = l_v5_0.CFrame * (CFrame.new(v9) * CFrame.Angles(0, math.rad(v10.Y), 0) * CFrame.Angles(math.rad(v10.X), 0, (math.rad(v10.Z))));
        if v11 then
            v8 = nil;
            if v7 then
                v7:Disconnect();
                v7 = nil;
            end;
        end;
    end);
    if v8 == true then
        v7 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 100 ]]
            -- upvalues: v6 (ref), v5 (ref)
            debug.profilebegin("ShakePresets:UpdateCameraCFrame");
            if v6 then
                v5.CFrame = v6;
            end;
            debug.profileend();
        end);
    end;
    return function() --[[ Line: 109 ]]
        -- upvalues: v7 (ref), v4 (copy)
        if v7 then
            v7:Disconnect();
            v7 = nil;
        end;
        v4:Destroy();
    end;
end;
return v3;