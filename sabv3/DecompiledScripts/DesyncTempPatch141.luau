local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
if not require(l_ReplicatedStorage_0:WaitForChild("Datas").ServerData).IsDuelsServer() then
    return;
else
    l_ReplicatedStorage_0:WaitForChild("Desync"):WaitForChild("UnreliableRemoteEvent").OnClientEvent:Connect(function(v2, v3) --[[ Line: 10 ]]
        if v2 and v2.Character and v2.Character:FindFirstChild("HumanoidRootPart") then
            local l_HumanoidRootPart_0 = v2.Character.HumanoidRootPart;
            if (l_HumanoidRootPart_0.Position - v3.Position).Magnitude > (v2:GetAttribute("Stealing") and 4.5 or 7) then
                l_HumanoidRootPart_0.CFrame = v3;
            end;
        end;
    end);
    return;
end;