local _ = game:GetService("StarterPlayer");
local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net);
script.Parent.Activated:Connect(function() --[[ Line: 10 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v5 (copy)
    local v6 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    v5:RemoteEvent("UseItem"):FireServer(v6.Hit.Position);
end);