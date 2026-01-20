local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local _ = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local l_Players_0 = game:GetService("Players");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GameSettings_0 = UserSettings().GameSettings;
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_GameSettings_0 (copy), l_Players_0 (copy)
    local v8 = setmetatable({}, v7);
    v8.isMouseLocked = false;
    v8.savedMouseCursor = nil;
    v8.boundKeys = {
        Enum.KeyCode.LeftShift, 
        Enum.KeyCode.RightShift
    };
    v8.mouseLockToggledEvent = Instance.new("BindableEvent");
    local l_BoundKeys_0 = script:FindFirstChild("BoundKeys");
    if not l_BoundKeys_0 or not l_BoundKeys_0:IsA("StringValue") then
        if l_BoundKeys_0 then
            l_BoundKeys_0:Destroy();
        end;
        l_BoundKeys_0 = Instance.new("StringValue");
        assert(l_BoundKeys_0, "");
        l_BoundKeys_0.Name = "BoundKeys";
        l_BoundKeys_0.Value = "LeftShift,RightShift";
        l_BoundKeys_0.Parent = script;
    end;
    if l_BoundKeys_0 then
        l_BoundKeys_0.Changed:Connect(function(v10) --[[ Line: 56 ]]
            -- upvalues: v8 (copy)
            v8:OnBoundKeysObjectChanged(v10);
        end);
        v8:OnBoundKeysObjectChanged(l_BoundKeys_0.Value);
    end;
    l_GameSettings_0.Changed:Connect(function(v11) --[[ Line: 63 ]]
        -- upvalues: v8 (copy)
        if v11 == "ControlMode" or v11 == "ComputerMovementMode" then
            v8:UpdateMouseLockAvailability();
        end;
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function() --[[ Line: 70 ]]
        -- upvalues: v8 (copy)
        v8:UpdateMouseLockAvailability();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 75 ]]
        -- upvalues: v8 (copy)
        v8:UpdateMouseLockAvailability();
    end);
    v8:UpdateMouseLockAvailability();
    return v8;
end;
v7.GetIsMouseLocked = function(v12) --[[ Line: 84 ]] --[[ Name: GetIsMouseLocked ]]
    return v12.isMouseLocked;
end;
v7.GetBindableToggleEvent = function(v13) --[[ Line: 88 ]] --[[ Name: GetBindableToggleEvent ]]
    return v13.mouseLockToggledEvent.Event;
end;
v7.GetMouseLockOffset = function(_) --[[ Line: 92 ]] --[[ Name: GetMouseLockOffset ]]
    return (Vector3.new(1.75, 0, 0, 0));
end;
v7.UpdateMouseLockAvailability = function(v15) --[[ Line: 96 ]] --[[ Name: UpdateMouseLockAvailability ]]
    -- upvalues: l_Players_0 (copy), l_GameSettings_0 (copy)
    local l_DevEnableMouseLock_0 = l_Players_0.LocalPlayer.DevEnableMouseLock;
    local v17 = l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable;
    local v18 = l_GameSettings_0.ControlMode == Enum.ControlMode.MouseLockSwitch;
    local v19 = l_GameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    local v20 = l_DevEnableMouseLock_0 and v18 and not v19 and not v17;
    if v20 ~= v15.enabled then
        v15:EnableMouseLock(v20);
    end;
end;
v7.OnBoundKeysObjectChanged = function(v21, v22) --[[ Line: 108 ]] --[[ Name: OnBoundKeysObjectChanged ]]
    v21.boundKeys = {};
    for v23 in string.gmatch(v22, "[^%s,]+") do
        for _, v25 in pairs(Enum.KeyCode:GetEnumItems()) do
            if v23 == v25.Name then
                v21.boundKeys[#v21.boundKeys + 1] = v25;
                break;
            end;
        end;
    end;
    v21:UnbindContextActions();
    v21:BindContextActions();
end;
v7.OnMouseLockToggled = function(v26) --[[ Line: 123 ]] --[[ Name: OnMouseLockToggled ]]
    -- upvalues: l_CameraUtils_0 (copy)
    v26.isMouseLocked = not v26.isMouseLocked;
    if v26.isMouseLocked then
        local l_CursorImage_0 = script:FindFirstChild("CursorImage");
        if l_CursorImage_0 and l_CursorImage_0:IsA("StringValue") and l_CursorImage_0.Value then
            l_CameraUtils_0.setMouseIconOverride(l_CursorImage_0.Value);
        else
            if l_CursorImage_0 then
                l_CursorImage_0:Destroy();
            end;
            l_CursorImage_0 = Instance.new("StringValue");
            assert(l_CursorImage_0, "");
            l_CursorImage_0.Name = "CursorImage";
            l_CursorImage_0.Value = "rbxasset://textures/MouseLockedCursor.png";
            l_CursorImage_0.Parent = script;
            l_CameraUtils_0.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png");
        end;
    else
        l_CameraUtils_0.restoreMouseIcon();
    end;
    v26.mouseLockToggledEvent:Fire();
end;
v7.DoMouseLockSwitch = function(v28, _, v30, _) --[[ Line: 148 ]] --[[ Name: DoMouseLockSwitch ]]
    if v30 == Enum.UserInputState.Begin then
        v28:OnMouseLockToggled();
        return Enum.ContextActionResult.Sink;
    else
        return Enum.ContextActionResult.Pass;
    end;
end;
v7.BindContextActions = function(v32) --[[ Line: 156 ]] --[[ Name: BindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy), l_Value_0 (copy)
    l_ContextActionService_0:BindActionAtPriority("MouseLockSwitchAction", function(v33, v34, v35) --[[ Line: 157 ]]
        -- upvalues: v32 (copy)
        return v32:DoMouseLockSwitch(v33, v34, v35);
    end, false, l_Value_0, unpack(v32.boundKeys));
end;
v7.UnbindContextActions = function(_) --[[ Line: 162 ]] --[[ Name: UnbindContextActions ]]
    -- upvalues: l_ContextActionService_0 (copy)
    l_ContextActionService_0:UnbindAction("MouseLockSwitchAction");
end;
v7.IsMouseLocked = function(v37) --[[ Line: 166 ]] --[[ Name: IsMouseLocked ]]
    return v37.enabled and v37.isMouseLocked;
end;
v7.EnableMouseLock = function(v38, v39) --[[ Line: 170 ]] --[[ Name: EnableMouseLock ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v39 ~= v38.enabled then
        v38.enabled = v39;
        if v38.enabled then
            v38:BindContextActions();
            return;
        else
            l_CameraUtils_0.restoreMouseIcon();
            v38:UnbindContextActions();
            if v38.isMouseLocked then
                v38.mouseLockToggledEvent:Fire();
            end;
            v38.isMouseLocked = false;
        end;
    end;
end;
return v7;