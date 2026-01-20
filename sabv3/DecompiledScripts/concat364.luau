local v0 = require(script.Parent.Parent.None);
local v1 = require(script.Parent.Parent.utils.maybeFreeze);
return function(...) --[[ Line: 16 ]] --[[ Name: concat ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v2 = {};
    local v3 = 1;
    for v4 = 1, select("#", ...) do
        local v5 = select(v4, ...);
        if v5 ~= nil and type(v5) == "table" and #v5 > 0 then
            for _, v7 in ipairs(v5) do
                if v7 ~= v0 then
                    v2[v3] = v7;
                    v3 = v3 + 1;
                end;
            end;
        end;
    end;
    return v1(v2);
end;