local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Datas.Animals);
local v3 = {};
for v4, v5 in v2 do
    if v5.LuckyBlock then
        table.insert(v3, v4);
    end;
end;
return v1.register_type("LuckyBlock", v1.args.enum_new(v3));