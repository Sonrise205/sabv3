local v0 = {};
v0.__index = v0;
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local _ = script.Parent:WaitForChild("CommonUtils");
local l_Keyboard_0 = require(script:WaitForChild("Keyboard"));
local l_Gamepad_0 = require(script:WaitForChild("Gamepad"));
local l_DynamicThumbstick_0 = require(script:WaitForChild("DynamicThumbstick"));
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
    return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = require(script:WaitForChild("TouchThumbstick"));
l_result_0 = require(script:WaitForChild("ClickToMoveController"));
local l_TouchJump_0 = require(script:WaitForChild("TouchJump"));
local l_VehicleController_0 = require(script:WaitForChild("VehicleController"));
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v19 = {
    [Enum.TouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DPad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.Thumbpad] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.Thumbstick] = l_status_0, 
    [Enum.DevTouchMovementMode.Thumbstick] = l_status_0, 
    [Enum.TouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.DevTouchMovementMode.DynamicThumbstick] = l_DynamicThumbstick_0, 
    [Enum.TouchMovementMode.ClickToMove] = l_result_0, 
    [Enum.DevTouchMovementMode.ClickToMove] = l_result_0, 
    [Enum.TouchMovementMode.Default] = l_DynamicThumbstick_0, 
    [Enum.ComputerMovementMode.Default] = l_Keyboard_0, 
    [Enum.ComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.KeyboardMouse] = l_Keyboard_0, 
    [Enum.DevComputerMovementMode.Scriptable] = nil, 
    [Enum.ComputerMovementMode.ClickToMove] = l_result_0, 
    [Enum.DevComputerMovementMode.ClickToMove] = l_result_0
};
local v20 = {
    [Enum.UserInputType.Keyboard] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton1] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton2] = l_Keyboard_0, 
    [Enum.UserInputType.MouseButton3] = l_Keyboard_0, 
    [Enum.UserInputType.MouseWheel] = l_Keyboard_0, 
    [Enum.UserInputType.MouseMovement] = l_Keyboard_0, 
    [Enum.UserInputType.Gamepad1] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad2] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad3] = l_Gamepad_0, 
    [Enum.UserInputType.Gamepad4] = l_Gamepad_0
};
local v21 = nil;
v0.new = function() --[[ Line: 94 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), l_Players_0 (copy), l_VehicleController_0 (copy), l_Value_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy), l_GuiService_0 (copy)
    local v22 = setmetatable({}, v0);
    v22.controllers = {};
    v22.activeControlModule = nil;
    v22.activeController = nil;
    v22.touchJumpController = nil;
    v22.moveFunction = l_Players_0.LocalPlayer.Move;
    v22.humanoid = nil;
    v22.lastInputType = Enum.UserInputType.None;
    v22.controlsEnabled = true;
    v22.humanoidSeatedConn = nil;
    v22.vehicleController = nil;
    v22.touchControlFrame = nil;
    v22.currentTorsoAngle = 0;
    v22.inputMoveVector = Vector3.new(0, 0, 0, 0);
    v22.vehicleController = l_VehicleController_0.new(l_Value_0);
    l_Players_0.LocalPlayer.CharacterAdded:Connect(function(v23) --[[ Line: 120 ]]
        -- upvalues: v22 (copy)
        v22:OnCharacterAdded(v23);
    end);
    l_Players_0.LocalPlayer.CharacterRemoving:Connect(function(v24) --[[ Line: 121 ]]
        -- upvalues: v22 (copy)
        v22:OnCharacterRemoving(v24);
    end);
    if l_Players_0.LocalPlayer.Character then
        v22:OnCharacterAdded(l_Players_0.LocalPlayer.Character);
    end;
    l_RunService_0:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(v25) --[[ Line: 126 ]]
        -- upvalues: v22 (copy)
        v22:OnRenderStepped(v25);
    end);
    l_UserInputService_0.LastInputTypeChanged:Connect(function(v26) --[[ Line: 130 ]]
        -- upvalues: v22 (copy)
        v22:OnLastInputTypeChanged(v26);
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 135 ]]
        -- upvalues: v22 (copy)
        v22:OnTouchMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 138 ]]
        -- upvalues: v22 (copy)
        v22:OnTouchMovementModeChange();
    end);
    l_UserGameSettings_0:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 142 ]]
        -- upvalues: v22 (copy)
        v22:OnComputerMovementModeChange();
    end);
    l_Players_0.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 145 ]]
        -- upvalues: v22 (copy)
        v22:OnComputerMovementModeChange();
    end);
    v22.playerGui = nil;
    v22.touchGui = nil;
    v22.playerGuiAddedConn = nil;
    l_GuiService_0:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 154 ]]
        -- upvalues: v22 (copy)
        v22:UpdateTouchGuiVisibility();
        v22:UpdateActiveControlModuleEnabled();
    end);
    if l_UserInputService_0.TouchEnabled then
        v22.playerGui = l_Players_0.LocalPlayer:FindFirstChildOfClass("PlayerGui");
        if v22.playerGui then
            v22:CreateTouchGuiContainer();
            v22:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
            return v22;
        else
            v22.playerGuiAddedConn = l_Players_0.LocalPlayer.ChildAdded:Connect(function(v27) --[[ Line: 165 ]]
                -- upvalues: v22 (copy), l_UserInputService_0 (ref)
                if v27:IsA("PlayerGui") then
                    v22.playerGui = v27;
                    v22:CreateTouchGuiContainer();
                    v22.playerGuiAddedConn:Disconnect();
                    v22.playerGuiAddedConn = nil;
                    v22:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
                end;
            end);
            return v22;
        end;
    else
        v22:OnLastInputTypeChanged(l_UserInputService_0:GetLastInputType());
        return v22;
    end;
