local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script.Parent;
local l_Humanoid_0 = l_Parent_0:WaitForChild("Humanoid");
local v3 = "Standing";
local l_status_0, l_result_0 = pcall(function() --[[ Line: 8 ]]
    return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop");
end);
local v6 = l_status_0 and l_result_0;
local l_status_1, l_result_1 = pcall(function() --[[ Line: 11 ]]
    return UserSettings():IsUserFeatureEnabled("UserAnimateScaleRun");
end);
local v9 = l_status_1 and l_result_1;
local function _(v10) --[[ Line: 14 ]] --[[ Name: shouldPlayToolAnim ]]
    if v10:HasTag("Tool_FishingRod") then
        return false;
    elseif v10:GetAttribute("DisableToolAnim") then
        return false;
    else
        return true;
    end;
end;
local function v12() --[[ Line: 24 ]] --[[ Name: getRigScale ]]
    -- upvalues: v9 (copy), l_Parent_0 (copy)
    if v9 then
        return l_Parent_0:GetScale();
    else
        return 1;
    end;
end;
local l_ScaleDampeningPercent_0 = script:FindFirstChild("ScaleDampeningPercent");
local v14 = "";
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = 1;
local v19 = nil;
local v20 = nil;
local v21 = {};
local v22 = {};
local v23 = {
    idle = {
        {
            id = "http://www.roblox.com/asset/?id=507766666", 
            weight = 1
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507766951", 
            weight = 1
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507766388", 
            weight = 9
        }
    }, 
    walk = {
        {
            id = "http://www.roblox.com/asset/?id=507777826", 
            weight = 10
        }
    }, 
    run = {
        {
            id = "http://www.roblox.com/asset/?id=507767714", 
            weight = 10
        }
    }, 
    swim = {
        {
            id = "http://www.roblox.com/asset/?id=507784897", 
            weight = 10
        }
    }, 
    swimidle = {
        {
            id = "http://www.roblox.com/asset/?id=507785072", 
            weight = 10
        }
    }, 
    jump = {
        {
            id = "http://www.roblox.com/asset/?id=507765000", 
            weight = 10
        }
    }, 
    fall = {
        {
            id = "http://www.roblox.com/asset/?id=507767968", 
            weight = 10
        }
    }, 
    climb = {
        {
            id = "http://www.roblox.com/asset/?id=507765644", 
            weight = 10
        }
    }, 
    sit = {
        {
            id = "http://www.roblox.com/asset/?id=2506281703", 
            weight = 10
        }
    }, 
    toolnone = {
        {
            id = "http://www.roblox.com/asset/?id=507768375", 
            weight = 10
        }
    }, 
    toolslash = {
        {
            id = "http://www.roblox.com/asset/?id=522635514", 
            weight = 10
        }
    }, 
    toollunge = {
        {
            id = "http://www.roblox.com/asset/?id=522638767", 
            weight = 10
        }
    }, 
    wave = {
        {
            id = "http://www.roblox.com/asset/?id=507770239", 
            weight = 10
        }
    }, 
    point = {
        {
            id = "http://www.roblox.com/asset/?id=507770453", 
            weight = 10
        }
    }, 
    dance = {
        {
            id = "http://www.roblox.com/asset/?id=507771019", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507771955", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507772104", 
            weight = 10
        }
    }, 
    dance2 = {
        {
            id = "http://www.roblox.com/asset/?id=507776043", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507776720", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507776879", 
            weight = 10
        }
    }, 
    dance3 = {
        {
            id = "http://www.roblox.com/asset/?id=507777268", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507777451", 
            weight = 10
        }, 
        {
            id = "http://www.roblox.com/asset/?id=507777623", 
            weight = 10
        }
    }, 
    laugh = {
        {
            id = "http://www.roblox.com/asset/?id=507770818", 
            weight = 10
        }
    }, 
    cheer = {
        {
            id = "http://www.roblox.com/asset/?id=507770677", 
            weight = 10
        }
    }
};
local v24 = {
    wave = false, 
    point = false, 
    dance = true, 
    dance2 = true, 
    dance3 = true, 
    laugh = false, 
    cheer = false
};
math.randomseed(tick());
findExistingAnimationInSet = function(v25, v26) --[[ Line: 122 ]] --[[ Name: findExistingAnimationInSet ]]
    if v25 == nil or v26 == nil then
        return 0;
    else
        for v27 = 1, v25.count do
            if v25[v27].anim.AnimationId == v26.AnimationId then
                return v27;
            end;
        end;
        return 0;
    end;
