local v0 = require(script.Parent.Parent.None);
local v1 = require(script.Parent.get);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v0 (copy)
    local l_v2_0 = v2;
    local v6 = 0;
    while true do
        if v6 ~= #v3 then
            v6 = v6 + 1;
            l_v2_0 = v1(l_v2_0, v3[v6], v0);
            if l_v2_0 == v0 then
                return v4;
            end;
        else
            return l_v2_0;
        end;
    end;
end;