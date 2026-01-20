--!native
local l_GuiService_0 = game:GetService("GuiService");
local l_MenuState_0 = script.Parent:WaitForChild("MenuState");
l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 24 ]]
    -- upvalues: l_MenuState_0 (copy)
    l_MenuState_0:FireServer(true);
end);
l_GuiService_0.MenuClosed:Connect(function() --[[ Line: 27 ]]
    -- upvalues: l_MenuState_0 (copy)
    l_MenuState_0:FireServer(false);
end);