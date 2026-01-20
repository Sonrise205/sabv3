local v0 = require(script.Parent.Parent.Parent.utils.deprecationWarning);
return function(v1, v2) --[[ Line: 9 ]] --[[ Name: create ]]
    -- upvalues: v0 (copy)
    v0("List." .. script.Name, "table.create");
    return table.create(v1, v2);
end;