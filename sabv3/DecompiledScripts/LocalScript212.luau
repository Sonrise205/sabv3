Tool = script.Parent;
Handle = Tool:WaitForChild("Handle");
Players = game:GetService("Players");
RunService = game:GetService("RunService");
Camera = game:GetService("Workspace").CurrentCamera;
Animations = {};
LocalObjects = {};
ClientControl = Tool:WaitForChild("ClientControl");
Rate = 0.016666666666666666;
SpeedMultiplier = 1.5;
CameraSpeed = {
    X = 40 * SpeedMultiplier, 
    Z = 60 * SpeedMultiplier
};
Controls = {
    Forward = {
        Mode = false, 
        Keys = {
            Key = "w", 
            ByteKey = 17
        }
    }, 
    Backward = {
        Mode = false, 
        Keys = {
            Key = "s", 
            ByteKey = 18
        }
    }, 
    Left = {
        Mode = false, 
        Keys = {
            Key = "a", 
            ByteKey = 20
        }
    }, 
    Right = {
        Mode = false, 
        Keys = {
            Key = "d", 
            ByteKey = 19
        }
    }
};
ToolEquipped = false;
HandleFlightControl = function() --[[ Line: 44 ]] --[[ Name: HandleFlightControl ]]
    if not CheckIfAlive() then
        return;
    else
        if FightMonitor then
            FightMonitor:disconnect();
        end;
        FightMonitor = Torso.ChildAdded:connect(function(v0) --[[ Line: 51 ]]
            if Flying then
                return;
            else
                if v0.Name == "FlightHold" then
                    local l_FlightSpin_0 = Torso:FindFirstChild("FlightSpin");
                    local l_FlightPower_0 = Torso:FindFirstChild("FlightPower");
                    local l_FlightHold_0 = Torso:FindFirstChild("FlightHold");
                    if not l_FlightSpin_0 or not l_FlightPower_0 or not l_FlightHold_0 then
                        return;
                    else
                        Flying = true;
                        Humanoid.WalkSpeed = 0;
                        Humanoid.PlatformStand = true;
                        Humanoid.AutoRotate = false;
                        DisableJump(true);
                        Torso.Velocity = Vector3.new(0, 0, 0, 0);
                        Torso.RotVelocity = Vector3.new(0, 0, 0, 0);
                        while Flying and l_FlightSpin_0.Parent and l_FlightPower_0.Parent and l_FlightHold_0.Parent and CheckIfAlive() do
                            local v4 = Vector3.new(0, 0, 0, 0);
                            local v5 = Camera.CoordinateFrame:vectorToWorldSpace((Vector3.new(0, 0, -1, 0)));
                            local v6 = Camera.CoordinateFrame:vectorToWorldSpace((Vector3.new(-1, 0, 0, 0)));
                            local l_CoordinateFrame_0 = Camera.CoordinateFrame;
                            local v8 = CFrame.new(Vector3.new(0, 0, 0, 0), l_CoordinateFrame_0.lookVector * Vector3.new(1, 0, 1, 0)):vectorToObjectSpace(Humanoid.MoveDirection);
                            v4 = v4 + (v5 * CameraSpeed.Z * -v8.z or v4);
                            v4 = v4 + (v6 * CameraSpeed.X * -v8.x or v4);
                            l_FlightSpin_0.cframe = CFrame.new(Vector3.new(0, 0, 0, 0), v5);
                            if v4.magnitude < 1 then
                                l_FlightHold_0.maxForce = Vector3.new(l_FlightHold_0.P, l_FlightHold_0.P, l_FlightHold_0.P);
                                l_FlightPower_0.maxForce = Vector3.new(0, 0, 0, 0);
                                l_FlightHold_0.position = Torso.Position;
                            else
                                l_FlightHold_0.maxForce = Vector3.new(0, 0, 0, 0);
                                l_FlightPower_0.maxForce = Vector3.new(l_FlightPower_0.P * 100, l_FlightPower_0.P * 100, l_FlightPower_0.P * 100);
                            end;
                            l_FlightPower_0.velocity = v4;
                            wait(Rate);
                        end;
                        Flying = false;
                        if CheckIfAlive() then
                            Torso.Velocity = Vector3.new(0, 0, 0, 0);
                            Torso.RotVelocity = Vector3.new(0, 0, 0, 0);
                            Humanoid.WalkSpeed = 16;
                            Humanoid.PlatformStand = false;
                            Humanoid.AutoRotate = true;
                            DisableJump(false);
                            Humanoid:ChangeState(Enum.HumanoidStateType.Freefall);
                        end;
                    end;
                end;
                return;
            end;
        end);
        return;
    end;
