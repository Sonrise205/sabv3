--!native
return function(v0) --[[ Line: 20 ]] --[[ Name: TrimmedNumberString ]]
    assert(type(v0) == "number");
    if v0 ~= v0 then
        return "NaN";
    elseif v0 == 1e999 then
        return "Infinity";
    elseif v0 == -1e999 then
        return "-Infinity";
    else
        local v1 = string.format("%f", v0);
        local v2, v3 = string.match(v1, "^([^%.]*)%.?(.*)$");
        assert(v2);
        if not v3 then
            return v2;
        else
            v3 = string.gsub(v3, "0+$", "");
            if #v3 == 0 then
                return v2;
            else
                return (("%*.%*"):format(v2, v3));
            end;
        end;
    end;
end;