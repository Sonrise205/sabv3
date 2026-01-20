local v0 = {};
v0.__index = v0;
local v1 = {
    "CameraMinZoomDistance", 
    "CameraMaxZoomDistance", 
    "CameraMode", 
    "DevCameraOcclusionMode", 
    "DevComputerCameraMode", 
    "DevTouchCameraMode", 
    "DevComputerMovementMode", 
    "DevTouchMovementMode", 
    "DevEnableMouseLock"
};
local v2 = {
    "ComputerCameraMovementMode", 
    "ComputerMovementMode", 
    "ControlMode", 
    "GamepadCameraSensitivity", 
    "MouseSensitivity", 
    "RotationType", 
    "TouchCameraMovementMode", 
    "TouchMovementMode"
};
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_CommonUtils_0 = script.Parent:WaitForChild("CommonUtils");
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraUtils_0 = require(script:WaitForChild("CameraUtils"));
local l_CameraInput_0 = require(script:WaitForChild("CameraInput"));
local l_ClassicCamera_0 = require(script:WaitForChild("ClassicCamera"));
local l_OrbitalCamera_0 = require(script:WaitForChild("OrbitalCamera"));
local l_LegacyCamera_0 = require(script:WaitForChild("LegacyCamera"));
local l_VehicleCamera_0 = require(script:WaitForChild("VehicleCamera"));
local l_VRCamera_0 = require(script:WaitForChild("VRCamera"));
local l_VRVehicleCamera_0 = require(script:WaitForChild("VRVehicleCamera"));
local l_Invisicam_0 = require(script:WaitForChild("Invisicam"));
local l_Poppercam_0 = require(script:WaitForChild("Poppercam"));
local l_TransparencyController_0 = require(script:WaitForChild("TransparencyController"));
local l_MouseLockController_0 = require(script:WaitForChild("MouseLockController"));
local v23 = {};
local v24 = {};
if not l_Players_0.LocalPlayer then
    return {};
