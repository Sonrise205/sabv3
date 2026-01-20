local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Datas.Rebirth);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.ABTests);
return function(v3, v4) --[[ Line: 8 ]] --[[ Name: GetRebirthCost ]]
    -- upvalues: v2 (copy), v1 (copy)
    return (v2.GetAttribute(v3, ("Rebirth.Cost.%*"):format(v4), v1[v4].Requirements.Cash));
end;