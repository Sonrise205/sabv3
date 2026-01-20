local v0 = require(script.Parent.Parent.removeValue);
local v1 = require(script.Parent.Parent.Parent.utils.deprecationWarning);
return function(v2, ...) --[[ Line: 10 ]] --[[ Name: removeValues ]]
    -- upvalues: v1 (copy), v0 (copy)
    v1("List." .. script.Name, "List.removeValue");
    return v0(v2, ...);
end;