--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Math.RoundFigures);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Math.StableExp10);
local v3 = require(l_ReplicatedStorage_0.UserGenerated.Strings.TrimmedNumberString);
local v4 = {
    "", 
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
return function(v5) --[[ Line: 53 ]] --[[ Name: FormatAbbreviated ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy), v3 (copy)
    assert(type(v5) == "number");
    if v5 ~= v5 then
        return "NaN";
    elseif v5 == 1e999 then
        return "Infinity";
    elseif v5 == -1e999 then
        return "-Infinity";
    else
        local v6 = {};
        if v5 < 0 then
            table.insert(v6, "-");
            v5 = -v5;
        end;
        v5 = math.floor(v5);
        if v5 >= 1000 then
            local v7 = math.clamp(math.floor(math.log10(v5) / 3) + 1, 1, #v4);
            v5 = v2(v5, (v7 - 1) * -3);
            v5 = v1(v5, 3, nil, math.floor);
            table.insert(v6, v3(v5));
            table.insert(v6, v4[v7]);
        else
            table.insert(v6, v3(v5));
        end;
        return table.concat(v6);
    end;
end;