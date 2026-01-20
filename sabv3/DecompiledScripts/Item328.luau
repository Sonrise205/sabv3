local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local _ = require(l_ReplicatedStorage_0.Datas.Animals);
local _ = require(l_ReplicatedStorage_0.Datas.Items);
local v4 = {};
for _, v6 in l_ReplicatedStorage_0.Items:GetChildren() do
    table.insert(v4, v6.Name);
end;
return v1.register_type("Item", v1.args.enum_new(v4));