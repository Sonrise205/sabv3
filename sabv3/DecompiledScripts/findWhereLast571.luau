local v0 = require(script.Parent.Parent.reverse);
local v1 = require(script.Parent.Parent.find);
local v2 = require(script.Parent.Parent.Parent.utils.deprecationWarning);
return function(v3, v4, v5) --[[ Line: 11 ]] --[[ Name: findWhereLast ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy)
    assert(v5 == nil, "[Freeze] findWhereLast's `from` argument is not supported.");
    v2("List." .. script.Name, "List.reverse and then List.find");
    local v6 = v0(v3);
    return v1(v6, v4);
end;