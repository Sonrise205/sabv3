local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local _ = require(l_ReplicatedStorage_0.Datas.Animals);
local _ = require(l_ReplicatedStorage_0.Datas.Items);
return v1.register_type("CalendarDayStatus", v1.args.enum_new({
    "Available", 
    "Claimed", 
    "Missed"
}));