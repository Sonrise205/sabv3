local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local _ = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local _ = require(l_Controllers_0.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Net):RemoteEvent("UseItem");
local v10 = {};
v9.OnClientEvent:Connect(function(v11, v12, v13) --[[ Line: 20 ]]
    if v11 ~= "Trapped" then
        return;
    elseif v12 ~= "PlaySound" then
        return;
    else
        local l_v13_FirstChildWhichIsA_0 = v13:FindFirstChildWhichIsA("Sound", true);
        if l_v13_FirstChildWhichIsA_0 then
            l_v13_FirstChildWhichIsA_0:Play();
        end;
        return;
    end;
end);
return v10;