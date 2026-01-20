local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Datas.Index);
local v3 = {
    "Normal"
};
for v4, v5 in v2 do
    if v5.BaseColors then
        table.insert(v3, v4);
    end;
end;
return v1.register_type("Base Skin", v1.args.enum_new(v3));