end;
configureAnimationSet = function(v28, v29) --[[ Line: 136 ]] --[[ Name: configureAnimationSet ]]
    -- upvalues: v22 (copy), v21 (copy), l_Humanoid_0 (copy)
    if v22[v28] ~= nil then
        for _, v31 in pairs(v22[v28].connections) do
            v31:disconnect();
        end;
    end;
    v22[v28] = {};
    v22[v28].count = 0;
    v22[v28].totalWeight = 0;
    v22[v28].connections = {};
    local v32 = true;
    local l_status_2, _ = pcall(function() --[[ Line: 149 ]]
        -- upvalues: v32 (ref)
        v32 = game:GetService("StarterPlayer").AllowCustomAnimations;
    end);
    if not l_status_2 then
        v32 = true;
    end;
    local l_script_FirstChild_0 = script:FindFirstChild(v28);
    if v32 and l_script_FirstChild_0 ~= nil then
        table.insert(v22[v28].connections, l_script_FirstChild_0.ChildAdded:connect(function(_) --[[ Line: 157 ]]
            -- upvalues: v28 (copy), v29 (copy)
            configureAnimationSet(v28, v29);
        end));
        table.insert(v22[v28].connections, l_script_FirstChild_0.ChildRemoved:connect(function(_) --[[ Line: 158 ]]
            -- upvalues: v28 (copy), v29 (copy)
            configureAnimationSet(v28, v29);
        end));
        local v38 = 0;
        for _, v40 in pairs(l_script_FirstChild_0:GetChildren()) do
            if v40:IsA("Animation") then
                local v41 = 1;
                local l_Weight_0 = v40:FindFirstChild("Weight");
                if l_Weight_0 ~= nil then
                    v41 = l_Weight_0.Value;
                end;
                v22[v28].count = v22[v28].count + 1;
                v38 = v22[v28].count;
                v22[v28][v38] = {};
                v22[v28][v38].anim = v40;
                v22[v28][v38].weight = v41;
                v22[v28].totalWeight = v22[v28].totalWeight + v22[v28][v38].weight;
                table.insert(v22[v28].connections, v40.Changed:connect(function(_) --[[ Line: 174 ]]
                    -- upvalues: v28 (copy), v29 (copy)
                    configureAnimationSet(v28, v29);
                end));
                table.insert(v22[v28].connections, v40.ChildAdded:connect(function(_) --[[ Line: 175 ]]
                    -- upvalues: v28 (copy), v29 (copy)
                    configureAnimationSet(v28, v29);
                end));
                table.insert(v22[v28].connections, v40.ChildRemoved:connect(function(_) --[[ Line: 176 ]]
                    -- upvalues: v28 (copy), v29 (copy)
                    configureAnimationSet(v28, v29);
                end));
            end;
        end;
    end;
    if v22[v28].count <= 0 then
        for v46, v47 in pairs(v29) do
            v22[v28][v46] = {};
            v22[v28][v46].anim = Instance.new("Animation");
            v22[v28][v46].anim.Name = v28;
            v22[v28][v46].anim.AnimationId = v47.id;
            v22[v28][v46].weight = v47.weight;
            v22[v28].count = v22[v28].count + 1;
            v22[v28].totalWeight = v22[v28].totalWeight + v47.weight;
        end;
    end;
    for _, v49 in pairs(v22) do
        for v50 = 1, v49.count do
            if v21[v49[v50].anim.AnimationId] == nil then
                l_Humanoid_0:LoadAnimation(v49[v50].anim);
                v21[v49[v50].anim.AnimationId] = true;
            end;
        end;
    end;
