local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local v2 = {};
for v3 = 1, 25 do
    table.insert(v2, v3);
end;
return v1.register_type("CalendarDay", v1.args.enum_new(v2));