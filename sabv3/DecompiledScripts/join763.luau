local v0 = require(script.Parent.Parent.merge);
local v1 = require(script.Parent.Parent.Parent.utils.deprecationWarning);
return function(...) --[[ Line: 10 ]] --[[ Name: join ]]
    -- upvalues: v1 (copy), v0 (copy)
    v1("List." .. script.Name, "List.merge");
    return v0(...);
end;