end;
configureAnimationSetOld = function(v51, v52) --[[ Line: 207 ]] --[[ Name: configureAnimationSetOld ]]
    -- upvalues: v22 (copy), l_Humanoid_0 (copy)
    if v22[v51] ~= nil then
        for _, v54 in pairs(v22[v51].connections) do
            v54:disconnect();
        end;
    end;
    v22[v51] = {};
    v22[v51].count = 0;
    v22[v51].totalWeight = 0;
    v22[v51].connections = {};
    local v55 = true;
    local l_status_3, _ = pcall(function() --[[ Line: 220 ]]
        -- upvalues: v55 (ref)
        v55 = game:GetService("StarterPlayer").AllowCustomAnimations;
    end);
    if not l_status_3 then
        v55 = true;
    end;
    local l_script_FirstChild_1 = script:FindFirstChild(v51);
    if v55 and l_script_FirstChild_1 ~= nil then
        table.insert(v22[v51].connections, l_script_FirstChild_1.ChildAdded:connect(function(_) --[[ Line: 228 ]]
            -- upvalues: v51 (copy), v52 (copy)
            configureAnimationSet(v51, v52);
        end));
        table.insert(v22[v51].connections, l_script_FirstChild_1.ChildRemoved:connect(function(_) --[[ Line: 229 ]]
            -- upvalues: v51 (copy), v52 (copy)
            configureAnimationSet(v51, v52);
        end));
        local v61 = 1;
        for _, v63 in pairs(l_script_FirstChild_1:GetChildren()) do
            if v63:IsA("Animation") then
                table.insert(v22[v51].connections, v63.Changed:connect(function(_) --[[ Line: 233 ]]
                    -- upvalues: v51 (copy), v52 (copy)
                    configureAnimationSet(v51, v52);
                end));
                v22[v51][v61] = {};
                v22[v51][v61].anim = v63;
                local l_Weight_1 = v63:FindFirstChild("Weight");
                if l_Weight_1 == nil then
                    v22[v51][v61].weight = 1;
                else
                    v22[v51][v61].weight = l_Weight_1.Value;
                end;
                v22[v51].count = v22[v51].count + 1;
                v22[v51].totalWeight = v22[v51].totalWeight + v22[v51][v61].weight;
                v61 = v61 + 1;
            end;
        end;
    end;
    if v22[v51].count <= 0 then
        for v66, v67 in pairs(v52) do
            v22[v51][v66] = {};
            v22[v51][v66].anim = Instance.new("Animation");
            v22[v51][v66].anim.Name = v51;
            v22[v51][v66].anim.AnimationId = v67.id;
            v22[v51][v66].weight = v67.weight;
            v22[v51].count = v22[v51].count + 1;
            v22[v51].totalWeight = v22[v51].totalWeight + v67.weight;
        end;
    end;
    for _, v69 in pairs(v22) do
        for v70 = 1, v69.count do
            l_Humanoid_0:LoadAnimation(v69[v70].anim);
        end;
    end;
end;
scriptChildModified = function(v71) --[[ Line: 272 ]] --[[ Name: scriptChildModified ]]
    -- upvalues: v23 (copy)
    local v72 = v23[v71.Name];
    if v72 ~= nil then
        configureAnimationSet(v71.Name, v72);
    end;
end;
script.ChildAdded:connect(scriptChildModified);
script.ChildRemoved:connect(scriptChildModified);
local v73 = if l_Humanoid_0 then l_Humanoid_0:FindFirstChildOfClass("Animator") else nil;
if v73 then
    local l_v73_PlayingAnimationTracks_0 = v73:GetPlayingAnimationTracks();
    for _, v76 in ipairs(l_v73_PlayingAnimationTracks_0) do
        v76:Stop(0);
        v76:Destroy();
    end;
end;
for v77, v78 in pairs(v23) do
    configureAnimationSet(v77, v78);
end;
local v79 = "None";
local v80 = 0;
local v81 = 0;
local v82 = false;
stopAllAnimations = function() --[[ Line: 313 ]] --[[ Name: stopAllAnimations ]]
    -- upvalues: v14 (ref), v24 (copy), v82 (ref), v15 (ref), v17 (ref), v16 (ref), v20 (ref), v19 (ref)
    local l_v14_0 = v14;
    if v24[l_v14_0] ~= nil and v24[l_v14_0] == false then
        l_v14_0 = "idle";
    end;
    if v82 then
        l_v14_0 = "idle";
        v82 = false;
    end;
    v14 = "";
    v15 = nil;
    if v17 ~= nil then
        v17:disconnect();
    end;
    if v16 ~= nil then
        v16:Stop();
        v16:Destroy();
        v16 = nil;
    end;
    if v20 ~= nil then
        v20:disconnect();
    end;
    if v19 ~= nil then
        v19:Stop();
        v19:Destroy();
        v19 = nil;
    end;
    return l_v14_0;
