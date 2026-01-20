local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local _ = l_LocalPlayer_0.PlayerScripts;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_PumpkingHolder_0 = l_PlayerGui_0:WaitForChild("ToolsScreen").MainFrame.PumpkingHolder;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v9 = require(l_Packages_0.Net):RemoteEvent("UseItem");
local v10 = {};
v9.OnClientEvent:Connect(function(v11) --[[ Line: 21 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_PumpkingHolder_0 (copy)
    if v11 ~= "TurnIntoPumpkinHead" then
        return;
    else
        l_CurrentCamera_0.FieldOfView = 20;
        l_PumpkingHolder_0.Visible = true;
        task.delay(8, function() --[[ Line: 27 ]]
            -- upvalues: l_CurrentCamera_0 (ref), l_PumpkingHolder_0 (ref)
            l_CurrentCamera_0.FieldOfView = 70;
            l_PumpkingHolder_0.Visible = false;
        end);
        return;
    end;
end);
return v10;