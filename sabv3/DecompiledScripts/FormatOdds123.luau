--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Strings.FormatAbbreviated);
return function(v2) --[[ Line: 24 ]] --[[ Name: FormatOdds ]]
    -- upvalues: v1 (copy)
    assert(type(v2) == "number");
    if v2 == 0 then
        return "0";
    elseif v2 == 1e999 then
        return "Infinity";
    elseif v2 == -1e999 then
        return "-Infinity";
    elseif v2 ~= v2 then
        return "NaN";
    else
        return "1/" .. v1(1 / v2);
    end;
end;