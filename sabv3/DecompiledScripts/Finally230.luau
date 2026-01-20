--!native
local function v1(v0) --[[ Line: 20 ]] --[[ Name: ErrorHandler ]]
    warn((("%*\nStack Begin\n%*Stack End"):format(tostring(v0), (debug.traceback(nil, 3)))));
end;
local function v4(v2, v3, ...) --[[ Line: 24 ]] --[[ Name: Handle ]]
    -- upvalues: v1 (copy)
    xpcall(v2, v1);
    if not v3 then
        error((select(1, ...)));
    end;
    return ...;
end;
return function(v5, v6, ...) --[[ Line: 36 ]] --[[ Name: Finally ]]
    -- upvalues: v4 (copy), v1 (copy)
    return v4(v6, xpcall(v5, v1, ...));
end;