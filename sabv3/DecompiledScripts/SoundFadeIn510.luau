--!native
local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local v2 = l_RunService_0:IsClient() and l_RunService_0.RenderStepped or l_RunService_0.Heartbeat;
return function(v3, v4, v5, v6, v7) --[[ Line: 26 ]] --[[ Name: SoundFadeIn ]]
    -- upvalues: v2 (copy), l_TweenService_0 (copy)
    local v8 = v6 or Enum.EasingStyle.Linear;
    local v9 = v7 or Enum.EasingDirection.In;
    if v3.Playing then
        return;
    else
        v3.Volume = 0;
        v3:Play();
        local v10 = 0;
        local v11 = nil;
        v11 = v2:Connect(function(v12) --[[ Line: 42 ]]
            -- upvalues: v10 (ref), v4 (copy), l_TweenService_0 (ref), v8 (copy), v9 (copy), v3 (copy), v5 (copy), v11 (ref)
            v10 = v10 + v12;
            if v10 < v4 then
                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v10 / v4, v8, v9);
                v3.Volume = math.lerp(0, v5, (math.max(0, l_l_TweenService_0_Value_0)));
                return;
            else
                v11:Disconnect();
                v3.Volume = v5;
                return;
            end;
        end);
        return;
    end;
end;