local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
require(l_ReplicatedStorage_0.Controllers.AnimalController).OnAnimalSpawn:Connect(function(v2) --[[ Line: 7 ]]
    local l_AnimationController_0 = v2.AnimalModel.AnimationController;
    local v4 = l_AnimationController_0.Animator or Instance.new("Animator", l_AnimationController_0);
    local v5 = v4:LoadAnimation(script.Dance);
    v5.Priority = Enum.AnimationPriority.Action2;
    v5.Looped = true;
    local v6 = v4:LoadAnimation(script.GettingUpTransition);
    v6.Priority = Enum.AnimationPriority.Action3;
    v6.Looped = false;
    local v7 = v4:LoadAnimation(script.GroundDance);
    v7.Priority = Enum.AnimationPriority.Action3;
    v7.Looped = true;
    v7.Stopped:Connect(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy)
        v6:Play();
    end);
    local v8 = v4:LoadAnimation(script.GroundTransition);
    v8.Priority = Enum.AnimationPriority.Action3;
    v8.Looped = false;
    v8.Stopped:Connect(function() --[[ Line: 29 ]]
        -- upvalues: v7 (copy)
        v7:Play();
    end);
    local function v9() --[[ Line: 33 ]] --[[ Name: updateDance ]]
        -- upvalues: v2 (copy), v5 (copy)
        if v2.Instance:GetAttribute("Dance") then
            if not v5.IsPlaying then
                v2.WalkTrack:Stop();
                v2.IdleTrack:Stop();
                v5:Play();
                return;
            end;
        elseif v5.IsPlaying then
            v5:Stop();
            if v2.Instance:GetAttribute("ForceIdle") then
                v2.IdleTrack:Play();
                return;
            else
                v2.WalkTrack:Play();
            end;
        end;
    end;
    v2.Collector:Add(v2.Instance:GetAttributeChangedSignal("Dance"):Connect(v9));
    v2.Collector:Add(task.spawn(v9));
    local function v10() --[[ Line: 58 ]] --[[ Name: updateGroundDance ]]
        -- upvalues: v2 (copy), v8 (copy), v7 (copy), v6 (copy), v5 (copy)
        if v2.Instance:GetAttribute("GroundDance") then
            v2.WalkTrack:Stop();
            v2.IdleTrack:Stop();
            if not v8.IsPlaying and not v7.IsPlaying then
                if v6.IsPlaying then
                    v6:Stop();
                end;
                v8:Play();
                return;
            end;
        elseif v8.IsPlaying or v7.IsPlaying then
            if v8.IsPlaying then
                v8:Stop();
            end;
            if v7.IsPlaying then
                v7:Stop();
            end;
            v6:Play();
            if v2.Instance:GetAttribute("ForceIdle") then
                v2.IdleTrack:Play();
                return;
            elseif not v5.IsPlaying then
                v2.WalkTrack:Play();
            end;
        end;
    end;
    v2.Collector:Add(v2.Instance:GetAttributeChangedSignal("GroundDance"):Connect(v10));
    v2.Collector:Add(task.spawn(v10));
end);
return {
    Start = function() --[[ Line: 98 ]] --[[ Name: Start ]]

    end
};