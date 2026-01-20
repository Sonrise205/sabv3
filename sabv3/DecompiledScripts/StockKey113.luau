local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Datas.MerchantData);
local v3 = {};
for _, v5 in v2.Brainrots do
    table.insert(v3, v5.StockKey);
end;
return v1.register_type("Stock Key", v1.args.enum_new(v3));