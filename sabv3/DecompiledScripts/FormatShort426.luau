--!native
local v0 = {
    "k", 
    "m", 
    "b", 
    "t", 
    "q", 
    "Qt", 
    "Sx", 
    "Sp", 
    "o", 
    "n", 
    "d", 
    "u", 
    "Du", 
    "Tr"
};
return function(v1, v2, v3) --[[ Line: 26 ]] --[[ Name: FormatAbbreviated ]]
    -- upvalues: v0 (copy)
    assert(type(v1) == "number");
    local v4 = true;
    if v2 ~= nil then
        v4 = type(v2) == "number";
    end;
    assert(v4);
    v4 = true;
    if v3 ~= nil then
        v4 = type(v3) == "number";
    end;
    assert(v4);
    if v1 ~= v1 then
        return "NaN";
    elseif v1 == 1e999 then
        return "Infinity";
    elseif v1 == -1e999 then
        return "-Infinity";
    else
        local v5 = v2 or 3;
        v4 = v3 or 0;
        local v6 = math.max(math.abs(v1), (math.pow(10, -#v0 * 3)));
        local v7 = 10 ^ (math.min(math.ceil((math.log10(v6))), #v0 * 3 + v5) - v4 - v5);
        local v8 = math.round(v6 / v7) * v7;
        local v9 = math.min(math.floor(math.log10((math.max(v8, 1))) / 3), #v0);
        v8 = v8 * math.sign(v1) / 10 ^ (v9 * 3);
        local v10 = string.format("%f", v8):gsub("%.?0+$", "");
        if v9 >= 1 then
            return v10 .. v0[v9];
        else
            return v10;
        end;
    end;
end;