--!native
local function v0(v1, v2, v3) --[[ Line: 31 ]] --[[ Name: DeepEquals ]]
    -- upvalues: v0 (copy)
    if rawequal(v1, v2) then
        return true;
    elseif type(v1) ~= "table" or type(v2) ~= "table" then
        if v1 ~= v1 and v2 ~= v2 then
            return true;
        else
            return false;
        end;
    elseif rawlen(v1) ~= rawlen(v2) then
        return false;
    else
        local v4 = getmetatable(v1);
        if v4 ~= getmetatable(v2) then
            return false;
        elseif v4 ~= nil and v4.__eq then
            return v1 == v2;
        else
            local v5 = v3 or {};
            v5[v1] = v5[v1] or {};
            v5[v2] = v5[v2] or {};
            if v5[v1][v2] then
                return true;
            else
                v5[v1][v2] = true;
                v5[v2][v1] = true;
                for v6, v7 in next, v1 do
                    local v8 = rawget(v2, v6);
                    if v8 == nil or not v0(v7, v8, v5) then
                        return false;
                    end;
                end;
                for v9, _ in next, v2 do
                    if rawget(v1, v9) == nil then
                        return false;
                    end;
                end;
                return true;
            end;
        end;
    end;
end;
return v0;