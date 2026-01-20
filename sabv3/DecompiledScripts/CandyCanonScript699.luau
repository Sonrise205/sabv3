local _ = game:GetService("StarterPlayer");
local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Parent.Parent;
l_Parent_0.Activated:Connect(function() --[[ Line: 12 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v5 (copy)
    local _ = game.Players.LocalPlayer;
    local v9 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    v5:RemoteEvent("UseItem"):FireServer(v9.Hit.Position);
end);