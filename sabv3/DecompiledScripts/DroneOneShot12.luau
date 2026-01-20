local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("ContentProvider");
local v3 = {};
v3.__index = v3;
local v4 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out);
local function _(v5, v6, v7) --[[ Line: 27 ]] --[[ Name: SetTransparency ]]
    v5.Transparency = v7;
    v6.Transparency = v7;
end;
local function v12(v9, v10, v11) --[[ Line: 32 ]] --[[ Name: TweenTransparency ]]
    -- upvalues: l_TweenService_0 (copy), v4 (copy)
    l_TweenService_0:Create(v9, v4, {
        Transparency = v11
    }):Play();
    l_TweenService_0:Create(v10, v4, {
        Transparency = v11
    }):Play();
end;
local function _(v13) --[[ Line: 37 ]] --[[ Name: ColorFromHSV ]]
    return Color3.fromHSV(v13 % 1, 1, 1);
end;
local function _(v15) --[[ Line: 41 ]] --[[ Name: ParseStartStop ]]
    if not v15 then
        return "";
    else
        return (tostring(v15));
    end;
end;
v3.new = function(v17) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    local v18 = setmetatable({}, v3);
    v18.Model = v17;
    v18.RootPart = v17.RootPart;
    v18.Drones = v17.Drones;
    v18.Drones001 = v17:FindFirstChild("Drones.001");
    v18.AnimationController = v17.AnimationController;
    v18.Animator = v18.AnimationController.Animator;
    v18.Animation = script.Animation;
    v18.AnimationTrack = nil;
    v18.Connections = {};
    v18.FlashThreadToken = 0;
    v18.YellowThreadToken = 0;
    v18.OrangeThreadToken = 0;
    v18.RedThreadToken = 0;
    v18.ExplosionThreadToken = 0;
    return v18;
end;
v3.DisconnectAll = function(v19) --[[ Line: 73 ]] --[[ Name: DisconnectAll ]]
    for _, v21 in ipairs(v19.Connections) do
        if v21.Connected then
            v21:Disconnect();
        end;
    end;
    table.clear(v19.Connections);
end;
v3.StopAllColorDrivers = function(v22) --[[ Line: 82 ]] --[[ Name: StopAllColorDrivers ]]
    v22.FlashThreadToken = v22.FlashThreadToken + 1;
    v22.YellowThreadToken = v22.YellowThreadToken + 1;
    v22.OrangeThreadToken = v22.OrangeThreadToken + 1;
    v22.RedThreadToken = v22.RedThreadToken + 1;
    v22.ExplosionThreadToken = v22.ExplosionThreadToken + 1;
end;
v3.StartRainbowFlash = function(v23) --[[ Line: 90 ]] --[[ Name: StartRainbowFlash ]]
    v23.FlashThreadToken = v23.FlashThreadToken + 1;
    local l_FlashThreadToken_0 = v23.FlashThreadToken;
    local l_Drones001_0 = v23.Drones001;
    task.spawn(function() --[[ Line: 95 ]]
        -- upvalues: l_FlashThreadToken_0 (copy), v23 (copy), l_Drones001_0 (copy)
        local v26 = 0;
        while l_FlashThreadToken_0 == v23.FlashThreadToken do
            v26 = v26 + 0.08;
            l_Drones001_0.Color = Color3.fromHSV(v26 % 1, 1, 1);
            task.wait(0.1);
        end;
    end);
end;
v3.StartSolidFlash = function(v27, v28, v29, v30) --[[ Line: 105 ]] --[[ Name: StartSolidFlash ]]
    v27[v28] = v27[v28] + 1;
    local v31 = v27[v28];
    local l_Drones001_1 = v27.Drones001;
    task.spawn(function() --[[ Line: 110 ]]
        -- upvalues: v31 (copy), v27 (copy), v28 (copy), l_Drones001_1 (copy), v29 (copy), v30 (copy)
        local v33 = false;
        while v31 == v27[v28] do
            v33 = not v33;
            l_Drones001_1.Color = v33 and v29 or v30;
            task.wait(0.1);
        end;
    end);
end;
v3.StartExplosionTweenLoop = function(v34) --[[ Line: 120 ]] --[[ Name: StartExplosionTweenLoop ]]
    -- upvalues: l_TweenService_0 (copy), l_RunService_0 (copy)
    v34.ExplosionThreadToken = v34.ExplosionThreadToken + 1;
    local l_ExplosionThreadToken_0 = v34.ExplosionThreadToken;
    local l_Drones001_2 = v34.Drones001;
    task.spawn(function() --[[ Line: 125 ]]
        -- upvalues: l_Drones001_2 (copy), l_ExplosionThreadToken_0 (copy), v34 (copy), l_TweenService_0 (ref), l_RunService_0 (ref)
        local v37 = Color3.fromRGB(255, 40, 40);
        local v38 = Color3.fromRGB(255, 140, 0);
        local v39 = Color3.fromRGB(0, 0, 0);
        l_Drones001_2.Color = v37;
        while l_ExplosionThreadToken_0 == v34.ExplosionThreadToken do
            local v40 = l_TweenService_0:Create(l_Drones001_2, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
                Color = v38
            });
            v40:Play();
            v40.Completed:Wait();
            if l_ExplosionThreadToken_0 == v34.ExplosionThreadToken then
                local v41 = l_TweenService_0:Create(l_Drones001_2, TweenInfo.new(0.35, Enum.EasingStyle.Linear), {
                    Color = v39
                });
                v41:Play();
                v41.Completed:Wait();
                if l_ExplosionThreadToken_0 == v34.ExplosionThreadToken then
                    l_Drones001_2.Color = v37;
                    l_RunService_0.Heartbeat:Wait();
                else
                    break;
                end;
            else
                break;
            end;
        end;
    end);
