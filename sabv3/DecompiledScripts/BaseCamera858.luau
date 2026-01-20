local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script.Parent:WaitForChild("CameraUtils"));
local l_ZoomController_0 = require(script.Parent:WaitForChild("ZoomController"));
local l_CameraToggleStateController_0 = require(script.Parent:WaitForChild("CameraToggleStateController"));
local l_CameraInput_0 = require(script.Parent:WaitForChild("CameraInput"));
local l_CameraUI_0 = require(script.Parent:WaitForChild("CameraUI"));
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 24 ]]
    return UserSettings():IsUserFeatureEnabled("UserFixGamepadMaxZoom");
end);
v13 = l_status_0 and l_result_0;
l_status_0 = l_FlagUtil_0.getUserFlag("UserFixCameraCameraCharacterUpdates");
l_result_0 = Vector2.new(0, 0);
local v16 = {
    CHARACTER_ADDED = "CHARACTER_ADDED", 
    CAMERA_MODE_CHANGED = "CAMERA_MODE_CHANGED", 
    CAMERA_MIN_DISTANCE_CHANGED = "CAMERA_MIN_DISTANCE_CHANGED", 
    CAMERA_MAX_DISTANCE_CHANGED = "CAMERA_MAX_DISTANCE_CHANGED"
};
local v17 = {};
v17.__index = v17;
v17.new = function() --[[ Line: 80 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), l_ConnectionUtil_0 (copy), l_LocalPlayer_0 (copy), l_status_0 (copy), l_UserGameSettings_0 (copy)
    local v18 = setmetatable({}, v17);
    v18._connections = l_ConnectionUtil_0.new();
    v18.gamepadZoomLevels = {
        0, 
        10, 
        20
    };
    v18.FIRST_PERSON_DISTANCE_THRESHOLD = 1;
    v18.cameraType = nil;
    v18.cameraMovementMode = nil;
    v18.lastCameraTransform = nil;
    v18.lastUserPanCamera = tick();
    v18.humanoidRootPart = nil;
    v18.humanoidCache = {};
    v18.lastSubject = nil;
    v18.lastSubjectPosition = Vector3.new(0, 5, 0, 0);
    v18.lastSubjectCFrame = CFrame.new(v18.lastSubjectPosition);
    v18.currentSubjectDistance = math.clamp(12.5, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
    v18.inFirstPerson = false;
    v18.inMouseLockedMode = false;
    v18.portraitMode = false;
    v18.isSmallTouchScreen = false;
    v18.resetCameraAngle = true;
    v18.enabled = false;
    if not l_status_0 then
        v18.PlayerGui = nil;
    end;
    v18.cameraChangedConn = nil;
    v18.viewportSizeChangedConn = nil;
    v18.shouldUseVRRotation = false;
    v18.VRRotationIntensityAvailable = false;
    v18.lastVRRotationIntensityCheckTime = 0;
    v18.lastVRRotationTime = 0;
    v18.vrRotateKeyCooldown = {};
    v18.cameraTranslationConstraints = Vector3.new(1, 1, 1, 0);
    v18.humanoidJumpOrigin = nil;
    v18.trackingHumanoid = nil;
    v18.cameraFrozen = false;
    v18.subjectStateChangedConn = nil;
    v18.gamepadZoomPressConnection = nil;
    v18.mouseLockOffset = Vector3.new(0, 0, 0, 0);
    l_UserGameSettings_0:SetCameraYInvertVisible();
    l_UserGameSettings_0:SetGamepadCameraSensitivityVisible();
    return v18;
end;
v17.GetModuleName = function(_) --[[ Line: 149 ]] --[[ Name: GetModuleName ]]
    return "BaseCamera";
end;
v17._setUpConfigurations = function(v20) --[[ Line: 153 ]] --[[ Name: _setUpConfigurations ]]
    -- upvalues: v16 (copy), l_LocalPlayer_0 (copy), l_status_0 (copy)
    v20._connections:trackConnection(v16.CHARACTER_ADDED, l_LocalPlayer_0.CharacterAdded:Connect(function(v21) --[[ Line: 154 ]]
        -- upvalues: v20 (copy)
        v20:OnCharacterAdded(v21);
    end));
    if l_status_0 then
        v20.humanoidRootPart = nil;
    elseif l_LocalPlayer_0.Character then
        v20:OnCharacterAdded(l_LocalPlayer_0.Character);
    end;
    v20._connections:trackConnection(v16.CAMERA_MODE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 165 ]]
        -- upvalues: v20 (copy)
        v20:OnPlayerCameraPropertyChange();
    end));
    v20._connections:trackConnection(v16.CAMERA_MIN_DISTANCE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 168 ]]
        -- upvalues: v20 (copy)
        v20:OnPlayerCameraPropertyChange();
    end));
    v20._connections:trackConnection(v16.CAMERA_MAX_DISTANCE_CHANGED, l_LocalPlayer_0:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 171 ]]
        -- upvalues: v20 (copy)
        v20:OnPlayerCameraPropertyChange();
    end));
    v20:OnPlayerCameraPropertyChange();