else
    assert(l_Players_0.LocalPlayer, "Strict typing check");
    local l_PlayerScripts_0 = l_Players_0.LocalPlayer:WaitForChild("PlayerScripts");
    l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default);
    l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow);
    l_PlayerScripts_0:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic);
    l_PlayerScripts_0:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle);
    l_PlayerScripts_0 = l_FlagUtil_0.getUserFlag("UserRespectLegacyCameraOptions");
    local v26 = l_FlagUtil_0.getUserFlag("UserPlayerConnectionMemoryLeak");
    v0.new = function() --[[ Line: 144 ]] --[[ Name: new ]]
        -- upvalues: l_TransparencyController_0 (copy), v26 (copy), l_ConnectionUtil_0 (copy), v0 (copy), l_Players_0 (copy), l_MouseLockController_0 (copy), l_PlayerScripts_0 (copy), l_RunService_0 (copy), v1 (copy), v2 (copy), l_UserGameSettings_0 (copy)
        local v27 = setmetatable({
            activeTransparencyController = l_TransparencyController_0.new(), 
            connectionUtil = if v26 then l_ConnectionUtil_0.new() else nil
        }, v0);
        v27.activeCameraController = nil;
        v27.activeOcclusionModule = nil;
        v27.activeMouseLockController = nil;
        v27.currentComputerCameraMovementMode = nil;
        v27.cameraSubjectChangedConn = nil;
        v27.cameraTypeChangedConn = nil;
        for _, v29 in pairs(l_Players_0:GetPlayers()) do
            v27:OnPlayerAdded(v29);
        end;
        l_Players_0.PlayerAdded:Connect(function(v30) --[[ Line: 167 ]]
            -- upvalues: v27 (copy)
            v27:OnPlayerAdded(v30);
        end);
        if v26 then
            l_Players_0.PlayerRemoving:Connect(function(v31) --[[ Line: 172 ]]
                -- upvalues: v27 (copy)
                v27:OnPlayerRemoving(v31);
            end);
        end;
        v27.activeTransparencyController:Enable(true);
        v27.activeMouseLockController = l_MouseLockController_0.new();
        assert(v27.activeMouseLockController, "Strict typing check");
        local l_BindableToggleEvent_0 = v27.activeMouseLockController:GetBindableToggleEvent();
        if l_BindableToggleEvent_0 then
            l_BindableToggleEvent_0:Connect(function() --[[ Line: 184 ]]
                -- upvalues: v27 (copy)
                v27:OnMouseLockToggled();
            end);
        end;
        if l_PlayerScripts_0 then
            v27:ActivateCameraController();
        else
            v27:ActivateCameraController(v27:GetCameraControlChoice());
        end;
        v27:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
        v27:OnCurrentCameraChanged();
        l_RunService_0:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(v33) --[[ Line: 196 ]]
            -- upvalues: v27 (copy)
            v27:Update(v33);
        end);
        for _, v35 in pairs(v1) do
            l_Players_0.LocalPlayer:GetPropertyChangedSignal(v35):Connect(function() --[[ Line: 200 ]]
                -- upvalues: v27 (copy), v35 (copy)
                v27:OnLocalPlayerCameraPropertyChanged(v35);
            end);
        end;
        for _, v37 in pairs(v2) do
            l_UserGameSettings_0:GetPropertyChangedSignal(v37):Connect(function() --[[ Line: 206 ]]
                -- upvalues: v27 (copy), v37 (copy)
                v27:OnUserGameSettingsPropertyChanged(v37);
            end);
        end;
        game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 210 ]]
            -- upvalues: v27 (copy)
            v27:OnCurrentCameraChanged();
        end);
        return v27;
    end;
    v0.GetCameraMovementModeFromSettings = function(_) --[[ Line: 217 ]] --[[ Name: GetCameraMovementModeFromSettings ]]
        -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
        if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic);
        else
            local v39 = nil;
            local v40 = nil;
            if l_UserInputService_0.TouchEnabled then
                v39 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
                v40 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
            else
                v39 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
                v40 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
            end;
            if v39 == Enum.DevComputerCameraMovementMode.UserChoice then
                return v40;
            else
                return v39;
            end;
        end;
    end;
    v0.ActivateOcclusionModule = function(v41, v42) --[[ Line: 242 ]] --[[ Name: ActivateOcclusionModule ]]
        -- upvalues: l_Poppercam_0 (copy), l_Invisicam_0 (copy), v24 (copy), l_Players_0 (copy)
        local v43 = nil;
        if v42 == Enum.DevCameraOcclusionMode.Zoom then
            v43 = l_Poppercam_0;
        elseif v42 == Enum.DevCameraOcclusionMode.Invisicam then
            v43 = l_Invisicam_0;
        else
            warn("CameraScript ActivateOcclusionModule called with unsupported mode");
            return;
        end;
        v41.occlusionMode = v42;
        if v41.activeOcclusionModule and v41.activeOcclusionModule:GetOcclusionMode() == v42 then
            if not v41.activeOcclusionModule:GetEnabled() then
                v41.activeOcclusionModule:Enable(true);
            end;
            return;
        else
            local l_activeOcclusionModule_0 = v41.activeOcclusionModule;
            v41.activeOcclusionModule = v24[v43];
            if not v41.activeOcclusionModule then
                v41.activeOcclusionModule = v43.new();
                if v41.activeOcclusionModule then
                    v24[v43] = v41.activeOcclusionModule;
                end;
            end;
            if v41.activeOcclusionModule then
                if v41.activeOcclusionModule:GetOcclusionMode() ~= v42 then
                    warn("CameraScript ActivateOcclusionModule mismatch: ", v41.activeOcclusionModule:GetOcclusionMode(), "~=", v42);
                end;
                if l_activeOcclusionModule_0 then
                    if l_activeOcclusionModule_0 ~= v41.activeOcclusionModule then
                        l_activeOcclusionModule_0:Enable(false);
                    else
                        warn("CameraScript ActivateOcclusionModule failure to detect already running correct module");
                    end;
                end;
                if v42 == Enum.DevCameraOcclusionMode.Invisicam then
                    if l_Players_0.LocalPlayer.Character then
                        v41.activeOcclusionModule:CharacterAdded(l_Players_0.LocalPlayer.Character, l_Players_0.LocalPlayer);
                    end;
                else
                    for _, v46 in pairs(l_Players_0:GetPlayers()) do
                        if v46 and v46.Character then
                            v41.activeOcclusionModule:CharacterAdded(v46.Character, v46);
                        end;
                    end;
                    v41.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject);
                end;
                v41.activeOcclusionModule:Enable(true);
            end;
            return;
        end;
    end;
    v0.ShouldUseVehicleCamera = function(v47) --[[ Line: 321 ]] --[[ Name: ShouldUseVehicleCamera ]]
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        if not l_CurrentCamera_0 then
            return false;
        else
            local l_CameraType_0 = l_CurrentCamera_0.CameraType;
            local l_CameraSubject_0 = l_CurrentCamera_0.CameraSubject;
            local v51 = true;
            if l_CameraType_0 ~= Enum.CameraType.Custom then
                v51 = l_CameraType_0 == Enum.CameraType.Follow;
            end;
            local v52 = l_CameraSubject_0 and l_CameraSubject_0:IsA("VehicleSeat") or false;
            local v53 = v47.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam;
            return v52 and v51 and v53;
        end;
    end;
    v0.ActivateCameraController = function(v54, v55, v56) --[[ Line: 337 ]] --[[ Name: ActivateCameraController ]]
        -- upvalues: l_PlayerScripts_0 (copy), l_LegacyCamera_0 (copy), l_VRService_0 (copy), l_VRCamera_0 (copy), l_ClassicCamera_0 (copy), l_OrbitalCamera_0 (copy), l_VRVehicleCamera_0 (copy), l_VehicleCamera_0 (copy), v23 (copy)
        if l_PlayerScripts_0 then
            v56 = workspace.CurrentCamera.CameraType;
            v55 = v54:GetCameraMovementModeFromSettings();
        end;
        local v57 = nil;
        if l_PlayerScripts_0 and true or v56 ~= nil then
            if v56 == Enum.CameraType.Scriptable then
                if v54.activeCameraController then
                    v54.activeCameraController:Enable(false);
                    v54.activeCameraController = nil;
                end;
                return;
            elseif v56 == Enum.CameraType.Custom then
                v55 = v54:GetCameraMovementModeFromSettings();
            elseif v56 == Enum.CameraType.Track then
                v55 = Enum.ComputerCameraMovementMode.Classic;
            elseif v56 == Enum.CameraType.Follow then
                v55 = Enum.ComputerCameraMovementMode.Follow;
            elseif v56 == Enum.CameraType.Orbital then
                v55 = Enum.ComputerCameraMovementMode.Orbital;
            elseif v56 == Enum.CameraType.Attach or v56 == Enum.CameraType.Watch or v56 == Enum.CameraType.Fixed then
                v57 = l_LegacyCamera_0;
            else
                warn("CameraScript encountered an unhandled Camera.CameraType value: ", v56);
            end;
        end;
        if not v57 then
            if l_VRService_0.VREnabled then
                v57 = l_VRCamera_0;
            elseif v55 == Enum.ComputerCameraMovementMode.Classic or v55 == Enum.ComputerCameraMovementMode.Follow or v55 == Enum.ComputerCameraMovementMode.Default or v55 == Enum.ComputerCameraMovementMode.CameraToggle then
                v57 = l_ClassicCamera_0;
            elseif v55 == Enum.ComputerCameraMovementMode.Orbital then
                v57 = l_OrbitalCamera_0;
            else
                warn("ActivateCameraController did not select a module.");
                return;
            end;
        end;
        if v54:ShouldUseVehicleCamera() then
            v57 = if l_VRService_0.VREnabled then l_VRVehicleCamera_0 else l_VehicleCamera_0;
        end;
        local v58 = nil;
        if not v23[v57] then
            v58 = v57.new();
            v23[v57] = v58;
        else
            v58 = v23[v57];
            if v58.Reset then
                v58:Reset();
            end;
        end;
        if v54.activeCameraController then
            if v54.activeCameraController ~= v58 then
                v54.activeCameraController:Enable(false);
                v54.activeCameraController = v58;
                v54.activeCameraController:Enable(true);
            elseif not v54.activeCameraController:GetEnabled() then
                v54.activeCameraController:Enable(true);
            end;
        elseif v58 ~= nil then
            v54.activeCameraController = v58;
            assert(v54.activeCameraController, "Strict typing check");
            v54.activeCameraController:Enable(true);
        end;
        if v54.activeCameraController then
            if l_PlayerScripts_0 then
                v54.activeCameraController:SetCameraMovementMode(v55);
                v54.activeCameraController:SetCameraType(v56);
                return;
            elseif v55 ~= nil then
                v54.activeCameraController:SetCameraMovementMode(v55);
                return;
            elseif v56 ~= nil then
                v54.activeCameraController:SetCameraType(v56);
            end;
        end;
    end;
    v0.OnCameraSubjectChanged = function(v59) --[[ Line: 451 ]] --[[ Name: OnCameraSubjectChanged ]]
        local l_CurrentCamera_1 = workspace.CurrentCamera;
        local v61 = if l_CurrentCamera_1 then l_CurrentCamera_1.CameraSubject else nil;
        if v59.activeTransparencyController then
            v59.activeTransparencyController:SetSubject(v61);
        end;
        if v59.activeOcclusionModule then
            v59.activeOcclusionModule:OnCameraSubjectChanged(v61);
        end;
        v59:ActivateCameraController(nil, if l_CurrentCamera_1 then l_CurrentCamera_1.CameraType else nil);
    end;
    v0.OnCameraTypeChanged = function(v62, v63) --[[ Line: 466 ]] --[[ Name: OnCameraTypeChanged ]]
        -- upvalues: l_UserInputService_0 (copy), l_CameraUtils_0 (copy)
        if v63 == Enum.CameraType.Scriptable and l_UserInputService_0.MouseBehavior == Enum.MouseBehavior.LockCenter then
            l_CameraUtils_0.restoreMouseBehavior();
        end;
        v62:ActivateCameraController(nil, v63);
    end;
    v0.OnCurrentCameraChanged = function(v64) --[[ Line: 478 ]] --[[ Name: OnCurrentCameraChanged ]]
        local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
        if not l_CurrentCamera_2 then
            return;
        else
            if v64.cameraSubjectChangedConn then
                v64.cameraSubjectChangedConn:Disconnect();
            end;
            if v64.cameraTypeChangedConn then
                v64.cameraTypeChangedConn:Disconnect();
            end;
            v64.cameraSubjectChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 490 ]]
                -- upvalues: v64 (copy)
                v64:OnCameraSubjectChanged();
            end);
            v64.cameraTypeChangedConn = l_CurrentCamera_2:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 494 ]]
                -- upvalues: v64 (copy), l_CurrentCamera_2 (copy)
                v64:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
            end);
            v64:OnCameraSubjectChanged();
            v64:OnCameraTypeChanged(l_CurrentCamera_2.CameraType);
            return;
        end;
    end;
    v0.OnLocalPlayerCameraPropertyChanged = function(v66, v67) --[[ Line: 502 ]] --[[ Name: OnLocalPlayerCameraPropertyChanged ]]
        -- upvalues: l_Players_0 (copy), l_CameraUtils_0 (copy)
        if v67 == "CameraMode" then
            if l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
                if not v66.activeCameraController or v66.activeCameraController:GetModuleName() ~= "ClassicCamera" then
                    v66:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic));
                end;
                if v66.activeCameraController then
                    v66.activeCameraController:UpdateForDistancePropertyChange();
                    return;
                end;
            elseif l_Players_0.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
                local l_v66_CameraMovementModeFromSettings_0 = v66:GetCameraMovementModeFromSettings();
                v66:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v66_CameraMovementModeFromSettings_0));
                return;
            else
                warn("Unhandled value for property player.CameraMode: ", l_Players_0.LocalPlayer.CameraMode);
                return;
            end;
        elseif v67 == "DevComputerCameraMode" or v67 == "DevTouchCameraMode" then
            local l_v66_CameraMovementModeFromSettings_1 = v66:GetCameraMovementModeFromSettings();
            v66:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v66_CameraMovementModeFromSettings_1));
            return;
        elseif v67 == "DevCameraOcclusionMode" then
            v66:ActivateOcclusionModule(l_Players_0.LocalPlayer.DevCameraOcclusionMode);
            return;
        elseif v67 == "CameraMinZoomDistance" or v67 == "CameraMaxZoomDistance" then
            if v66.activeCameraController then
                v66.activeCameraController:UpdateForDistancePropertyChange();
                return;
            end;
        elseif v67 == "DevTouchMovementMode" then
            return;
        elseif v67 == "DevComputerMovementMode" then
            return;
        elseif v67 == "DevEnableMouseLock" then

        end;
    end;
    v0.OnUserGameSettingsPropertyChanged = function(v70, v71) --[[ Line: 546 ]] --[[ Name: OnUserGameSettingsPropertyChanged ]]
        -- upvalues: l_CameraUtils_0 (copy)
        if v71 == "ComputerCameraMovementMode" then
            local l_v70_CameraMovementModeFromSettings_0 = v70:GetCameraMovementModeFromSettings();
            v70:ActivateCameraController(l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_v70_CameraMovementModeFromSettings_0));
        end;
    end;
    v0.Update = function(v73, v74) --[[ Line: 559 ]] --[[ Name: Update ]]
        -- upvalues: l_CameraInput_0 (copy)
        if v73.activeCameraController then
            v73.activeCameraController:UpdateMouseBehavior();
            local v75, v76 = v73.activeCameraController:Update(v74);
            if v73.activeOcclusionModule then
                local v77, v78 = v73.activeOcclusionModule:Update(v74, v75, v76);
                v75 = v77;
                v76 = v78;
            end;
            local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
            l_CurrentCamera_3.CFrame = v75;
            l_CurrentCamera_3.Focus = v76;
            if v73.activeTransparencyController then
                v73.activeTransparencyController:Update(v74);
            end;
            if l_CameraInput_0.getInputEnabled() then
                l_CameraInput_0.resetInputForFrameEnd();
            end;
        end;
    end;
    v0.GetCameraControlChoice = function(_) --[[ Line: 587 ]] --[[ Name: GetCameraControlChoice ]]
        -- upvalues: l_PlayerScripts_0 (copy), l_UserInputService_0 (copy), l_Players_0 (copy), l_CameraUtils_0 (copy), l_UserGameSettings_0 (copy)
        assert(not l_PlayerScripts_0, "CameraModule:GetCameraControlChoice should not be called when FFlagUserRespectLegacyCameraOptions is enabled");
        if l_UserInputService_0:GetLastInputType() == Enum.UserInputType.Touch or l_UserInputService_0.TouchEnabled then
            if l_Players_0.LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.TouchCameraMovementMode);
            else
                return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevTouchCameraMode);
            end;
        elseif l_Players_0.LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
            local v81 = l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_UserGameSettings_0.ComputerCameraMovementMode);
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(v81);
        else
            return l_CameraUtils_0.ConvertCameraModeEnumToStandard(l_Players_0.LocalPlayer.DevComputerCameraMode);
        end;
    end;
    v0.OnCharacterAdded = function(v82, v83, v84) --[[ Line: 607 ]] --[[ Name: OnCharacterAdded ]]
        if v82.activeOcclusionModule then
            v82.activeOcclusionModule:CharacterAdded(v83, v84);
        end;
    end;
    v0.OnCharacterRemoving = function(v85, v86, v87) --[[ Line: 613 ]] --[[ Name: OnCharacterRemoving ]]
        if v85.activeOcclusionModule then
            v85.activeOcclusionModule:CharacterRemoving(v86, v87);
        end;
    end;
    v0.OnPlayerAdded = function(v88, v89) --[[ Line: 619 ]] --[[ Name: OnPlayerAdded ]]
        -- upvalues: v26 (copy)
        if v26 then
            if v88.connectionUtil then
                v88.connectionUtil:trackConnection(("%*CharacterAdded"):format(v89.UserId), v89.CharacterAdded:Connect(function(v90) --[[ Line: 623 ]]
                    -- upvalues: v88 (copy), v89 (copy)
                    v88:OnCharacterAdded(v90, v89);
                end));
                v88.connectionUtil:trackConnection(("%*CharacterRemoving"):format(v89.UserId), v89.CharacterRemoving:Connect(function(v91) --[[ Line: 626 ]]
                    -- upvalues: v88 (copy), v89 (copy)
                    v88:OnCharacterRemoving(v91, v89);
                end));
                return;
            end;
        else
            v89.CharacterAdded:Connect(function(v92) --[[ Line: 631 ]]
                -- upvalues: v88 (copy), v89 (copy)
                v88:OnCharacterAdded(v92, v89);
            end);
            v89.CharacterRemoving:Connect(function(v93) --[[ Line: 634 ]]
                -- upvalues: v88 (copy), v89 (copy)
                v88:OnCharacterRemoving(v93, v89);
            end);
        end;
    end;
    v0.OnPlayerRemoving = function(v94, v95) --[[ Line: 640 ]] --[[ Name: OnPlayerRemoving ]]
        if v94.connectionUtil then
            v94.connectionUtil:disconnect((("%*CharacterAdded"):format(v95.UserId)));
            v94.connectionUtil:disconnect((("%*CharacterRemoving"):format(v95.UserId)));
        end;
    end;
    v0.OnMouseLockToggled = function(v96) --[[ Line: 648 ]] --[[ Name: OnMouseLockToggled ]]
        if v96.activeMouseLockController then
            local l_IsMouseLocked_0 = v96.activeMouseLockController:GetIsMouseLocked();
            local l_MouseLockOffset_0 = v96.activeMouseLockController:GetMouseLockOffset();
            if v96.activeCameraController then
                v96.activeCameraController:SetIsMouseLocked(l_IsMouseLocked_0);
                v96.activeCameraController:SetMouseLockOffset(l_MouseLockOffset_0);
            end;
        end;
    end;
    return v0.new();
end;