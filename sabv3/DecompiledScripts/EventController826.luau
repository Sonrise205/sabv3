local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local v4 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = nil;
local v8 = {
    Events = {}, 
    GetActiveEvents = function(_) --[[ Line: 17 ]] --[[ Name: GetActiveEvents ]]
        -- upvalues: v6 (ref)
        if not v6 then
            return {};
        else
            return v6:Get("ActiveEvents");
        end;
    end
};
v8.GetActiveEventData = function(_, v10) --[[ Line: 25 ]] --[[ Name: GetActiveEventData ]]
    -- upvalues: v8 (copy)
    for v11, v12 in v8:GetActiveEvents() do
        if v12.eventName == v10 then
            return v12, v11;
        end;
    end;
    return nil, nil;
end;
v8.IsActive = function(_, v14) --[[ Line: 35 ]] --[[ Name: IsActive ]]
    -- upvalues: v8 (copy)
    local l_v8_ActiveEventData_0, v16 = v8:GetActiveEventData(v14);
    return l_v8_ActiveEventData_0 ~= nil, v16;
end;
v8.Execute = function(_, v18, _) --[[ Line: 40 ]] --[[ Name: Execute ]]
    -- upvalues: v8 (copy)
    local v20 = v8.Events[v18];
    if not v20 then
        return false;
    elseif v20.Active then
        return false;
    else
        v20.Active = true;
        if type(v20.OnStart) == "function" then
            v20:OnStart();
        end;
        return true;
    end;
end;
v8.Cancel = function(_, v22) --[[ Line: 59 ]] --[[ Name: Cancel ]]
    -- upvalues: v8 (copy)
    local v23 = v8.Events[v22];
    if not v23 then
        return false;
    elseif not v23.Active then
        return false;
    else
        v23.Active = false;
        if type(v23.OnStop) == "function" then
            v23:OnStop();
        end;
        return true;
    end;
end;
v8.Load = function(_) --[[ Line: 78 ]] --[[ Name: Load ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v8 (copy)
    task.spawn(function() --[[ Line: 79 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v8 (ref)
        while not l_ReplicatedStorage_0:GetAttribute("EventsLoaded") do
            task.wait();
        end;
        for _, v26 in script.Events:GetChildren() do
            if v26:IsA("ModuleScript") then
                local v27, v28 = coroutine.resume(coroutine.create(require), v26);
                if not v27 or type(v28) ~= "table" then
                    warn((("Event %* failed to load:\n%*"):format(v26:GetFullName(), v28 == nil and "yielded (possibly)" or v28)));
                else
                    if type(v28.OnLoad) == "function" then
                        local v29, v30 = coroutine.resume(coroutine.create(v28.OnLoad), v28);
                        if not v29 then
                            warn((("Event %* failed to call Load function:\n%*"):format(v26:GetFullName(), v30 == nil and "yielded (possibly)" or v30)));
                            continue;
                        end;
                    end;
                    v8.Events[v26.Name] = v28;
                end;
            end;
        end;
    end);
end;
v8.Start = function(_) --[[ Line: 108 ]] --[[ Name: Start ]]
    -- upvalues: v6 (ref), v4 (copy), v8 (copy)
    v6 = v4:Wait("Events");
    v6:OnArrayInserted("ActiveEvents", function(v32) --[[ Line: 111 ]]
        -- upvalues: v8 (ref)
        v8:Execute(v32.eventName);
    end);
    v6:OnArrayRemoved("ActiveEvents", function(v33) --[[ Line: 115 ]]
        -- upvalues: v8 (ref)
        v8:Cancel(v33.eventName);
    end);
    for _, v35 in v8:GetActiveEvents() do
        task.spawn(function() --[[ Line: 120 ]]
            -- upvalues: v8 (ref), v35 (copy)
            v8:Execute(v35.eventName);
        end);
    end;
end;
return v8;