end;
v3.BindMarkers = function(v42, v43) --[[ Line: 153 ]] --[[ Name: BindMarkers ]]
    -- upvalues: v12 (copy)
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("FadeIn"):Connect(function() --[[ Line: 154 ]]
        -- upvalues: v42 (copy), v12 (ref)
        local l_Drones_0 = v42.Drones;
        local l_Drones001_3 = v42.Drones001;
        l_Drones_0.Transparency = 1;
        l_Drones001_3.Transparency = 1;
        v12(v42.Drones, v42.Drones001, 0);
    end));
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("FadeOut"):Connect(function() --[[ Line: 159 ]]
        -- upvalues: v42 (copy), v12 (ref)
        local l_Drones_1 = v42.Drones;
        local l_Drones001_4 = v42.Drones001;
        l_Drones_1.Transparency = 0;
        l_Drones001_4.Transparency = 0;
        v12(v42.Drones, v42.Drones001, 1);
    end));
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("Flash"):Connect(function(v48) --[[ Line: 164 ]]
        -- upvalues: v42 (copy)
        local v49 = not v48 and "" or tostring(v48);
        if v49 == "Start" then
            v42:StopAllColorDrivers();
            v42:StartRainbowFlash();
            return;
        else
            if v49 == "Stop" then
                local l_v42_0 = v42;
                l_v42_0.FlashThreadToken = l_v42_0.FlashThreadToken + 1;
            end;
            return;
        end;
    end));
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("Yellow"):Connect(function(v51) --[[ Line: 174 ]]
        -- upvalues: v42 (copy)
        local v52 = not v51 and "" or tostring(v51);
        if v52 == "Start" then
            v42:StopAllColorDrivers();
            v42:StartSolidFlash("YellowThreadToken", Color3.fromRGB(255, 255, 120), Color3.fromRGB(255, 200, 0));
            return;
        else
            if v52 == "Stop" then
                local l_v42_1 = v42;
                l_v42_1.YellowThreadToken = l_v42_1.YellowThreadToken + 1;
            end;
            return;
        end;
    end));
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("Orange"):Connect(function(v54) --[[ Line: 184 ]]
        -- upvalues: v42 (copy)
        local v55 = not v54 and "" or tostring(v54);
        if v55 == "Start" then
            v42:StopAllColorDrivers();
            v42:StartSolidFlash("OrangeThreadToken", Color3.fromRGB(255, 200, 120), Color3.fromRGB(255, 120, 0));
            return;
        else
            if v55 == "Stop" then
                local l_v42_2 = v42;
                l_v42_2.OrangeThreadToken = l_v42_2.OrangeThreadToken + 1;
            end;
            return;
        end;
    end));
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("Red"):Connect(function(v57) --[[ Line: 194 ]]
        -- upvalues: v42 (copy)
        local v58 = not v57 and "" or tostring(v57);
        if v58 == "Start" then
            v42:StopAllColorDrivers();
            v42:StartSolidFlash("RedThreadToken", Color3.fromRGB(255, 120, 120), Color3.fromRGB(255, 0, 0));
            return;
        else
            if v58 == "Stop" then
                local l_v42_3 = v42;
                l_v42_3.RedThreadToken = l_v42_3.RedThreadToken + 1;
            end;
            return;
        end;
    end));
    table.insert(v42.Connections, v43:GetMarkerReachedSignal("Explosion"):Connect(function(v60) --[[ Line: 204 ]]
        -- upvalues: v42 (copy)
        local v61 = not v60 and "" or tostring(v60);
        if v61 == "Start" then
            v42:StopAllColorDrivers();
            v42:StartExplosionTweenLoop();
            return;
        else
            if v61 == "Stop" then
                local l_v42_4 = v42;
                l_v42_4.ExplosionThreadToken = l_v42_4.ExplosionThreadToken + 1;
                v42.Drones001.Color = Color3.fromRGB(0, 0, 0);
            end;
            return;
        end;
    end));
    table.insert(v42.Connections, v43.Stopped:Connect(function() --[[ Line: 215 ]]
        -- upvalues: v42 (copy)
        v42:StopAllColorDrivers();
    end));
end;
v3.Play = function(v63, v64) --[[ Line: 220 ]] --[[ Name: Play ]]
    v63:DisconnectAll();
    v63:StopAllColorDrivers();
    local v65 = v63.Animator:LoadAnimation(v63.Animation);
    v65.Looped = false;
    v63.AnimationTrack = v65;
    v63:BindMarkers(v65);
    v65:Play(0);
    v65.TimePosition = v64();
    task.spawn(function() --[[ Line: 232 ]]
        -- upvalues: v65 (copy), v63 (copy), v64 (copy)
        if v65.Length ~= 0 then
            return;
        else
            while v65.Length == 0 and v63.AnimationTrack == v65 do
                task.wait();
            end;
            v65.TimePosition = v64();
            return;
        end;
    end);
end;
v3.Stop = function(v66) --[[ Line: 245 ]] --[[ Name: Stop ]]
    if v66.AnimationTrack then
        v66.AnimationTrack:Stop();
    end;
    v66:StopAllColorDrivers();
end;
v3.Destroy = function(v67) --[[ Line: 252 ]] --[[ Name: Destroy ]]
    v67:Stop();
    v67:DisconnectAll();
    if v67.AnimationTrack then
        v67.AnimationTrack:Destroy();
        v67.AnimationTrack = nil;
    end;
end;
return v3;