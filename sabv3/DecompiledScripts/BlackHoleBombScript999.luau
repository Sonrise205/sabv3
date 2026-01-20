local l_GuiService_0 = game:GetService("GuiService");
local _ = game:GetService("StarterPlayer");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v6 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Parent.Parent;
l_Parent_0.Activated:Connect(function() --[[ Line: 16 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy), v6 (copy)
    local v10 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v12 = v10.Hit.Position - l_CurrentCamera_0.CFrame.Position;
    if v12.Magnitude < 0.001 then
        return;
    else
        v12 = v12.Unit;
        local v13 = l_CurrentCamera_0.ViewportSize * 0.5;
        local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
        local v15 = l_UserInputService_0:GetMouseLocation() - l_l_GuiService_0_GuiInset_0;
        local v16 = Vector2.new(v15.X - v13.X, v15.Y - v13.Y);
        local v17 = math.min(v13.X, v13.Y);
        local v18 = math.clamp(v16.Magnitude / v17, 0, 1);
        v6:RemoteEvent("UseItem"):FireServer(v12, v18);
        return;
    end;
end);