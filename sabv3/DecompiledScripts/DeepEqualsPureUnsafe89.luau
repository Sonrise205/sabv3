--!native
DeepEqualsPureUnsafe = function(v0, v1) --[[ Line: 33 ]] --[[ Name: DeepEqualsPureUnsafe ]]
    if rawequal(v0, v1) then
        return true;
    elseif type(v0) ~= "table" or type(v1) ~= "table" then
        if v0 ~= v0 and v1 ~= v1 then
            return true;
        else
            return false;
        end;
    elseif rawlen(v0) ~= rawlen(v1) then
        return false;
    elseif getmetatable(v0) ~= getmetatable(v1) then
        return false;
    else
        for v2, v3 in next, v0 do
            local v4 = rawget(v1, v2);
            if v4 == nil or not DeepEqualsPureUnsafe(v3, v4) then
                return false;
            end;
        end;
        for v5, _ in next, v1 do
            if rawget(v0, v5) == nil then
                return false;
            end;
        end;
        return true;
    end;
end;
return DeepEqualsPureUnsafe;