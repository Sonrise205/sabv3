local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Parent.Parent.Freeze);
local _ = require(script.Parent.Types);
return table.freeze({
    SerializedNone = "\000", 
    ShouldMock = l_RunService_0:IsStudio() and not l_RunService_0:IsRunning() or _G.NOCOLOR, 
    getValue = function(v3) --[[ Line: 29 ]] --[[ Name: getValue ]]
        -- upvalues: v1 (copy)
        if v3 == v1.None or v3 == "\000" then
            return nil;
        else
            return v3;
        end;
    end, 
    getPathTable = function(v4) --[[ Line: 9 ]] --[[ Name: getPathTable ]]
        if type(v4) == "table" then
            return table.clone(v4);
        elseif type(v4) == "string" then
            return string.split(v4, ".");
        else
            return {
                v4
            };
        end;
    end, 
    getPathString = function(v5) --[[ Line: 19 ]] --[[ Name: getPathString ]]
        if type(v5) == "string" then
            return v5;
        elseif type(v5) == "table" then
            return table.concat(v5, ".");
        else
            return (tostring(v5));
        end;
    end, 
    safeCancelThread = function(v6) --[[ Line: 33 ]] --[[ Name: safeCancelThread ]]
        if coroutine.status(v6) ~= "dead" then
            pcall(task.cancel, v6);
        end;
    end, 
    trimString = function(v7) --[[ Line: 39 ]] --[[ Name: trimString ]]
        return string.gsub(v7, "^%s*(.-)%s*$", "%1");
    end, 
    checkForTrimmedString = function(v8) --[[ Line: 43 ]] --[[ Name: checkForTrimmedString ]]
        return v8 ~= string.gsub(v8, "^%s*(.-)%s*$", "%1");
    end
});