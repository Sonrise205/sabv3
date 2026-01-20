--!native
local l_UserInputService_0 = game:GetService("UserInputService");
local l_FocusState_0 = script.Parent:WaitForChild("FocusState");
l_UserInputService_0.WindowFocused:Connect(function() --[[ Line: 24 ]]
    -- upvalues: l_FocusState_0 (copy)
    l_FocusState_0:FireServer(true);
end);
l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 27 ]]
    -- upvalues: l_FocusState_0 (copy)
    l_FocusState_0:FireServer(false);
end);