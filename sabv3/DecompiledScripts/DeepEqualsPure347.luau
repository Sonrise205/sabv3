--!native
DeepEqualsPure = function(v0, v1, v2) --[[ Line: 33 ]] --[[ Name: DeepEqualsPure ]]
    if type(v0) ~= "table" or type(v1) ~= "table" then
        if rawequal(v0, v1) then
            return true;
        elseif v0 ~= v0 and v1 ~= v1 then
            return true;
        else
            return false;
        end;
    else
        local v3 = v2 or {};
        if v3[v0] or v3[v1] then
            return false;
        elseif rawequal(v0, v1) then
            return true;
        elseif rawlen(v0) ~= rawlen(v1) then
            return false;
        elseif getmetatable(v0) ~= getmetatable(v1) then
            return false;
        else
            v3[v0] = true;
            v3[v1] = true;
            for v4, v5 in next, v0 do
                local v6 = rawget(v1, v4);
                if v6 == nil or not DeepEqualsPure(v5, v6, v3) then
                    return false;
                end;
            end;
            for v7, _ in next, v1 do
                if rawget(v0, v7) == nil then
                    return false;
                end;
            end;
            v3[v0] = nil;
            v3[v1] = nil;
            return true;
        end;
    end;
end;
return DeepEqualsPure;