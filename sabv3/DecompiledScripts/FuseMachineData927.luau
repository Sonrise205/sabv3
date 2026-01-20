local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Net);
return {
    FuseSlots = 4, 
    FuseTime = {
        Common = 900, 
        Rare = 900, 
        Epic = 900, 
        Legendary = 1800, 
        Mythic = 1800, 
        ["Brainrot God"] = 1800, 
        Secret = 5400
    }, 
    LuckMultipliers = {
        1, 
        4
    }, 
    RevealNowProductId = 3354160217, 
    FuseLuckProductId = 3483927303, 
    FFlagDefaults = {
        ["FuseMachine/Disabled"] = false, 
        ["FuseMachine/CanStealBrainrot"] = true, 
        ["FuseMachine/CostMultiplier"] = 1.25
    }, 
    Remotes = {
        RemoveBrainrot = v1:RemoteFunction("FuseMachine/RemoveBrainrot"), 
        ClaimBrainrot = v1:RemoteFunction("FuseMachine/ClaimBrainrot"), 
        ConfirmFusion = v1:RemoteFunction("FuseMachine/ConfirmFusion"), 
        Delivery = v1:RemoteFunction("FuseMachine/Delivery"), 
        RevealNow = v1:RemoteEvent("FuseMachine/RevealNow"), 
        FuseAnimation = v1:RemoteEvent("FuseMachine/FuseAnimation"), 
        ForceUpdate = v1:RemoteEvent("FuseMachine/ForceUpdate")
    }
};