end;
getHeightScale = function() --[[ Line: 352 ]] --[[ Name: getHeightScale ]]
    -- upvalues: l_Humanoid_0 (copy), v12 (copy), l_ScaleDampeningPercent_0 (ref)
    if l_Humanoid_0 then
        if not l_Humanoid_0.AutomaticScalingEnabled then
            return v12();
        else
            local v84 = l_Humanoid_0.HipHeight / 2;
            if l_ScaleDampeningPercent_0 == nil then
                l_ScaleDampeningPercent_0 = script:FindFirstChild("ScaleDampeningPercent");
            end;
            if l_ScaleDampeningPercent_0 ~= nil then
                v84 = 1 + (l_Humanoid_0.HipHeight - 2) * l_ScaleDampeningPercent_0.Value / 2;
            end;
            return v84;
        end;
    else
        return v12();
    end;
end;
local function _(v85) --[[ Line: 372 ]] --[[ Name: rootMotionCompensation ]]
    return v85 * 1.25 / getHeightScale();
end;
local function v93(v87) --[[ Line: 380 ]] --[[ Name: setRunSpeed ]]
    -- upvalues: v16 (ref), v19 (ref)
    local v88 = v87 * 1.25 / getHeightScale();
    local v89 = 1.0E-4;
    local v90 = 1.0E-4;
    local v91 = 1;
    if v88 <= 0.5 then
        v89 = 1;
        v91 = v88 / 0.5;
    elseif v88 < 1 then
        local v92 = (v88 - 0.5) / 0.5;
        v89 = 1 - v92;
        v90 = v92;
    else
        v91 = v88 / 1;
        v90 = 1;
    end;
    v16:AdjustWeight(v89);
    v19:AdjustWeight(v90);
    v16:AdjustSpeed(v91);
    v19:AdjustSpeed(v91);
end;
setAnimationSpeed = function(v94) --[[ Line: 406 ]] --[[ Name: setAnimationSpeed ]]
    -- upvalues: v14 (ref), v93 (copy), v18 (ref), v16 (ref)
    if v14 == "walk" then
        v93(v94);
        return;
    else
        if v94 ~= v18 then
            v18 = v94;
            v16:AdjustSpeed(v18);
        end;
        return;
    end;
end;
keyFrameReachedFunc = function(v95) --[[ Line: 417 ]] --[[ Name: keyFrameReachedFunc ]]
    -- upvalues: v14 (ref), v6 (copy), v19 (ref), v16 (ref), v24 (copy), v82 (ref), v18 (ref), l_Humanoid_0 (copy)
    if v95 == "End" then
        if v14 == "walk" then
            if v6 == true then
                if v19.Looped ~= true then
                    v19.TimePosition = 0;
                end;
                if v16.Looped ~= true then
                    v16.TimePosition = 0;
                    return;
                end;
            else
                v19.TimePosition = 0;
                v16.TimePosition = 0;
                return;
            end;
        else
            local l_v14_1 = v14;
            if v24[l_v14_1] ~= nil and v24[l_v14_1] == false then
                l_v14_1 = "idle";
            end;
            if v82 then
                if v16.Looped then
                    return;
                else
                    l_v14_1 = "idle";
                    v82 = false;
                end;
            end;
            local l_v18_0 = v18;
            playAnimation(l_v14_1, 0.15, l_Humanoid_0);
            setAnimationSpeed(l_v18_0);
        end;
    end;
end;
rollAnimation = function(v98) --[[ Line: 455 ]] --[[ Name: rollAnimation ]]
    -- upvalues: v22 (copy)
    local v99 = math.random(1, v22[v98].totalWeight);
    local _ = v99;
    local v101 = 1;
    while v22[v98][v101].weight < v99 do
        v99 = v99 - v22[v98][v101].weight;
        v101 = v101 + 1;
    end;
    return v101;
