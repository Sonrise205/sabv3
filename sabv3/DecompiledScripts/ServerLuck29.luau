local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Datas.ServerLuck);
local v3 = {};
for v4, v5 in v2 do
    v3[tostring(v5.Multiplier)] = v4;
end;
return v1.register_type("ServerLuck", v1.args.enum_map(v3));