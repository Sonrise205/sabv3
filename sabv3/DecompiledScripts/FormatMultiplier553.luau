--!native
return function(v0, v1) --[[ Line: 20 ]] --[[ Name: FormatMultiplier ]]
    assert(type(v0) == "number");
    local v2 = true;
    if v1 ~= nil then
        v2 = false;
        if type(v1) == "number" then
            v2 = false;
            if v1 >= 0 then
                v2 = math.floor(v1) == v1;
            end;
        end;
    end;
    assert(v2);
    if v0 ~= v0 then
        return "NaN";
    elseif v0 == 1e999 then
        return "Infinity";
    elseif v0 == -1e999 then
        return "-Infinity";
    else
        local v3 = v1 or 2;
        if v3 > 0 then
            return string.format(("%%0.%*f"):format(v3), v0):gsub("(%d)%.?0+$", "%1");
        else
            return (tostring((math.round(v0))));
        end;
    end;
end;