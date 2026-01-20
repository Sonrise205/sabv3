local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
return {
    name = "nightvision", 
    icon = "rbxassetid://86320449907895", 
    cooldown = 60, 
    description = "You have night vision for 1 minute!", 
    effects = {
        Victim = function() --[[ Line: 11 ]]
            -- upvalues: l_ReplicatedStorage_0 (copy)
            local v1 = require(l_ReplicatedStorage_0.Controllers.ItemController.NightVisionController);
            v1.Enable();
            task.delay(60, function() --[[ Line: 16 ]]
                -- upvalues: v1 (copy)
                v1.Disable();
            end);
        end
    }
};