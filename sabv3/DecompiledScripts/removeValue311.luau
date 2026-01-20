local v0 = require(script.Parent.Parent.utils.maybeFreeze);
local v1 = require(script.Parent.toSet);
local function v9(v2, ...) --[[ Line: 5 ]] --[[ Name: removeValues ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v3 = v1({
        ...
    });
    local v4 = {};
    local v5 = 1;
    local v6 = false;
    for _, v8 in ipairs(v2) do
        if not v3[v8] then
            v4[v5] = v8;
            v5 = v5 + 1;
        else
            v6 = true;
        end;
    end;
    if v6 then
        return (v0(v4));
    else
        return v2;
    end;
end;
return function(v10, ...) --[[ Line: 36 ]] --[[ Name: removeValue ]]
    -- upvalues: v0 (copy), v9 (copy)
    local v11 = {
        ...
    };
    if #v11 == 1 then
        local v12 = v11[1];
        local v13 = table.create(#v10);
        local v14 = false;
        for _, v16 in v10 do
            if v16 == v12 then
                v14 = true;
            else
                table.insert(v13, v16);
            end;
        end;
        if v14 then
            return (v0(v13));
        else
            return v10;
        end;
    else
        return v9(v10, ...);
    end;
end;