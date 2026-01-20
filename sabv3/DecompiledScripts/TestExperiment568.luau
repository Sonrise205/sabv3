local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.ABTestExperiments.ABTestTypes);
return {
    RemoteConfig = "Test", 
    Disabled = false, 
    DefaultState = false, 
    States = {
        [true] = {
            Server = function(_, _) --[[ Line: 15 ]] --[[ Name: Server ]]

            end, 
            Client = function(_, _) --[[ Line: 19 ]] --[[ Name: Client ]]

            end
        }, 
        [false] = {
            Server = function(_, _) --[[ Line: 25 ]] --[[ Name: Server ]]

            end, 
            Client = function(_, _) --[[ Line: 29 ]] --[[ Name: Client ]]

            end
        }
    }
};