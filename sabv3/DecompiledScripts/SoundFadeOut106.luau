--!native
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v2 = l_RunService_0:IsClient() and l_RunService_0.RenderStepped or l_RunService_0.Heartbeat;
return function(v3, v4, v5, v6) --[[ Line: 26 ]] --[[ Name: SoundFadeOut ]]
    -- upvalues: v2 (copy), l_TweenService_0 (copy)
    local v7 = v5 or Enum.EasingStyle.Linear;
    local v8 = v6 or Enum.EasingDirection.Out;
    if not v3.Playing then
        return;
    else
        local l_Volume_0 = v3.Volume;
        local v10 = 0;
        local v11 = nil;
        v11 = v2:Connect(function(v12) --[[ Line: 40 ]]
            -- upvalues: v10 (ref), v4 (copy), l_TweenService_0 (ref), v7 (copy), v8 (copy), v3 (copy), l_Volume_0 (copy), v11 (ref)
            v10 = v10 + v12;
            if v10 < v4 then
                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v10 / v4, v7, v8);
                v3.Volume = math.lerp(l_Volume_0, 0, (math.min(1, l_l_TweenService_0_Value_0)));
                return;
            else
                v11:Disconnect();
                v3.Volume = 0;
                v3:Stop();
                return;
            end;
        end);
        return;
    end;
end;