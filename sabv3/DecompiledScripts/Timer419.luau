local v0 = require(script.Parent.Signal);
local l_RunService_0 = game:GetService("RunService");
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 95 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_RunService_0 (copy), v0 (copy)
    assert(type(v3) == "number", "Argument #1 to Timer.new must be a number; got " .. type(v3));
    assert(v3 >= 0, "Argument #1 to Timer.new must be greater or equal to 0; got " .. tostring(v3));
    local v4 = setmetatable({}, v2);
    v4._runHandle = nil;
    v4.Interval = v3;
    v4.UpdateSignal = l_RunService_0.Heartbeat;
    v4.TimeFunction = time;
    v4.AllowDrift = true;
    v4.Tick = v0.new();
    return v4;
end;
v2.Simple = function(v5, v6, v7, v8, v9) --[[ Line: 125 ]] --[[ Name: Simple ]]
    -- upvalues: l_RunService_0 (copy)
    local v10 = v8 or l_RunService_0.Heartbeat;
    local v11 = v9 or time;
    local v12 = v11() + v5;
    if v7 then
        task.defer(v6);
    end;
    return v10:Connect(function() --[[ Line: 138 ]]
        -- upvalues: v11 (copy), v12 (ref), v5 (copy), v6 (copy)
        debug.profilebegin("Timer");
        local v13 = v11();
        if v12 <= v13 then
            v12 = v13 + v5;
            task.defer(v6);
        end;
        debug.profileend();
    end);
end;
v2.Is = function(v14) --[[ Line: 152 ]] --[[ Name: Is ]]
    -- upvalues: v2 (copy)
    local v15 = false;
    if type(v14) == "table" then
        v15 = getmetatable(v14) == v2;
    end;
    return v15;
end;
v2._startTimer = function(v16) --[[ Line: 156 ]] --[[ Name: _startTimer ]]
    local l_TimeFunction_0 = v16.TimeFunction;
    local v18 = l_TimeFunction_0() + v16.Interval;
    v16._runHandle = v16.UpdateSignal:Connect(function() --[[ Line: 159 ]]
        -- upvalues: l_TimeFunction_0 (copy), v18 (ref), v16 (copy)
        local v19 = l_TimeFunction_0();
        if v18 <= v19 then
            v18 = v19 + v16.Interval;
            v16.Tick:Fire();
        end;
    end);
end;
v2._startTimerNoDrift = function(v20) --[[ Line: 168 ]] --[[ Name: _startTimerNoDrift ]]
    assert(v20.Interval > 0, "Interval must be greater than 0 when AllowDrift is set to false");
    local l_TimeFunction_1 = v20.TimeFunction;
    local v22 = 1;
    local v23 = l_TimeFunction_1();
    local v24 = v23 + v20.Interval;
    v20._runHandle = v20.UpdateSignal:Connect(function() --[[ Line: 174 ]]
        -- upvalues: l_TimeFunction_1 (copy), v24 (ref), v22 (ref), v23 (copy), v20 (copy)
        local v25 = l_TimeFunction_1();
        while v24 <= v25 do
            v22 = v22 + 1;
            v24 = v23 + v20.Interval * v22;
            v20.Tick:Fire();
        end;
    end);
end;
v2.Start = function(v26) --[[ Line: 191 ]] --[[ Name: Start ]]
    if v26._runHandle then
        return;
    elseif v26.AllowDrift then
        v26:_startTimer();
        return;
    else
        v26:_startTimerNoDrift();
        return;
    end;
end;
v2.StartNow = function(v27) --[[ Line: 210 ]] --[[ Name: StartNow ]]
    if v27._runHandle then
        return;
    else
        v27.Tick:Fire();
        v27:Start();
        return;
    end;
end;
v2.Stop = function(v28) --[[ Line: 225 ]] --[[ Name: Stop ]]
    if not v28._runHandle then
        return;
    else
        v28._runHandle:Disconnect();
        v28._runHandle = nil;
        return;
    end;
end;
v2.IsRunning = function(v29) --[[ Line: 242 ]] --[[ Name: IsRunning ]]
    return v29._runHandle ~= nil;
end;
v2.Destroy = function(v30) --[[ Line: 249 ]] --[[ Name: Destroy ]]
    v30.Tick:Destroy();
    v30:Stop();
end;
return v2;