end;
v17.OnCharacterAdded = function(v22, v23) --[[ Line: 177 ]] --[[ Name: OnCharacterAdded ]]
    -- upvalues: l_status_0 (copy), l_UserInputService_0 (copy), l_LocalPlayer_0 (copy)
    v22.resetCameraAngle = v22.resetCameraAngle or v22:GetEnabled();
    v22.humanoidRootPart = nil;
    if not l_status_0 and l_UserInputService_0.TouchEnabled then
        v22.PlayerGui = l_LocalPlayer_0:WaitForChild("PlayerGui");
        for _, v25 in ipairs(v23:GetChildren()) do
            if v25:IsA("Tool") then
                v22.isAToolEquipped = true;
            end;
        end;
        v23.ChildAdded:Connect(function(v26) --[[ Line: 190 ]]
            -- upvalues: v22 (copy)
            if v26:IsA("Tool") then
                v22.isAToolEquipped = true;
            end;
        end);
        v23.ChildRemoved:Connect(function(v27) --[[ Line: 195 ]]
            -- upvalues: v22 (copy)
            if v27:IsA("Tool") then
                v22.isAToolEquipped = false;
            end;
        end);
    end;
end;
v17.GetHumanoidRootPart = function(v28) --[[ Line: 204 ]] --[[ Name: GetHumanoidRootPart ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if not v28.humanoidRootPart and l_LocalPlayer_0.Character then
        local l_Humanoid_0 = l_LocalPlayer_0.Character:FindFirstChildOfClass("Humanoid");
        if l_Humanoid_0 then
            v28.humanoidRootPart = l_Humanoid_0.RootPart;
        end;
    end;
    return v28.humanoidRootPart;
end;
v17.GetBodyPartToFollow = function(_, v31, _) --[[ Line: 216 ]] --[[ Name: GetBodyPartToFollow ]]
    if v31:GetState() == Enum.HumanoidStateType.Dead then
        local l_Parent_0 = v31.Parent;
        if l_Parent_0 and l_Parent_0:IsA("Model") then
            return l_Parent_0:FindFirstChild("Head") or v31.RootPart;
        end;
    end;
    return v31.RootPart;
end;
v17.GetSubjectCFrame = function(v34) --[[ Line: 228 ]] --[[ Name: GetSubjectCFrame ]]
    local l_lastSubjectCFrame_0 = v34.lastSubjectCFrame;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v37 = l_CurrentCamera_0 and l_CurrentCamera_0.CameraSubject;
    if not v37 then
        return l_lastSubjectCFrame_0;
    else
        if v37:IsA("Humanoid") then
            local v38 = v37:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_0 = v37.CameraOffset;
            if v34:GetIsMouseLocked() then
                l_CameraOffset_0 = Vector3.new();
            end;
            local l_RootPart_0 = v37.RootPart;
            if v38 and v37.Parent and v37.Parent:IsA("Model") then
                l_RootPart_0 = v37.Parent:FindFirstChild("Head") or l_RootPart_0;
            end;
            if l_RootPart_0 and l_RootPart_0:IsA("BasePart") then
                local v41 = nil;
                if v37.RigType == Enum.HumanoidRigType.R15 then
                    if v37.AutomaticScalingEnabled then
                        v41 = Vector3.new(0, 1.5, 0, 0);
                        local l_RootPart_1 = v37.RootPart;
                        if l_RootPart_0 == l_RootPart_1 then
                            v41 = v41 + Vector3.new(0, (l_RootPart_1.Size.Y - Vector3.new(2, 2, 1, 0).Y) / 2, 0);
                        end;
                    else
                        v41 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v41 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v38 then
                    v41 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectCFrame_0 = l_RootPart_0.CFrame * CFrame.new(v41 + l_CameraOffset_0);
            end;
        elseif v37:IsA("BasePart") then
            l_lastSubjectCFrame_0 = v37.CFrame;
        elseif v37:IsA("Model") then
            l_lastSubjectCFrame_0 = if v37.PrimaryPart then v37:GetPrimaryPartCFrame() else CFrame.new();
        end;
        if l_lastSubjectCFrame_0 then
            v34.lastSubjectCFrame = l_lastSubjectCFrame_0;
        end;
        return l_lastSubjectCFrame_0;
    end;
end;
v17.GetSubjectVelocity = function(_) --[[ Line: 302 ]] --[[ Name: GetSubjectVelocity ]]
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v45 = l_CurrentCamera_1 and l_CurrentCamera_1.CameraSubject;
    if not v45 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v45:IsA("BasePart") then
        return v45.Velocity;
    else
        if v45:IsA("Humanoid") then
            local l_RootPart_2 = v45.RootPart;
            if l_RootPart_2 then
                return l_RootPart_2.Velocity;
            end;
        elseif v45:IsA("Model") then
            local l_PrimaryPart_0 = v45.PrimaryPart;
            if l_PrimaryPart_0 then
                return l_PrimaryPart_0.Velocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v17.GetSubjectRotVelocity = function(_) --[[ Line: 331 ]] --[[ Name: GetSubjectRotVelocity ]]
    local l_CurrentCamera_2 = workspace.CurrentCamera;
    local v50 = l_CurrentCamera_2 and l_CurrentCamera_2.CameraSubject;
    if not v50 then
        return (Vector3.new(0, 0, 0, 0));
    elseif v50:IsA("BasePart") then
        return v50.RotVelocity;
    else
        if v50:IsA("Humanoid") then
            local l_RootPart_3 = v50.RootPart;
            if l_RootPart_3 then
                return l_RootPart_3.RotVelocity;
            end;
        elseif v50:IsA("Model") then
            local l_PrimaryPart_1 = v50.PrimaryPart;
            if l_PrimaryPart_1 then
                return l_PrimaryPart_1.RotVelocity;
            end;
        end;
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
v17.StepZoom = function(v53) --[[ Line: 360 ]] --[[ Name: StepZoom ]]
    -- upvalues: l_CameraInput_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_0 = v53.currentSubjectDistance;
    local v55 = l_CameraInput_0.getZoomDelta();
    if math.abs(v55) > 0 then
        local v56 = nil;
        v56 = if v55 > 0 then math.max(l_currentSubjectDistance_0 + v55 * (l_currentSubjectDistance_0 * 0.5 + 1), v53.FIRST_PERSON_DISTANCE_THRESHOLD) else math.max((l_currentSubjectDistance_0 + v55) / (1 - v55 * 0.5), 0.5);
        if v56 < v53.FIRST_PERSON_DISTANCE_THRESHOLD then
            v56 = 0.5;
        end;
        v53:SetCameraToSubjectDistance(v56);
    end;
    return l_ZoomController_0.GetZoomRadius();
end;
v17.GetSubjectPosition = function(v57) --[[ Line: 385 ]] --[[ Name: GetSubjectPosition ]]
    local l_lastSubjectPosition_0 = v57.lastSubjectPosition;
    local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
    local v60 = l_CurrentCamera_3 and l_CurrentCamera_3.CameraSubject;
    if v60 then
        if v60:IsA("Humanoid") then
            local v61 = v60:GetState() == Enum.HumanoidStateType.Dead;
            local l_CameraOffset_1 = v60.CameraOffset;
            if v57:GetIsMouseLocked() then
                l_CameraOffset_1 = Vector3.new();
            end;
            local l_RootPart_4 = v60.RootPart;
            if v61 and v60.Parent and v60.Parent:IsA("Model") then
                l_RootPart_4 = v60.Parent:FindFirstChild("Head") or l_RootPart_4;
            end;
            if l_RootPart_4 and l_RootPart_4:IsA("BasePart") then
                local v64 = nil;
                if v60.RigType == Enum.HumanoidRigType.R15 then
                    if v60.AutomaticScalingEnabled then
                        v64 = Vector3.new(0, 1.5, 0, 0);
                        if l_RootPart_4 == v60.RootPart then
                            v64 = v64 + Vector3.new(0, v60.RootPart.Size.Y / 2 - Vector3.new(2, 2, 1, 0).Y / 2, 0);
                        end;
                    else
                        v64 = Vector3.new(0, 2, 0, 0);
                    end;
                else
                    v64 = Vector3.new(0, 1.5, 0, 0);
                end;
                if v61 then
                    v64 = Vector3.new(0, 0, 0, 0);
                end;
                l_lastSubjectPosition_0 = l_RootPart_4.CFrame.p + l_RootPart_4.CFrame:vectorToWorldSpace(v64 + l_CameraOffset_1);
            end;
        elseif v60:IsA("VehicleSeat") then
            l_lastSubjectPosition_0 = v60.CFrame.p + v60.CFrame:vectorToWorldSpace((Vector3.new(0, 5, 0, 0)));
        elseif v60:IsA("SkateboardPlatform") then
            l_lastSubjectPosition_0 = v60.CFrame.p + Vector3.new(0, 5, 0, 0);
        elseif v60:IsA("BasePart") then
            l_lastSubjectPosition_0 = v60.CFrame.p;
        elseif v60:IsA("Model") then
            l_lastSubjectPosition_0 = if v60.PrimaryPart then v60:GetPrimaryPartCFrame().p else v60:GetModelCFrame().p;
        end;
        v57.lastSubject = v60;
        v57.lastSubjectPosition = l_lastSubjectPosition_0;
        return l_lastSubjectPosition_0;
    else
        return nil;
    end;
end;
v17.OnViewportSizeChanged = function(v65) --[[ Line: 462 ]] --[[ Name: OnViewportSizeChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_ViewportSize_0 = game.Workspace.CurrentCamera.ViewportSize;
    v65.portraitMode = l_ViewportSize_0.X < l_ViewportSize_0.Y;
    v65.isSmallTouchScreen = l_UserInputService_0.TouchEnabled and (l_ViewportSize_0.Y < 500 or l_ViewportSize_0.X < 700);
end;
v17.OnCurrentCameraChanged = function(v67) --[[ Line: 470 ]] --[[ Name: OnCurrentCameraChanged ]]
    -- upvalues: l_UserInputService_0 (copy)
    if l_UserInputService_0.TouchEnabled then
        if v67.viewportSizeChangedConn then
            v67.viewportSizeChangedConn:Disconnect();
            v67.viewportSizeChangedConn = nil;
        end;
        local l_CurrentCamera_4 = game.Workspace.CurrentCamera;
        if l_CurrentCamera_4 then
            v67:OnViewportSizeChanged();
            v67.viewportSizeChangedConn = l_CurrentCamera_4:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 481 ]]
                -- upvalues: v67 (copy)
                v67:OnViewportSizeChanged();
            end);
        end;
    end;
    if v67.cameraSubjectChangedConn then
        v67.cameraSubjectChangedConn:Disconnect();
        v67.cameraSubjectChangedConn = nil;
    end;
    local l_CurrentCamera_5 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_5 then
        v67.cameraSubjectChangedConn = l_CurrentCamera_5:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 495 ]]
            -- upvalues: v67 (copy)
            v67:OnNewCameraSubject();
        end);
        v67:OnNewCameraSubject();
    end;
