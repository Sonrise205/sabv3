local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_QuantumCloner_0 = l_Players_0.LocalPlayer.PlayerGui:WaitForChild("ToolsFrames").QuantumCloner;
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local _ = require(l_Controllers_0.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Net);
local v10 = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v13 = nil;
l_Parent_0.Activated:Connect(function() --[[ Line: 26 ]]
    -- upvalues: v9 (copy)
    local _ = game.Players.LocalPlayer;
    v9:RemoteEvent("UseItem"):FireServer();
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 31 ]]
    -- upvalues: v13 (ref), l_RunService_0 (copy), l_Parent_1 (copy), l_QuantumCloner_0 (copy)
    v13 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 32 ]]
        -- upvalues: l_Parent_1 (ref), l_QuantumCloner_0 (ref)
        debug.profilebegin("QuantumCloner:Update");
        if workspace:FindFirstChild((("%*_Clone"):format(l_Parent_1.UserId))) then
            l_QuantumCloner_0.Visible = true;
        end;
        debug.profileend();
    end);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 42 ]]
    -- upvalues: v13 (ref), l_QuantumCloner_0 (copy)
    if v13 then
        v13:Disconnect();
    end;
    l_QuantumCloner_0.Visible = false;
end);
l_Parent_1.CharacterAdded:Connect(function() --[[ Line: 49 ]]
    -- upvalues: l_QuantumCloner_0 (copy), v13 (ref)
    l_QuantumCloner_0.Visible = false;
    if v13 then
        v13:Disconnect();
    end;
end);
l_QuantumCloner_0.TeleportToClone.MouseButton1Up:Connect(function() --[[ Line: 56 ]]
    -- upvalues: v10 (copy), l_Parent_1 (copy), v9 (copy)
    if v10(("ItemUse/QuantumClonerTeleport/%*"):format(l_Parent_1.Name), 5) then
        return;
    else
        v9:RemoteEvent("QuantumCloner/OnTeleport"):FireServer();
        return;
    end;
end);