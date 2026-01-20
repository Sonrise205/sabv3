local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Packages.Net);
local l_PlayerScripts_0 = l_Players_0.LocalPlayer.PlayerScripts;
local _ = workspace.CurrentCamera;
local l_Controls_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local v6 = v2:RemoteEvent("SetInputEnabled");
local v7 = {};
local l_moveFunction_0 = l_Controls_0.moveFunction;
v6.OnClientEvent:Connect(function(v9) --[[ Line: 21 ]]
    -- upvalues: l_Controls_0 (copy), l_moveFunction_0 (copy)
    if v9 then
        l_Controls_0.moveFunction = l_moveFunction_0;
        return;
    else
        l_Controls_0.moveFunction = function(_, _, _) --[[ Line: 25 ]]

        end;
        return;
    end;
end);
return v7;