end;
v17.OnPlayerCameraPropertyChange = function(v70) --[[ Line: 502 ]] --[[ Name: OnPlayerCameraPropertyChange ]]
    v70:SetCameraToSubjectDistance(v70.currentSubjectDistance);
end;
v17.InputTranslationToCameraAngleChange = function(_, v72, v73) --[[ Line: 507 ]] --[[ Name: InputTranslationToCameraAngleChange ]]
    return v72 * v73;
end;
v17.GamepadZoomPress = function(v74) --[[ Line: 513 ]] --[[ Name: GamepadZoomPress ]]
    -- upvalues: l_LocalPlayer_0 (copy), v13 (ref)
    local l_v74_CameraToSubjectDistance_0 = v74:GetCameraToSubjectDistance();
    local l_CameraMaxZoomDistance_0 = l_LocalPlayer_0.CameraMaxZoomDistance;
    for v77 = #v74.gamepadZoomLevels, 1, -1 do
        local v78 = v74.gamepadZoomLevels[v77];
        if l_CameraMaxZoomDistance_0 >= v78 then
            if v78 < l_LocalPlayer_0.CameraMinZoomDistance then
                v78 = l_LocalPlayer_0.CameraMinZoomDistance;
                if v13 and l_CameraMaxZoomDistance_0 == v78 then
                    break;
                end;
            end;
            if v13 or l_CameraMaxZoomDistance_0 ~= v78 then
                if v78 + (l_CameraMaxZoomDistance_0 - v78) / 2 < l_v74_CameraToSubjectDistance_0 then
                    v74:SetCameraToSubjectDistance(v78);
                    return;
                else
                    l_CameraMaxZoomDistance_0 = v78;
                end;
            else
                break;
            end;
        end;
    end;
    v74:SetCameraToSubjectDistance(v74.gamepadZoomLevels[#v74.gamepadZoomLevels]);
end;
v17.Enable = function(v79, v80) --[[ Line: 558 ]] --[[ Name: Enable ]]
    if v79.enabled ~= v80 then
        v79.enabled = v80;
        v79:OnEnabledChanged();
    end;
end;
v17.OnEnabledChanged = function(v81) --[[ Line: 566 ]] --[[ Name: OnEnabledChanged ]]
    -- upvalues: l_CameraInput_0 (copy), l_LocalPlayer_0 (copy)
    if v81.enabled then
        v81:_setUpConfigurations();
        l_CameraInput_0.setInputEnabled(true);
        v81.gamepadZoomPressConnection = l_CameraInput_0.gamepadZoomPress:Connect(function() --[[ Line: 572 ]]
            -- upvalues: v81 (copy)
            v81:GamepadZoomPress();
        end);
        if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
            v81.currentSubjectDistance = 0.5;
            if not v81.inFirstPerson then
                v81:EnterFirstPerson();
            end;
        end;
        if v81.cameraChangedConn then
            v81.cameraChangedConn:Disconnect();
            v81.cameraChangedConn = nil;
        end;
        v81.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 584 ]]
            -- upvalues: v81 (copy)
            v81:OnCurrentCameraChanged();
        end);
        v81:OnCurrentCameraChanged();
        return;
    else
        v81._connections:disconnectAll();
        l_CameraInput_0.setInputEnabled(false);
        if v81.gamepadZoomPressConnection then
            v81.gamepadZoomPressConnection:Disconnect();
            v81.gamepadZoomPressConnection = nil;
        end;
        v81:Cleanup();
        return;
    end;
