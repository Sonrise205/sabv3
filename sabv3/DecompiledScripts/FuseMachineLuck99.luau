local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Datas.FuseMachineData);
local v3 = {};
for v4, v5 in v2.LuckMultipliers do
    if v5 ~= 1 then
        v3[tostring(v5)] = v4;
    end;
end;
return v1.register_type("FuseMachineLuck", v1.args.enum_map(v3));