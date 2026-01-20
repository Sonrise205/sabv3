local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Datas.Mutations);
local v3 = {
    "Normal"
};
for v4 in v2 do
    table.insert(v3, v4);
end;
return v1.register_type("Mutation", v1.args.enum_new(v3));