end;
SetAnimation = function(v9, v10) --[[ Line: 108 ]] --[[ Name: SetAnimation ]]
    if v9 == "PlayAnimation" and v10 and ToolEquipped and Humanoid then
        for v11, v12 in pairs(Animations) do
            if v12.Animation == v10.Animation then
                v12.AnimationTrack:Stop();
                table.remove(Animations, v11);
            end;
        end;
        local v13 = Humanoid:LoadAnimation(v10.Animation);
        table.insert(Animations, {
            Animation = v10.Animation, 
            AnimationTrack = v13
        });
        v13:Play(v10.FadeTime, v10.Weight, v10.Speed);
        return;
    else
        if v9 == "StopAnimation" and v10 then
            for v14, v15 in pairs(Animations) do
                if v15.Animation == v10.Animation then
                    v15.AnimationTrack:Stop();
                    table.remove(Animations, v14);
                end;
            end;
        end;
        return;
    end;
end;
DisableJump = function(v16) --[[ Line: 129 ]] --[[ Name: DisableJump ]]
    if PreventJump then
        PreventJump:disconnect();
    end;
    if v16 then
        PreventJump = Humanoid.Changed:connect(function(v17) --[[ Line: 134 ]]
            if v17 == "Jump" then
                Humanoid.Jump = false;
            end;
        end);
    end;
end;
CheckIfAlive = function() --[[ Line: 142 ]] --[[ Name: CheckIfAlive ]]
    if Character and Character.Parent and Humanoid and Humanoid.Parent and Humanoid.Health > 0 and Torso and Torso.Parent and Player and Player.Parent then
        return true;
    else
        return false;
    end;
end;
KeyPress = function(v18, v19) --[[ Line: 146 ]] --[[ Name: KeyPress ]]
    local v20 = string.lower(v18);
    local v21 = string.byte(v20);
    for v22, v23 in pairs(Controls) do
        if v20 == v23.Keys.Key or v21 == v23.Keys.ByteKey then
            Controls[v22].Mode = v19;
        end;
    end;
end;
Equipped = function(v24) --[[ Line: 156 ]] --[[ Name: Equipped ]]
    Character = Tool.Parent;
    Player = Players:GetPlayerFromCharacter(Character);
    Humanoid = Character:FindFirstChild("Humanoid");
    Torso = Character:FindFirstChild("HumanoidRootPart");
    ToolEquipped = true;
    if not CheckIfAlive() then
        return;
    else
        v24.KeyDown:connect(function(v25) --[[ Line: 165 ]]
            KeyPress(v25, true);
        end);
        v24.KeyUp:connect(function(v26) --[[ Line: 168 ]]
            KeyPress(v26, false);
        end);
        Spawn(HandleFlightControl);
        return;
    end;
end;
Unequipped = function() --[[ Line: 174 ]] --[[ Name: Unequipped ]]
    Flying = false;
    LocalObjects = {};
    for _, v28 in pairs(Animations) do
        if v28 and v28.AnimationTrack then
            v28.AnimationTrack:Stop();
        end;
    end;
    for _, v30 in pairs({
        PreventJump, 
        FightMonitor
    }) do
        if v30 then
            v30:disconnect();
        end;
    end;
    for v31, _ in pairs(Controls) do
        Controls[v31].Mode = false;
    end;
    Animations = {};
    ToolEquipped = false;
end;
OnClientInvoke = function(v33, v34) --[[ Line: 194 ]] --[[ Name: OnClientInvoke ]]
    if v33 == "PlayAnimation" and v34 and ToolEquipped and Humanoid then
        SetAnimation("PlayAnimation", v34);
        return;
    elseif v33 == "StopAnimation" and v34 then
        SetAnimation("StopAnimation", v34);
        return;
    elseif v33 == "PlaySound" and v34 then
        v34:Play();
        return;
    else
        if v33 == "StopSound" and v34 then
            v34:Stop();
        end;
        return;
    end;
end;
ClientControl.OnClientInvoke = OnClientInvoke;
Tool.Equipped:connect(Equipped);
Tool.Unequipped:connect(Unequipped);