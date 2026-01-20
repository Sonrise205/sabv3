local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_VRService_0 = game:GetService("VRService");
local l_CommonUtils_0 = script.Parent.Parent:WaitForChild("CommonUtils");
local v7 = require(l_CommonUtils_0:WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Value_0 = Enum.ContextActionPriority.Medium.Value;
local v10 = Vector2.new(1, 0.77) * 0.06981317007977318;
local v11 = Vector2.new(1, 0.77) * 0.008726646259971648;
local v12 = Vector2.new(1, 0.77) * 0.12217304763960307;
local v13 = Vector2.new(1, 0.66) * 0.017453292519943295;
if v7 then
    v10 = v10 * 60;
end;
local v14 = nil;
local l_status_0, l_result_0 = pcall(function() --[[ Line: 41 ]]
    return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen");
end);
v14 = l_status_0 and l_result_0;
l_status_0 = nil;
local v17;
l_result_0, v17 = pcall(function() --[[ Line: 49 ]]
    return UserSettings():IsUserFeatureEnabled("UserClearPanOnCameraDisable");
end);
l_status_0 = l_result_0 and v17;
l_result_0 = nil;
v17 = nil;
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
l_result_0 = l_BindableEvent_0.Event;
v17 = l_BindableEvent_1.Event;
local l_l_BindableEvent_0_0 = l_BindableEvent_0 --[[ copy: 19 -> 51 ]];
l_UserInputService_0.InputBegan:Connect(function(v21, v22) --[[ Line: 63 ]]
    -- upvalues: l_l_BindableEvent_0_0 (copy)
    if not v22 and v21.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_0_0:Fire();
    end;
end);
local l_l_BindableEvent_1_0 = l_BindableEvent_1 --[[ copy: 20 -> 52 ]];
l_UserInputService_0.InputEnded:Connect(function(v24, _) --[[ Line: 69 ]]
    -- upvalues: l_l_BindableEvent_1_0 (copy)
    if v24.UserInputType == Enum.UserInputType.MouseButton2 then
        l_l_BindableEvent_1_0:Fire();
    end;
end);
l_BindableEvent_0 = nil;
l_BindableEvent_0 = function(v26) --[[ Line: 80 ]] --[[ Name: thumbstickCurve ]]
    local v27 = (math.exp((math.abs(v26) - 0.1) / 0.9 * 2) - 1) / 6.38905609893065;
    return math.sign(v26) * math.clamp(v27, 0, 1);
end;
l_BindableEvent_1 = function(v28) --[[ Line: 94 ]] --[[ Name: adjustTouchPitchSensitivity ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return v28;
    else
        local v30 = l_CurrentCamera_0.CFrame:ToEulerAnglesYXZ();
        if v28.Y * v30 >= 0 then
            return v28;
        else
            local v31 = (1 - (math.abs(v30) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25;
            return Vector2.new(1, v31) * v28;
        end;
    end;
end;
local function v40(v32) --[[ Line: 120 ]] --[[ Name: isInDynamicThumbstickArea ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_PlayerGui_0 = l_LocalPlayer_0:FindFirstChildOfClass("PlayerGui");
    local v34 = l_PlayerGui_0 and l_PlayerGui_0:FindFirstChild("TouchGui");
    local v35 = v34 and v34:FindFirstChild("TouchControlFrame");
    local v36 = v35 and v35:FindFirstChild("DynamicThumbstickFrame");
    if not v36 then
        return false;
    elseif not v34.Enabled then
        return false;
    else
        local l_AbsolutePosition_0 = v36.AbsolutePosition;
        local v38 = l_AbsolutePosition_0 + v36.AbsoluteSize;
        local v39 = false;
        if v32.X >= l_AbsolutePosition_0.X then
            v39 = false;
            if v32.Y >= l_AbsolutePosition_0.Y then
                v39 = false;
                if v32.X <= v38.X then
                    v39 = v32.Y <= v38.Y;
                end;
            end;
        end;
        return v39;
    end;
end;
local v41 = 0.016666666666666666;
l_RunService_0.Stepped:Connect(function(_, v43) --[[ Line: 145 ]]
    -- upvalues: v41 (ref)
    v41 = v43;
end);
local v44 = {};
local v45 = {};
local v46 = 0;
do
    local l_v45_0, l_v46_0 = v45, v46;
    local function _() --[[ Line: 155 ]] --[[ Name: incPanInputCount ]]
        -- upvalues: l_v46_0 (ref)
        l_v46_0 = math.max(0, l_v46_0 + 1);
    end;
    local function _() --[[ Line: 159 ]] --[[ Name: decPanInputCount ]]
        -- upvalues: l_v46_0 (ref)
        l_v46_0 = math.max(0, l_v46_0 - 1);
    end;
    local function _() --[[ Line: 163 ]] --[[ Name: resetPanInputCount ]]
        -- upvalues: l_v46_0 (ref)
        l_v46_0 = 0;
    end;
    local v52 = {
        Thumbstick2 = Vector2.new()
    };
    local v53 = {
        Left = 0, 
        Right = 0, 
        I = 0, 
        O = 0
    };
    local v54 = {
        Movement = Vector2.new(), 
        Wheel = 0, 
        Pan = Vector2.new(), 
        Pinch = 0
    };
    local v55 = {
        Move = Vector2.new(), 
        Pinch = 0
    };
    local l_BindableEvent_2 = Instance.new("BindableEvent");
    v44.gamepadZoomPress = l_BindableEvent_2.Event;
    local v57 = l_VRService_0.VREnabled and Instance.new("BindableEvent") or nil;
    if l_VRService_0.VREnabled then
        v44.gamepadReset = v57.Event;
    end;
    local l_v52_0 = v52 --[[ copy: 29 -> 53 ]];
    v44.getRotationActivated = function() --[[ Line: 196 ]] --[[ Name: getRotationActivated ]]
        -- upvalues: l_v46_0 (ref), l_v52_0 (copy)
        local v59 = true;
        if l_v46_0 <= 0 then
            v59 = l_v52_0.Thumbstick2.Magnitude > 0;
        end;
        return v59;
    end;
    v44.getRotation = function(v60, v61) --[[ Line: 200 ]] --[[ Name: getRotation ]]
        -- upvalues: l_UserGameSettings_0 (copy), v7 (copy), v53 (copy), v41 (ref), l_v52_0 (copy), v54 (copy), l_BindableEvent_1 (copy), v55 (copy), v10 (ref), v11 (copy), v12 (copy), v13 (copy)
        local v62 = Vector2.new(1, l_UserGameSettings_0:GetCameraYInvertValue());
        local v63 = nil;
        v63 = if v7 then Vector2.new(v53.Right - v53.Left, 0) * v60 else Vector2.new(v53.Right - v53.Left, 0) * v41;
        local v64 = l_v52_0.Thumbstick2 * l_UserGameSettings_0.GamepadCameraSensitivity;
        if v7 then
            v64 = v64 * v60;
        end;
        local l_Movement_0 = v54.Movement;
        local l_Pan_0 = v54.Pan;
        local v67 = l_BindableEvent_1(v55.Move);
        if v61 then
            v63 = Vector2.new();
        end;
        return (v63 * 2.0943951023931953 + v64 * v10 + l_Movement_0 * v11 + l_Pan_0 * v12 + v67 * v13) * v62;
    end;
    v44.getZoomDelta = function() --[[ Line: 234 ]] --[[ Name: getZoomDelta ]]
        -- upvalues: v53 (copy), v54 (copy), v55 (copy)
        local v68 = v53.O - v53.I;
        local v69 = -v54.Wheel + v54.Pinch;
        local v70 = -v55.Pinch;
        return v68 * 0.1 + v69 * 1 + v70 * 0.04;
    end;
    local function v75(_, _, v73) --[[ Line: 242 ]] --[[ Name: thumbstick ]]
        -- upvalues: l_v52_0 (copy), l_BindableEvent_0 (ref)
        local l_Position_0 = v73.Position;
        l_v52_0[v73.KeyCode.Name] = Vector2.new(l_BindableEvent_0(l_Position_0.X), -l_BindableEvent_0(l_Position_0.Y));
        return Enum.ContextActionResult.Pass;
    end;
    local function _(v76) --[[ Line: 248 ]] --[[ Name: mouseMovement ]]
        -- upvalues: v54 (copy)
        local l_Delta_0 = v76.Delta;
        v54.Movement = Vector2.new(l_Delta_0.X, l_Delta_0.Y);
    end;
    local _ = function(_, _, v81) --[[ Line: 253 ]] --[[ Name: mouseWheel ]]
        -- upvalues: v54 (copy)
        v54.Wheel = v81.Position.Z;
        return Enum.ContextActionResult.Pass;
    end;
    local function v86(_, v84, v85) --[[ Line: 258 ]] --[[ Name: keypress ]]
        -- upvalues: v53 (copy)
        v53[v85.KeyCode.Name] = v84 == Enum.UserInputState.Begin and 1 or 0;
    end;
    local function v90(_, v88, _) --[[ Line: 262 ]] --[[ Name: gamepadZoomPress ]]
        -- upvalues: l_BindableEvent_2 (copy)
        if v88 == Enum.UserInputState.Begin then
            l_BindableEvent_2:Fire();
        end;
    end;
    local function v94(_, v92, _) --[[ Line: 268 ]] --[[ Name: gamepadReset ]]
        -- upvalues: v57 (copy)
        if v92 == Enum.UserInputState.Begin then
            v57:Fire();
        end;
    end;
    local function v99() --[[ Line: 274 ]] --[[ Name: resetInputDevices ]]
        -- upvalues: l_v52_0 (copy), v53 (copy), v54 (copy), v55 (copy), l_status_0 (ref), l_v46_0 (ref)
        for _, v96 in pairs({
            l_v52_0, 
            v53, 
            v54, 
            v55
        }) do
            for v97, v98 in pairs(v96) do
                if type(v98) == "boolean" then
                    v96[v97] = false;
                else
                    v96[v97] = v96[v97] * 0;
                end;
            end;
        end;
        if l_status_0 then
            l_v46_0 = 0;
        end;
    end;
    local v100 = nil;
    local v101 = nil;
    local v102 = nil;
    local v103 = nil;
    local v104 = {};
    local v105 = nil;
    local v106 = nil;
    do
        local l_v104_0, l_v105_0, l_v106_0 = v104, v105, v106;
        v100 = function(v110, v111) --[[ Line: 302 ]] --[[ Name: touchBegan ]]
            -- upvalues: l_v105_0 (ref), v40 (copy), l_v46_0 (ref), l_v104_0 (ref)
            assert(v110.UserInputType == Enum.UserInputType.Touch);
            assert(v110.UserInputState == Enum.UserInputState.Begin);
            if l_v105_0 == nil and v40(v110.Position) and not v111 then
                l_v105_0 = v110;
                return;
            else
                if not v111 then
                    l_v46_0 = math.max(0, l_v46_0 + 1);
                end;
                l_v104_0[v110] = v111;
                return;
            end;
        end;
        v102 = function(v112, _) --[[ Line: 322 ]] --[[ Name: touchEnded ]]
            -- upvalues: l_v105_0 (ref), l_v104_0 (ref), l_v106_0 (ref), l_v46_0 (ref)
            assert(v112.UserInputType == Enum.UserInputType.Touch);
            assert(v112.UserInputState == Enum.UserInputState.End);
            if v112 == l_v105_0 then
                l_v105_0 = nil;
            end;
            if l_v104_0[v112] == false then
                l_v106_0 = nil;
                l_v46_0 = math.max(0, l_v46_0 - 1);
            end;
            l_v104_0[v112] = nil;
        end;
        v101 = function(v114, v115) --[[ Line: 341 ]] --[[ Name: touchChanged ]]
            -- upvalues: l_v105_0 (ref), l_v104_0 (ref), v55 (copy), l_v106_0 (ref)
            assert(v114.UserInputType == Enum.UserInputType.Touch);
            assert(v114.UserInputState == Enum.UserInputState.Change);
            if v114 == l_v105_0 then
                return;
            else
                if l_v104_0[v114] == nil then
                    l_v104_0[v114] = v115;
                end;
                local v116 = {};
                for v117, v118 in pairs(l_v104_0) do
                    if not v118 then
                        table.insert(v116, v117);
                    end;
                end;
                if #v116 == 1 and l_v104_0[v114] == false then
                    local l_Delta_1 = v114.Delta;
                    local l_v55_0 = v55;
                    l_v55_0.Move = l_v55_0.Move + Vector2.new(l_Delta_1.X, l_Delta_1.Y);
                end;
                if #v116 == 2 then
                    local l_Magnitude_0 = (v116[1].Position - v116[2].Position).Magnitude;
                    if l_v106_0 then
                        local l_v55_1 = v55;
                        l_v55_1.Pinch = l_v55_1.Pinch + (l_Magnitude_0 - l_v106_0);
                    end;
                    l_v106_0 = l_Magnitude_0;
                    return;
                else
                    l_v106_0 = nil;
                    return;
                end;
            end;
        end;
        v103 = function() --[[ Line: 385 ]] --[[ Name: resetTouchState ]]
            -- upvalues: l_v104_0 (ref), l_v105_0 (ref), l_v106_0 (ref), v14 (ref), l_v46_0 (ref)
            l_v104_0 = {};
            l_v105_0 = nil;
            l_v106_0 = nil;
            if v14 then
                l_v46_0 = 0;
            end;
        end;
    end;
    v104 = function(v123, v124, v125, v126) --[[ Line: 395 ]] --[[ Name: pointerAction ]]
        -- upvalues: v54 (copy)
        if not v126 then
            v54.Wheel = v123;
            v54.Pan = v124;
            v54.Pinch = -v125;
        end;
    end;
    do
        local l_v100_0, l_v101_0, l_v102_0, l_v103_0 = v100, v101, v102, v103;
        v105 = function(v131, v132) --[[ Line: 403 ]] --[[ Name: inputBegan ]]
            -- upvalues: l_v100_0 (ref), l_v46_0 (ref)
            if v131.UserInputType == Enum.UserInputType.Touch then
                l_v100_0(v131, v132);
                return;
            else
                if v131.UserInputType == Enum.UserInputType.MouseButton2 and not v132 then
                    l_v46_0 = math.max(0, l_v46_0 + 1);
                end;
                return;
            end;
        end;
        v106 = function(v133, v134) --[[ Line: 412 ]] --[[ Name: inputChanged ]]
            -- upvalues: l_v101_0 (ref), v54 (copy)
            if v133.UserInputType == Enum.UserInputType.Touch then
                l_v101_0(v133, v134);
                return;
            else
                if v133.UserInputType == Enum.UserInputType.MouseMovement then
                    local l_Delta_2 = v133.Delta;
                    v54.Movement = Vector2.new(l_Delta_2.X, l_Delta_2.Y);
                end;
                return;
            end;
        end;
        local function v138(v136, v137) --[[ Line: 421 ]] --[[ Name: inputEnded ]]
            -- upvalues: l_v102_0 (ref), l_v46_0 (ref)
            if v136.UserInputType == Enum.UserInputType.Touch then
                l_v102_0(v136, v137);
                return;
            else
                if v136.UserInputType == Enum.UserInputType.MouseButton2 then
                    l_v46_0 = math.max(0, l_v46_0 - 1);
                end;
                return;
            end;
        end;
        local v139 = false;
        v44.setInputEnabled = function(v140) --[[ Line: 432 ]] --[[ Name: setInputEnabled ]]
            -- upvalues: v139 (ref), v99 (copy), l_v103_0 (ref), l_ContextActionService_0 (copy), v75 (copy), l_Value_0 (copy), v86 (copy), l_VRService_0 (copy), v94 (copy), v90 (copy), l_v45_0 (ref), l_UserInputService_0 (copy), v105 (copy), v106 (copy), v138 (copy), v104 (copy), v14 (ref)
            if v139 == v140 then
                return;
            else
                v139 = v140;
                v99();
                l_v103_0();
                if v139 then
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraThumbstick", v75, false, l_Value_0, Enum.KeyCode.Thumbstick2);
                    l_ContextActionService_0:BindActionAtPriority("RbxCameraKeypress", v86, false, l_Value_0, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:BindAction("RbxCameraGamepadReset", v94, false, Enum.KeyCode.ButtonL3);
                    end;
                    l_ContextActionService_0:BindAction("RbxCameraGamepadZoom", v90, false, Enum.KeyCode.ButtonR3);
                    table.insert(l_v45_0, l_UserInputService_0.InputBegan:Connect(v105));
                    table.insert(l_v45_0, l_UserInputService_0.InputChanged:Connect(v106));
                    table.insert(l_v45_0, l_UserInputService_0.InputEnded:Connect(v138));
                    table.insert(l_v45_0, l_UserInputService_0.PointerAction:Connect(v104));
                    if v14 then
                        local l_GuiService_0 = game:GetService("GuiService");
                        table.insert(l_v45_0, l_GuiService_0.MenuOpened:connect(l_v103_0));
                        return;
                    end;
                else
                    l_ContextActionService_0:UnbindAction("RbxCameraThumbstick");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseMove");
                    l_ContextActionService_0:UnbindAction("RbxCameraMouseWheel");
                    l_ContextActionService_0:UnbindAction("RbxCameraKeypress");
                    l_ContextActionService_0:UnbindAction("RbxCameraGamepadZoom");
                    if l_VRService_0.VREnabled then
                        l_ContextActionService_0:UnbindAction("RbxCameraGamepadReset");
                    end;
                    for _, v143 in pairs(l_v45_0) do
                        v143:Disconnect();
                    end;
                    l_v45_0 = {};
                end;
                return;
            end;
        end;
        v44.getInputEnabled = function() --[[ Line: 504 ]] --[[ Name: getInputEnabled ]]
            -- upvalues: v139 (ref)
            return v139;
        end;
        v44.resetInputForFrameEnd = function() --[[ Line: 508 ]] --[[ Name: resetInputForFrameEnd ]]
            -- upvalues: v54 (copy), v55 (copy)
            v54.Movement = Vector2.new();
            v55.Move = Vector2.new();
            v55.Pinch = 0;
            v54.Wheel = 0;
            v54.Pan = Vector2.new();
            v54.Pinch = 0;
        end;
        l_UserInputService_0.WindowFocused:Connect(v99);
        l_UserInputService_0.WindowFocusReleased:Connect(v99);
    end;
end;
v45 = false;
v46 = false;
local v144 = 0;
do
    local l_v45_1, l_v46_1, l_v144_0 = v45, v46, v144;
    v44.getHoldPan = function() --[[ Line: 529 ]] --[[ Name: getHoldPan ]]
        -- upvalues: l_v45_1 (ref)
        return l_v45_1;
    end;
    v44.getTogglePan = function() --[[ Line: 533 ]] --[[ Name: getTogglePan ]]
        -- upvalues: l_v46_1 (ref)
        return l_v46_1;
    end;
    v44.getPanning = function() --[[ Line: 537 ]] --[[ Name: getPanning ]]
        -- upvalues: l_v46_1 (ref), l_v45_1 (ref)
        return l_v46_1 or l_v45_1;
    end;
    v44.setTogglePan = function(v148) --[[ Line: 541 ]] --[[ Name: setTogglePan ]]
        -- upvalues: l_v46_1 (ref)
        l_v46_1 = v148;
    end;
    local v149 = false;
    local v150 = nil;
    local v151 = nil;
    v44.enableCameraToggleInput = function() --[[ Line: 549 ]] --[[ Name: enableCameraToggleInput ]]
        -- upvalues: v149 (ref), l_v45_1 (ref), l_v46_1 (ref), v150 (ref), v151 (ref), l_result_0 (ref), l_v144_0 (ref), v17 (ref), l_UserInputService_0 (copy)
        if v149 then
            return;
        else
            v149 = true;
            l_v45_1 = false;
            l_v46_1 = false;
            if v150 then
                v150:Disconnect();
            end;
            if v151 then
                v151:Disconnect();
            end;
            v150 = l_result_0:Connect(function() --[[ Line: 566 ]]
                -- upvalues: l_v45_1 (ref), l_v144_0 (ref)
                l_v45_1 = true;
                l_v144_0 = tick();
            end);
            v151 = v17:Connect(function() --[[ Line: 571 ]]
                -- upvalues: l_v45_1 (ref), l_v144_0 (ref), l_v46_1 (ref), l_UserInputService_0 (ref)
                l_v45_1 = false;
                if tick() - l_v144_0 < 0.3 and (l_v46_1 or l_UserInputService_0:GetMouseDelta().Magnitude < 2) then
                    l_v46_1 = not l_v46_1;
                end;
            end);
            return;
        end;
    end;
    v44.disableCameraToggleInput = function() --[[ Line: 579 ]] --[[ Name: disableCameraToggleInput ]]
        -- upvalues: v149 (ref), v150 (ref), v151 (ref)
        if not v149 then
            return;
        else
            v149 = false;
            if v150 then
                v150:Disconnect();
                v150 = nil;
            end;
            if v151 then
                v151:Disconnect();
                v151 = nil;
            end;
            return;
        end;
    end;
end;
return v44;