local v0 = require(script.Parent.Parent.utils.maybeFreeze);
local function v8(v1, v2) --[[ Line: 4 ]] --[[ Name: removeSingle ]]
    local v3 = #v1;
    local v4 = table.create(v3 - 1);
    if v2 < 1 then
        v2 = v2 + (v3 + 1);
    end;
    if v2 <= 0 or v3 < v2 then
        return v1;
    else
        local v5 = 1;
        for v6, v7 in v1 do
            if v6 ~= v2 then
                v4[v5] = v7;
                v5 = v5 + 1;
            end;
        end;
        return v4;
    end;
end;
return function(v9, ...) --[[ Line: 44 ]] --[[ Name: remove ]]
    -- upvalues: v8 (copy), v0 (copy)
    local v10 = {
        ...
    };
    if #v10 == 1 then
        return (v8(v9, v10[1]));
    else
        local v11 = 0;
        local v12 = #v9;
        local v13 = {};
        for _, v15 in v10 do
            if v15 < 1 then
                v15 = v15 + (v12 + 1);
            end;
            if v15 > 0 and v12 >= v15 then
                v13[v15] = true;
                v11 = v11 + 1;
            end;
        end;
        if v11 == 0 then
            return v9;
        else
            local v16 = table.create((math.max(1, v12 - v11)));
            local v17 = 1;
            for v18, v19 in v9 do
                if not v13[v18] then
                    v16[v17] = v19;
                    v17 = v17 + 1;
                end;
            end;
            return v0(v16);
        end;
    end;
end;