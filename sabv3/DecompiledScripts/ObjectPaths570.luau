--!native
local v10 = {
    QueryObject = function(v0, v1, v2) --[[ Line: 29 ]] --[[ Name: QueryObject ]]
        for _, v4 in ipairs(string.split(v1, ".")) do
            if v0 == nil then
                return false;
            elseif v0 == v2 then
                return true;
            elseif type(v0) ~= "table" then
                return false;
            else
                v0 = v0[v4];
            end;
        end;
        if v0 == nil then
            return false;
        elseif v0 == v2 then
            return true;
        else
            return true, v0;
        end;
    end, 
    HasHierarchicalOverlap = function(v5, v6) --[[ Line: 51 ]] --[[ Name: HasHierarchicalOverlap ]]
        if v5 == v6 then
            return true;
        else
            local v7 = string.split(v5, ".");
            local v8 = string.split(v6, ".");
            for v9 = 1, math.min(#v7, #v8) do
                if v7[v9] ~= v8[v9] then
                    return false;
                end;
            end;
            return true;
        end;
    end
};
return table.freeze(v10);