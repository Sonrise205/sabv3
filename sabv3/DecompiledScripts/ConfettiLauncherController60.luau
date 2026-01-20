local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_TweenService_0 = game:GetService("TweenService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
local _ = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Net);
local l_ConfettiHolder_0 = l_PlayerGui_0:WaitForChild("ToolsScreen").MainFrame.ConfettiHolder;
local v11 = v9:RemoteEvent("UseItem");
local l_ConfettiSizes_0 = script.ConfettiSizes;
local v13 = Random.new();
local v14 = TweenInfo.new(v13:NextNumber(1, 2.5), Enum.EasingStyle.Sine, Enum.EasingDirection.In);
local v15 = {
    Color3.fromRGB(255, 55, 55), 
    Color3.fromRGB(55, 255, 55), 
    Color3.fromRGB(255, 225, 0), 
    Color3.fromRGB(0, 75, 255), 
    Color3.fromRGB(0, 225, 255), 
    Color3.fromRGB(255, 200, 0), 
    Color3.fromRGB(255, 125, 0), 
    Color3.fromRGB(225, 0, 255), 
    Color3.fromRGB(55, 255, 125), 
    Color3.fromRGB(255, 0, 255), 
    Color3.fromRGB(255, 0, 0)
};
local v16 = {};
v11.OnClientEvent:Connect(function(v17) --[[ Line: 47 ]]
    -- upvalues: l_ConfettiSizes_0 (copy), v15 (copy), v13 (copy), l_ConfettiHolder_0 (copy), l_TweenService_0 (copy), v14 (copy)
    if v17 ~= "Confetti Launcher" then
        return;
    else
        for _ = 1, 500 do
            local v19 = l_ConfettiSizes_0[math.random(1, #l_ConfettiSizes_0:GetChildren())]:Clone();
            v19.BackgroundColor3 = v15[math.random(1, #v15)];
            v19.Position = UDim2.new(v13:NextNumber(-0.3, 1.3), 0, -0.2, 0);
            v19.Rotation = v13:NextNumber(10, 360);
            v19.Visible = true;
            v19.Parent = l_ConfettiHolder_0;
            l_TweenService_0:Create(v19, v14, {
                Position = UDim2.fromScale(v19.Position.X.Scale, 1.5)
            }):Play();
            task.wait(0.01);
        end;
        task.wait(7);
        l_ConfettiHolder_0:ClearAllChildren();
        return;
    end;
end);
return v16;