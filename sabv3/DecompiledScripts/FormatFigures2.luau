--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Math.RoundFigures);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Strings.Commas);
return function(v3, v4, v5, v6) --[[ Line: 44 ]] --[[ Name: FormatFigures ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2(v1(v3, v4, v5, v6));
end;