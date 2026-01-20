local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_ReplicatedStorage_0.Packages.Trove);
return {
    name = "jumpscare", 
    icon = "rbxassetid://70977280827000", 
    cooldown = 60, 
    description = "BOO!", 
    effects = {
        Victim = function() --[[ Line: 14 ]]
            -- upvalues: l_Players_0 (copy), l_ReplicatedStorage_0 (copy), v4 (copy), l_TweenService_0 (copy), l_RunService_0 (copy)
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            local l_CurrentCamera_0 = workspace.CurrentCamera;
            local v7 = l_ReplicatedStorage_0.Models.Animals["Tim Cheese"];
            local v8 = l_ReplicatedStorage_0.Sounds.Animals["Tim Cheese"];
            local l_Idle_0 = l_ReplicatedStorage_0.Animations.Animals["Tim Cheese"].Idle;
            if not l_LocalPlayer_0 or not l_CurrentCamera_0 or not v7 or not v8 or not l_Idle_0 then
                return;
            else
                local v10 = v4.new();
                local v11 = v10:Add(v7:Clone());
                if not v11.PrimaryPart then
                    v10:Destroy();
                    return;
                else
                    local v12 = v10:Add(v8:Clone());
                    v12.Volume = 10;
                    v12.Parent = v11.PrimaryPart;
                    local v13 = v10:Add(Instance.new("ColorCorrectionEffect"));
                    v13.Saturation = -0.1;
                    v13.Brightness = -0.1;
                    v13.Contrast = 0;
                    v13.Parent = l_CurrentCamera_0;
                    local v14 = v10:Add(Instance.new("DepthOfFieldEffect"));
                    v14.Enabled = true;
                    v14.Parent = l_CurrentCamera_0;
                    v14.FocusDistance = 8;
                    v14.FarIntensity = 1;
                    v14.NearIntensity = 0;
                    v14.InFocusRadius = 2;
                    local l_ScreenGui_0 = Instance.new("ScreenGui");
                    l_ScreenGui_0.ResetOnSpawn = false;
                    l_ScreenGui_0.IgnoreGuiInset = true;
                    l_ScreenGui_0.Parent = l_LocalPlayer_0:WaitForChild("PlayerGui");
                    local l_Frame_0 = Instance.new("Frame");
                    l_Frame_0.Size = UDim2.new(1, 0, 1, 0);
                    l_Frame_0.BackgroundColor3 = Color3.new(0, 0, 0);
                    l_Frame_0.BackgroundTransparency = 1;
                    l_Frame_0.Parent = l_ScreenGui_0;
                    v11.Parent = l_CurrentCamera_0;
                    local v17 = CFrame.Angles(0, 3.141592653589793, 0);
                    local v18 = CFrame.new(0, -20, -15) * v17;
                    local v19 = CFrame.new(0, -6, -8) * v17;
                    l_TweenService_0:Create(v14, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 4.3), {
                        FarIntensity = 0, 
                        NearIntensity = 0, 
                        InFocusRadius = 0
                    }):Play();
                    local l_AnimationController_0 = v11:FindFirstChildOfClass("AnimationController");
                    if l_AnimationController_0 then
                        local v21 = v10:Add(l_AnimationController_0:LoadAnimation(l_Idle_0));
                        v21.Looped = true;
                        v21:Play();
                    end;
                    l_TweenService_0:Create(v13, TweenInfo.new(0.3), {
                        Contrast = 0.2
                    }):Play();
                    l_TweenService_0:Create(l_Frame_0, TweenInfo.new(0.1), {
                        BackgroundTransparency = 0
                    }):Play();
                    task.delay(0.1, function() --[[ Line: 84 ]]
                        -- upvalues: l_TweenService_0 (ref), l_Frame_0 (copy)
                        l_TweenService_0:Create(l_Frame_0, TweenInfo.new(0.4), {
                            BackgroundTransparency = 1
                        }):Play();
                    end);
                    v12:Play();
                    local v22 = os.clock();
                    v10:Add((l_RunService_0.RenderStepped:Connect(function() --[[ Line: 91 ]]
                        -- upvalues: v22 (copy), v18 (copy), v19 (copy), v10 (copy), v11 (copy), l_CurrentCamera_0 (copy)
                        debug.profilebegin("Jumpscare:Update");
                        local v23 = os.clock() - v22;
                        local v24 = nil;
                        if v23 < 0.3 then
                            local v25 = v23 / 0.3;
                            local v26 = v25 * v25 * v25;
                            v24 = v18:Lerp(v19, v26);
                        elseif v23 < 4.3 then
                            v24 = v19 * CFrame.new(math.random(-5, 5) / 100, math.random(-5, 5) / 100, math.random(-5, 5) / 100);
                        elseif v23 < 4.8 then
                            local v27 = math.sin((v23 - 0.3 - 4) / 0.5 * 1.5707963267948966);
                            v24 = v19:Lerp(v18, v27);
                        else
                            v10:Destroy();
                            debug.profileend();
                            return;
                        end;
                        v11:PivotTo(l_CurrentCamera_0.CFrame * v24);
                        debug.profileend();
                    end)));
                    return;
                end;
            end;
        end
    }
};