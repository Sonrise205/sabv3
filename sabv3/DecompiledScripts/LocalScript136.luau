local l_Players_0 = game:GetService("Players");
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(l_ReplicatedStorage_0.Packages.Net);
local l_Parent_0 = script.Parent;
local v5 = if l_Parent_0.Parent:IsA("Model") then l_Players_0:GetPlayerFromCharacter(l_Parent_0.Parent) else l_Parent_0.Parent.Parent;
assert(v5 and v5:IsA("Player"));
if v5 ~= l_Players_0.LocalPlayer then
    return;
else
    local v6 = v5.Character or v5.CharacterAdded:Wait();
    local v7 = assert(v6:WaitForChild("HumanoidRootPart", 5));
    local v8 = assert(v6:WaitForChild("Humanoid", 5));
    local _ = l_Parent_0:WaitForChild("Handle");
    local l_SantasSleighPresent_0 = v5.PlayerGui:WaitForChild("ToolsFrames"):WaitForChild("SantasSleighPresent");
    local v11 = {
        X = 66, 
        Z = 99
    };
    local v12 = {
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
    local v13 = false;
    local v14 = false;
    local v15 = nil;
    local function _() --[[ Line: 67 ]] --[[ Name: CheckIfAlive ]]
        -- upvalues: v6 (copy), v8 (copy), v7 (copy), v5 (copy)
        if v6 and v6.Parent and v8 and v8.Parent and v8.Health > 0 and v7 and v7.Parent and v5 and v5.Parent then
            return true;
        else
            return false;
        end;
    end;
    local function _(v17) --[[ Line: 71 ]] --[[ Name: DisableJump ]]
        -- upvalues: v15 (ref), v8 (copy)
        if v15 then
            v15:Disconnect();
        end;
        if v17 then
            v15 = v8.Changed:Connect(function(v18) --[[ Line: 76 ]]
                -- upvalues: v8 (ref)
                if v18 == "Jump" then
                    v8.Jump = false;
                end;
            end);
        end;
    end;
    local v20 = nil;
    local function v32() --[[ Line: 85 ]] --[[ Name: HandleFlightControl ]]
        -- upvalues: v6 (copy), v8 (copy), v7 (copy), v5 (copy), v20 (ref), v13 (ref), l_SantasSleighPresent_0 (copy), v15 (ref), v11 (copy)
        if not if v6 and v6.Parent and v8 and v8.Parent then v8.Health > 0 and (v7 and v7.Parent and v5 and v5.Parent and true or false) else false then
            return;
        else
            if v20 then
                v20:Disconnect();
            end;
            v20 = v7.ChildAdded:Connect(function(v21) --[[ Line: 92 ]]
                -- upvalues: v13 (ref), v7 (ref), l_SantasSleighPresent_0 (ref), v8 (ref), v15 (ref), v6 (ref), v5 (ref), v11 (ref)
                if v13 then
                    return;
                else
                    if v21.Name == "FlightHold" then
                        local l_FlightSpin_0 = v7:FindFirstChild("FlightSpin");
                        local l_FlightPower_0 = v7:FindFirstChild("FlightPower");
                        local l_FlightHold_0 = v7:FindFirstChild("FlightHold");
                        if not l_FlightSpin_0 or not l_FlightPower_0 or not l_FlightHold_0 then
                            return;
                        else
                            v13 = true;
                            l_SantasSleighPresent_0.Visible = true;
                            v8.WalkSpeed = 0;
                            v8.PlatformStand = true;
                            v8.AutoRotate = false;
                            if v15 then
                                v15:Disconnect();
                            end;
                            v15 = v8.Changed:Connect(function(v25) --[[ Line: 76 ]]
                                -- upvalues: v8 (ref)
                                if v25 == "Jump" then
                                    v8.Jump = false;
                                end;
                            end);
                            v7.Velocity = Vector3.new(0, 0, 0, 0);
                            v7.RotVelocity = Vector3.new(0, 0, 0, 0);
                            local v26 = assert(workspace.CurrentCamera);
                            while v13 and l_FlightSpin_0.Parent and l_FlightPower_0.Parent and l_FlightHold_0.Parent and if v6 and v6.Parent and v8 and v8.Parent then v8.Health > 0 and (v7 and v7.Parent and v5 and v5.Parent and true or false) else false do
                                local v27 = Vector3.new(0, 0, 0, 0);
                                local l_CFrame_0 = v26.CFrame;
                                local v29 = l_CFrame_0:VectorToWorldSpace((Vector3.new(0, 0, -1, 0)));
                                local v30 = l_CFrame_0:VectorToWorldSpace((Vector3.new(-1, 0, 0, 0)));
                                local v31 = CFrame.new(Vector3.new(0, 0, 0, 0), l_CFrame_0.LookVector * Vector3.new(1, 0, 1, 0)):VectorToObjectSpace(v8.MoveDirection);
                                v27 = v27 + (v29 * v11.Z * -v31.Z or v27);
                                v27 = v27 + (v30 * v11.X * -v31.X or v27);
                                l_FlightSpin_0.CFrame = CFrame.new(Vector3.new(0, 0, 0, 0), v29);
                                if v27.Magnitude < 1 then
                                    l_FlightHold_0.MaxForce = Vector3.new(l_FlightHold_0.P, l_FlightHold_0.P, l_FlightHold_0.P);
                                    l_FlightPower_0.MaxForce = Vector3.new(0, 0, 0, 0);
                                    l_FlightHold_0.Position = v7.Position;
                                else
                                    l_FlightHold_0.MaxForce = Vector3.new(0, 0, 0, 0);
                                    l_FlightPower_0.MaxForce = Vector3.new(l_FlightPower_0.P * 100, l_FlightPower_0.P * 100, l_FlightPower_0.P * 100);
                                end;
                                l_FlightPower_0.Velocity = v27;
                                task.wait(0.016666666666666666);
                            end;
                            v13 = false;
                            l_SantasSleighPresent_0.Visible = false;
                            if if v6 and v6.Parent and v8 and v8.Parent then v8.Health > 0 and (v7 and v7.Parent and v5 and v5.Parent and true or false) else false then
                                v7.Velocity = Vector3.new(0, 0, 0, 0);
                                v7.RotVelocity = Vector3.new(0, 0, 0, 0);
                                v8.WalkSpeed = 16;
                                v8.PlatformStand = false;
                                v8.AutoRotate = true;
                                if v15 then
                                    v15:Disconnect();
                                end;
                                v8:ChangeState(Enum.HumanoidStateType.Freefall);
                            end;
                        end;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v39(v33, v34) --[[ Line: 152 ]] --[[ Name: KeyPress ]]
        -- upvalues: v12 (copy)
        local v35 = string.lower(v33);
        local v36 = string.byte(v35);
        for v37, v38 in pairs(v12) do
            if v35 == v38.Keys.Key or v36 == v38.Keys.ByteKey then
                v12[v37].Mode = v34;
            end;
        end;
    end;
    local function v43(v40) --[[ Line: 162 ]] --[[ Name: Equipped ]]
        -- upvalues: v6 (copy), v8 (copy), v7 (copy), v5 (copy), v14 (ref), v39 (copy), v32 (copy)
        if not if v6 and v6.Parent and v8 and v8.Parent then v8.Health > 0 and (v7 and v7.Parent and v5 and v5.Parent and true or false) else false then
            return;
        else
            v14 = true;
            v40.KeyDown:Connect(function(v41) --[[ Line: 167 ]]
                -- upvalues: v39 (ref)
                v39(v41, true);
            end);
            v40.KeyUp:Connect(function(v42) --[[ Line: 170 ]]
                -- upvalues: v39 (ref)
                v39(v42, false);
            end);
            task.spawn(v32);
            return;
        end;
    end;
    local function v48() --[[ Line: 176 ]] --[[ Name: Unequipped ]]
        -- upvalues: v14 (ref), v13 (ref), l_SantasSleighPresent_0 (copy), v15 (ref), v20 (ref), v12 (copy)
        if not v14 then
            return;
        else
            v13 = false;
            l_SantasSleighPresent_0.Visible = false;
            for _, v45 in pairs({
                v15, 
                v20
            }) do
                if v45 then
                    v45:Disconnect();
                end;
            end;
            for v46, _ in pairs(v12) do
                v12[v46].Mode = false;
            end;
            v14 = false;
            return;
        end;
    end;
    l_Parent_0.Equipped:Connect(v43);
    l_Parent_0.Unequipped:Connect(v48);
    l_SantasSleighPresent_0.Activate.MouseButton1Up:Connect(function() --[[ Line: 196 ]]
        -- upvalues: v3 (copy)
        v3:RemoteEvent("Tools/SantasSleigh/DropPresent"):FireServer();
    end);
    local function v50() --[[ Line: 200 ]] --[[ Name: UpdateCooldown ]]
        -- upvalues: l_Parent_0 (copy), l_SantasSleighPresent_0 (copy)
        local v49 = tonumber(l_Parent_0:GetAttribute("CooldownTime") or 0) or 0;
        if v49 > 0 then
            l_SantasSleighPresent_0.Activate.ImageColor3 = Color3.fromRGB(128, 128, 128);
            l_SantasSleighPresent_0.Activate.Icon.ImageColor3 = Color3.fromRGB(128, 128, 128);
            l_SantasSleighPresent_0.Activate.Txt.TextColor3 = Color3.fromRGB(128, 128, 128);
            l_SantasSleighPresent_0.Activate.Cooldown.Text = string.format("%0.1f", v49);
            l_SantasSleighPresent_0.Activate.Cooldown.Visible = true;
            return;
        else
            l_SantasSleighPresent_0.Activate.ImageColor3 = Color3.fromRGB(255, 255, 255);
            l_SantasSleighPresent_0.Activate.Icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
            l_SantasSleighPresent_0.Activate.Txt.TextColor3 = Color3.fromRGB(255, 255, 255);
            l_SantasSleighPresent_0.Activate.Cooldown.Visible = false;
            return;
        end;
    end;
    l_Parent_0:GetAttributeChangedSignal("CooldownTime"):Connect(v50);
    v50();
    return;
end;