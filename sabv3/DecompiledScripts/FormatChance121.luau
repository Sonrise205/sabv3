--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Strings.FormatOdds);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Strings.FormatPercent);
return function(v3, v4) --[[ Line: 31 ]] --[[ Name: FormatChance ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(type(v3) == "number");
    local v5 = true;
    if v4 ~= nil then
        v5 = type(v4) == "number";
    end;
    assert(v5);
    v3 = math.clamp(v3, 0, 1);
    local v6 = math.clamp(v4 or v3, 0, 1);
    if v3 > 0 and v6 <= 2.0E-4 and v3 <= 0.001 then
        return v1(v3);
    else
        return v2(v3);
    end;
end;