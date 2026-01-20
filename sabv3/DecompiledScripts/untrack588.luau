if not game then
    script = require("test/relative-string");
end;
local l_get_scope_0 = require(script.Parent.graph).get_scope;
return function(v1) --[[ Line: 7 ]] --[[ Name: untrack ]]
    -- upvalues: l_get_scope_0 (copy)
    local v2 = l_get_scope_0();
    if v2 then
        local l_effect_0 = v2.effect;
        v2.effect = false;
        local l_status_0, l_result_0 = pcall(v1);
        v2.effect = l_effect_0;
        if not l_status_0 then
            error(l_result_0, 0);
        end;
        return l_result_0;
    else
        return v1();
    end;
end;