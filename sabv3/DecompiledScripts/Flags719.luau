local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.FastFlags);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v3 = CFrame.new(0, 0, -3.35);
return table.freeze({
    ChargeMaxDuration = v1.Replicated("BanHammer.ChargeMaxDuration", v2.FinitePositive, 2.5), 
    Cooldown = v1.Replicated("BanHammer.Cooldown", v2.FiniteNonNegative, 2), 
    MinForce = v1.Replicated("BanHammer.MinForce", v2.FiniteNonNegative, 1000), 
    MaxForce = v1.Replicated("BanHammer.MaxForce", v2.FiniteNonNegative, 2800), 
    MinRagdollDuration = v1.Replicated("BanHammer.MinRagdollDuration", v2.FiniteNonNegative, 2), 
    MaxRagdollDuration = v1.Replicated("BanHammer.MaxRagdollDuration", v2.FiniteNonNegative, 6), 
    MinRadius = v1.Replicated("BanHammer.MinRadius", v2.FinitePositive, 10), 
    MaxRadius = v1.Replicated("BanHammer.MaxRadius", v2.FinitePositive, 20), 
    TargettingTTL = v1.Replicated("BanHammer.TargettingTTL", v2.Finite, 0.3), 
    SlamOffset = v3
});