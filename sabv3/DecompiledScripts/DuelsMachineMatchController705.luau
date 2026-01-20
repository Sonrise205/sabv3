local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.ReplicatorClient);
local v4 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v5 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v6 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Shared.UsersAPI);
local _ = require(l_ReplicatedStorage_0.Packages.FFlags);
local v9 = require(l_ReplicatedStorage_0.Packages.Timer);
local v10 = require(l_ReplicatedStorage_0.Packages.Trove);
local v11 = require(l_ReplicatedStorage_0.Packages.Net);
local v12 = require(l_ReplicatedStorage_0.Packages.Spr);
local v13 = require(l_ReplicatedStorage_0.Controllers.ConfirmationController);
local v14 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v15 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v16 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local v17 = require(l_ReplicatedStorage_0.Datas.DuelsModes);
local v18 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v19 = require(l_ReplicatedStorage_0.Datas.Animals);
local v20 = require(l_ReplicatedStorage_0.Datas.Traits);
local v21 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local _ = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v23 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_DuelsMachineSession_0 = l_PlayerGui_0:WaitForChild("DuelsMachineSession").DuelsMachineSession;
local l_DuelsMachineTopFrame_0 = l_PlayerGui_0:WaitForChild("DuelsMachineTopFrame").DuelsMachineTopFrame;
local l_DuelsMachineAnimation_0 = l_PlayerGui_0:WaitForChild("DuelsMachineAnimation").DuelsMachineAnimation;
local l_DuelsMachineVoteFrame_0 = l_PlayerGui_0:WaitForChild("DuelsMachineTopFrame").DuelsMachineVoteFrame;
local l_Return_0 = l_PlayerGui_0:WaitForChild("DuelsMachineTopFrame").Return;
local l_Tip_0 = l_PlayerGui_0:WaitForChild("DuelsMachineTopFrame").Tip;
local v33 = false;
return {
    Start = function(_) --[[ Line: 82 ]] --[[ Name: Start ]]
        -- upvalues: v18 (copy), l_LocalPlayer_0 (copy), l_Return_0 (copy), v12 (copy), l_PlayerGui_0 (copy), v13 (copy), v11 (copy), v3 (copy), v14 (copy), l_DuelsMachineSession_0 (copy), v4 (copy), v10 (copy), v9 (copy), v19 (copy), v21 (copy), v23 (copy), v20 (copy), l_Players_0 (copy), v15 (copy), v17 (copy), l_DuelsMachineVoteFrame_0 (copy), v16 (copy), l_UserInputService_0 (copy), l_DuelsMachineAnimation_0 (copy), v33 (ref), v5 (copy), l_DuelsMachineTopFrame_0 (copy), l_Tip_0 (copy), v6 (copy)
        if not v18.IsDuelsServer() then
            return;
        else
            local function v36() --[[ Line: 88 ]] --[[ Name: updateButtonPosition ]]
                -- upvalues: l_LocalPlayer_0 (ref), l_Return_0 (ref), v12 (ref), l_PlayerGui_0 (ref)
                if l_LocalPlayer_0:GetAttribute("__duels_tp_back") then
                    l_Return_0.Visible = true;
                    v12.target(l_Return_0, 0.9, 4, {
                        Position = UDim2.fromScale(0.5, 0.9)
                    });
                    local l_Notification_0 = l_PlayerGui_0:WaitForChild("Notification"):WaitForChild("Notification");
                    l_Notification_0.AnchorPoint = Vector2.new(0.5, 0.5);
                    l_Notification_0.Position = UDim2.fromScale(0.5, 0.57);
                    return;
                else
                    v12.target(l_Return_0, 0.9, 4, {
                        Position = UDim2.fromScale(0.5, 1.2)
                    });
                    return;
                end;
            end;
            l_Return_0.Activated:Connect(function() --[[ Line: 103 ]]
                -- upvalues: v13 (ref), v11 (ref)
                if not v13:Show("This will send you to a public server. Continue?", 3600, "DuelsTeleportBackTemplate") then
                    return;
                else
                    v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/TeleportBack"):FireServer();
                    return;
                end;
            end);
            l_LocalPlayer_0:GetAttributeChangedSignal("__duels_tp_back"):Connect(v36);
            task.spawn(v36);
            v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/WinnerScreen").OnClientEvent:Connect(function(_) --[[ Line: 116 ]]

            end);
            local v38 = v3.get("DuelsRounds");
            local v39 = v3.get("DuelsModeVote");
            v3.get("SelectBrainrots");
            local v40 = v14:Register("DuelsMachineSession", l_DuelsMachineSession_0, "TopQuint");
            v40:AttachCloseButton(l_DuelsMachineSession_0.Header.Close);
            v40:Close();
            local v41 = v4:Wait(l_LocalPlayer_0);
            if not _G.__REPLICATOR_INIT then
                _G.__REPLICATOR_INIT = true;
                task.spawn(v3.init);
            end;
            local v42 = v10.new();
            local function v97() --[[ Line: 139 ]] --[[ Name: updateDuelsSelectionUI ]]
                -- upvalues: v14 (ref), v42 (copy), v3 (ref), l_LocalPlayer_0 (ref), v12 (ref), l_DuelsMachineSession_0 (ref), v9 (ref), v19 (ref), v21 (ref), v23 (ref), v20 (ref), l_Players_0 (ref), v41 (copy), v15 (ref), v11 (ref)
                if not workspace:GetAttribute("DuelsSelectBrainrotActive") then
                    v14:SetState("DuelsMachineSession", false);
                    v42:Clean();
                    return;
                else
                    v14:SetState("DuelsMachineSession", true);
                    local v43 = v3.get("SelectBrainrots");
                    v43:WaitForLoaded();
                    local v44 = v42:Extend();
                    local function v52() --[[ Line: 155 ]] --[[ Name: updateReadyButtonState ]]
                        -- upvalues: v43 (copy), l_LocalPlayer_0 (ref), v12 (ref), l_DuelsMachineSession_0 (ref)
                        local v45 = v43:TryIndex({
                            "lastChange"
                        }) or 0;
                        local v46 = v43:TryIndex({
                            "players"
                        }) or {};
                        local v47 = true;
                        for _, v49 in v46 do
                            if not v49.brainrot then
                                v47 = false;
                                break;
                            end;
                        end;
                        local v50 = v46[tostring(l_LocalPlayer_0.UserId)];
                        local v51 = v45 + 5 - workspace:GetServerTimeNow();
                        v12.target(l_DuelsMachineSession_0.Other.Ready, 1, 5, {
                            BackgroundColor3 = if not (v51 <= 0 and v47 and next(v46)) or v50 and v50.accepted then Color3.fromRGB(112, 112, 112) else Color3.fromRGB(81, 158, 86)
                        });
                    end;
                    v42:Add(v43:Observe({
                        "lastChange"
                    }, function(v53) --[[ Line: 173 ]]
                        -- upvalues: v44 (copy), v9 (ref), l_DuelsMachineSession_0 (ref), v52 (copy)
                        v44:Clean();
                        if v53 == nil then
                            return;
                        else
                            v44:Add(v9.Simple(0.1, function() --[[ Line: 180 ]]
                                -- upvalues: v53 (copy), l_DuelsMachineSession_0 (ref), v52 (ref)
                                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                                local v55 = v53 + 5 - l_workspace_ServerTimeNow_0;
                                l_DuelsMachineSession_0.Other.Timer.Text = v55 <= 0 and "" or ("\226\143\176%*s Left"):format(math.floor(v55 * 10) / 10);
                                v52();
                            end, true));
                            return;
                        end;
                    end));
                    local v56 = {};
                    local v57 = {};
                    v42:Add(v43:Observe({
                        "players"
                    }, function(v58) --[[ Line: 191 ]]
                        -- upvalues: l_DuelsMachineSession_0 (ref), v12 (ref), v56 (copy), v57 (copy), v19 (ref), v21 (ref), v23 (ref), v20 (ref), v42 (ref), l_LocalPlayer_0 (ref), l_Players_0 (ref)
                        local v59 = true;
                        for _, v61 in v58 do
                            if not v61.ready or not v61.brainrot then
                                v59 = false;
                                break;
                            end;
                        end;
                        if v59 then
                            l_DuelsMachineSession_0.Other.Ready.Txt.Text = "ACCEPT";
                        else
                            l_DuelsMachineSession_0.Other.Ready.Txt.Text = "READY";
                        end;
                        local function v75(v62, v63, v64) --[[ Line: 207 ]] --[[ Name: updateFrame ]]
                            -- upvalues: v12 (ref), v56 (ref), v57 (ref), v19 (ref), v21 (ref), v23 (ref), v20 (ref)
                            local l_Item_0 = v64.Item;
                            v64.Frame.Ready.Text = v63.accepted and "ACCEPTED" or "READY";
                            v64.Frame.Ready.Visible = v63.ready;
                            v12.target(l_Item_0.UIStroke, 1, 5, {
                                Color = if v63.ready then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(0, 0, 0)
                            });
                            local v66 = ("%*_%*"):format(v63.indexOnPlot, v63.brainrot and v63.brainrot.UUID);
                            if v56[v62] == v66 then
                                return;
                            else
                                v56[v62] = v66;
                                v57[v62]:Clean();
                                local l_brainrot_0 = v63.brainrot;
                                if not l_brainrot_0 then
                                    l_Item_0.Title.Text = "Waiting for player to select...";
                                    l_Item_0.Cash.Text = "";
                                    return;
                                else
                                    local v68 = v19[l_brainrot_0.Index];
                                    l_Item_0.Title.Text = v68 and v68.DisplayName or l_brainrot_0.Index;
                                    l_Item_0.Cash.Text = ("$%*/s"):format((v21:ToString(v23:GetGeneration(l_brainrot_0.Index, l_brainrot_0.Mutation, l_brainrot_0.Traits))));
                                    local v69 = v23:AttachOnViewportWithOptimizations(l_brainrot_0.Index, l_Item_0.ViewportFrame, nil, l_brainrot_0.Mutation);
                                    if v69 then
                                        v57[v62]:Add(v69);
                                    end;
                                    local v70 = l_brainrot_0.Traits or {};
                                    for _, v72 in v70 do
                                        local v73 = v20[v72];
                                        if v73 then
                                            local v74 = v57[v62]:Clone(l_Item_0.Traits.Template);
                                            v74.Name = v72;
                                            v74.Visible = true;
                                            v74.Image = v73.Icon;
                                            v74.Parent = l_Item_0.Traits;
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        for v76, v77 in v58 do
                            if not v57[v76] then
                                v57[v76] = v42:Extend();
                            end;
                            if v76 == tostring(l_LocalPlayer_0.UserId) then
                                l_DuelsMachineSession_0.Your.Frame.Ready.Text = v77.accepted and "ACCEPTED" or "READY";
                                l_DuelsMachineSession_0.Your.Frame.Ready.Visible = v77.ready;
                                l_DuelsMachineSession_0.Main.Visible = v59;
                                l_DuelsMachineSession_0.ScrollingFrame.Visible = not v59;
                                if v59 then
                                    v75(v76, v77, l_DuelsMachineSession_0.Main);
                                end;
                            else
                                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v76)));
                                l_DuelsMachineSession_0.Other.Frame.Username.Text = ("@%*'s Offer"):format(if l_l_Players_0_PlayerByUserId_0 then l_l_Players_0_PlayerByUserId_0.Name else "???");
                                l_DuelsMachineSession_0.Other.PlayerImage.Headshot.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(v76);
                                v75(v76, v77, l_DuelsMachineSession_0.Other);
                            end;
                        end;
                    end));
                    local v79 = v42:Extend();
                    v42:Add(v41:OnChanged("AnimalPodiums", function(v80) --[[ Line: 281 ]]
                        -- upvalues: v79 (copy), l_DuelsMachineSession_0 (ref), v19 (ref), v21 (ref), v23 (ref), v20 (ref), v15 (ref), v11 (ref), v43 (copy), l_LocalPlayer_0 (ref), v12 (ref)
                        v79:Clean();
                        for v81, v82 in v80 do
                            if typeof(v82) == "table" and not v82.Machine then
                                local v83 = v79:Clone(l_DuelsMachineSession_0.ScrollingFrame.Template);
                                v83.Visible = true;
                                local v84 = v19[v82.Index];
                                v83.Spacer.Title.Text = v84 and v84.DisplayName or v82.Index;
                                v83.Spacer.Cash.Text = ("$%*/s"):format((v21:ToString(v23:GetGeneration(v82.Index, v82.Mutation, v82.Traits))));
                                local v85 = v23:AttachOnViewportWithOptimizations(v82.Index, v83.Spacer.ViewportFrame, nil, v82.Mutation);
                                if v85 then
                                    v79:Add(v85);
                                end;
                                local v86 = v82.Traits or {};
                                for _, v88 in v86 do
                                    local v89 = v20[v88];
                                    if v89 then
                                        local v90 = v79:Clone(v83.Spacer.Traits.Template);
                                        v90.Name = v88;
                                        v90.Visible = true;
                                        v90.Image = v89.Icon;
                                        v90.Parent = v83.Spacer.Traits;
                                    end;
                                end;
                                v83.Parent = l_DuelsMachineSession_0.ScrollingFrame;
                                v79:Add(v83.Spacer.Activated:Connect(function() --[[ Line: 321 ]]
                                    -- upvalues: v15 (ref), v11 (ref), v81 (copy), v82 (copy)
                                    v15:PlaySound("Sounds.Sfx.Activated");
                                    v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Select"):FireServer(v81, v82);
                                end));
                                v86 = ("%*_%*"):format(v81, v82.UUID);
                                local v91 = true;
                                do
                                    local l_v91_0 = v91;
                                    v79:Add(v43:Observe({
                                        "players", 
                                        (tostring(l_LocalPlayer_0.UserId))
                                    }, function(v93) --[[ Line: 330 ]]
                                        -- upvalues: v86 (copy), l_v91_0 (ref), v83 (copy), v12 (ref)
                                        local v94 = ("%*_%*"):format(v93.indexOnPlot, v93.brainrot and v93.brainrot.UUID) == v86;
                                        local v95 = if v94 then Color3.fromRGB(15, 50, 15) else Color3.fromRGB(35, 45, 50);
                                        local v96 = if v94 then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(0, 0, 0);
                                        if l_v91_0 then
                                            l_v91_0 = false;
                                            v83.Spacer.BackgroundColor3 = v95;
                                            v83.Spacer.UIStroke.Color = v96;
                                            return;
                                        else
                                            v12.target(v83.Spacer, 1, 5, {
                                                BackgroundColor3 = v95
                                            });
                                            v12.target(v83.Spacer.UIStroke, 1, 5, {
                                                Color = v96
                                            });
                                            return;
                                        end;
                                    end));
                                end;
                            end;
                        end;
                    end, true));
                    return;
                end;
            end;
            workspace:GetAttributeChangedSignal("DuelsSelectBrainrotActive"):Connect(function() --[[ Line: 351 ]]
                -- upvalues: v42 (copy), v97 (copy)
                v42:Add(task.spawn(v97));
            end);
            v42:Add(task.spawn(v97));
            local function v99() --[[ Line: 357 ]] --[[ Name: updateDuelsMode ]]
                -- upvalues: v17 (ref), l_DuelsMachineSession_0 (ref)
                local l_workspace_Attribute_0 = workspace:GetAttribute("DuelsSelectedMode");
                if l_workspace_Attribute_0 and v17[l_workspace_Attribute_0] then
                    l_DuelsMachineSession_0.Mode.Text = ("<font color=\"#%*\">%*</font> mode selected!"):format(v17[l_workspace_Attribute_0].Color:ToHex(), l_workspace_Attribute_0);
                    return;
                else
                    l_DuelsMachineSession_0.Mode.Text = "";
                    return;
                end;
            end;
            workspace:GetAttributeChangedSignal("DuelsSelectedMode"):Connect(v99);
            task.spawn(v99);
            l_DuelsMachineSession_0.Your.PlayerImage.Headshot.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(l_LocalPlayer_0.UserId);
            l_DuelsMachineSession_0.Other.Ready.Activated:Connect(function() --[[ Line: 371 ]]
                -- upvalues: v3 (ref), v15 (ref), v11 (ref)
                local v100 = v3.get("SelectBrainrots");
                if not v100.Data or not workspace:GetAttribute("DuelsSelectBrainrotActive") then
                    return;
                else
                    v15:PlaySound("Sounds.Sfx.Activated");
                    local v101 = true;
                    for _, v103 in v100.Data.players do
                        if not v103.ready or not v103.brainrot then
                            v101 = false;
                            break;
                        end;
                    end;
                    if v101 then
                        v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Accept"):FireServer();
                        return;
                    else
                        v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Ready"):FireServer();
                        return;
                    end;
                end;
            end);
            l_DuelsMachineSession_0.Other.Cancel.Activated:Connect(function() --[[ Line: 394 ]]
                -- upvalues: v3 (ref), v15 (ref), v11 (ref)
                if not v3.get("SelectBrainrots").Data or not workspace:GetAttribute("DuelsSelectBrainrotActive") then
                    return;
                else
                    v15:PlaySound("Sounds.Sfx.Activated");
                    v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Cancel"):FireServer();
                    return;
                end;
            end);
            v40.OnClose:Connect(function() --[[ Line: 405 ]]
                -- upvalues: v3 (ref), v11 (ref)
                if not v3.get("SelectBrainrots").Data or not workspace:GetAttribute("DuelsSelectBrainrotActive") then
                    return;
                else
                    v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Cancel"):FireServer();
                    return;
                end;
            end);
            local v104 = v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Vote");
            v39:Observe({
                "timer"
            }, function(v105) --[[ Line: 417 ]]
                -- upvalues: l_DuelsMachineVoteFrame_0 (ref)
                l_DuelsMachineVoteFrame_0.TimerLabel.Text = v105 and ("Game starting in %* seconds"):format(v105 // 1) or "";
            end);
            for _, v107 in l_DuelsMachineVoteFrame_0.Buttons:GetChildren() do
                if v107:IsA("GuiButton") then
                    local v108 = v16.new(v107);
                    v108:Animate();
                    v108.OnActivated:Connect(function() --[[ Line: 428 ]]
                        -- upvalues: v104 (copy), v107 (copy)
                        v104:FireServer(v107.Name);
                    end);
                end;
            end;
            v39:Observe({
                "playerVotes"
            }, function(v109) --[[ Line: 433 ]]
                -- upvalues: l_DuelsMachineVoteFrame_0 (ref)
                if not v109 then
                    return;
                else
                    local v110 = {};
                    for _, v112 in v109 do
                        v110[v112] = (v110[v112] or 0) + 1;
                    end;
                    for _, v114 in l_DuelsMachineVoteFrame_0.Buttons:GetChildren() do
                        if v114:IsA("GuiButton") then
                            v114.Background.Function.Text = v110[v114.Name] or 0;
                        end;
                    end;
                    return;
                end;
            end);
            task.spawn(function() --[[ Line: 452 ]]
                -- upvalues: l_UserInputService_0 (ref), l_DuelsMachineVoteFrame_0 (ref)
                if not l_UserInputService_0:GetLastInputType() then
                    l_UserInputService_0.LastInputTypeChanged:Wait();
                end;
                if l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
                    return;
                else
                    l_DuelsMachineVoteFrame_0.Size = UDim2.fromScale(0.325, 0.3);
                    return;
                end;
            end);
            local function v115() --[[ Line: 464 ]] --[[ Name: updateVoteUIVisibility ]]
                -- upvalues: l_DuelsMachineVoteFrame_0 (ref), v12 (ref)
                if workspace:GetAttribute("DuelsVoteModeActive") then
                    l_DuelsMachineVoteFrame_0.Visible = true;
                    v12.target(l_DuelsMachineVoteFrame_0, 1, 4, {
                        Position = UDim2.fromScale(0.5, 0.08)
                    });
                    return;
                else
                    v12.target(l_DuelsMachineVoteFrame_0, 1, 4, {
                        Position = UDim2.fromScale(0.5, -0.2)
                    });
                    v12.completed(l_DuelsMachineVoteFrame_0, function() --[[ Line: 470 ]]
                        -- upvalues: l_DuelsMachineVoteFrame_0 (ref)
                        if l_DuelsMachineVoteFrame_0.Position.Y.Scale <= -0.15 then
                            l_DuelsMachineVoteFrame_0.Visible = false;
                        end;
                    end);
                    return;
                end;
            end;
            workspace:GetAttributeChangedSignal("DuelsVoteModeActive"):Connect(v115);
            task.spawn(v115);
            local v116 = v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/Animation");
            v11:RemoteEvent("DuelsMachineMatchService/SelectBrainrot/SetDevice"):FireServer(l_UserInputService_0.PreferredInput == Enum.PreferredInput.Gamepad and "Console" or l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and "Mobile" or "PC");
            local l_Label1_0 = l_DuelsMachineAnimation_0.Label1;
            local l_Label2_0 = l_DuelsMachineAnimation_0.Label2;
            local l_BlurEffect_0 = Instance.new("BlurEffect");
            l_BlurEffect_0.Size = 0;
            l_BlurEffect_0.Parent = workspace.CurrentCamera;
            v116.OnClientEvent:Connect(function(v120) --[[ Line: 494 ]]
                -- upvalues: v33 (ref), l_DuelsMachineAnimation_0 (ref), v15 (ref), v5 (ref), l_BlurEffect_0 (copy), l_Label1_0 (copy), l_Label2_0 (copy)
                while v33 do
                    task.wait();
                end;
                v33 = true;
                l_DuelsMachineAnimation_0.Visible = true;
                v15:PlaySound("Sounds.Sfx.Duels.Countdown", nil, false);
                v5(l_DuelsMachineAnimation_0, TweenInfo.new(0.25), {
                    BackgroundTransparency = 0.25
                });
                v5(l_BlurEffect_0, TweenInfo.new(0.5), {
                    Size = 20
                });
                l_Label1_0.Visible = true;
                l_Label2_0.Visible = true;
                for v121 = v120 // 1, 1, -1 do
                    local v122 = if v121 % 2 == 0 then l_Label1_0 else l_Label2_0;
                    v122.ZIndex = 2;
                    v122.TextTransparency = 1;
                    v122.Size = UDim2.fromScale(0.5, 0.5);
                    v122.Text = v121;
                    v5(v122, TweenInfo.new(0.7, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                        Size = UDim2.fromScale(0.2, 0.2)
                    }).Completed:Once(function() --[[ Line: 519 ]]
                        -- upvalues: v122 (copy), v5 (ref)
                        v122.ZIndex = 1;
                        v5(v122, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                            Size = UDim2.fromScale(0, 0)
                        });
                    end);
                    v5(v122, TweenInfo.new(0.35), {
                        TextTransparency = 0
                    });
                    task.wait(1);
                end;
                v5(l_BlurEffect_0, TweenInfo.new(0.25), {
                    Size = 0
                });
                v5(l_DuelsMachineAnimation_0, TweenInfo.new(0.25), {
                    BackgroundTransparency = 1
                }).Completed:Wait();
                l_Label1_0.TextTransparency = 1;
                l_Label2_0.TextTransparency = 1;
                l_Label1_0.Visible = false;
                l_Label2_0.Visible = false;
                l_DuelsMachineAnimation_0.Visible = false;
                v33 = false;
            end);
            l_DuelsMachineTopFrame_0.Visible = false;
            l_DuelsMachineTopFrame_0.Position = UDim2.fromScale(0.5, -0.2);
            l_Tip_0.TextTransparency = 1;
            l_Tip_0.UIStroke.Transparency = 1;
            v38:WaitForLoaded();
            l_DuelsMachineTopFrame_0.Visible = true;
            v5(l_DuelsMachineTopFrame_0, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {
                Position = UDim2.fromScale(0.5, 0.01)
            });
            v5(l_Tip_0, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 1), {
                TextTransparency = 0
            });
            v5(l_Tip_0.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 1), {
                Transparency = 0
            });
            task.delay(10.5, function() --[[ Line: 556 ]]
                -- upvalues: v5 (ref), l_Tip_0 (ref)
                v5(l_Tip_0, TweenInfo.new(0.5), {
                    TextTransparency = 1
                });
                v5(l_Tip_0.UIStroke, TweenInfo.new(0.5), {
                    Transparency = 1
                });
            end);
            v38:Observe({
                "roundTimer"
            }, function(v123) --[[ Line: 561 ]]
                -- upvalues: l_DuelsMachineTopFrame_0 (ref)
                v123 = v123 // 1;
                l_DuelsMachineTopFrame_0.Timer.Label.Text = if v123 > 60 then string.format("%d:%0.2d", v123 // 60, v123 % 60) else ("%*"):format(v123);
            end);
            local v124 = {
                l_DuelsMachineTopFrame_0.Blue, 
                l_DuelsMachineTopFrame_0.Red
            };
            local v125 = {
                PC = "rbxassetid://87143261820372", 
                Console = "rbxassetid://119798532223911", 
                Mobile = "rbxassetid://72402748445638"
            };
            local function v133() --[[ Line: 578 ]] --[[ Name: updateTopUI ]]
                -- upvalues: v38 (copy), v124 (copy), l_Players_0 (ref), v125 (copy)
                local v126 = v38:TryIndex({
                    "expectedPlayers"
                });
                local v127 = v38:TryIndex({
                    "roundWins"
                });
                if not v126 or not v127 then
                    return;
                else
                    for v128, v129 in v126 do
                        local v130 = v124[v128];
                        local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v129);
                        v130.Player.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(v129);
                        v130.Label.Text = tostring(v127[tostring(v129)] or 0);
                        local v132 = l_l_Players_0_PlayerByUserId_1 and l_l_Players_0_PlayerByUserId_1:GetAttribute("Device");
                        if v132 then
                            v130.Icon.Image = v125[v132] or "";
                        end;
                    end;
                    return;
                end;
            end;
            v38:Observe({
                "roundWins"
            }, v133);
            v38:Observe({
                "expectedPlayers"
            }, v133);
            v6.observePlayer(function(v134) --[[ Line: 602 ]]
                -- upvalues: v133 (copy), v6 (ref)
                task.spawn(v133);
                local v135 = v6.observeAttribute(v134, "Device", function() --[[ Line: 605 ]]
                    -- upvalues: v133 (ref)
                    task.spawn(v133);
                    return nil;
                end);
                return function() --[[ Line: 610 ]]
                    -- upvalues: v135 (copy), v133 (ref)
                    v135();
                    task.spawn(v133);
                end;
            end);
            return;
        end;
    end
};