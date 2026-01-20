--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v2 = v1.Table({
    JoinSource = v1.Enum(Enum.JoinSource), 
    ItemType = v1.Optional(v1.Enum(Enum.AvatarItemType)), 
    AssetId = v1.Optional(v1.Pattern("^rbxassetid://%d+$")), 
    OutfitId = v1.Optional(v1.Pattern("^rbxassetid://%d+$")), 
    AssetType = v1.Optional(v1.Enum(Enum.AssetType))
});
local v3 = v1.Table({
    SourceGameId = v1.Optional(v1.Integer), 
    SourcePlaceId = v1.Optional(v1.Integer), 
    ReferredByPlayerId = v1.Optional(v1.Integer), 
    Members = v1.Optional(v1.UniqueArray(v1.Integer)), 
    TeleportData = v1.Optional(v1.Storable), 
    LaunchData = v1.Optional(v1.Storable), 
    GameJoinContext = v1.Optional(v2)
});
local v4 = {};
for _, v6 in ipairs(Enum.DeveloperMemoryTag:GetEnumItems()) do
    local l_Name_0 = v6.Name;
    if l_Name_0 == "PhysicsParts" then
        l_Name_0 = "BaseParts";
    end;
    v4[l_Name_0] = v1.FiniteNonNegative;
end;
local v8 = v1.Table({
    ContactsCount = v1.IntegerNonNegative, 
    DataReceiveKbps = v1.FiniteNonNegative, 
    DataSendKbps = v1.FiniteNonNegative, 
    FrameTime = v1.FiniteNonNegative, 
    HeartbeatTime = v1.FiniteNonNegative, 
    InstanceCount = v1.IntegerNonNegative, 
    MovingPrimitivesCount = v1.IntegerNonNegative, 
    PhysicsReceiveKbps = v1.FiniteNonNegative, 
    PhysicsSendKbps = v1.FiniteNonNegative, 
    PhysicsStepTime = v1.FiniteNonNegative, 
    PrimitivesCount = v1.IntegerNonNegative, 
    RenderCPUFrameTime = v1.FiniteNonNegative, 
    RenderGPUFrameTime = v1.Number, 
    SceneDrawcallCount = v1.IntegerNonNegative, 
    SceneTriangleCount = v1.IntegerNonNegative, 
    ShadowsDrawcallCount = v1.IntegerNonNegative, 
    ShadowsTriangleCount = v1.IntegerNonNegative, 
    UI2DDrawcallCount = v1.IntegerNonNegative, 
    UI2DTriangleCount = v1.IntegerNonNegative, 
    UI3DDrawcallCount = v1.IntegerNonNegative, 
    UI3DTriangleCount = v1.IntegerNonNegative, 
    MemoryUsageMbForTag = v1.Table(v4), 
    TotalMemoryUsageMb = v1.FiniteNonNegative
});
local v9 = v1.Table({
    System = v1.Table({
        UWP = v1.Optional(v1.Boolean), 
        Windows = v1.Boolean, 
        Time = v1.Finite, 
        Clock = v1.Finite, 
        ElapsedTime = v1.Finite, 
        TimezoneOffset = v1.String, 
        Timezone = v1.String, 
        TimezoneDST = v1.Boolean, 
        HeapSize = v1.FiniteNonNegative
    }), 
    Game = v1.Table({
        LoadingDuration = v1.Optional(v1.FiniteNonNegative)
    }), 
    LocalPlayer = v1.Table({
        JoinData = v3, 
        NetworkPing = v1.Optional(v1.FinitePositive)
    }), 
    TeleportService = v1.Table({
        TeleportData = v1.Optional(v1.Storable)
    }), 
    Workspace = v1.Table({
        ServerTimeNow = v1.Finite, 
        RealPhysicsFPS = v1.FiniteNonNegative, 
        DistributedGameTime = v1.FiniteNonNegative, 
        NumAwakeParts = v1.FiniteNonNegative, 
        PhysicsThrottling = v1.IntegerRange(0, 100)
    }), 
    Stats = v1.Optional(v8), 
    UserInputService = v1.Table({
        DeviceForm = v1.Optional(v1.Enum(Enum.DeviceForm))
    }), 
    GuiService = v1.Table({
        IsTenFootInterface = v1.Boolean, 
        TouchControlsEnabled = v1.Boolean, 
        GuiInsetTopLeft = v1.Vector2Finite, 
        GuiInsetBotRight = v1.Vector2Finite, 
        IsModalDialog = v1.Boolean, 
        MenuIsOpen = v1.Boolean, 
        PreferredTransparency = v1.Range(0, 1), 
        ReducedMotionEnabled = v1.Boolean, 
        CoreGuiNavigationEnabled = v1.Boolean, 
        GuiNavigationEnabled = v1.Boolean, 
        AutoSelectGuiEnabled = v1.Boolean
    }), 
    CurrentCamera = v1.Table({
        ViewportSize = v1.Vector2Finite
    }), 
    LocalizationService = v1.Table({
        RobloxLocaleId = v1.StringRange(0, 1000), 
        SystemLocaleId = v1.StringRange(0, 5000)
    }), 
    VoiceChatService = v1.Table({
        VoiceEnabled = v1.Optional(v1.Boolean)
    }), 
    UserSettings = v1.Table({
        GameSettings = v1.Table({
            ControlMode = v1.Enum(Enum.ControlMode), 
            VignetteEnabled = v1.Boolean, 
            ComputerCameraMovementMode = v1.Enum(Enum.ComputerCameraMovementMode), 
            ComputerMovementMode = v1.Enum(Enum.ComputerMovementMode), 
            GamepadCameraSensitivity = v1.FiniteNonNegative, 
            MouseSensitivity = v1.Range(0, 10), 
            RotationType = v1.Enum(Enum.RotationType), 
            SavedQualityLevel = v1.Enum(Enum.SavedQualitySetting), 
            TouchCameraMovementMode = v1.Enum(Enum.TouchCameraMovementMode), 
            TouchMovementMode = v1.Enum(Enum.TouchMovementMode), 
            InFullScreen = v1.Boolean, 
            InStudioMode = v1.Boolean
        })
    })
});
local v10 = {
    AssertGameJoinContext = v2, 
    AssertJoinData = v3, 
    AssertData = v9, 
    AcceptRemote = script:WaitForChild("Accept"), 
    PingRemote = script:WaitForChild("Ping"), 
    MenuStateRemote = script:WaitForChild("MenuState"), 
    FocusStateRemote = script:WaitForChild("FocusState")
};
return table.freeze(v10);