end;
v0.GetMoveVector = function(v28) --[[ Line: 185 ]] --[[ Name: GetMoveVector ]]
    if v28.activeController then
        return v28.activeController:GetMoveVector();
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
local function _(v29) --[[ Line: 192 ]] --[[ Name: NormalizeAngle ]]
    v29 = (v29 + 12.566370614359172) % 6.283185307179586;
    if v29 > 3.141592653589793 then
        v29 = v29 - 6.283185307179586;
    end;
    return v29;
end;
local function _(v31, v32) --[[ Line: 200 ]] --[[ Name: AverageAngle ]]
    local v33 = (v32 - v31 + 12.566370614359172) % 6.283185307179586;
    if v33 > 3.141592653589793 then
        v33 = v33 - 6.283185307179586;
    end;
    local v34 = (v31 + v33 / 2 + 12.566370614359172) % 6.283185307179586;
    if v34 > 3.141592653589793 then
        v34 = v34 - 6.283185307179586;
    end;
    return v34;
end;
v0.GetEstimatedVRTorsoFrame = function(v36) --[[ Line: 205 ]] --[[ Name: GetEstimatedVRTorsoFrame ]]
    -- upvalues: l_VRService_0 (copy)
    local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local _, v39, _ = l_l_VRService_0_UserCFrame_0:ToEulerAnglesYXZ();
    v39 = -v39;
    if not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or not l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
        v36.currentTorsoAngle = v39;
    else
        local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
        local v43 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_1.Position;
        local v44 = l_l_VRService_0_UserCFrame_0.Position - l_l_VRService_0_UserCFrame_2.Position;
        local v45 = -math.atan2(v43.X, v43.Z);
        local v46 = (-math.atan2(v44.X, v44.Z) - v45 + 12.566370614359172) % 6.283185307179586;
        if v46 > 3.141592653589793 then
            v46 = v46 - 6.283185307179586;
        end;
        v46 = (v45 + v46 / 2 + 12.566370614359172) % 6.283185307179586;
        if v46 > 3.141592653589793 then
            v46 = v46 - 6.283185307179586;
        end;
        local l_v46_0 = v46;
        v46 = (v39 - v36.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v46 > 3.141592653589793 then
            v46 = v46 - 6.283185307179586;
        end;
        local l_v46_1 = v46;
        local v49 = (l_v46_0 - v36.currentTorsoAngle + 12.566370614359172) % 6.283185307179586;
        if v49 > 3.141592653589793 then
            v49 = v49 - 6.283185307179586;
        end;
        v46 = v49;
        v49 = false;
        if v46 > -1.5707963267948966 then
            v49 = v46 < 1.5707963267948966;
        end;
        if not v49 then
            v46 = l_v46_1;
        end;
        local v50 = math.min(v46, l_v46_1);
        local v51 = math.max(v46, l_v46_1);
        local v52 = 0;
        if v50 > 0 then
            v52 = v50;
        elseif v51 < 0 then
            v52 = v51;
        end;
        v36.currentTorsoAngle = v52 + v36.currentTorsoAngle;
    end;
    return CFrame.new(l_l_VRService_0_UserCFrame_0.Position) * CFrame.fromEulerAnglesYXZ(0, -v36.currentTorsoAngle, 0);
end;
v0.GetActiveController = function(v53) --[[ Line: 249 ]] --[[ Name: GetActiveController ]]
    return v53.activeController;
end;
v0.UpdateActiveControlModuleEnabled = function(v54) --[[ Line: 254 ]] --[[ Name: UpdateActiveControlModuleEnabled ]]
    -- upvalues: l_Players_0 (copy), l_result_0 (copy), l_status_0 (copy), l_DynamicThumbstick_0 (copy), l_TouchJump_0 (copy), l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local function _() --[[ Line: 256 ]]
        -- upvalues: v54 (copy), l_Players_0 (ref)
        v54.activeController:Enable(false);
        if v54.touchJumpController then
            v54.touchJumpController:Enable(false);
        end;
        if v54.moveFunction then
            v54.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
    end;
    local function v56() --[[ Line: 267 ]]
        -- upvalues: v54 (copy), l_result_0 (ref), l_status_0 (ref), l_DynamicThumbstick_0 (ref), l_TouchJump_0 (ref), l_Players_0 (ref)
        if v54.touchControlFrame and (v54.activeControlModule == l_result_0 or v54.activeControlModule == l_status_0 or v54.activeControlModule == l_DynamicThumbstick_0) then
            if not v54.controllers[l_TouchJump_0] then
                v54.controllers[l_TouchJump_0] = l_TouchJump_0.new();
            end;
            v54.touchJumpController = v54.controllers[l_TouchJump_0];
            v54.touchJumpController:Enable(true, v54.touchControlFrame);
        elseif v54.touchJumpController then
            v54.touchJumpController:Enable(false);
        end;
        if v54.activeControlModule == l_result_0 then
            v54.activeController:Enable(true, l_Players_0.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, v54.touchJumpController);
            return;
        elseif v54.touchControlFrame then
            v54.activeController:Enable(true, v54.touchControlFrame);
            return;
        else
            v54.activeController:Enable(true);
            return;
        end;
    end;
    if not v54.activeController then
        return;
    elseif not v54.controlsEnabled then
        v54.activeController:Enable(false);
        if v54.touchJumpController then
            v54.touchJumpController:Enable(false);
        end;
        if v54.moveFunction then
            v54.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    elseif not l_GuiService_0.TouchControlsEnabled and l_UserInputService_0.TouchEnabled and (v54.activeControlModule == l_result_0 or v54.activeControlModule == l_status_0 or v54.activeControlModule == l_DynamicThumbstick_0) then
        v54.activeController:Enable(false);
        if v54.touchJumpController then
            v54.touchJumpController:Enable(false);
        end;
        if v54.moveFunction then
            v54.moveFunction(l_Players_0.LocalPlayer, Vector3.new(0, 0, 0, 0), true);
        end;
        return;
    else
        v56();
        return;
    end;
end;
v0.Enable = function(v57, v58) --[[ Line: 326 ]] --[[ Name: Enable ]]
    if v58 == nil then
        v58 = true;
    end;
    if v57.controlsEnabled == v58 then
        return;
    else
        v57.controlsEnabled = v58;
        if not v57.activeController then
            return;
        else
            v57:UpdateActiveControlModuleEnabled();
            return;
        end;
    end;
end;
v0.Disable = function(v59) --[[ Line: 341 ]] --[[ Name: Disable ]]
    v59:Enable(false);
end;
v0.SelectComputerMovementModule = function(_) --[[ Line: 347 ]] --[[ Name: SelectComputerMovementModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v20 (copy), v21 (ref), l_UserGameSettings_0 (copy), l_Keyboard_0 (copy), l_result_0 (copy), v19 (copy)
    if not l_UserInputService_0.KeyboardEnabled and not l_UserInputService_0.GamepadEnabled then
        return nil, false;
    else
        local v61 = nil;
        local l_DevComputerMovementMode_0 = l_Players_0.LocalPlayer.DevComputerMovementMode;
        if l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.UserChoice then
            v61 = v20[v21];
            if l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v61 == l_Keyboard_0 then
                v61 = l_result_0;
            end;
        else
            v61 = v19[l_DevComputerMovementMode_0];
            if not v61 and l_DevComputerMovementMode_0 ~= Enum.DevComputerMovementMode.Scriptable then
                warn("No character control module is associated with DevComputerMovementMode ", l_DevComputerMovementMode_0);
            end;
        end;
        if v61 then
            return v61, true;
        elseif l_DevComputerMovementMode_0 == Enum.DevComputerMovementMode.Scriptable then
            return nil, true;
        else
            return nil, false;
        end;
    end;
end;
v0.SelectTouchModule = function(_) --[[ Line: 385 ]] --[[ Name: SelectTouchModule ]]
    -- upvalues: l_UserInputService_0 (copy), l_Players_0 (copy), v19 (copy), l_UserGameSettings_0 (copy)
    if not l_UserInputService_0.TouchEnabled then
        return nil, false;
    else
        local v64 = nil;
        local l_DevTouchMovementMode_0 = l_Players_0.LocalPlayer.DevTouchMovementMode;
        if l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.UserChoice then
            v64 = v19[l_UserGameSettings_0.TouchMovementMode];
        elseif l_DevTouchMovementMode_0 == Enum.DevTouchMovementMode.Scriptable then
            return nil, true;
        else
            v64 = v19[l_DevTouchMovementMode_0];
        end;
        return v64, true;
    end;
end;
local function v69() --[[ Line: 401 ]] --[[ Name: getGamepadRightThumbstickPosition ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_GamepadState_0 = l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1);
    for _, v68 in pairs(l_l_UserInputService_0_GamepadState_0) do
        if v68.KeyCode == Enum.KeyCode.Thumbstick2 then
            return v68.Position;
        end;
    end;
    return (Vector3.new(0, 0, 0, 0));
end;
v0.calculateRawMoveVector = function(v70, v71, v72) --[[ Line: 411 ]] --[[ Name: calculateRawMoveVector ]]
    -- upvalues: l_Workspace_0 (copy), l_VRService_0 (copy), v69 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v72;
    else
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        if l_VRService_0.VREnabled and v71.RootPart then
            local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            l_l_VRService_0_UserCFrame_3 = v70:GetEstimatedVRTorsoFrame();
            l_CFrame_0 = if (l_CurrentCamera_0.Focus.Position - l_CFrame_0.Position).Magnitude < 3 then l_CFrame_0 * l_l_VRService_0_UserCFrame_3 else l_CurrentCamera_0.CFrame * (l_l_VRService_0_UserCFrame_3.Rotation + l_l_VRService_0_UserCFrame_3.Position * l_CurrentCamera_0.HeadScale);
        end;
        if v71:GetState() == Enum.HumanoidStateType.Swimming then
            if l_VRService_0.VREnabled then
                v72 = Vector3.new(v72.X, 0, v72.Z);
                if v72.Magnitude < 0.01 then
                    return (Vector3.new(0, 0, 0, 0));
                else
                    local v76 = -v69().Y * 1.3962634015954636;
                    local v77 = math.atan2(-v72.X, -v72.Z);
                    local _, v79, _ = l_CFrame_0:ToEulerAnglesYXZ();
                    v77 = v77 + v79;
                    return CFrame.fromEulerAnglesYXZ(v76, v77, 0).LookVector;
                end;
            else
                return l_CFrame_0:VectorToWorldSpace(v72);
            end;
        else
            local v81 = nil;
            local v82 = nil;
            local _, _, _, v86, v87, v88, _, _, v91, _, _, v94 = l_CFrame_0:GetComponents();
            if v91 < 1 and v91 > -1 then
                v81 = v94;
                v82 = v88;
            else
                v81 = v86;
                v82 = -v87 * math.sign(v91);
            end;
            local v95 = math.sqrt(v81 * v81 + v82 * v82);
            return (Vector3.new((v81 * v72.X + v82 * v72.Z) / v95, 0, (v81 * v72.Z - v82 * v72.X) / v95));
        end;
    end;
end;
v0.OnRenderStepped = function(v96, v97) --[[ Line: 470 ]] --[[ Name: OnRenderStepped ]]
    -- upvalues: l_Gamepad_0 (copy), l_VRService_0 (copy), l_Players_0 (copy), l_ReplicatedStorage_0 (copy)
    if v96.activeController and v96.activeController.enabled and v96.humanoid then
        local l_MoveVector_0 = v96.activeController:GetMoveVector();
        local v99 = v96.activeController:IsMoveVectorCameraRelative();
        local l_v96_ClickToMoveController_0 = v96:GetClickToMoveController();
        if v96.activeController == l_v96_ClickToMoveController_0 then
            l_v96_ClickToMoveController_0:OnRenderStepped(v97);
        elseif l_MoveVector_0.magnitude > 0 then
            l_v96_ClickToMoveController_0:CleanupPath();
        else
            l_v96_ClickToMoveController_0:OnRenderStepped(v97);
            l_MoveVector_0 = l_v96_ClickToMoveController_0:GetMoveVector();
            v99 = l_v96_ClickToMoveController_0:IsMoveVectorCameraRelative();
        end;
        local v101 = false;
        if v96.vehicleController then
            local v102, v103 = v96.vehicleController:Update(l_MoveVector_0, v99, v96.activeControlModule == l_Gamepad_0);
            l_MoveVector_0 = v102;
            v101 = v103;
        end;
        if v99 then
            l_MoveVector_0 = v96:calculateRawMoveVector(v96.humanoid, l_MoveVector_0);
        end;
        v96.inputMoveVector = l_MoveVector_0;
        if l_VRService_0.VREnabled then
            l_MoveVector_0 = v96:updateVRMoveVector(l_MoveVector_0);
        end;
        v96.moveFunction(l_Players_0.LocalPlayer, l_MoveVector_0, false);
        if v96.activeController:GetIsJumping() or v96.touchJumpController and v96.touchJumpController:GetIsJumping() then
            if l_Players_0.LocalPlayer:GetAttribute("SeatedCanJump") then
                require(l_ReplicatedStorage_0.Packages.Net):RemoteEvent("SeatService/Unsit"):FireServer();
                v96.humanoid.Jump = true;
                return;
            elseif not l_Players_0.LocalPlayer:GetAttribute("Seated") then
                v96.humanoid.Jump = true;
                return;
            end;
        else
            v96.humanoid.Jump = false;
        end;
    end;
end;
v0.updateVRMoveVector = function(v104, v105) --[[ Line: 530 ]] --[[ Name: updateVRMoveVector ]]
    -- upvalues: l_VRService_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v107 = l_CurrentCamera_1.Focus.Position - l_CurrentCamera_1.CFrame.Position;
    local v108 = false;
    if v107.Magnitude < 5 then
        v108 = true;
    end;
    if v105.Magnitude == 0 and v108 and l_VRService_0.AvatarGestures and v104.humanoid and not v104.humanoid.Sit then
        local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        l_l_VRService_0_UserCFrame_4 = l_l_VRService_0_UserCFrame_4.Rotation + l_l_VRService_0_UserCFrame_4.Position * l_CurrentCamera_1.HeadScale;
        local v110 = -0.7 * v104.humanoid.RootPart.Size.Y / 2;
        local v111 = (l_CurrentCamera_1.CFrame * l_l_VRService_0_UserCFrame_4 * CFrame.new(0, v110, 0)).Position - v104.humanoid.RootPart.CFrame.Position;
        return (Vector3.new(v111.x, 0, v111.z));
    else
        return v105;
    end;
end;
v0.OnHumanoidSeated = function(v112, v113, v114) --[[ Line: 555 ]] --[[ Name: OnHumanoidSeated ]]
    -- upvalues: l_Value_0 (copy)
    if v113 then
        if v114 and v114:IsA("VehicleSeat") then
            if not v112.vehicleController then
                v112.vehicleController = v112.vehicleController.new(l_Value_0);
            end;
            v112.vehicleController:Enable(true, v114);
            return;
        end;
    elseif v112.vehicleController then
        v112.vehicleController:Enable(false, v114);
    end;
end;
v0.OnCharacterAdded = function(v115, v116) --[[ Line: 570 ]] --[[ Name: OnCharacterAdded ]]
    v115.humanoid = v116:FindFirstChildOfClass("Humanoid");
    while not v115.humanoid do
        v116.ChildAdded:wait();
        v115.humanoid = v116:FindFirstChildOfClass("Humanoid");
    end;
    v115:UpdateTouchGuiVisibility();
    if v115.humanoidSeatedConn then
        v115.humanoidSeatedConn:Disconnect();
        v115.humanoidSeatedConn = nil;
    end;
    v115.humanoidSeatedConn = v115.humanoid.Seated:Connect(function(v117, v118) --[[ Line: 583 ]]
        -- upvalues: v115 (copy)
        v115:OnHumanoidSeated(v117, v118);
    end);
end;
v0.OnCharacterRemoving = function(v119, _) --[[ Line: 588 ]] --[[ Name: OnCharacterRemoving ]]
    v119.humanoid = nil;
    v119:UpdateTouchGuiVisibility();
end;
v0.UpdateTouchGuiVisibility = function(v121) --[[ Line: 594 ]] --[[ Name: UpdateTouchGuiVisibility ]]
    -- upvalues: l_GuiService_0 (copy)
    if v121.touchGui then
        local v122 = v121.humanoid and l_GuiService_0.TouchControlsEnabled;
        v121.touchGui.Enabled = not not v122;
    end;
end;
v0.SwitchToController = function(v123, v124) --[[ Line: 608 ]] --[[ Name: SwitchToController ]]
    -- upvalues: l_Value_0 (copy)
    if not v124 then
        if v123.activeController then
            v123.activeController:Enable(false);
        end;
        v123.activeController = nil;
        v123.activeControlModule = nil;
        return;
    else
        if not v123.controllers[v124] then
            v123.controllers[v124] = v124.new(l_Value_0);
        end;
        if v123.activeController ~= v123.controllers[v124] then
            if v123.activeController then
                v123.activeController:Enable(false);
            end;
            v123.activeController = v123.controllers[v124];
            v123.activeControlModule = v124;
            v123:UpdateActiveControlModuleEnabled();
        end;
        return;
    end;
end;
v0.OnLastInputTypeChanged = function(v125, v126) --[[ Line: 636 ]] --[[ Name: OnLastInputTypeChanged ]]
    -- upvalues: v21 (ref), v20 (copy)
    if v21 == v126 then
        warn("LastInputType Change listener called with current type.");
    end;
    v21 = v126;
    if v21 == Enum.UserInputType.Touch then
        local v127, v128 = v125:SelectTouchModule();
        if v128 then
            while not v125.touchControlFrame do
                wait();
            end;
            v125:SwitchToController(v127);
        end;
    elseif v20[v21] ~= nil then
        local v129 = v125:SelectComputerMovementModule();
        if v129 then
            v125:SwitchToController(v129);
        end;
    end;
    v125:UpdateTouchGuiVisibility();
end;
v0.OnComputerMovementModeChange = function(v130) --[[ Line: 663 ]] --[[ Name: OnComputerMovementModeChange ]]
    local v131, v132 = v130:SelectComputerMovementModule();
    if v132 then
        v130:SwitchToController(v131);
    end;
end;
v0.OnTouchMovementModeChange = function(v133) --[[ Line: 670 ]] --[[ Name: OnTouchMovementModeChange ]]
    local v134, v135 = v133:SelectTouchModule();
    if v135 then
        while not v133.touchControlFrame do
            wait();
        end;
        v133:SwitchToController(v134);
    end;
end;
v0.CreateTouchGuiContainer = function(v136) --[[ Line: 680 ]] --[[ Name: CreateTouchGuiContainer ]]
    -- upvalues: v13 (ref)
    if v136.touchGui then
        v136.touchGui:Destroy();
    end;
    v136.touchGui = Instance.new("ScreenGui");
    v136.touchGui.Name = "TouchGui";
    v136.touchGui.ResetOnSpawn = false;
    v136.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v136:UpdateTouchGuiVisibility();
    if v13 then
        v136.touchGui.ClipToDeviceSafeArea = false;
    end;
    v136.touchControlFrame = Instance.new("Frame");
    v136.touchControlFrame.Name = "TouchControlFrame";
    v136.touchControlFrame.Size = UDim2.new(1, 0, 1, 0);
    v136.touchControlFrame.BackgroundTransparency = 1;
    v136.touchControlFrame.Parent = v136.touchGui;
    v136.touchGui.Parent = v136.playerGui;
end;
v0.GetClickToMoveController = function(v137) --[[ Line: 703 ]] --[[ Name: GetClickToMoveController ]]
    -- upvalues: l_result_0 (copy), l_Value_0 (copy)
    if not v137.controllers[l_result_0] then
        v137.controllers[l_result_0] = l_result_0.new(l_Value_0);
    end;
    return v137.controllers[l_result_0];
end;
return v0.new();