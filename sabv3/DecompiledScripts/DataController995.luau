local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Synchronizer);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = nil;
return {
    Load = function(_) --[[ Line: 17 ]] --[[ Name: Load ]]
        -- upvalues: v4 (copy), l_LocalPlayer_0 (copy), v6 (ref), l_ReplicatedFirst_0 (copy)
        v4:WaitAndCall(l_LocalPlayer_0, function(v8) --[[ Line: 19 ]]
            -- upvalues: v6 (ref), l_ReplicatedFirst_0 (ref)
            v6 = v8;
            l_ReplicatedFirst_0:SetAttribute("DataLoaded", true);
        end);
    end
};