local l_RunService_0 = game:GetService("RunService");
local v1 = {};
local function v12(v2, v3) --[[ Line: 10 ]] --[[ Name: SyncAnimators ]]
    -- upvalues: v1 (copy)
    local function v6(v4) --[[ Line: 11 ]] --[[ Name: syncAnimation ]]
        -- upvalues: v3 (copy), v1 (ref)
        if not v4.Animation or not v4.IsPlaying then
            return;
        else
            local v5 = v3:LoadAnimation(v4.Animation);
            v5.Looped = v4.Looped;
            v5.Priority = v4.Priority;
            v5:Play();
            v5:AdjustSpeed(v4.Speed);
            v5.TimePosition = v4.TimePosition;
            v1[v5] = v4;
            return;
        end;
    end;
    for _, v8 in v2:GetPlayingAnimationTracks() do
        task.spawn(v6, v8);
    end;
    local v9 = v2.AnimationPlayed:Connect(v6);
    return function() --[[ Line: 29 ]]
        -- upvalues: v3 (copy), v9 (copy)
        for _, v11 in v3:GetPlayingAnimationTracks() do
            v11:Stop();
        end;
        v9:Disconnect();
    end;
end;
l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 37 ]]
    -- upvalues: v1 (copy)
    for v14, v15 in v1 do
        if not v14.IsPlaying then
            v1[v14] = nil;
        elseif not v15.IsPlaying then
            if v14.IsPlaying then
                v14:Stop();
            end;
        else
            v14.Looped = v15.Looped;
            v14.Priority = v15.Priority;
            v14:AdjustSpeed(v14.Speed);
            v14:AdjustWeight(v14.WeightTarget, 0.1);
            v14.TimePosition = v15.TimePosition;
        end;
    end;
end);
return v12;