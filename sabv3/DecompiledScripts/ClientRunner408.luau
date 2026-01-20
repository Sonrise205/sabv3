--!native
local v0 = os.clock();
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_Stats_0 = game:GetService("Stats");
local l_TeleportService_0 = game:GetService("TeleportService");
local v10 = require(l_ReplicatedStorage_0.UserGenerated.Roblox.VoiceChatServiceHelper);
local v11 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.ThreadJoin);
local v12 = require(l_ReplicatedStorage_0.UserGenerated.Analytics.ClientKit);
local v13 = require(l_ReplicatedStorage_0.UserGenerated.Strings.UTF8Sub);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v15 = nil;
SafeGet = function(v16, v17, v18) --[[ Line: 43 ]] --[[ Name: SafeGet ]]
    local l_status_0, l_result_0 = pcall(function(_, _) --[[ Line: 48 ]]
        -- upvalues: v16 (copy), v17 (copy)
        return v16[v17];
    end, v16, v17);
    if l_status_0 then
        return l_result_0;
    else
        return v18;
    end;
end;
IsUWP = function() --[[ Line: 55 ]] --[[ Name: IsUWP ]]
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 56 ]]
        return tostring({
            1
        }):match("^table: 0x(00000000%x+)$") ~= nil;
    end);
    return l_status_1 and l_result_1;
end;
IsWindows = function() --[[ Line: 64 ]] --[[ Name: IsWindows ]]
    -- upvalues: l_GuiService_0 (copy)
    return SafeGet(l_GuiService_0, "IsWindows", false);
