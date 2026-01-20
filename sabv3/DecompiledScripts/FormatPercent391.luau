--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Strings.FormatFigures);
return function(v2) --[[ Line: 24 ]] --[[ Name: FormatPercent ]]
    -- upvalues: v1 (copy)
    return v1(v2 * 100, 4, 5) .. "%";
end;