end;
local function v107(v102, v103, v104, v105) --[[ Line: 466 ]] --[[ Name: switchToAnim ]]
    -- upvalues: v15 (ref), v16 (ref), v19 (ref), v6 (copy), v18 (ref), v14 (ref), v17 (ref), v22 (copy), v20 (ref)
    if v102 ~= v15 then
        if v16 ~= nil then
            v16:Stop(v104);
            v16:Destroy();
        end;
        if v19 ~= nil then
            v19:Stop(v104);
            v19:Destroy();
            if v6 == true then
                v19 = nil;
            end;
        end;
        v18 = 1;
        v16 = v105:LoadAnimation(v102);
        v16.Priority = Enum.AnimationPriority.Core;
        v16:Play(v104);
        v14 = v103;
        v15 = v102;
        if v17 ~= nil then
            v17:disconnect();
        end;
        v17 = v16.KeyframeReached:connect(keyFrameReachedFunc);
        if v103 == "walk" then
            local v106 = rollAnimation("run");
            v19 = v105:LoadAnimation(v22.run[v106].anim);
            v19.Priority = Enum.AnimationPriority.Core;
            v19:Play(v104);
            if v20 ~= nil then
                v20:disconnect();
            end;
            v20 = v19.KeyframeReached:connect(keyFrameReachedFunc);
        end;
    end;
end;
playAnimation = function(v108, v109, v110) --[[ Line: 517 ]] --[[ Name: playAnimation ]]
    -- upvalues: v22 (copy), v107 (copy), v82 (ref)
    local v111 = rollAnimation(v108);
    local l_anim_0 = v22[v108][v111].anim;
    v107(l_anim_0, v108, v109, v110);
    v82 = false;
end;
playEmote = function(v113, v114, v115) --[[ Line: 525 ]] --[[ Name: playEmote ]]
    -- upvalues: v107 (copy), v82 (ref)
    v107(v113, v113.Name, v114, v115);
    v82 = true;
end;
local v116 = "";
local v117 = nil;
local v118 = nil;
local v119 = nil;
toolKeyFrameReachedFunc = function(v120) --[[ Line: 538 ]] --[[ Name: toolKeyFrameReachedFunc ]]
    -- upvalues: v116 (ref), l_Humanoid_0 (copy)
    if v120 == "End" then
        playToolAnimation(v116, 0, l_Humanoid_0);
    end;
end;
playToolAnimation = function(v121, v122, v123, v124) --[[ Line: 545 ]] --[[ Name: playToolAnimation ]]
    -- upvalues: v22 (copy), v118 (ref), v117 (ref), v116 (ref), v119 (ref)
    local v125 = rollAnimation(v121);
    local l_anim_1 = v22[v121][v125].anim;
    if v118 ~= l_anim_1 then
        if v117 ~= nil then
            v117:Stop();
            v117:Destroy();
            v122 = 0;
        end;
        v117 = v123:LoadAnimation(l_anim_1);
        if v124 then
            v117.Priority = v124;
        end;
        v117:Play(v122);
        v116 = v121;
        v118 = l_anim_1;
        v119 = v117.KeyframeReached:connect(toolKeyFrameReachedFunc);
    end;
end;
stopToolAnimations = function() --[[ Line: 572 ]] --[[ Name: stopToolAnimations ]]
    -- upvalues: v116 (ref), v119 (ref), v118 (ref), v117 (ref)
    local l_v116_0 = v116;
    if v119 ~= nil then
        v119:disconnect();
    end;
    v116 = "";
    v118 = nil;
    if v117 ~= nil then
        v117:Stop();
        v117:Destroy();
        v117 = nil;
    end;
    return l_v116_0;
end;
onRunning = function(v128) --[[ Line: 594 ]] --[[ Name: onRunning ]]
    -- upvalues: v9 (copy), v82 (ref), l_Humanoid_0 (copy), v3 (ref), v24 (copy), v14 (ref)
    local v129 = if v9 then getHeightScale() else 1;
    if (v82 and l_Humanoid_0.MoveDirection == Vector3.new(0, 0, 0, 0) and l_Humanoid_0.WalkSpeed / v129 or 0.75) * v129 < v128 then
        playAnimation("walk", 0.2, l_Humanoid_0);
        setAnimationSpeed(v128 / 16);
        v3 = "Running";
        return;
    else
        if v24[v14] == nil and not v82 then
            playAnimation("idle", 0.2, l_Humanoid_0);
            v3 = "Standing";
        end;
        return;
    end;
