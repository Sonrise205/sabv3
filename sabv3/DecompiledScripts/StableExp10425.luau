--!native
return function(v0, v1) --[[ Line: 25 ]] --[[ Name: StableExp10 ]]
    assert(type(v0) == "number");
    assert(type(v1) == "number");
    if v1 == 0 then
        return v0;
    else
        local v2 = tonumber((("%*e%*"):format(string.format("%f", v0), v1)));
        if not v2 then
            return v0 * 10 ^ v1;
        else
            return v2;
        end;
    end;
end;