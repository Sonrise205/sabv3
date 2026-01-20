local v0 = require(script.Parent.observePlayer);
local v1 = require(script.Parent.observeCharacter);
return function(v2) --[[ Line: 22 ]] --[[ Name: observeCharacters ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0(function(v3) --[[ Line: 23 ]]
        -- upvalues: v1 (ref), v2 (copy)
        return v1(v3, v2);
    end);
end;