end;
v17.GetEnabled = function(v82) --[[ Line: 602 ]] --[[ Name: GetEnabled ]]
    return v82.enabled;
end;
v17.Cleanup = function(v83) --[[ Line: 606 ]] --[[ Name: Cleanup ]]
    -- upvalues: l_CameraUtils_0 (copy)
    if v83.subjectStateChangedConn then
        v83.subjectStateChangedConn:Disconnect();
        v83.subjectStateChangedConn = nil;
    end;
    if v83.viewportSizeChangedConn then
        v83.viewportSizeChangedConn:Disconnect();
        v83.viewportSizeChangedConn = nil;
    end;
    if v83.cameraChangedConn then
        v83.cameraChangedConn:Disconnect();
        v83.cameraChangedConn = nil;
    end;
    v83.lastCameraTransform = nil;
    v83.lastSubjectCFrame = nil;
    l_CameraUtils_0.restoreMouseBehavior();
end;
v17.UpdateMouseBehavior = function(v84) --[[ Line: 627 ]] --[[ Name: UpdateMouseBehavior ]]
    -- upvalues: l_UserGameSettings_0 (copy), l_CameraUI_0 (copy), l_CameraInput_0 (copy), l_CameraToggleStateController_0 (copy), l_LocalPlayer_0 (copy), l_CameraUtils_0 (copy)
    local v85 = l_UserGameSettings_0.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove;
    if v84.isCameraToggle and v85 == false then
        l_CameraUI_0.setCameraModeToastEnabled(true);
        l_CameraInput_0.enableCameraToggleInput();
        l_CameraToggleStateController_0(v84.inFirstPerson);
        return;
    else
        l_CameraUI_0.setCameraModeToastEnabled(false);
        l_CameraInput_0.disableCameraToggleInput();
        if v84.inFirstPerson or v84.inMouseLockedMode and not l_LocalPlayer_0:GetAttribute("NoMouseLockOffset") then
            l_CameraUtils_0.setRotationTypeOverride(Enum.RotationType.CameraRelative);
            l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter);
            return;
        else
            l_CameraUtils_0.restoreRotationType();
            if l_CameraInput_0.getRotationActivated() then
                l_CameraUtils_0.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition);
                return;
            else
                l_CameraUtils_0.restoreMouseBehavior();
                return;
            end;
        end;
    end;
