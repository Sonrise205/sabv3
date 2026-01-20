local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local _ = require(l_ReplicatedStorage_0.Datas.Animals);
local v3 = require(l_ReplicatedStorage_0.Datas.Traits);
local v4 = {};
for v5 in v3 do
    table.insert(v4, v5);
end;
return v1.register_type("Trait", v1.args.enum_new(v4));