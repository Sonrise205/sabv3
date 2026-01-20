if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.switch);
return function(v1, v2, v3) --[[ Line: 5 ]] --[[ Name: show ]]
    -- upvalues: v0 (copy)
    return v0(function() --[[ Line: 6 ]] --[[ Name: truthy ]]
        -- upvalues: v1 (copy)
        return not not v1();
    end)({
        [true] = v2, 
        [false] = v3
    });
end;