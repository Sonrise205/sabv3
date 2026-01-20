local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v4 = require(l_Controllers_0.InterfaceController);
local v5 = require(l_Controllers_0.CameraController);
local v6 = require(l_Controllers_0.GameController);
local v7 = require(l_Controllers_0.SoundController);
local v8 = require(l_Controllers_0.EventController);
local v9 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v10 = require(l_ReplicatedStorage_0.Datas.ServerData);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v13 = require(l_Packages_0.Synchronizer);
local v14 = require(l_ReplicatedStorage_0.Packages.Net);
local v15 = require(l_Packages_0.Timer);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v17 = require(l_Classes_0.AnimatedButton);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v19 = require(l_Shared_0.Friends);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v21 = require(l_Utils_0.NumberUtils);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_LeftCenter_0 = l_PlayerGui_0.LeftCenter.LeftCenter;
local l_LeftBottom_0 = l_PlayerGui_0.LeftBottom.LeftBottom;
local v26 = TweenInfo.new(0.5, Enum.EasingStyle.Quint);
local v27 = nil;
local v71 = {
    Start = function(_) --[[ Line: 45 ]] --[[ Name: Start ]]
        -- upvalues: l_TweenService_0 (copy), l_LeftCenter_0 (copy), v26 (copy), v27 (ref), v4 (copy), v5 (copy), v6 (copy), v10 (copy), v17 (copy), l_PlayerGui_0 (copy), v13 (copy), v15 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v9 (copy), l_LeftBottom_0 (copy), v19 (copy), l_LocalPlayer_0 (copy), v21 (copy), v7 (copy)
        local v29 = l_TweenService_0:Create(l_LeftCenter_0, v26, {
            Position = UDim2.fromScale(l_LeftCenter_0.Position.X.Scale - 1, l_LeftCenter_0.Position.Y.Scale)
        });
        local v30 = l_TweenService_0:Create(l_LeftCenter_0, v26, {
            Position = l_LeftCenter_0.Position
        });
        v27 = v4:Register("Hud", l_LeftCenter_0, "Custom");
        v27.OnOpen:Connect(function() --[[ Line: 54 ]]
            -- upvalues: v5 (ref), v30 (copy)
            v5:Blur(0, 0.5);
            v5:Fov(v5:GetDefaultFov(), 0.5);
            v30:Play();
        end);
        v27.OnClose:Connect(function() --[[ Line: 61 ]]
            -- upvalues: v29 (copy)
            v29:Play();
        end);
        v27:Close();
        v6:OnGameLoaded(function() --[[ Line: 68 ]]
            -- upvalues: v27 (ref)
            v27:Toggle(true);
        end);
        if v10.IsDuelsServer() then
            l_LeftCenter_0.Buttons.Visible = false;
        end;
        for _, v32 in l_LeftCenter_0.Buttons:GetChildren() do
            if v32:IsA("GuiButton") then
                local v33 = v17.new(v32);
                v33:Animate();
                v33.OnActivated:Connect(function() --[[ Line: 81 ]]
                    -- upvalues: v4 (ref), v32 (copy)
                    v4:Toggle(v32.Name);
                end);
            end;
        end;
        local v34 = {};
        for _, v36 in l_PlayerGui_0:WaitForChild("ActiveEvents").ActiveEvents:GetChildren() do
            if v36:IsA("GuiObject") then
                v34[v36.Name] = v36;
            end;
        end;
        local v37 = {};
        local v38 = v13:Get("ServerLuck");
        task.spawn(function() --[[ Line: 97 ]]
            -- upvalues: v13 (ref), v38 (ref)
            v13:WaitAndCall("ServerLuck", function(v39) --[[ Line: 98 ]]
                -- upvalues: v38 (ref)
                v38 = v39;
            end);
        end);
        v15.Simple(1, function() --[[ Line: 103 ]]
            -- upvalues: v8 (ref), v38 (ref), v34 (copy), l_ReplicatedStorage_0 (ref), v37 (copy), l_TweenService_0 (ref), v9 (ref)
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            local v41 = {};
            for _, v43 in v8:GetActiveEvents() do
                v41[v43.eventName] = v43.endsAt - l_workspace_ServerTimeNow_0;
            end;
            local v44 = v38 and v38:Get("Index") or 0;
            local v45 = v41["6x Server Luck"];
            local v46 = v41["8x Server Luck"];
            local v47 = v41["10x Server Luck"];
            local v48 = v41["12x Server Luck"];
            local v49 = v41["15x Server Luck"];
            if v49 and v49 > 0 then
                v41["15x Server Luck"] = nil;
                v41.Luck = v49;
                v34.Luck.Main.Image = "rbxassetid://97625587462302";
            elseif v48 and v48 > 0 then
                v41["12x Server Luck"] = nil;
                v41.Luck = v48;
                v34.Luck.Main.Image = "rbxassetid://111270514767194";
            elseif v47 and v47 > 0 then
                v41["10x Server Luck"] = nil;
                v41.Luck = v47;
                v34.Luck.Main.Image = "rbxassetid://137888841783656";
            elseif v46 and v46 > 0 then
                v41["8x Server Luck"] = nil;
                v41.Luck = v46;
                v34.Luck.Main.Image = "rbxassetid://124799036749678";
            elseif v45 and v45 > 0 then
                v41["6x Server Luck"] = nil;
                v41.Luck = v45;
                v34.Luck.Main.Image = "rbxassetid://94933198053674";
            elseif v44 > 0 then
                v41.Luck = (v38:Get("EndTime") or l_workspace_ServerTimeNow_0) - l_workspace_ServerTimeNow_0;
                v34.Luck.Main.Image = v44 == 1 and "rbxassetid://92074411396710" or "rbxassetid://90033075589118";
            end;
            local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("FuseMachineLuckTimer");
            if l_l_ReplicatedStorage_0_Attribute_0 and l_l_ReplicatedStorage_0_Attribute_0 > 0 then
                v41["Fuse Machine Luck"] = l_l_ReplicatedStorage_0_Attribute_0;
            end;
            for _, v52 in v34 do
                local l_Name_0 = v52.Name;
                local v54 = v41[l_Name_0];
                local v55 = false;
                if v54 ~= nil then
                    v55 = v54 > 0;
                end;
                if v55 ~= v37[l_Name_0] then
                    local v56 = if v55 then TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out) else TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In);
                    local v57 = l_TweenService_0:Create(v52.Main, v56, {
                        Position = UDim2.fromScale(0.5, v55 and 0.5 or 1.5)
                    });
                    if v55 then
                        v52.Visible = true;
                    end;
                    v57:Play();
                    v57.Completed:Once(function() --[[ Line: 169 ]]
                        -- upvalues: v55 (copy), v52 (copy), v57 (copy)
                        if not v55 then
                            v52.Visible = false;
                        end;
                        v57:Cancel();
                        v57:Destroy();
                    end);
                    v37[l_Name_0] = v55;
                end;
                v52.Main.TextLabel.Text = if v54 then v9:B((math.max(v54 // 1, 0))) else v52.Main.TextLabel.Text;
            end;
        end);
        v15.Simple(5, function() --[[ Line: 186 ]]
            -- upvalues: l_LeftBottom_0 (ref), v19 (ref), l_LocalPlayer_0 (ref)
            l_LeftBottom_0.FriendBoost.Text = ("Friend Boost: +%*%%"):format((v19:GetFriendBoostPercentage(l_LocalPlayer_0)));
        end);
        if v10.IsContentCreatorGame() then
            local l_CC_0 = l_LeftBottom_0.CC;
            local v59 = UDim2.fromScale(0, -l_CC_0.Size.Y.Scale * 0.8);
            l_CC_0.Visible = true;
            local l_FriendBoost_0 = l_LeftBottom_0.FriendBoost;
            l_FriendBoost_0.Position = l_FriendBoost_0.Position + v59;
            l_FriendBoost_0 = l_LeftBottom_0.Currency;
            l_FriendBoost_0.Position = l_FriendBoost_0.Position + v59;
            l_FriendBoost_0 = l_LeftBottom_0.Cashout;
            l_FriendBoost_0.Position = l_FriendBoost_0.Position + v59;
            l_CC_0:GetPropertyChangedSignal("Parent"):Once(function() --[[ Line: 198 ]]
                -- upvalues: l_CC_0 (copy), l_LeftBottom_0 (ref), l_LocalPlayer_0 (ref)
                if l_CC_0.Parent ~= l_LeftBottom_0 then
                    l_LocalPlayer_0:Kick();
                end;
            end);
            l_CC_0:GetPropertyChangedSignal("Visible"):Once(function() --[[ Line: 204 ]]
                -- upvalues: l_CC_0 (copy), l_LocalPlayer_0 (ref)
                if not l_CC_0.Visible then
                    l_LocalPlayer_0:Kick();
                end;
            end);
        end;
        v13:WaitAndCall(l_LocalPlayer_0, function(v61) --[[ Line: 212 ]]
            -- upvalues: l_LeftBottom_0 (ref), v21 (ref), l_TweenService_0 (ref), v7 (ref)
            local l_Currency_0 = l_LeftBottom_0.Currency;
            local l_Cashout_0 = l_LeftBottom_0.Cashout;
            local v64 = TweenInfo.new(5, Enum.EasingStyle.Linear);
            v61:OnChanged("Coins", function(v65, v66) --[[ Line: 219 ]]
                -- upvalues: l_Currency_0 (copy), v21 (ref), l_Cashout_0 (copy), l_TweenService_0 (ref), v64 (copy), v7 (ref)
                l_Currency_0.Text = ("$%*"):format((v21:ToString(v65, 2)));
                if v66 then
                    local v67 = v65 - v66;
                    if v67 == 0 then
                        return;
                    else
                        local v68 = l_Cashout_0.Template:Clone();
                        v68.Text = ("%*$%*"):format(v67 > 0 and "+" or "-", (v21:ToString(math.abs(v67), 2)));
                        v68.TextColor3 = v67 < 0 and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(13, 255, 0);
                        v68.Visible = true;
                        v68.Parent = l_Cashout_0;
                        local v69 = l_TweenService_0:Create(v68, v64, {
                            TextTransparency = 1
                        });
                        local v70 = l_TweenService_0:Create(v68.UIStroke, v64, {
                            Transparency = 1
                        });
                        v69.Completed:Once(function() --[[ Line: 234 ]]
                            -- upvalues: v68 (copy)
                            v68:Destroy();
                        end);
                        v69:Play();
                        v70:Play();
                        if v67 > 0 then
                            v7:PlaySound("Sounds.Sfx.Cashout");
                        end;
                    end;
                end;
            end, true);
        end);
    end
};
task.spawn(function() --[[ Line: 248 ]]
    -- upvalues: v10 (copy), l_LocalPlayer_0 (copy), l_Players_0 (copy), v14 (copy)
    if not v10.IsDevGame() then
        return;
    else
        local l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("Role");
        while l_l_LocalPlayer_0_Attribute_0 == nil do
            l_LocalPlayer_0:GetAttributeChangedSignal("Role"):Wait();
            l_l_LocalPlayer_0_Attribute_0 = l_LocalPlayer_0:GetAttribute("Role");
        end;
        if l_l_LocalPlayer_0_Attribute_0 ~= "Dev" and l_l_LocalPlayer_0_Attribute_0 ~= "Lead" then
            local l_Name_1 = l_Players_0.LocalPlayer.Name;
            local l_ScreenGui_0 = Instance.new("ScreenGui");
            l_ScreenGui_0.Enabled = true;
            l_ScreenGui_0.IgnoreGuiInset = true;
            l_ScreenGui_0.Name = utf8.char(65279);
            l_ScreenGui_0.ResetOnSpawn = false;
            l_ScreenGui_0.Parent = l_Players_0.LocalPlayer.PlayerGui;
            local l_ScreenGui_1 = Instance.new("ScreenGui");
            l_ScreenGui_1.Enabled = true;
            l_ScreenGui_1.IgnoreGuiInset = true;
            l_ScreenGui_1.Name = utf8.char(65279);
            l_ScreenGui_1.ResetOnSpawn = false;
            l_ScreenGui_1.Parent = l_ScreenGui_0;
            for v76 = -89, 2848, 89 do
                local v77 = string.rep("@" .. l_Name_1 .. " ", 2000);
                local v78 = UDim2.new(2, 0, 0, 89);
                local v79 = UDim2.new(0.5, 0, 0, v76);
                local v80 = Vector2.new(0.5, 0);
                local l_TextLabel_0 = Instance.new("TextLabel");
                l_TextLabel_0.Size = v78;
                l_TextLabel_0.AnchorPoint = v80;
                l_TextLabel_0.Position = v79;
                l_TextLabel_0.BackgroundTransparency = 1;
                l_TextLabel_0.TextTransparency = 0.8;
                l_TextLabel_0.MaxVisibleGraphemes = -1;
                l_TextLabel_0.TextColor3 = Color3.fromRGB(0, 0, 0);
                l_TextLabel_0.TextSize = 30;
                l_TextLabel_0.TextWrapped = true;
                l_TextLabel_0.Font = Enum.Font.SourceSansBold;
                l_TextLabel_0.Rotation = 5;
                l_TextLabel_0.Text = v77;
                l_TextLabel_0.Parent = l_ScreenGui_1;
                task.spawn(function() --[[ Line: 299 ]]
                    -- upvalues: l_TextLabel_0 (copy), v77 (copy), v78 (copy), v79 (copy), v80 (copy), l_ScreenGui_1 (copy), l_ScreenGui_0 (copy), l_Players_0 (ref), l_LocalPlayer_0 (ref), v14 (ref)
                    while true do
                        if not l_TextLabel_0.Visible or l_TextLabel_0.Rotation ~= 5 or l_TextLabel_0.TextSize ~= 30 or not l_TextLabel_0.TextWrapped or math.abs(0.8 - l_TextLabel_0.TextTransparency) > 0.1 or l_TextLabel_0.Text ~= v77 or l_TextLabel_0.Size ~= v78 or l_TextLabel_0.Position ~= v79 or l_TextLabel_0.AnchorPoint ~= v80 or l_TextLabel_0.Parent ~= l_ScreenGui_1 or l_TextLabel_0.Font ~= Enum.Font.SourceSansBold or l_TextLabel_0.MaxVisibleGraphemes ~= -1 or not l_ScreenGui_1.Enabled or l_ScreenGui_1.Parent ~= l_ScreenGui_0 or l_ScreenGui_0.Parent ~= l_Players_0.LocalPlayer.PlayerGui then
                            task.spawn(function() --[[ Line: 318 ]]
                                -- upvalues: l_LocalPlayer_0 (ref), v14 (ref)
                                l_LocalPlayer_0:Kick();
                                v14:RemoteEvent("92e5a494-0ab4-4c4e-ae6b-96e5f4a2a698"):FireServer((0/0));
                                local function v82() --[[ Line: 323 ]] --[[ Name: e ]]
                                    -- upvalues: v82 (copy)
                                    local _ = buffer.create(1073741824);
                                    v82();
                                end;
                                while true do
                                    task.spawn(v82);
                                end;
                            end);
                        end;
                        task.wait();
                    end;
                end);
            end;
        end;
        return;
    end;
end);
return v71;