end;
onDied = function() --[[ Line: 612 ]] --[[ Name: onDied ]]
    -- upvalues: v3 (ref)
    v3 = "Dead";
end;
onJumping = function() --[[ Line: 616 ]] --[[ Name: onJumping ]]
    -- upvalues: l_Parent_0 (copy), l_Players_0 (copy), l_Humanoid_0 (copy), v81 (ref), v3 (ref)
    local l_HumanoidRootPart_0 = l_Parent_0:FindFirstChild("HumanoidRootPart");
    if l_HumanoidRootPart_0 and l_HumanoidRootPart_0:FindFirstChild("SeatWeld_Forced") then
        local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(l_Parent_0);
        if l_l_Players_0_PlayerFromCharacter_0 and not l_l_Players_0_PlayerFromCharacter_0:GetAttribute("SeatedCanJump") then
            return;
        end;
    end;
    playAnimation("jump", 0.1, l_Humanoid_0);
    v81 = 0.31;
    v3 = "Jumping";
end;
onClimbing = function(v132) --[[ Line: 630 ]] --[[ Name: onClimbing ]]
    -- upvalues: v9 (copy), l_Humanoid_0 (copy), v3 (ref)
    if v9 then
        v132 = v132 / getHeightScale();
    end;
    playAnimation("climb", 0.1, l_Humanoid_0);
    setAnimationSpeed(v132 / 5);
    v3 = "Climbing";
end;
onGettingUp = function() --[[ Line: 640 ]] --[[ Name: onGettingUp ]]
    -- upvalues: v3 (ref)
    v3 = "GettingUp";
end;
onFreeFall = function() --[[ Line: 644 ]] --[[ Name: onFreeFall ]]
    -- upvalues: v81 (ref), l_Humanoid_0 (copy), v3 (ref)
    if v81 <= 0 then
        playAnimation("fall", 0.2, l_Humanoid_0);
    end;
    v3 = "FreeFall";
end;
onFallingDown = function() --[[ Line: 651 ]] --[[ Name: onFallingDown ]]
    -- upvalues: v3 (ref)
    v3 = "FallingDown";
end;
onSeated = function() --[[ Line: 655 ]] --[[ Name: onSeated ]]
    -- upvalues: v3 (ref)
    v3 = "Seated";
end;
onPlatformStanding = function() --[[ Line: 659 ]] --[[ Name: onPlatformStanding ]]
    -- upvalues: v3 (ref)
    v3 = "PlatformStanding";
end;
onSwimming = function(v133) --[[ Line: 666 ]] --[[ Name: onSwimming ]]
    -- upvalues: v9 (copy), l_Humanoid_0 (copy), v3 (ref)
    if v9 then
        v133 = v133 / getHeightScale();
    end;
    if v133 > 1 then
        playAnimation("swim", 0.4, l_Humanoid_0);
        setAnimationSpeed(v133 / 10);
        v3 = "Swimming";
        return;
    else
        playAnimation("swimidle", 0.4, l_Humanoid_0);
        v3 = "Standing";
        return;
    end;
end;
animateTool = function() --[[ Line: 681 ]] --[[ Name: animateTool ]]
    -- upvalues: v79 (ref), l_Humanoid_0 (copy)
    if v79 == "None" then
        playToolAnimation("toolnone", 0.1, l_Humanoid_0, Enum.AnimationPriority.Idle);
        return;
    elseif v79 == "Slash" then
        playToolAnimation("toolslash", 0, l_Humanoid_0, Enum.AnimationPriority.Action);
        return;
    elseif v79 == "Lunge" then
        playToolAnimation("toollunge", 0, l_Humanoid_0, Enum.AnimationPriority.Action);
        return;
    else
        return;
    end;
