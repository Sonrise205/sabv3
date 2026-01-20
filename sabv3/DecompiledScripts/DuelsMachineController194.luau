local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SocialService_0 = game:GetService("SocialService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local v5 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v6 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v7 = require(l_ReplicatedStorage_0.Packages.Observers);
local v8 = require(l_ReplicatedStorage_0.Shared.UsersAPI);
local v9 = require(l_ReplicatedStorage_0.Packages.Promise);
local v10 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v11 = require(l_ReplicatedStorage_0.Packages.Trove);
local v12 = require(l_ReplicatedStorage_0.Packages.Net);
local v13 = require(l_ReplicatedStorage_0.Packages.Spr);
local v14 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v15 = require(l_ReplicatedStorage_0.Controllers.ConfirmationController);
local v16 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v17 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v18 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local v19 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v20 = require(l_ReplicatedStorage_0.Shared.Friends);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_DuelsMachinePlayerList_0 = l_PlayerGui_0:WaitForChild("DuelsMachinePlayerList").DuelsMachinePlayerList;
local l_DuelsMachinePrompt_0 = l_PlayerGui_0:WaitForChild("DuelsMachinePrompt").DuelsMachinePrompt;
local v26 = v12:RemoteEvent("DuelsMachineService/ReconnectWarn");
local v27 = v12:RemoteEvent("DuelsMachineService/CreateInvite");
local v28 = v12:RemoteEvent("DuelsMachineService/Reconnect");
local v29 = v12:RemoteFunction("DuelsMachineService/AcceptInvite");
local v30 = v12:RemoteFunction("DuelsMachineService/SearchUser");
local v31 = v12:RemoteFunction("DuelsMachineService/Invite");
local v35 = {
    IsEnabled = function(_) --[[ Line: 58 ]] --[[ Name: IsEnabled ]]
        -- upvalues: v10 (copy), v19 (copy)
        return not v10:GetInstant("DuelsMachineService/Disabled") and not v19.IsNewPlayersServer() and not v19.IsDuelsServer() and not v19.IsTsunamiServer() and true;
    end, 
    SendInvite = function(_, v34) --[[ Line: 66 ]] --[[ Name: SendInvite ]]
        -- upvalues: v31 (copy)
        return v31:InvokeServer(v34);
    end
};
local v36 = nil;
local v37 = 0;
local function v39() --[[ Line: 80 ]] --[[ Name: getOnlineFriends ]]
    -- upvalues: v36 (ref), v37 (ref), v9 (copy), l_LocalPlayer_0 (copy)
    local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
    if v36 == nil or l_UnixTimestamp_0 - v37 >= 600 or v36:getStatus() == v9.Status.Rejected then
        v37 = l_UnixTimestamp_0;
        v36 = v9.try(function() --[[ Line: 84 ]]
            -- upvalues: l_LocalPlayer_0 (ref)
            return l_LocalPlayer_0:GetFriendsOnlineAsync(200);
        end);
    end;
    return v36:await();
end;
v35._createPlayerList = function(_) --[[ Line: 92 ]] --[[ Name: _createPlayerList ]]
    -- upvalues: v16 (copy), l_DuelsMachinePlayerList_0 (copy), v17 (copy), v35 (copy), v14 (copy), l_SocialService_0 (copy), l_LocalPlayer_0 (copy), l_HttpService_0 (copy), v11 (copy), v20 (copy), l_Players_0 (copy), v39 (copy), v19 (copy), v30 (copy), v8 (copy), v18 (copy), v7 (copy)
    local v41 = v16:Register("DuelsMachinePlayerList", l_DuelsMachinePlayerList_0, "TopQuint");
    v41:AttachCloseButton(l_DuelsMachinePlayerList_0.Header.Close);
    v41:Close();
    local l_SearchBox_0 = l_DuelsMachinePlayerList_0.SearchFrame.SearchBox;
    local v43 = nil;
    local v44 = nil;
    local function v51(v45, v46, v47, v48) --[[ Line: 111 ]] --[[ Name: updateUserCard ]]
        local v49 = ("%*_%*"):format(v46.username, v46.userId);
        local v50 = v48 or v45:FindFirstChild(v49);
        if not v50 then
            return;
        else
            v50.Fill.Status2.Text = v46.inGame and "Online" or v46.isFriend and "Away" or "Offline";
            v50.Fill.Status2.TextColor3 = if v46.inGame then Color3.fromRGB(86, 211, 74) else if v46.isFriend then Color3.fromRGB(239, 225, 69) else Color3.fromRGB(211, 38, 38);
            v50.Fill.PlayerImage.Status.BackgroundColor3 = if v46.inGame then Color3.fromRGB(86, 211, 74) else if v46.isFriend then Color3.fromRGB(239, 225, 69) else Color3.fromRGB(211, 38, 38);
            v50.Fill.Send.BackgroundColor3 = if v46.inGame and v46.canInvite or v46.isFriend then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(112, 112, 112);
            v50.LayoutOrder = if v46.inGame then v47 else v47 + 300;
            return;
        end;
    end;
    local function v63(v52, v53, v54) --[[ Line: 128 ]] --[[ Name: createUserCard ]]
        -- upvalues: l_DuelsMachinePlayerList_0 (ref), v51 (copy), v17 (ref), v35 (ref), v14 (ref), l_SocialService_0 (ref), l_LocalPlayer_0 (ref), l_HttpService_0 (ref)
        local v55 = ("%*_%*"):format(v53.username, v53.userId);
        local v56 = l_DuelsMachinePlayerList_0.LocalList.UIListLayout.Template:Clone();
        v56.Name = v55;
        v56.Fill.PlayerImage.Headshot.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(v53.userId);
        v56.Fill.Username.Text = ("@%*"):format(v53.username);
        v51(v52, v53, v54, v56);
        v56.Visible = true;
        v56.Parent = v52;
        local v57 = false;
        v56.Fill.Send.Activated:Connect(function() --[[ Line: 141 ]]
            -- upvalues: v53 (copy), v57 (ref), v17 (ref), v35 (ref), v14 (ref), v56 (copy), l_SocialService_0 (ref), l_LocalPlayer_0 (ref), l_HttpService_0 (ref)
            if not v53.canInvite or v57 then
                return;
            else
                v17:PlaySound("Sounds.Sfx.Activated");
                if v53.inGame then
                    v57 = true;
                    xpcall(function() --[[ Line: 151 ]]
                        -- upvalues: v35 (ref), v53 (ref), v14 (ref), v56 (ref)
                        local v58, v59 = v35:SendInvite(v53.userId);
                        if not v58 and typeof(v59) == "string" then
                            v14:Error(v59);
                        end;
                        v56.Fill.Send.Txt.Text = v58 and "SENT!" or "FAILED";
                        task.wait(5);
                        v56.Fill.Send.Txt.Text = "SEND";
                    end, warn);
                    v57 = false;
                    return;
                else
                    if v53.isFriend then
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 164 ]]
                            -- upvalues: l_SocialService_0 (ref), l_LocalPlayer_0 (ref)
                            return l_SocialService_0:CanSendGameInviteAsync(l_LocalPlayer_0);
                        end);
                        if not l_status_0 or not l_result_0 then
                            return;
                        else
                            local l_ExperienceInviteOptions_0 = Instance.new("ExperienceInviteOptions");
                            l_ExperienceInviteOptions_0.InviteUser = v53.userId;
                            l_ExperienceInviteOptions_0.PromptMessage = ("Invite %* to a duel"):format(v53.username);
                            l_ExperienceInviteOptions_0.LaunchData = l_HttpService_0:JSONEncode({
                                type = "DuelsInvite", 
                                sender = l_LocalPlayer_0.UserId
                            });
                            l_SocialService_0:PromptGameInvite(l_LocalPlayer_0, l_ExperienceInviteOptions_0);
                        end;
                    end;
                    return;
                end;
            end;
        end);
        return v56;
    end;
    local v64 = v11.new();
    local function v76() --[[ Line: 190 ]] --[[ Name: updateLists ]]
        -- upvalues: v44 (ref), v64 (copy), v43 (ref), v20 (ref), l_LocalPlayer_0 (ref), l_Players_0 (ref), v39 (ref), v19 (ref), v63 (copy), l_DuelsMachinePlayerList_0 (ref)
        local v65 = coroutine.running();
        v44 = v65;
        v64:Clean();
        if v43 == "Global" then
            return;
        else
            local l_v20_InGameFriends_0 = v20:GetInGameFriends(l_LocalPlayer_0);
            local v67 = {};
            if v43 == "Server" then
                for _, v69 in l_Players_0:GetPlayers() do
                    if v69 ~= l_LocalPlayer_0 then
                        table.insert(v67, {
                            username = v69.Name, 
                            userId = v69.UserId, 
                            inGame = true, 
                            canInvite = true, 
                            isFriend = table.find(l_v20_InGameFriends_0, v69) ~= nil
                        });
                    end;
                end;
            elseif v43 == "Friends" then
                local v70, v71 = v39();
                if v70 and typeof(v71) == "table" then
                    for _, v73 in v71 do
                        table.insert(v67, {
                            username = v73.UserName, 
                            userId = v73.VisitorId, 
                            inGame = v73.PlaceId and table.find(v19.AllPlaces, v73.PlaceId) ~= nil, 
                            canInvite = true, 
                            isFriend = true
                        });
                    end;
                end;
            end;
            if v65 ~= v44 then
                return;
            else
                for v74, v75 in v67 do
                    v64:Add((v63(l_DuelsMachinePlayerList_0.LocalList, v75, v74)));
                end;
                return;
            end;
        end;
    end;
    local function v80(v77) --[[ Line: 241 ]] --[[ Name: setTab ]]
        -- upvalues: v43 (ref), l_SearchBox_0 (copy), l_DuelsMachinePlayerList_0 (ref), v76 (copy)
        if v43 == v77 then
            return;
        else
            v43 = v77;
            l_SearchBox_0.Text = "";
            l_DuelsMachinePlayerList_0.LocalList.Visible = v43 ~= "Global";
            l_DuelsMachinePlayerList_0.GlobalList.Visible = v43 == "Global";
            l_DuelsMachinePlayerList_0.SearchFrame.Visible = v43 == "Global";
            for _, v79 in l_DuelsMachinePlayerList_0.Btns:GetChildren() do
                if v79:IsA("GuiButton") then
                    v79.BackgroundColor3 = if v79.Name == v43 then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(115, 152, 172);
                end;
            end;
            v76();
            return;
        end;
    end;
    l_Players_0.PlayerAdded:Connect(function() --[[ Line: 267 ]]
        -- upvalues: v43 (ref), v76 (copy)
        if v43 == "Server" then
            v76();
        end;
    end);
    l_Players_0.PlayerRemoving:Connect(function() --[[ Line: 273 ]]
        -- upvalues: v43 (ref), v76 (copy)
        if v43 == "Server" then
            v76();
        end;
    end);
    l_DuelsMachinePlayerList_0.SearchFrame.SearchBox.FocusLost:Connect(function(v81) --[[ Line: 279 ]]
        -- upvalues: l_SearchBox_0 (copy), v64 (copy), l_Players_0 (ref), v30 (ref), v8 (ref), v63 (copy), l_DuelsMachinePlayerList_0 (ref)
        if not v81 then
            return;
        else
            local l_Text_0 = l_SearchBox_0.Text;
            l_SearchBox_0.TextEditable = false;
            l_SearchBox_0.Active = false;
            l_SearchBox_0.Text = "...";
            v64:Clean();
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 293 ]]
                -- upvalues: l_Players_0 (ref), l_Text_0 (copy)
                return l_Players_0:GetUserIdFromNameAsync(l_Text_0);
            end);
            if not l_status_1 or typeof(l_result_1) ~= "number" then
                l_SearchBox_0.Text = string.find(l_result_1, "Unknown user") and "User not found!" or "Failed to search for user, try again later";
                task.wait(5);
                l_SearchBox_0.Text = "";
                l_SearchBox_0.TextEditable = true;
                l_SearchBox_0.Active = true;
                return false;
            else
                local v85, v86, v87, v88 = pcall(function() --[[ Line: 309 ]]
                    -- upvalues: v30 (ref), l_result_1 (copy)
                    return v30:InvokeServer(l_result_1);
                end);
                if not v85 or not v86 then
                    l_SearchBox_0.Text = if typeof(v86) == "string" then v86 else if typeof(v87) == "string" then v87 else "Failed to search for user, try again later";
                    task.wait(5);
                    l_SearchBox_0.Text = "";
                    l_SearchBox_0.TextEditable = true;
                    l_SearchBox_0.Active = true;
                    return false;
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 326 ]]
                        -- upvalues: v8 (ref), l_result_1 (copy)
                        return v8:GetUser(l_result_1);
                    end);
                    v64:Add((v63(l_DuelsMachinePlayerList_0.GlobalList, {
                        userId = l_result_1, 
                        username = if l_status_2 and typeof(l_result_2) == "table" and l_result_2.IsLoaded then l_result_2.Username else string.upper(l_Text_0), 
                        inGame = v87, 
                        canInvite = v88
                    }, 1)));
                    l_SearchBox_0.Text = "";
                    task.wait(5);
                    l_SearchBox_0.TextEditable = true;
                    l_SearchBox_0.ClearTextOnFocus = true;
                    l_SearchBox_0.Active = true;
                    return;
                end;
            end;
        end;
    end);
    for _, v92 in l_DuelsMachinePlayerList_0.Btns:GetChildren() do
        if v92:IsA("GuiButton") then
            local l_Name_0 = v92.Name;
            local v94 = v18.new(v92);
            v94:Animate();
            v94.OnActivated:Connect(function() --[[ Line: 356 ]]
                -- upvalues: v80 (copy), l_Name_0 (copy)
                v80(l_Name_0);
            end);
        end;
    end;
    v80("Server");
    v7.observeTag("DuelsMachinePrompt", function(v95) --[[ Line: 363 ]]
        -- upvalues: v16 (ref)
        local v96 = v95.Triggered:Connect(function() --[[ Line: 364 ]]
            -- upvalues: v16 (ref)
            v16:Toggle("DuelsMachinePlayerList");
        end);
        return function() --[[ Line: 368 ]]
            -- upvalues: v96 (copy)
            v96:Disconnect();
        end;
    end);
