local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.FastFlags);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
return table.freeze({
    DraggingThreshold = v1.Replicated("ActionController.DraggingThreshold", v2.Finite, 4), 
    TouchDuration = v1.Replicated("ActionController.TouchDuration", v2.Finite, 0.2)
});