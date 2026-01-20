local v0 = require(script.Parent.Parent.utils.maybeFreeze);
return function(v1, ...) --[[ Line: 14 ]] --[[ Name: push ]]
    -- upvalues: v0 (copy)
    if #{
        ...
    } == 0 then
        return v1;
    else
        local v2 = table.clone(v1);
        for _, v4 in {
            ...
        } do
            table.insert(v2, v4);
        end;
        return v0(v2);
    end;
end;