end;
v35._createInvites = function(_) --[[ Line: 374 ]] --[[ Name: _createInvites ]]
    -- upvalues: l_DuelsMachinePrompt_0 (copy), v7 (copy), v13 (copy), v27 (copy), v8 (copy), v6 (copy), v17 (copy), v29 (copy), v14 (copy), v28 (copy), v5 (copy), l_LocalPlayer_0 (copy), v15 (copy), v26 (copy)
    local v98 = {};
    local function _(v99) --[[ Line: 377 ]] --[[ Name: getYfromIndex ]]
        return 1 - (v99 - 1) * 0.14800000000000002;
    end;
    local v101 = nil;
    local function v102() --[[ Line: 382 ]] --[[ Name: updateHolderPosition ]]
        -- upvalues: v101 (ref), l_DuelsMachinePrompt_0 (ref)
        if v101 then
            l_DuelsMachinePrompt_0.AnchorPoint = Vector2.new(0.5, 1);
            l_DuelsMachinePrompt_0.Position = UDim2.fromScale(0.5, 1) + UDim2.fromOffset(0, v101.Position.Y.Offset);
            return;
        else
            l_DuelsMachinePrompt_0.AnchorPoint = Vector2.new(0.5, 0.5);
            l_DuelsMachinePrompt_0.Position = UDim2.fromScale(0.5, 1);
            return;
        end;
    end;
    v7.observeTag("JumpButton", function(v103) --[[ Line: 393 ]]
        -- upvalues: v101 (ref), v102 (copy)
        v101 = v103;
        local v104 = v103:GetPropertyChangedSignal("Position"):Connect(v102);
        v102();
        return function() --[[ Line: 397 ]]
            -- upvalues: v104 (copy), v101 (ref), v103 (copy), v102 (ref)
            v104:Disconnect();
            if v101 == v103 then
                v101 = nil;
                v102();
            end;
        end;
    end);
    local function _(v105) --[[ Line: 406 ]] --[[ Name: getY ]]
        -- upvalues: v98 (copy)
        for v106, v107 in v98 do
            if v107 == v105 then
                return 1 - (v106 - 1) * 0.14800000000000002;
            end;
        end;
        return 1;
    end;
    local function v111() --[[ Line: 416 ]] --[[ Name: reconcileInvites ]]
        -- upvalues: v98 (copy), v13 (ref)
        for v109, v110 in v98 do
            if v110.frame then
                v13.target(v110.frame, 1, 5, {
                    Position = UDim2.fromScale(1, 1 - (v109 - 1) * 0.14800000000000002)
                });
            end;
        end;
    end;
    v27.OnClientEvent:Connect(function(v112, v113) --[[ Line: 424 ]]
        -- upvalues: v8 (ref), v98 (copy), v111 (copy), v13 (ref), l_DuelsMachinePrompt_0 (ref), v6 (ref), v17 (ref), v29 (ref), v14 (ref)
        local v114 = false;
        print(v112, v113);
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        local v116 = v113.expires - l_workspace_ServerTimeNow_0;
        if v116 <= 0 then
            return;
        else
            local l_v8_User_0 = v8:GetUser(v113.from);
            if not l_v8_User_0 then
                return;
            else
                local v118 = {
                    id = v112, 
                    invite = v113, 
                    frame = nil
                };
                table.insert(v98, v118);
                local function v120() --[[ Line: 446 ]] --[[ Name: destroy ]]
                    -- upvalues: v98 (ref), v118 (copy), v111 (ref), v13 (ref)
                    local v119 = table.find(v98, v118);
                    if not v119 then
                        return;
                    else
                        table.remove(v98, v119);
                        v111();
                        if v118.frame then
                            v13.target(v118.frame, 1, 5, {
                                Position = UDim2.fromScale(1, 1.2)
                            });
                            task.delay(1, function() --[[ Line: 457 ]]
                                -- upvalues: v118 (ref)
                                v118.frame:Destroy();
                            end);
                        end;
                        return;
                    end;
                end;
                local v121;
                for v122, v123 in v98 do
                    if v123 == v118 then
                        v121 = 1 - (v122 - 1) * 0.14800000000000002;
                        v114 = true;
                    end;
                    if v114 then
                        break;
                    end;
                end;
                if not v114 then
                    v121 = 1;
                end;
                v114 = false;
                local v124 = nil;
                local v125 = l_DuelsMachinePrompt_0.InviteTemplate:Clone();
                v125.Username.Text = ("@%* invited you to a Duel!"):format(l_v8_User_0.Username);
                v125.Visible = true;
                v125.Position = UDim2.fromScale(1.3, v121);
                v125.Parent = l_DuelsMachinePrompt_0;
                v6(v125.Fill, TweenInfo.new(v116), {
                    Size = UDim2.fromScale(0, v125.Fill.Size.Y.Scale)
                });
                local v126 = false;
                v125.Yes.Activated:Connect(function() --[[ Line: 476 ]]
                    -- upvalues: v126 (ref), v17 (ref), v113 (copy), v120 (copy), v29 (ref), v112 (copy), v14 (ref), v124 (ref)
                    if v126 then
                        return;
                    else
                        v17:PlaySound("Sounds.Sfx.Activated");
                        if workspace:GetServerTimeNow() > v113.expires then
                            v120();
                            return;
                        else
                            v126 = true;
                            xpcall(function() --[[ Line: 490 ]]
                                -- upvalues: v29 (ref), v112 (ref), v14 (ref), v124 (ref), v120 (ref)
                                local v127, v128 = v29:InvokeServer(v112);
                                if not v127 and typeof(v128) == "string" then
                                    v14:Error(v128);
                                    return;
                                else
                                    if v124 and coroutine.status(v124) == "suspended" then
                                        pcall(task.cancel, v124);
                                    end;
                                    v120();
                                    return;
                                end;
                            end, warn);
                            v126 = false;
                            return;
                        end;
                    end;
                end);
                v125.No.Activated:Connect(function() --[[ Line: 508 ]]
                    -- upvalues: v113 (copy), v120 (copy), v17 (ref), v124 (ref)
                    if workspace:GetServerTimeNow() > v113.expires then
                        v120();
                        return;
                    else
                        v17:PlaySound("Sounds.Sfx.Activated");
                        if v124 and coroutine.status(v124) == "suspended" then
                            pcall(task.cancel, v124);
                        end;
                        v120();
                        return;
                    end;
                end);
                v118.frame = v125;
                v111();
                v124 = task.delay(v116, v120);
                return;
            end;
        end;
    end);
    v28.OnClientEvent:Connect(function(v129) --[[ Line: 530 ]]
        -- upvalues: v8 (ref), v5 (ref), l_LocalPlayer_0 (ref), v15 (ref), v26 (ref), v28 (ref)
        local _, l_result_3 = pcall(function() --[[ Line: 531 ]]
            -- upvalues: v8 (ref), v129 (copy)
            return v8:GetUser(v129);
        end);
        if not l_result_3 or not l_result_3.IsLoaded then
            return;
        else
            local v132 = v5:Wait(l_LocalPlayer_0);
            if not v132 then
                return;
            else
                local v133 = v15:Show(("You disconnected an active duel with @%*"):format(l_result_3.Username), 600, "ReconnectTemplate");
                if not v133 then
                    if not v132:Get("DuelsReconnectWarn") then
                        if v15:Show("Leaving the duel will count as a forfeit and you will lose your brainrot! Are you sure?", 60, "WarningTemplate") then
                            v26:FireServer();
                            return;
                        end;
                    else
                        return;
                    end;
                end;
                v28:FireServer(v133);
                return;
            end;
        end;
    end);
end;
v35.Start = function(v134) --[[ Line: 562 ]] --[[ Name: Start ]]
    task.spawn(v134._createPlayerList, v134);
    task.spawn(v134._createInvites, v134);
end;
return v35;