end;
v17.UpdateForDistancePropertyChange = function(v86) --[[ Line: 655 ]] --[[ Name: UpdateForDistancePropertyChange ]]
    v86:SetCameraToSubjectDistance(v86.currentSubjectDistance);
end;
v17.SetCameraToSubjectDistance = function(v87, v88) --[[ Line: 661 ]] --[[ Name: SetCameraToSubjectDistance ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ZoomController_0 (copy)
    local l_currentSubjectDistance_1 = v87.currentSubjectDistance;
    if l_LocalPlayer_0.CameraMode == Enum.CameraMode.LockFirstPerson then
        v87.currentSubjectDistance = 0.5;
        if not v87.inFirstPerson then
            v87:EnterFirstPerson();
        end;
    else
        local v90 = math.clamp(v88, l_LocalPlayer_0.CameraMinZoomDistance, l_LocalPlayer_0.CameraMaxZoomDistance);
        if v90 < 1 then
            v87.currentSubjectDistance = 0.5;
            if not v87.inFirstPerson then
                v87:EnterFirstPerson();
            end;
        else
            v87.currentSubjectDistance = v90;
            if v87.inFirstPerson then
                v87:LeaveFirstPerson();
            end;
        end;
    end;
    l_ZoomController_0.SetZoomParameters(v87.currentSubjectDistance, (math.sign(v88 - l_currentSubjectDistance_1)));
    return v87.currentSubjectDistance;
end;
v17.SetCameraType = function(v91, v92) --[[ Line: 695 ]] --[[ Name: SetCameraType ]]
    v91.cameraType = v92;
end;
v17.GetCameraType = function(v93) --[[ Line: 700 ]] --[[ Name: GetCameraType ]]
    return v93.cameraType;
end;
v17.SetCameraMovementMode = function(v94, v95) --[[ Line: 705 ]] --[[ Name: SetCameraMovementMode ]]
    v94.cameraMovementMode = v95;
end;
v17.GetCameraMovementMode = function(v96) --[[ Line: 709 ]] --[[ Name: GetCameraMovementMode ]]
    return v96.cameraMovementMode;
end;
v17.SetIsMouseLocked = function(v97, v98) --[[ Line: 713 ]] --[[ Name: SetIsMouseLocked ]]
    v97.inMouseLockedMode = v98;
end;
v17.GetIsMouseLocked = function(v99) --[[ Line: 717 ]] --[[ Name: GetIsMouseLocked ]]
    return v99.inMouseLockedMode;
end;
v17.SetMouseLockOffset = function(v100, v101) --[[ Line: 721 ]] --[[ Name: SetMouseLockOffset ]]
    v100.mouseLockOffset = v101;
end;
v17.GetMouseLockOffset = function(v102) --[[ Line: 725 ]] --[[ Name: GetMouseLockOffset ]]
    return v102.mouseLockOffset;
end;
v17.InFirstPerson = function(v103) --[[ Line: 729 ]] --[[ Name: InFirstPerson ]]
    return v103.inFirstPerson;
end;
v17.EnterFirstPerson = function(v104) --[[ Line: 733 ]] --[[ Name: EnterFirstPerson ]]
    v104.inFirstPerson = true;
    v104:UpdateMouseBehavior();
end;
v17.LeaveFirstPerson = function(v105) --[[ Line: 738 ]] --[[ Name: LeaveFirstPerson ]]
    v105.inFirstPerson = false;
    v105:UpdateMouseBehavior();
end;
v17.GetCameraToSubjectDistance = function(v106) --[[ Line: 744 ]] --[[ Name: GetCameraToSubjectDistance ]]
    return v106.currentSubjectDistance;
end;
v17.GetMeasuredDistanceToFocus = function(_) --[[ Line: 751 ]] --[[ Name: GetMeasuredDistanceToFocus ]]
    local l_CurrentCamera_6 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_6 then
        return (l_CurrentCamera_6.CoordinateFrame.p - l_CurrentCamera_6.Focus.p).magnitude;
    else
        return nil;
    end;
end;
v17.GetCameraLookVector = function(_) --[[ Line: 759 ]] --[[ Name: GetCameraLookVector ]]
    return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1, 0);
end;
v17.CalculateNewLookCFrameFromArg = function(v110, v111, v112) --[[ Line: 763 ]] --[[ Name: CalculateNewLookCFrameFromArg ]]
    local v113 = v111 or v110:GetCameraLookVector();
    local v114 = math.asin(v113.Y);
    local v115 = math.clamp(v112.Y, v114 + -1.3962634015954636, v114 + 1.3962634015954636);
    local v116 = Vector2.new(v112.X, v115);
    local v117 = CFrame.new(Vector3.new(0, 0, 0, 0), v113);
    return CFrame.Angles(0, -v116.X, 0) * v117 * CFrame.Angles(-v116.Y, 0, 0);
end;
v17.CalculateNewLookVectorFromArg = function(v118, v119, v120) --[[ Line: 773 ]] --[[ Name: CalculateNewLookVectorFromArg ]]
    return v118:CalculateNewLookCFrameFromArg(v119, v120).LookVector;
end;
v17.CalculateNewLookVectorVRFromArg = function(v121, v122) --[[ Line: 778 ]] --[[ Name: CalculateNewLookVectorVRFromArg ]]
    local l_unit_0 = ((v121:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1, 0)).unit;
    local v124 = Vector2.new(v122.X, 0);
    local v125 = CFrame.new(Vector3.new(0, 0, 0, 0), l_unit_0);
    return ((CFrame.Angles(0, -v124.X, 0) * v125 * CFrame.Angles(-v124.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1, 0)).unit;
end;
v17.GetHumanoid = function(v126) --[[ Line: 788 ]] --[[ Name: GetHumanoid ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v127 = l_LocalPlayer_0 and l_LocalPlayer_0.Character;
    if v127 then
        local v128 = v126.humanoidCache[l_LocalPlayer_0];
        if v128 and v128.Parent == v127 then
            return v128;
        else
            v126.humanoidCache[l_LocalPlayer_0] = nil;
            local l_Humanoid_1 = v127:FindFirstChildOfClass("Humanoid");
            if l_Humanoid_1 then
                v126.humanoidCache[l_LocalPlayer_0] = l_Humanoid_1;
            end;
            return l_Humanoid_1;
        end;
    else
        return nil;
    end;
end;
v17.GetHumanoidPartToFollow = function(_, v131, v132) --[[ Line: 806 ]] --[[ Name: GetHumanoidPartToFollow ]]
    if v132 == Enum.HumanoidStateType.Dead then
        local l_Parent_1 = v131.Parent;
        if l_Parent_1 then
            return l_Parent_1:FindFirstChild("Head") or v131.Torso;
        else
            return v131.Torso;
        end;
    else
        return v131.Torso;
    end;
end;
v17.OnNewCameraSubject = function(v134) --[[ Line: 820 ]] --[[ Name: OnNewCameraSubject ]]
    if v134.subjectStateChangedConn then
        v134.subjectStateChangedConn:Disconnect();
        v134.subjectStateChangedConn = nil;
    end;
end;
v17.IsInFirstPerson = function(v135) --[[ Line: 827 ]] --[[ Name: IsInFirstPerson ]]
    return v135.inFirstPerson;
end;
v17.Update = function(_, _) --[[ Line: 831 ]] --[[ Name: Update ]]
    error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2);
end;
v17.GetCameraHeight = function(v138) --[[ Line: 835 ]] --[[ Name: GetCameraHeight ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled and not v138.inFirstPerson then
        return 0.25881904510252074 * v138.currentSubjectDistance;
    else
        return 0;
    end;
end;
return v17;