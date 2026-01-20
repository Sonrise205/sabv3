local v0 = require(script.Parent.Parent.find);
local v1 = require(script.Parent.Parent.Parent.utils.deprecationWarning);
return function(v2, v3, v4) --[[ Line: 10 ]] --[[ Name: findWhere ]]
    -- upvalues: v1 (copy), v0 (copy)
    assert(v4 == nil, "[Freeze] findWhere's `from` argument is not supported.");
    v1("List." .. script.Name, "List.find");
    return v0(v2, v3);
end;