local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.FFlags);
return {
    IsEnabled = function(_) --[[ Line: 16 ]] --[[ Name: IsEnabled ]]
        -- upvalues: v1 (copy)
        local l_v1_Instant_0 = v1:GetInstant("StockEventMachineEndTime", nil);
        return v1:GetInstant("StockEventEnabled", true) and (l_v1_Instant_0 == nil or DateTime.now().UnixTimestamp < l_v1_Instant_0);
    end, 
    Start = function(_) --[[ Line: 21 ]] --[[ Name: Start ]]
        for _, v6 in script.Machines:GetChildren() do
            require(v6):Start();
        end;
    end
};