local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local _ = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("ToolsFrames").QuantumCloner;
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local _ = require(l_Controllers_0.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Parent.Parent;
l_Parent_0.Activated:Connect(function() --[[ Line: 24 ]]
    -- upvalues: v9 (copy)
    v9:RemoteEvent("UseItem"):FireServer();
end);