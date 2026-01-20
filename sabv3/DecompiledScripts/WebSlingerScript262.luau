local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Net);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Parent.Parent;
l_Parent_0.Activated:Connect(function() --[[ Line: 11 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v4 (copy)
    local _ = game.Players.LocalPlayer;
    local v8 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    v4:RemoteEvent("UseItem"):FireServer(v8.Hit.Position, v8.Target);
end);