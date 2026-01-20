local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v5 = require(l_ReplicatedStorage_0.Packages.Timer);
local v6 = require(l_ReplicatedStorage_0.Packages.Trove);
local v7 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v11 = v6.new();
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Tutorial_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("Main").Tutorial;
local l_TextLabel_0 = l_Tutorial_0.TextLabel;
local v15 = v7:RemoteEvent("TutorialService/StartTutorial");
local v16 = v7:RemoteEvent("TutorialService/FinishTutorial");
local v17 = v7:RemoteEvent("PlotService/CashCollected");
local v18 = v7:RemoteEvent("StealService/StealingSuccess");
local _ = v7:RemoteEvent("StealService/StealingFailure");
local v20 = {};
local function v58(v21) --[[ Line: 35 ]] --[[ Name: Setup ]]
    -- upvalues: l_LocalPlayer_0 (copy), v11 (copy), l_TextLabel_0 (copy), v9 (copy), v18 (copy), v16 (copy), v10 (copy), v17 (copy), v5 (copy), l_RunService_0 (copy), v15 (copy)
    local v22 = false;
    local v23 = false;
    local function v24() --[[ Line: 38 ]] --[[ Name: updateTutorial ]]
        -- upvalues: l_LocalPlayer_0 (ref), v11 (ref), v22 (ref), l_TextLabel_0 (ref), v21 (copy), v23 (ref), v9 (ref), v18 (ref), v16 (ref), v10 (ref), v24 (copy), v17 (ref), v5 (ref), l_RunService_0 (ref)
        task.wait(0.5);
        if l_LocalPlayer_0:GetAttribute("InNorthPole") then
            v11:Clean();
            return;
        else
            local v25 = (l_LocalPlayer_0.Character or l_LocalPlayer_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5);
            if not v25 then
                return;
            else
                if not v22 then
                    l_TextLabel_0.Visible = false;
                end;
                v11:Clean();
                if v21:Get("TutorialFinished") == true then
                    v23 = true;
                    v11:Destroy();
                    return;
                else
                    local v26, v27 = v9:HasAnimal("Noobini Pizzanini");
                    if v22 then
                        if l_LocalPlayer_0:GetAttribute("StealingPlayer") then
                            v11:Add(v18.OnClientEvent:Connect(function() --[[ Line: 72 ]]
                                -- upvalues: l_TextLabel_0 (ref), v16 (ref)
                                l_TextLabel_0.Visible = false;
                                v16:FireServer();
                            end));
                            local l_v10_MyPlot_0 = v10:GetMyPlot();
                            if l_v10_MyPlot_0 then
                                local l_DeliveryHitbox_0 = l_v10_MyPlot_0.PlotModel.DeliveryHitbox;
                                local v30 = script.TutorialArrow:Clone();
                                v30.Parent = workspace;
                                v30.Start.CFrame = v25.CFrame;
                                local v31 = Instance.new("WeldConstraint", v30.Start);
                                v31.Part0 = v25;
                                v31.Part1 = v30.Start;
                                v30.End.CFrame = l_DeliveryHitbox_0.CFrame - Vector3.new(0, 7.5, 0, 0);
                                v11:Add(v30);
                            end;
                        end;
                        v11:Add(l_LocalPlayer_0:GetAttributeChangedSignal("StealingPlayer"):Connect(function() --[[ Line: 95 ]]
                            -- upvalues: v24 (ref)
                            v24();
                        end));
                        return;
                    elseif v26 then
                        local l_v10_MyPlot_1 = v10:GetMyPlot();
                        if l_v10_MyPlot_1 then
                            local l_Main_0 = l_v10_MyPlot_1.PlotModel.AnimalPodiums:FindFirstChild(v27[1]).Claim.Main;
                            local v34 = script.TutorialArrow:Clone();
                            v34.Parent = workspace;
                            v34.Start.CFrame = v25.CFrame;
                            local v35 = Instance.new("WeldConstraint", v34.Start);
                            v35.Part0 = v25;
                            v35.Part1 = v34.Start;
                            v34.End.CFrame = l_Main_0.CFrame;
                            v11:Add(v34);
                        end;
                        l_TextLabel_0.Text = "Go collect your cash!";
                        l_TextLabel_0.Visible = true;
                        v11:Add(v17.OnClientEvent:Connect(function() --[[ Line: 119 ]]
                            -- upvalues: l_TextLabel_0 (ref), v22 (ref), v24 (ref)
                            l_TextLabel_0.Text = "Steal Brainrots from other players and bring them back to your base!";
                            l_TextLabel_0.Visible = true;
                            task.delay(10, function() --[[ Line: 122 ]]
                                -- upvalues: l_TextLabel_0 (ref)
                                l_TextLabel_0.Visible = false;
                            end);
                            v22 = true;
                            v24();
                        end));
                        v11:Add(v21:OnChanged("AnimalAddedOrRemoved", v24));
                        return;
                    else
                        local v36 = v9:HasAnimalMovingToBase("Noobini Pizzanini");
                        if v36 then
                            local l_UID_0 = v36.UID;
                            l_TextLabel_0.Text = "Wait for Noobini Pizzanini to reach your base!";
                            l_TextLabel_0.Visible = true;
                            v11:Add(v9.OnAnimalDestroyed:Connect(function(v38) --[[ Line: 138 ]]
                                -- upvalues: l_UID_0 (copy), v24 (ref)
                                if l_UID_0 == v38 then
                                    v24();
                                end;
                            end));
                            v11:Add(v9.OnFollowingChanged:Connect(function(v39, _, _) --[[ Line: 144 ]]
                                -- upvalues: v24 (ref)
                                if v39 == "Noobini Pizzanini" then
                                    v24();
                                end;
                            end));
                            v11:Add(v36.Instance.PrimaryPart.PromptAttachment.ProximityPrompt:GetAttributeChangedSignal("TargetPlayer"):Connect(v24));
                            return;
                        else
                            local v42 = v11:Clone(script.TutorialArrow);
                            v42.Start.CFrame = v25.CFrame;
                            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                            l_WeldConstraint_0.Part0 = v25;
                            l_WeldConstraint_0.Part1 = v42.Start;
                            l_WeldConstraint_0.Parent = v42.Start;
                            v42.Parent = workspace;
                            l_TextLabel_0.Text = "Go buy a Noobini Pizzanini";
                            local v44 = nil;
                            v11:Add(v5.Simple(0.1, function() --[[ Line: 165 ]]
                                -- upvalues: l_LocalPlayer_0 (ref), v9 (ref), v44 (ref)
                                local l_Character_0 = l_LocalPlayer_0.Character;
                                if not l_Character_0 then
                                    return;
                                else
                                    local l_l_Character_0_Pivot_0 = l_Character_0:GetPivot();
                                    local v47 = nil;
                                    local v48 = 1e999;
                                    for _, v50 in v9:GetAnimals() do
                                        if v50.Index == "Noobini Pizzanini" then
                                            local l_ProximityPrompt_0 = v50.Instance.PrimaryPart:FindFirstChild("PromptAttachment"):FindFirstChildOfClass("ProximityPrompt");
                                            if l_ProximityPrompt_0 and not l_ProximityPrompt_0:GetAttribute("TargetPlayer") then
                                                local l_CFrame_0 = v50.AnimalModel.PrimaryPart.CFrame;
                                                local l_Magnitude_0 = (l_l_Character_0_Pivot_0.Position - l_CFrame_0.Position).Magnitude;
                                                if l_Magnitude_0 < v48 then
                                                    v48 = l_Magnitude_0;
                                                    v47 = v50;
                                                end;
                                            end;
                                        end;
                                    end;
                                    v44 = v47;
                                    return;
                                end;
                            end, true));
                            v11:Add(l_RunService_0.PostSimulation:Connect(function() --[[ Line: 197 ]]
                                -- upvalues: v44 (ref), v42 (copy), l_TextLabel_0 (ref)
                                debug.profilebegin("FTUEController");
                                local v54 = v44 and v44.AnimalModel and v44.AnimalModel.PrimaryPart;
                                v42.Start.Beam.Enabled = v54 ~= nil;
                                l_TextLabel_0.Visible = v54 ~= nil;
                                if v54 then
                                    v42.End.CFrame = v54.CFrame;
                                end;
                                debug.profileend();
                            end));
                            v11:Add(v9.OnFollowingChanged:Connect(function(v55, _, _) --[[ Line: 209 ]]
                                -- upvalues: v24 (ref)
                                if v55 == "Noobini Pizzanini" then
                                    v24();
                                end;
                            end));
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
    if v21:Get("TutorialFinished") == true then
        return;
    else
        v21:OnChanged("TutorialFinished", v24, true);
        l_LocalPlayer_0:GetAttributeChangedSignal("InNorthPole"):Connect(v24);
        if l_LocalPlayer_0.Character then
            task.spawn(v24);
        else
            l_LocalPlayer_0.CharacterAdded:Once(v24);
        end;
        v15:FireServer();
        return;
    end;
end;
v20.Start = function(_) --[[ Line: 235 ]] --[[ Name: Start ]]
    -- upvalues: v4 (copy), l_LocalPlayer_0 (copy), v58 (copy), l_Tutorial_0 (copy), l_GuiService_0 (copy)
    v4:WaitAndCall(l_LocalPlayer_0, v58);
    local function v60() --[[ Line: 238 ]] --[[ Name: onTopbarInsetUpdate ]]
        -- upvalues: l_Tutorial_0 (ref), l_GuiService_0 (ref)
        l_Tutorial_0.Position = UDim2.fromScale(0.5, 0) + UDim2.fromOffset(0, l_GuiService_0.TopbarInset.Height);
    end;
    l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v60);
    l_Tutorial_0.Position = UDim2.fromScale(0.5, 0) + UDim2.fromOffset(0, l_GuiService_0.TopbarInset.Height);
end;
return v20;