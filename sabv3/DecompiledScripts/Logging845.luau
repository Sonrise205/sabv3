--!native
local l_RunService_0 = game:GetService("RunService");
local v1 = require(game.ReplicatedStorage.UserGenerated.Lang.Keys);
local v2 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v3 = require(game.ReplicatedStorage.UserGenerated.Strings.Stringify);
local v4 = {
    Pretty = true, 
    IndentChar = " ", 
    IndentSize = 2
};
local function v11(v5, ...) --[[ Line: 40 ]] --[[ Name: InsertPrefix ]]
    local v6 = v5 or 0;
    local v7, v8, v9 = debug.info(v6 + 2, "sln");
    local v10 = ("%*:%*"):format(v7, v8);
    if v9 then
        v10 = v10 .. (" %*"):format(v9);
    end;
    return ("[%*]"):format(v10), ...;
end;
local function _(v12) --[[ Line: 52 ]] --[[ Name: Format ]]
    -- upvalues: v3 (copy), v4 (copy)
    if type(v12) == "string" then
        return v12;
    elseif typeof(v12) == "Instance" then
        return (("%*[%*]"):format(v12.ClassName, (v12:GetFullName())));
    else
        return v3.Serialize(v12, v4);
    end;
end;
local function v17(...) --[[ Line: 62 ]] --[[ Name: FormatArgs ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v14 = table.pack(...);
    for v15 = 1, v14.n do
        local v16 = v14[v15];
        v14[v15] = if type(v16) == "string" then v16 else if typeof(v16) == "Instance" then ("%*[%*]"):format(v16.ClassName, (v16:GetFullName())) else v3.Serialize(v16, v4);
    end;
    return table.unpack(v14);
end;
local function v18(...) --[[ Line: 70 ]]
    -- upvalues: v11 (copy), v17 (copy)
    task.spawn(function(...) --[[ Line: 71 ]]
        -- upvalues: v11 (ref), v17 (ref)
        print(v11(1, v17(...)));
    end, ...);
end;
local function v19(...) --[[ Line: 75 ]]
    -- upvalues: v11 (copy), v17 (copy)
    task.spawn(function(...) --[[ Line: 76 ]]
        -- upvalues: v11 (ref), v17 (ref)
        warn(v11(1, v17(...)));
    end, ...);
end;
if l_RunService_0:IsStudio() then
    v18 = print;
    v19 = warn;
end;
local function v20() --[[ Line: 88 ]]

end;
local v21 = {
    Trace = 1, 
    Debug = 2, 
    Info = 3, 
    Warn = 4, 
    Error = 5, 
    Critical = 6, 
    Off = 7
};
table.freeze(v21);
local v22 = {
    Trace = v18, 
    Debug = v18, 
    Info = v18, 
    Warn = v19, 
    Error = v19, 
    Critical = v19, 
    Off = v20
};
table.freeze(v22);
local v23 = v2.Set(v1(v21));
local v24 = table.clone(v22);
local v25 = "Info";
local function v32(v26, v27) --[[ Line: 117 ]] --[[ Name: SetLevel ]]
    -- upvalues: v21 (copy), v25 (ref), v24 (copy), v22 (copy), v20 (copy)
    assert(v21[v26]);
    local v28 = true;
    if v27 ~= nil then
        v28 = type(v27) == "boolean";
    end;
    assert(v28);
    if v25 == v26 and not v27 then
        return;
    else
        v25 = v26;
        local v29 = assert(v21[v26]);
        for v30, v31 in pairs(v21) do
            if v29 <= v31 then
                v24[v30] = v22[v30];
            else
                v24[v30] = v20;
            end;
        end;
        return;
    end;
end;
v32(v25, true);
local v33 = {
    Levels = v21, 
    AssertLevel = v23
};
setmetatable(v33, {
    __index = v24
});
v33.GetLevel = function() --[[ Line: 145 ]] --[[ Name: GetLevel ]]
    -- upvalues: v25 (ref)
    return v25;
end;
v33.SetLevel = function(v34) --[[ Line: 149 ]] --[[ Name: SetLevel ]]
    -- upvalues: v32 (copy)
    v32(v34);
end;
v33.Sink = function(v35) --[[ Line: 153 ]] --[[ Name: Sink ]]
    -- upvalues: v24 (copy)
    return assert(v24[v35]);
end;
return table.freeze(v33);