local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = require(l_ReplicatedStorage_0.Shared.Updates);
local v3 = {};
for _, v5 in v2.List do
    table.insert(v3, v5.FFlag);
end;
return v1.register_type("Update", v1.args.enum_new(v3));