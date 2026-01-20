local _ = game:GetService("Players");
local _ = game:GetService("RunService");
local _ = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v6 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Parent.Parent;
l_Parent_0.Activated:Connect(function() --[[ Line: 19 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v6 (copy), l_Parent_0 (copy)
    local v10 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    v6:RemoteEvent("UseItem"):FireServer(v10.Hit.Position, l_Parent_0.Handle);
end);