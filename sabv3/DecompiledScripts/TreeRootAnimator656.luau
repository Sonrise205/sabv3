local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Observers);
local v3 = require(l_ReplicatedStorage_0.Packages.Trove);
local v4 = {
    "StartX", 
    "StartZ", 
    "Direction", 
    "FromLength", 
    "ToLength", 
    "TweenDuration", 
    "TweenId", 
    "ThicknessY", 
    "PauseUntil"
};
local v5 = {};
local v6 = {};
local v7 = {};
local v8 = nil;
local function v14(v9) --[[ Line: 37 ]] --[[ Name: getStateFromPart ]]
    -- upvalues: v4 (copy)
    local v10 = {};
    for _, v12 in v4 do
        local l_v9_Attribute_0 = v9:GetAttribute(v12);
        if typeof(l_v9_Attribute_0) ~= "number" and typeof(l_v9_Attribute_0) ~= "Vector2" then
            return nil;
        else
            v10[v12] = l_v9_Attribute_0;
        end;
    end;
    v10.Elapsed = 0;
    v10.Part = v9;
    return v10;
end;
local function v23(v15, v16) --[[ Line: 55 ]] --[[ Name: setRunTransformLocal ]]
    local l_Y_0 = v15.Part.Position.Y;
    local v18 = v16 or v15.FromLength;
    local v19 = (v18 - 1) * 0.5;
    local v20 = nil;
    v20 = if v15.Direction.X ~= 0 then Vector3.new(v15.StartX + v15.Direction.X * v19, l_Y_0, v15.StartZ + 0.5) else Vector3.new(v15.StartX + 0.5, l_Y_0, v15.StartZ + v15.Direction.Y * v19);
    local v21 = if v15.Direction.X ~= 0 then math.max(1, v18) else 2;
    local v22 = if v15.Direction.Y ~= 0 then math.max(1, v18) else 2;
    v15.Part.Size = Vector3.new(v21, v15.ThicknessY, v22);
    v15.Part.CFrame = CFrame.new(v20);
end;
local function _() --[[ Line: 75 ]] --[[ Name: startTweenSimulation ]]
    -- upvalues: v8 (ref), l_RunService_0 (copy), v5 (copy), v6 (copy), v23 (copy)
    if v8 and v8.Connected then
        return;
    else
        v8 = l_RunService_0.PostSimulation:Connect(function(v24) --[[ Line: 80 ]]
            -- upvalues: v5 (ref), v8 (ref), v6 (ref), v23 (ref)
            debug.profilebegin("TreeRootAnimator:Step");
            if next(v5) == nil and v8 ~= nil and v8.Connected then
                v8:Disconnect();
                v8 = nil;
                debug.profileend();
                return;
            else
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                for v26, v27 in v6 do
                    if v27.PauseUntil <= l_workspace_ServerTimeNow_0 then
                        v5[v26] = v27;
                        v6[v26] = nil;
                        v23(v27);
                    else
                        v23(v27);
                    end;
                end;
                local v28 = 0;
                for v29, v30 in v5 do
                    if l_workspace_ServerTimeNow_0 < v30.PauseUntil then
                        v6[v29] = v30;
                        v5[v29] = nil;
                        v23(v30);
                    else
                        v30.Elapsed = v30.Elapsed + v24;
                        local v31 = math.max(v30.TweenDuration, 0.011111111111111112);
                        local v32 = math.clamp(v30.Elapsed / v31, 0, 1);
                        local v33 = v30.FromLength + (v30.ToLength - v30.FromLength) * v32;
                        v23(v30, v33);
                        if v32 >= 1 then
                            v5[v29] = nil;
                        end;
                    end;
                    v28 = v28 + 1;
                    if v28 >= 3 then
                        break;
                    end;
                end;
                debug.profileend();
                return;
            end;
        end);
        return;
    end;