end;
GetDeviceForm = function() --[[ Line: 68 ]] --[[ Name: GetDeviceForm ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy)
    if l_UserInputService_0.VREnabled then
        return Enum.DeviceForm.VR;
    elseif l_GuiService_0:IsTenFootInterface() then
        return Enum.DeviceForm.Console;
    elseif IsWindows() then
        return Enum.DeviceForm.Desktop;
    elseif l_UserInputService_0.GyroscopeEnabled or l_UserInputService_0.AccelerometerEnabled then
        return Enum.DeviceForm.Phone;
    elseif l_UserInputService_0.MouseEnabled then
        return Enum.DeviceForm.Desktop;
    elseif l_UserInputService_0.TouchEnabled then
        return Enum.DeviceForm.Phone;
    elseif l_UserInputService_0.GamepadEnabled then
        return Enum.DeviceForm.Console;
    else
        return nil;
    end;
end;
IsLoaded = function() --[[ Line: 105 ]] --[[ Name: IsLoaded ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    if not game:IsLoaded() then
        return false;
    else
        local l_Character_0 = l_LocalPlayer_0.Character;
        if not l_Character_0 then
            return false;
        elseif not l_Character_0.PrimaryPart or not l_Character_0:FindFirstChild("Humanoid") then
            return false;
        else
            return true;
        end;
    end;
end;
task.spawn(function() --[[ Line: 119 ]]
    -- upvalues: v15 (ref)
    while not IsLoaded() do
        task.wait();
    end;
    v15 = os.clock();
end);
GetStartTime = function() --[[ Line: 126 ]] --[[ Name: GetStartTime ]]
    -- upvalues: v0 (copy)
    local l___StartTime_0 = _G.__StartTime;
    if type(l___StartTime_0) == "number" then
        return l___StartTime_0;
    else
        return v0;
    end;
end;
GetLoadDurationAsync = function(v27) --[[ Line: 134 ]] --[[ Name: GetLoadDurationAsync ]]
    -- upvalues: v15 (ref)
    while true do
        local l_v15_0 = v15;
        if l_v15_0 then
            return (math.max(0, l_v15_0 - GetStartTime()));
        elseif not v27 then
            task.wait();
        else
            return nil;
        end;
    end;
end;
Build = function() --[[ Line: 148 ]] --[[ Name: Build ]]
    -- upvalues: l_GuiService_0 (copy), l_LocalPlayer_0 (copy), l_HttpService_0 (copy), l_Stats_0 (copy), l_TeleportService_0 (copy), l_LocalizationService_0 (copy), v13 (copy), v10 (copy), v11 (copy)
    local v29 = GetLoadDurationAsync(false);
    local v30 = os.time();
    local v31 = os.clock();
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    local v33 = elapsedTime();
    local l_GameSettings_0 = UserSettings().GameSettings;
    local l_l_GuiService_0_GuiInset_0, v36 = l_GuiService_0:GetGuiInset();
    local v37 = nil;
    pcall(function() --[[ Line: 168 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v37 (ref)
        local l_l_LocalPlayer_0_NetworkPing_0 = l_LocalPlayer_0:GetNetworkPing();
        if l_l_LocalPlayer_0_NetworkPing_0 > 0 then
            v37 = l_l_LocalPlayer_0_NetworkPing_0 * 1000;
        end;
    end);
    local l_l_LocalPlayer_0_JoinData_0 = l_LocalPlayer_0:GetJoinData();
    if l_l_LocalPlayer_0_JoinData_0.LaunchData ~= nil then
        pcall(function() --[[ Line: 176 ]]
            -- upvalues: l_l_LocalPlayer_0_JoinData_0 (copy), l_HttpService_0 (ref)
            l_l_LocalPlayer_0_JoinData_0.LaunchData = l_HttpService_0:JSONDecode(l_l_LocalPlayer_0_JoinData_0.LaunchData);
        end);
    end;
    local v40 = nil;
    if l_Stats_0.MemoryTrackingEnabled then
        v40 = {
            ContactsCount = l_Stats_0.ContactsCount, 
            DataReceiveKbps = l_Stats_0.DataReceiveKbps, 
            DataSendKbps = l_Stats_0.DataSendKbps, 
            FrameTime = l_Stats_0.FrameTime, 
            HeartbeatTime = l_Stats_0.HeartbeatTime, 
            InstanceCount = l_Stats_0.InstanceCount, 
            MovingPrimitivesCount = l_Stats_0.MovingPrimitivesCount, 
            PhysicsReceiveKbps = l_Stats_0.PhysicsReceiveKbps, 
            PhysicsSendKbps = l_Stats_0.PhysicsSendKbps, 
            PhysicsStepTime = l_Stats_0.PhysicsStepTime, 
            PrimitivesCount = l_Stats_0.PrimitivesCount, 
            RenderCPUFrameTime = l_Stats_0.RenderCPUFrameTime, 
            RenderGPUFrameTime = l_Stats_0.RenderGPUFrameTime, 
            SceneDrawcallCount = l_Stats_0.SceneDrawcallCount, 
            SceneTriangleCount = l_Stats_0.SceneTriangleCount, 
            ShadowsDrawcallCount = l_Stats_0.ShadowsDrawcallCount, 
            ShadowsTriangleCount = l_Stats_0.ShadowsTriangleCount, 
            UI2DDrawcallCount = l_Stats_0.UI2DDrawcallCount, 
            UI2DTriangleCount = l_Stats_0.UI2DTriangleCount, 
            UI3DDrawcallCount = l_Stats_0.UI3DDrawcallCount, 
            UI3DTriangleCount = l_Stats_0.UI3DTriangleCount, 
            MemoryUsageMbForTag = (function() --[[ Line: 207 ]]
                -- upvalues: l_Stats_0 (ref)
                local v41 = {};
                for _, v43 in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
                    local l_Name_0 = v43.Name;
                    if l_Name_0 == "PhysicsParts" then
                        l_Name_0 = "BaseParts";
                    end;
                    v41[l_Name_0] = l_Stats_0:GetMemoryUsageMbForTag(v43);
                end;
                return v41;
            end)(), 
            TotalMemoryUsageMb = l_Stats_0:GetTotalMemoryUsageMb()
        };
    end;
    local v45 = {
        System = {
            UWP = IsUWP(), 
            Windows = IsWindows(), 
            Time = v30, 
            Clock = v31, 
            ElapsedTime = v33, 
            TimezoneOffset = os.date("%z"), 
            Timezone = l_HttpService_0:UrlEncode((os.date("%Z"))), 
            TimezoneDST = os.date("*t").isdst == true, 
            HeapSize = gcinfo()
        }, 
        Game = {
            LoadingDuration = v29
        }, 
        LocalPlayer = {
            JoinData = l_l_LocalPlayer_0_JoinData_0, 
            NetworkPing = v37
        }, 
        TeleportService = {
            TeleportData = l_TeleportService_0:GetLocalPlayerTeleportData()
        }, 
        Workspace = {
            ServerTimeNow = l_workspace_ServerTimeNow_0, 
            RealPhysicsFPS = workspace:GetRealPhysicsFPS(), 
            DistributedGameTime = workspace.DistributedGameTime, 
            NumAwakeParts = workspace:GetNumAwakeParts(), 
            PhysicsThrottling = workspace:GetPhysicsThrottling()
        }, 
        Stats = v40, 
        UserInputService = {
            DeviceForm = GetDeviceForm()
        }, 
        GuiService = {
            IsTenFootInterface = l_GuiService_0:IsTenFootInterface(), 
            TouchControlsEnabled = l_GuiService_0.TouchControlsEnabled, 
            GuiInsetTopLeft = l_l_GuiService_0_GuiInset_0, 
            GuiInsetBotRight = v36, 
            IsModalDialog = SafeGet(l_GuiService_0, "IsModalDialog", false), 
            MenuIsOpen = l_GuiService_0.MenuIsOpen, 
            PreferredTransparency = math.clamp(l_GuiService_0.PreferredTransparency, 0, 1), 
            ReducedMotionEnabled = l_GuiService_0.ReducedMotionEnabled, 
            CoreGuiNavigationEnabled = l_GuiService_0.CoreGuiNavigationEnabled, 
            GuiNavigationEnabled = l_GuiService_0.GuiNavigationEnabled, 
            AutoSelectGuiEnabled = l_GuiService_0.AutoSelectGuiEnabled
        }, 
        CurrentCamera = {
            ViewportSize = workspace.CurrentCamera.ViewportSize
        }, 
        LocalizationService = {
            RobloxLocaleId = l_LocalizationService_0.RobloxLocaleId:lower(), 
            SystemLocaleId = v13(l_LocalizationService_0.SystemLocaleId:lower(), 1, 1000)
        }, 
        VoiceChatService = {}, 
        UserSettings = {
            GameSettings = {
                ControlMode = l_GameSettings_0.ControlMode, 
                VignetteEnabled = l_GameSettings_0.VignetteEnabled, 
                ComputerCameraMovementMode = l_GameSettings_0.ComputerCameraMovementMode, 
                ComputerMovementMode = l_GameSettings_0.ComputerMovementMode, 
                GamepadCameraSensitivity = l_GameSettings_0.GamepadCameraSensitivity, 
                MouseSensitivity = l_GameSettings_0.MouseSensitivity, 
                RotationType = l_GameSettings_0.RotationType, 
                SavedQualityLevel = l_GameSettings_0.SavedQualityLevel, 
                TouchCameraMovementMode = l_GameSettings_0.TouchCameraMovementMode, 
                TouchMovementMode = l_GameSettings_0.TouchMovementMode, 
                InFullScreen = l_GameSettings_0:InFullScreen(), 
                InStudioMode = l_GameSettings_0:InStudioMode()
            }
        }
    };
    local v46 = {};
    table.insert(v46, task.spawn(function() --[[ Line: 301 ]]
        -- upvalues: v45 (copy), v10 (ref), l_LocalPlayer_0 (ref)
        v45.VoiceChatService.VoiceEnabled = v10.IsVoiceEnabledForUserIdAsync(l_LocalPlayer_0.UserId, false);
    end));
    for _, v48 in ipairs(v46) do
        v11(v48);
    end;
    return v45;
end;
local v49 = false;
Send = function() --[[ Line: 319 ]] --[[ Name: Send ]]
    -- upvalues: v49 (ref), v12 (copy)
    if v49 then
        return true;
    else
        v49 = true;
        local v51 = pcall(function() --[[ Line: 324 ]]
            -- upvalues: v12 (ref)
            local v50 = Build();
            v12.AcceptRemote:FireServer(v50);
        end);
        v49 = false;
        return v51;
    end;
end;
local v52 = -1e999;
l_GuiService_0.MenuOpened:Connect(function() --[[ Line: 333 ]]
    -- upvalues: v52 (ref)
    local v53 = os.clock();
    if v53 - v52 > 15 then
        v52 = v53;
        Send();
    end;
end);
l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 341 ]]
    -- upvalues: v52 (ref)
    local v54 = os.clock();
    if v54 - v52 > 15 then
        v52 = v54;
        Send();
    end;
end);
task.spawn(function() --[[ Line: 349 ]]
    while true do
        Send();
        task.wait(150 + 300 * math.random());
    end;
end);