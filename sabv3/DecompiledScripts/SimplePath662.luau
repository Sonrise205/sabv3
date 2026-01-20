local v0 = {
    TIME_VARIANCE = 0.75, 
    COMPARISON_CHECKS = 1, 
    JUMP_WHEN_STUCK = false
};
local l_PathfindingService_0 = game:GetService("PathfindingService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local function _(v4, v5) --[[ Line: 25 ]] --[[ Name: output ]]
    v4((v4 == error and "SimplePath Error: " or "SimplePath: ") .. v5);
end;
local v7 = {
    StatusType = {
        Idle = "Idle", 
        Active = "Active"
    }, 
    ErrorType = {
        LimitReached = "LimitReached", 
        TargetUnreachable = "TargetUnreachable", 
        ComputationError = "ComputationError", 
        AgentStuck = "AgentStuck"
    }
};
v7.__index = function(v8, v9) --[[ Line: 40 ]]
    -- upvalues: v7 (copy)
    if v9 == "Stopped" and not v8._humanoid then
        local l_error_0 = error;
        l_error_0((l_error_0 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to use Path.Stopped on a non-humanoid.");
    end;
    return v8._events[v9] and v8._events[v9].Event or v9 == "LastError" and v8._lastError or v9 == "Status" and v8._status or v7[v9];
end;
local l_Part_0 = Instance.new("Part");
l_Part_0.Size = Vector3.new(0.30000001192092896, 0.30000001192092896, 0.30000001192092896, 0);
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.Material = Enum.Material.Neon;
l_Part_0.Shape = Enum.PartType.Ball;
local function _(v12, v13) --[[ Line: 59 ]] --[[ Name: declareError ]]
    v12._lastError = v13;
    v12._events.Error:Fire(v13);
end;
local function v20(v15) --[[ Line: 65 ]] --[[ Name: createVisualWaypoints ]]
    -- upvalues: l_Part_0 (copy)
    local v16 = {};
    for _, v18 in ipairs(v15) do
        local v19 = l_Part_0:Clone();
        v19.Position = v18.Position;
        v19.Parent = workspace;
        v19.Color = v18 == v15[#v15] and Color3.fromRGB(0, 255, 0) or v18.Action == Enum.PathWaypointAction.Jump and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 139, 0);
        table.insert(v16, v19);
    end;
    return v16;
end;
local _ = function(v21) --[[ Line: 81 ]] --[[ Name: destroyVisualWaypoints ]]
    if v21 then
        for _, v23 in ipairs(v21) do
            v23:Destroy();
        end;
    end;
end;
local function _(v25) --[[ Line: 90 ]] --[[ Name: getRootPart ]]
    if type(v25._humanoid) == "table" then
        return v25._humanoid.Mover;
    else
        return v25._agent.PrimaryPart;
    end;
end;
local function v29(v27) --[[ Line: 99 ]] --[[ Name: getNonHumanoidWaypoint ]]
    for v28 = 2, #v27._waypoints do
        if (v27._waypoints[v28].Position - v27._waypoints[v28 - 1].Position).Magnitude > 0.1 then
            return v28;
        end;
    end;
    return 2;
end;
local function _(v30) --[[ Line: 110 ]] --[[ Name: setJumpState ]]
    pcall(function() --[[ Line: 111 ]]
        -- upvalues: v30 (copy)
        if v30._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v30._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
            v30._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
        end;
    end);
end;
local function _(v32) --[[ Line: 119 ]] --[[ Name: move ]]
    if v32._waypoints[v32._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
        pcall(function() --[[ Line: 111 ]]
            -- upvalues: v32 (copy)
            if v32._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v32._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                v32._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
            end;
        end);
    end;
    v32._humanoid:MoveTo(v32._waypoints[v32._currentWaypoint].Position);
end;
local function _(v34) --[[ Line: 127 ]] --[[ Name: disconnectMoveConnection ]]
    if v34._moveConnection then
        v34._moveConnection:Disconnect();
        v34._moveConnection = nil;
    end;
end;
local function _(v36) --[[ Line: 135 ]] --[[ Name: invokeWaypointReached ]]
    local v37 = v36._waypoints[v36._currentWaypoint - 1];
    local v38 = v36._waypoints[v36._currentWaypoint];
    v36._events.WaypointReached:Fire(v36._agent, v37, v38);
end;
local function v60(v40, v41) --[[ Line: 141 ]] --[[ Name: moveToFinished ]]
    -- upvalues: v7 (copy)
    if not getmetatable(v40) then
        return;
    elseif not v40._humanoid then
        if v41 and v40._currentWaypoint + 1 <= #v40._waypoints then
            local v42 = v40._waypoints[v40._currentWaypoint - 1];
            local v43 = v40._waypoints[v40._currentWaypoint];
            v40._events.WaypointReached:Fire(v40._agent, v42, v43);
            v40._currentWaypoint = v40._currentWaypoint + 1;
            return;
        elseif v41 then
            local l__visualWaypoints_0 = v40._visualWaypoints;
            if l__visualWaypoints_0 then
                for _, v46 in ipairs(l__visualWaypoints_0) do
                    v46:Destroy();
                end;
            end;
            v40._visualWaypoints = nil;
            v40._target = nil;
            v40._events.Reached:Fire(v40._agent, v40._waypoints[v40._currentWaypoint]);
            return;
        else
            local l__visualWaypoints_1 = v40._visualWaypoints;
            if l__visualWaypoints_1 then
                for _, v49 in ipairs(l__visualWaypoints_1) do
                    v49:Destroy();
                end;
            end;
            v40._visualWaypoints = nil;
            v40._target = nil;
            local l_TargetUnreachable_0 = v40.ErrorType.TargetUnreachable;
            v40._lastError = l_TargetUnreachable_0;
            v40._events.Error:Fire(l_TargetUnreachable_0);
            return;
        end;
    elseif v41 and v40._currentWaypoint + 1 <= #v40._waypoints then
        if v40._currentWaypoint + 1 < #v40._waypoints then
            local v51 = v40._waypoints[v40._currentWaypoint - 1];
            local v52 = v40._waypoints[v40._currentWaypoint];
            v40._events.WaypointReached:Fire(v40._agent, v51, v52);
        end;
        v40._currentWaypoint = v40._currentWaypoint + 1;
        if v40._waypoints[v40._currentWaypoint].Action == Enum.PathWaypointAction.Jump then
            pcall(function() --[[ Line: 111 ]]
                -- upvalues: v40 (copy)
                if v40._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v40._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                    v40._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                end;
            end);
        end;
        v40._humanoid:MoveTo(v40._waypoints[v40._currentWaypoint].Position);
        return;
    elseif v41 then
        if v40._moveConnection then
            v40._moveConnection:Disconnect();
            v40._moveConnection = nil;
        end;
        v40._status = v7.StatusType.Idle;
        local l__visualWaypoints_2 = v40._visualWaypoints;
        if l__visualWaypoints_2 then
            for _, v55 in ipairs(l__visualWaypoints_2) do
                v55:Destroy();
            end;
        end;
        v40._visualWaypoints = nil;
        v40._events.Reached:Fire(v40._agent, v40._waypoints[v40._currentWaypoint]);
        return;
    else
        if v40._moveConnection then
            v40._moveConnection:Disconnect();
            v40._moveConnection = nil;
        end;
        v40._status = v7.StatusType.Idle;
        local l__visualWaypoints_3 = v40._visualWaypoints;
        if l__visualWaypoints_3 then
            for _, v58 in ipairs(l__visualWaypoints_3) do
                v58:Destroy();
            end;
        end;
        v40._visualWaypoints = nil;
        local l_TargetUnreachable_1 = v40.ErrorType.TargetUnreachable;
        v40._lastError = l_TargetUnreachable_1;
        v40._events.Error:Fire(l_TargetUnreachable_1);
        return;
    end;
end;
local function v64(v61) --[[ Line: 183 ]] --[[ Name: comparePosition ]]
    if v61._currentWaypoint == #v61._waypoints then
        return;
    else
        local v62 = if type(v61._humanoid) == "table" then v61._humanoid.Mover else v61._agent.PrimaryPart;
        v61._position._count = (v62.Position - v61._position._last).Magnitude <= 0.07 and v61._position._count + 1 or 0;
        v61._position._last = v62.Position;
        if v61._position._count >= v61._settings.COMPARISON_CHECKS then
            if v61._settings.JUMP_WHEN_STUCK then
                pcall(function() --[[ Line: 111 ]]
                    -- upvalues: v61 (copy)
                    if v61._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and v61._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                        v61._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                    end;
                end);
            end;
            local l_AgentStuck_0 = v61.ErrorType.AgentStuck;
            v61._lastError = l_AgentStuck_0;
            v61._events.Error:Fire(l_AgentStuck_0);
        end;
        return;
    end;
end;
v7.GetNearestCharacter = function(v65) --[[ Line: 197 ]] --[[ Name: GetNearestCharacter ]]
    -- upvalues: l_Players_0 (copy)
    local v66 = nil;
    local v67 = 1e999;
    for _, v69 in ipairs(l_Players_0:GetPlayers()) do
        if v69.Character and (v69.Character.PrimaryPart.Position - v65).Magnitude < v67 then
            v66 = v69.Character;
            v67 = (v69.Character.PrimaryPart.Position - v65).Magnitude;
        end;
    end;
    return v66;
end;
v7.new = function(v70, v71, v72) --[[ Line: 208 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_PathfindingService_0 (copy), v7 (copy)
    if not v70 or not v70:IsA("Model") or not v70.PrimaryPart then
        local l_error_1 = error;
        l_error_1((l_error_1 == error and "SimplePath Error: " or "SimplePath: ") .. "Pathfinding agent must be a valid Model Instance with a set PrimaryPart.");
    end;
    local v74 = setmetatable({
        _settings = v72 or v0, 
        _events = {
            Reached = Instance.new("BindableEvent"), 
            WaypointReached = Instance.new("BindableEvent"), 
            Blocked = Instance.new("BindableEvent"), 
            Error = Instance.new("BindableEvent"), 
            Stopped = Instance.new("BindableEvent")
        }, 
        _agent = v70, 
        _humanoid = v70:FindFirstChildOfClass("Humanoid"), 
        _path = l_PathfindingService_0:CreatePath(v71), 
        _status = "Idle", 
        _t = 0, 
        _position = {
            _last = Vector3.new(), 
            _count = 0
        }
    }, v7);
    for v75, v76 in pairs(v0) do
        v74._settings[v75] = v74._settings[v75] == nil and v76 or v74._settings[v75];
    end;
    v74._path.Blocked:Connect(function(...) --[[ Line: 239 ]]
        -- upvalues: v74 (copy)
        if v74._currentWaypoint <= ... and ... <= v74._currentWaypoint + 1 and v74._humanoid then
            local l_v74_0 = v74;
            pcall(function() --[[ Line: 111 ]]
                -- upvalues: l_v74_0 (copy)
                if l_v74_0._humanoid:GetState() ~= Enum.HumanoidStateType.Jumping and l_v74_0._humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                    l_v74_0._humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                end;
            end);
            v74._events.Blocked:Fire(v74._agent, v74._waypoints[...]);
        end;
    end);
    return v74;
end;
v7.Destroy = function(v78) --[[ Line: 251 ]] --[[ Name: Destroy ]]
    if v78._moveConnection then
        v78._moveConnection:Disconnect();
        v78._moveConnection = nil;
    end;
    for _, v80 in ipairs(v78._events) do
        v80:Destroy();
    end;
    v78._events = nil;
    if rawget(v78, "_visualWaypoints") then
        local l__visualWaypoints_4 = v78._visualWaypoints;
        if l__visualWaypoints_4 then
            for _, v83 in ipairs(l__visualWaypoints_4) do
                v83:Destroy();
            end;
        end;
        v78._visualWaypoints = nil;
    end;
    v78._path:Destroy();
    setmetatable(v78, nil);
    for v84, _ in pairs(v78) do
        v78[v84] = nil;
    end;
end;
v7.Stop = function(v86) --[[ Line: 267 ]] --[[ Name: Stop ]]
    -- upvalues: v7 (copy)
    if not v86._humanoid then
        local l_error_2 = error;
        l_error_2((l_error_2 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to call Path:Stop() on a non-humanoid.");
        return;
    elseif v86._status == v7.StatusType.Idle then
        local function v89(v88) --[[ Line: 273 ]]
            warn(debug.traceback(v88));
        end;
        v89((v89 == error and "SimplePath Error: " or "SimplePath: ") .. "Attempt to run Path:Stop() in idle state");
        return;
    else
        if v86._moveConnection then
            v86._moveConnection:Disconnect();
            v86._moveConnection = nil;
        end;
        v86._status = v7.StatusType.Idle;
        local l__visualWaypoints_5 = v86._visualWaypoints;
        if l__visualWaypoints_5 then
            for _, v92 in ipairs(l__visualWaypoints_5) do
                v92:Destroy();
            end;
        end;
        v86._visualWaypoints = nil;
        v86._events.Stopped:Fire(v86._model);
        return;
    end;
end;
v7.Run = function(v93, v94) --[[ Line: 284 ]] --[[ Name: Run ]]
    -- upvalues: v60 (copy), v7 (copy), v64 (copy), v20 (copy), l_RunService_0 (copy), v29 (copy)
    if not v94 and not v93._humanoid and v93._target then
        v60(v93, true);
        return;
    else
        local v95 = if type(v93._humanoid) == "table" then v93._humanoid.Mover else v93._agent.PrimaryPart;
        if not v94 or typeof(v94) ~= "Vector3" and not v94:IsA("PVInstance") then
            local l_error_3 = error;
            l_error_3((l_error_3 == error and "SimplePath Error: " or "SimplePath: ") .. "Pathfinding target must be a valid Vector3 or PVInstance.");
        end;
        if os.clock() - v93._t <= v93._settings.TIME_VARIANCE and v93._humanoid then
            task.wait(os.clock() - v93._t);
            local l_LimitReached_0 = v93.ErrorType.LimitReached;
            v93._lastError = l_LimitReached_0;
            v93._events.Error:Fire(l_LimitReached_0);
            return false;
        else
            if v93._humanoid then
                v93._t = os.clock();
            end;
            local l_status_0, _ = pcall(function() --[[ Line: 309 ]]
                -- upvalues: v93 (copy), v95 (copy), v94 (copy)
                v93._path:ComputeAsync(v95.Position, typeof(v94) == "Vector3" and v94 or v94:GetPivot().Position);
            end);
            if not v93._path then
                return;
            elseif not l_status_0 or v93._path.Status == Enum.PathStatus.NoPath or #v93._path:GetWaypoints() < 2 or v93._humanoid and v93._humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                local l__visualWaypoints_6 = v93._visualWaypoints;
                if l__visualWaypoints_6 then
                    for _, v102 in ipairs(l__visualWaypoints_6) do
                        v102:Destroy();
                    end;
                end;
                v93._visualWaypoints = nil;
                task.wait();
                if not v93._path then
                    return false;
                else
                    local l_ComputationError_0 = v93.ErrorType.ComputationError;
                    v93._lastError = l_ComputationError_0;
                    v93._events.Error:Fire(l_ComputationError_0);
                    return false;
                end;
            else
                v93._status = v93._humanoid and v7.StatusType.Active or v7.StatusType.Idle;
                v93._target = v94;
                if not v95.Anchored then
                    pcall(function() --[[ Line: 339 ]]
                        -- upvalues: v95 (copy)
                        v95:SetNetworkOwner(nil);
                    end);
                end;
                v93._waypoints = v93._path:GetWaypoints();
                v93._currentWaypoint = 2;
                if v93._humanoid then
                    v64(v93);
                end;
                local l__visualWaypoints_7 = v93._visualWaypoints;
                if l__visualWaypoints_7 then
                    for _, v106 in ipairs(l__visualWaypoints_7) do
                        v106:Destroy();
                    end;
                end;
                v93._visualWaypoints = v93.Visualize and v20(v93._waypoints);
                v93._moveConnection = v93._humanoid and (v93._moveConnection or l_RunService_0.PostSimulation:Connect(function(v107) --[[ Line: 358 ]]
                    -- upvalues: v93 (copy), v60 (ref), v7 (ref)
                    debug.profilebegin("SimplePath:MoveToFinished");
                    if not v93._humanoid then
                        debug.profileend();
                        return;
                    else
                        local l_v93_0 = v93;
                        local v109 = if type(l_v93_0._humanoid) == "table" then l_v93_0._humanoid.Mover else l_v93_0._agent.PrimaryPart;
                        if not v109 then
                            debug.profileend();
                            return;
                        else
                            if ((v109.Position - v93._waypoints[v93._currentWaypoint].Position) * Vector3.new(1, 0, 1, 0)).Magnitude <= 5 then
                                v93._moveTimer = 0;
                                v60(v93, true);
                            else
                                v93._moveTimer = (v93._moveTimer or 0) + v107;
                                if v93._moveTimer >= 8 then
                                    local l_v93_1 = v93;
                                    if getmetatable(l_v93_1) then
                                        if not l_v93_1._humanoid then
                                            local l__visualWaypoints_8 = l_v93_1._visualWaypoints;
                                            if l__visualWaypoints_8 then
                                                for _, v113 in ipairs(l__visualWaypoints_8) do
                                                    v113:Destroy();
                                                end;
                                            end;
                                            l_v93_1._visualWaypoints = nil;
                                            l_v93_1._target = nil;
                                            local l_TargetUnreachable_2 = l_v93_1.ErrorType.TargetUnreachable;
                                            l_v93_1._lastError = l_TargetUnreachable_2;
                                            l_v93_1._events.Error:Fire(l_TargetUnreachable_2);
                                        else
                                            if l_v93_1._moveConnection then
                                                l_v93_1._moveConnection:Disconnect();
                                                l_v93_1._moveConnection = nil;
                                            end;
                                            l_v93_1._status = v7.StatusType.Idle;
                                            local l__visualWaypoints_9 = l_v93_1._visualWaypoints;
                                            if l__visualWaypoints_9 then
                                                for _, v117 in ipairs(l__visualWaypoints_9) do
                                                    v117:Destroy();
                                                end;
                                            end;
                                            l_v93_1._visualWaypoints = nil;
                                            local l_TargetUnreachable_3 = l_v93_1.ErrorType.TargetUnreachable;
                                            l_v93_1._lastError = l_TargetUnreachable_3;
                                            l_v93_1._events.Error:Fire(l_TargetUnreachable_3);
                                        end;
                                    end;
                                end;
                            end;
                            debug.profileend();
                            return;
                        end;
                    end;
                end));
                if v93._humanoid then
                    v93._humanoid:MoveTo(v93._waypoints[v93._currentWaypoint].Position);
                elseif #v93._waypoints == 2 then
                    v93._target = nil;
                    local l__visualWaypoints_10 = v93._visualWaypoints;
                    if l__visualWaypoints_10 then
                        for _, v121 in ipairs(l__visualWaypoints_10) do
                            v121:Destroy();
                        end;
                    end;
                    v93._visualWaypoints = nil;
                    v93._events.Reached:Fire(v93._agent, v93._waypoints[2]);
                else
                    v93._currentWaypoint = v29(v93);
                    v60(v93, true);
                end;
                return true;
            end;
        end;
    end;
end;
return v7;