end;
local function v48(v35) --[[ Line: 135 ]] --[[ Name: applyTweenFromAttributes ]]
    -- upvalues: v14 (copy), v7 (copy), v6 (copy), v5 (copy), v23 (copy), v8 (ref), l_RunService_0 (copy)
    local v36 = v14(v35);
    if not v36 then
        return;
    else
        local l_TweenId_0 = v36.TweenId;
        if v7[v35] == l_TweenId_0 then
            return;
        else
            v7[v35] = l_TweenId_0;
            if workspace:GetServerTimeNow() < v36.PauseUntil then
                v6[v35] = v36;
                v5[v35] = nil;
            else
                v5[v35] = v36;
                v6[v35] = nil;
            end;
            v23(v36);
            if v8 and v8.Connected then
                return;
            else
                v8 = l_RunService_0.PostSimulation:Connect(function(v38) --[[ Line: 80 ]]
                    -- upvalues: v5 (ref), v8 (ref), v6 (ref), v23 (ref)
                    debug.profilebegin("TreeRootAnimator:Step");
                    if next(v5) == nil and v8 ~= nil and v8.Connected then
                        v8:Disconnect();
                        v8 = nil;
                        debug.profileend();
                        return;
                    else
                        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                        for v40, v41 in v6 do
                            if v41.PauseUntil <= l_workspace_ServerTimeNow_1 then
                                v5[v40] = v41;
                                v6[v40] = nil;
                                v23(v41);
                            else
                                v23(v41);
                            end;
                        end;
                        local v42 = 0;
                        for v43, v44 in v5 do
                            if l_workspace_ServerTimeNow_1 < v44.PauseUntil then
                                v6[v43] = v44;
                                v5[v43] = nil;
                                v23(v44);
                            else
                                v44.Elapsed = v44.Elapsed + v38;
                                local v45 = math.max(v44.TweenDuration, 0.011111111111111112);
                                local v46 = math.clamp(v44.Elapsed / v45, 0, 1);
                                local v47 = v44.FromLength + (v44.ToLength - v44.FromLength) * v46;
                                v23(v44, v47);
                                if v46 >= 1 then
                                    v5[v43] = nil;
                                end;
                            end;
                            v42 = v42 + 1;
                            if v42 >= 3 then
                                break;
                            end;
                        end;
                        debug.profileend();
                        return;
                    end;
                end);
                return;
            end;
        end;
    end;
end;
return v2.observeTag("RootRunTween", function(v49) --[[ Line: 168 ]]
    -- upvalues: v3 (copy), v48 (copy), v5 (copy), v6 (copy), v23 (copy), v14 (copy), v8 (ref), l_RunService_0 (copy), v7 (copy)
    if not v49:IsA("BasePart") then
        return nil;
    else
        local v50 = v3.new();
        v48(v49);
        v50:Add(v49:GetAttributeChangedSignal("TweenId"):Connect(function() --[[ Line: 179 ]]
            -- upvalues: v48 (ref), v49 (copy)
            v48(v49);
        end));
        v50:Add(v49:GetAttributeChangedSignal("PauseUntil"):Connect(function() --[[ Line: 183 ]]
            -- upvalues: v49 (copy), v5 (ref), v6 (ref), v23 (ref), v14 (ref), v8 (ref), l_RunService_0 (ref)
            local v51 = v49:GetAttribute("PauseUntil") or 0;
            local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
            local v53 = v5[v49];
            local v54 = v6[v49];
            if l_workspace_ServerTimeNow_2 < v51 then
                if v53 then
                    v53.PauseUntil = v51;
                    v6[v49] = v53;
                    v5[v49] = nil;
                    v23(v53);
                elseif v54 then
                    v54.PauseUntil = v51;
                    v23(v54);
                else
                    local v55 = v14(v49);
                    if v55 then
                        v6[v49] = v55;
                        v23(v55);
                    end;
                end;
                if v8 and v8.Connected then
                    return;
                else
                    v8 = l_RunService_0.PostSimulation:Connect(function(v56) --[[ Line: 80 ]]
                        -- upvalues: v5 (ref), v8 (ref), v6 (ref), v23 (ref)
                        debug.profilebegin("TreeRootAnimator:Step");
                        if next(v5) == nil and v8 ~= nil and v8.Connected then
                            v8:Disconnect();
                            v8 = nil;
                            debug.profileend();
                            return;
                        else
                            local l_workspace_ServerTimeNow_3 = workspace:GetServerTimeNow();
                            for v58, v59 in v6 do
                                if v59.PauseUntil <= l_workspace_ServerTimeNow_3 then
                                    v5[v58] = v59;
                                    v6[v58] = nil;
                                    v23(v59);
                                else
                                    v23(v59);
                                end;
                            end;
                            local v60 = 0;
                            for v61, v62 in v5 do
                                if l_workspace_ServerTimeNow_3 < v62.PauseUntil then
                                    v6[v61] = v62;
                                    v5[v61] = nil;
                                    v23(v62);
                                else
                                    v62.Elapsed = v62.Elapsed + v56;
                                    local v63 = math.max(v62.TweenDuration, 0.011111111111111112);
                                    local v64 = math.clamp(v62.Elapsed / v63, 0, 1);
                                    local v65 = v62.FromLength + (v62.ToLength - v62.FromLength) * v64;
                                    v23(v62, v65);
                                    if v64 >= 1 then
                                        v5[v61] = nil;
                                    end;
                                end;
                                v60 = v60 + 1;
                                if v60 >= 3 then
                                    break;
                                end;
                            end;
                            debug.profileend();
                            return;
                        end;
                    end);
                end;
            end;
        end));
        return function() --[[ Line: 215 ]]
            -- upvalues: v50 (copy), v5 (ref), v49 (copy), v7 (ref)
            v50:Destroy();
            v5[v49] = nil;
            v7[v49] = nil;
        end;
    end;
end);