end;
getToolAnim = function(v134) --[[ Line: 698 ]] --[[ Name: getToolAnim ]]
    for _, v136 in ipairs(v134:GetChildren()) do
        if v136.Name == "toolanim" and v136.className == "StringValue" then
            return v136;
        end;
    end;
    return nil;
end;
local v137 = 0;
stepAnimate = function(v138) --[[ Line: 709 ]] --[[ Name: stepAnimate ]]
    -- upvalues: v137 (ref), v81 (ref), v3 (ref), l_Humanoid_0 (copy), l_Parent_0 (copy), v79 (ref), v80 (ref), v118 (ref)
    local v139 = 1;
    local v140 = 1;
    local v141 = v138 - v137;
    v137 = v138;
    local v142 = false;
    if v81 > 0 then
        v81 = v81 - v141;
    end;
    if v3 == "FreeFall" and v81 <= 0 then
        playAnimation("fall", 0.2, l_Humanoid_0);
    elseif v3 == "Seated" then
        playAnimation("sit", 0.5, l_Humanoid_0);
        return;
    elseif v3 == "Running" then
        playAnimation("walk", 0.2, l_Humanoid_0);
    elseif v3 == "Dead" or v3 == "GettingUp" or v3 == "FallingDown" or v3 == "Seated" or v3 == "PlatformStanding" then
        stopAllAnimations();
        v139 = 0.1;
        v140 = 1;
        v142 = true;
    end;
    local l_Tool_0 = l_Parent_0:FindFirstChildOfClass("Tool");
    if l_Tool_0 and l_Tool_0:FindFirstChild("Handle") and not l_Tool_0:HasTag("Tool_FishingRod") and (not l_Tool_0:GetAttribute("DisableToolAnim") or false) then
        local v144 = getToolAnim(l_Tool_0);
        if v144 then
            v79 = v144.Value;
            v144.Parent = nil;
            v80 = v138 + 0.3;
        end;
        if v80 < v138 then
            v80 = 0;
            v79 = "None";
        end;
        animateTool();
        return;
    else
        stopToolAnimations();
        v79 = "None";
        v118 = nil;
        v80 = 0;
        return;
    end;
end;
l_Humanoid_0.Died:connect(onDied);
l_Humanoid_0.Running:connect(onRunning);
l_Humanoid_0.Jumping:connect(onJumping);
l_Humanoid_0.Climbing:connect(onClimbing);
l_Humanoid_0.GettingUp:connect(onGettingUp);
l_Humanoid_0.FreeFalling:connect(onFreeFall);
l_Humanoid_0.FallingDown:connect(onFallingDown);
l_Humanoid_0.Seated:connect(onSeated);
l_Humanoid_0.PlatformStanding:connect(onPlatformStanding);
l_Humanoid_0.Swimming:connect(onSwimming);
game:GetService("Players").LocalPlayer.Chatted:connect(function(v145) --[[ Line: 775 ]]
    -- upvalues: v3 (ref), v24 (copy), l_Humanoid_0 (copy)
    local v146 = "";
    if string.sub(v145, 1, 3) == "/e " then
        v146 = string.sub(v145, 4);
    elseif string.sub(v145, 1, 7) == "/emote " then
        v146 = string.sub(v145, 8);
    end;
    if v3 == "Standing" and v24[v146] ~= nil then
        playAnimation(v146, 0.1, l_Humanoid_0);
    end;
end);
script:WaitForChild("PlayEmote").OnInvoke = function(v147) --[[ Line: 789 ]]
    -- upvalues: v3 (ref), v24 (copy), l_Humanoid_0 (copy), v16 (ref)
    if v3 ~= "Standing" then
        return;
    elseif v24[v147] ~= nil then
        playAnimation(v147, 0.1, l_Humanoid_0);
        return true, v16;
    elseif typeof(v147) == "Instance" and v147:IsA("Animation") then
        playEmote(v147, 0.1, l_Humanoid_0);
        return true, v16;
    else
        return false;
    end;
end;
if l_Parent_0.Parent ~= nil then
    playAnimation("idle", 0.1, l_Humanoid_0);
    v3 = "Standing";
end;
while l_Parent_0.Parent ~= nil do
    local _, v149 = wait(0.1);
    stepAnimate(v149);
end;