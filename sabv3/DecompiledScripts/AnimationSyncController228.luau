local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local v3 = require(l_ReplicatedStorage_0.Packages.Timer);
local v4 = {};
local v5 = {};
local function _(v6, v7) --[[ Line: 12 ]] --[[ Name: sync ]]
    local v8 = v7 % v6.Length;
    if math.abs(v8 - v6.TimePosition) > 0.05 or v6.Length == 0 then
        v6.TimePosition = v8;
    end;
end;
local function v13(v10, v11) --[[ Line: 19 ]] --[[ Name: triggerResyncFor ]]
    while v11 > 0 do
        local v12 = os.clock() % v10.Length;
        if math.abs(v12 - v10.TimePosition) > 0.05 or v10.Length == 0 then
            v10.TimePosition = v12;
        end;
        v11 = v11 - task.wait();
    end;
end;
v4.Add = function(_, v15) --[[ Line: 26 ]] --[[ Name: Add ]]
    -- upvalues: v5 (copy), v13 (copy)
    table.insert(v5, v15);
    local v16 = task.spawn(v13, v15, 1);
    return function() --[[ Line: 30 ]]
        -- upvalues: v16 (copy), v5 (ref), v15 (copy)
        if coroutine.status(v16) == "suspended" then
            pcall(task.cancel, v16);
        end;
        local v17 = table.find(v5, v15);
        if v17 then
            table.remove(v5, v17);
        end;
    end;
end;
v3.Simple(1, function() --[[ Line: 42 ]]
    -- upvalues: v5 (copy)
    local v18 = os.clock();
    for _, v20 in v5 do
        local v21 = v18 % v20.Length;
        if math.abs(v21 - v20.TimePosition) > 0.05 or v20.Length == 0 then
            v20.TimePosition = v21;
        end;
    end;
end);
return v4;