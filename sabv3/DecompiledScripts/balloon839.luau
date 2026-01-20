return {
    name = "balloon", 
    icon = "rbxassetid://122227641631583", 
    cooldown = 30, 
    description = "You will jump higher for 15 seconds!", 
    effects = {
        Victim = function() --[[ Line: 11 ]]
            workspace.Gravity = 29.429999999999996;
            task.delay(15, function() --[[ Line: 14 ]]
                workspace.Gravity = 196.2;
            end);
        end
    }
};