local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("TweenService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v6 = require(l_Packages_0.Net);
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v8 = require(l_Controllers_0.SoundController);
local v9 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v10 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
local l_Notification_0 = l_PlayerGui_0:WaitForChild("Notification").Notification;
local l_Template_0 = l_Notification_0.Template;
local v14 = v6:RemoteEvent("NotificationService/Notify");
local v15 = TweenInfo.new(1, Enum.EasingStyle.Linear);
local v16 = {};
local v17 = {
    "rainbow", 
    "og", 
    "yellowred", 
    "zebra", 
    "greenred", 
    "slowgreenred"
};
local function v25(v18) --[[ Line: 37 ]] --[[ Name: transformRichText ]]
    -- upvalues: v17 (copy)
    local v19 = {};
    for _, v21 in v17 do
        local v22 = ("<%*>(.-)</%*>"):format(v21, v21);
        local v23, v24 = string.gsub(v18, v22, "<stroke transparency=\"0\"><font transparency=\"0\">%1</font></stroke>");
        if v24 > 0 then
            v18 = string.gsub(v18, v22, "<stroke transparency=\"1\"><font transparency=\"1\">%1</font></stroke>");
            table.insert(v19, {
                tag = v21, 
                text = v23
            });
        end;
    end;
    return v18, v19;
end;
v16.Error = function(_, v27) --[[ Line: 62 ]] --[[ Name: Error ]]
    -- upvalues: v16 (copy)
    local v28 = ("<font color=\"#FA0103\">%*</font>"):format(v27);
    v16:Notify(v28, 5, "Sounds.Sfx.Error");
end;
v16.Success = function(_, v30) --[[ Line: 67 ]] --[[ Name: Success ]]
    -- upvalues: v16 (copy)
    local v31 = ("<font color=\"#92FF67\">%*</font>"):format(v30);
    v16:Notify(v31, 5, "Sounds.Sfx.Success");
end;
local v32 = {};
v16.Notify = function(_, v34, v35, v36, v37, _, v39, v40) --[[ Line: 73 ]] --[[ Name: Notify ]]
    -- upvalues: v25 (copy), v32 (copy), v8 (copy), v9 (copy), l_Template_0 (copy), l_PlayerGui_0 (copy), l_Notification_0 (copy), v10 (copy), v15 (copy)
    task.spawn(function() --[[ Line: 74 ]]
        -- upvalues: v25 (ref), v34 (copy), v35 (ref), v40 (copy), v39 (copy), v32 (ref), v36 (copy), v8 (ref), v9 (ref), l_Template_0 (ref), v37 (copy), l_PlayerGui_0 (ref), l_Notification_0 (ref), v10 (ref), v15 (ref)
        local v41, v42 = v25(v34);
        v35 = v35 or 5;
        if v40 and v39 ~= nil and v32[v39] then
            v32[v39]:Destroy();
            v32[v39] = nil;
            return;
        elseif v41 == "" then
            if v36 then
                v8:PlaySound(v36);
            end;
            return;
        else
            local function v50(v43, v44) --[[ Line: 93 ]] --[[ Name: applyText ]]
                -- upvalues: v41 (copy), v42 (copy), v9 (ref)
                if v44 then
                    for _, v46 in v43:GetChildren() do
                        if v46:IsA("TextLabel") then
                            v46:Destroy();
                        end;
                    end;
                end;
                v43.Text = v41;
                for _, v48 in v42 do
                    local v49 = v43:Clone();
                    v49:ClearAllChildren();
                    v49.Text = ("<stroke transparency=\"1\"><font transparency=\"1\">%*</font></stroke>"):format(v48.text);
                    v49.Size = UDim2.fromScale(1, 1);
                    v49.Position = UDim2.fromScale(0.5, 0.5);
                    v49.AnchorPoint = Vector2.new(0.5, 0.5);
                    v49.Parent = v43;
                    if v48.tag == "rainbow" then
                        v9.apply(v49, "Rainbow");
                    elseif v48.tag == "zebra" then
                        v9.apply(v49, "Zebra");
                    elseif v48.tag == "og" then
                        v9.apply(v49, "OG");
                    elseif v48.tag == "yellowred" then
                        v9.apply(v49, "YellowRed");
                    elseif v48.tag == "greenred" then
                        v9.apply(v49, "GreenRed");
                    elseif v48.tag == "slowgreenred" then
                        v9.apply(v49, "SlowGreenRed");
                    end;
                end;
            end;
            local v51 = false;
            if v39 ~= nil then
                v51 = v32[v39];
            end;
            if v51 then
                v50(v51, true);
                return;
            else
                local v52 = l_Template_0:Clone();
                if v39 ~= nil then
                    v32[v39] = v52;
                end;
                if v36 then
                    v8:PlaySound(v36);
                end;
                v52.Visible = true;
                v50(v52, false);
                v52.Parent = if v37 == "Top" then l_PlayerGui_0:WaitForChild("TopNotification").TopNotification else l_Notification_0;
                task.wait(v35);
                if not v52:IsDescendantOf(l_PlayerGui_0) then
                    if v39 ~= nil then
                        v32[v39] = nil;
                    end;
                    return;
                else
                    for _, v54 in v52:GetChildren() do
                        if v54:IsA("TextLabel") then
                            v10(v52, v15, {
                                TextTransparency = 1
                            });
                            v10(v52.UIStroke, v15, {
                                Transparency = 1
                            });
                        end;
                    end;
                    task.wait(v15.Time);
                    v52:Destroy();
                    if v39 ~= nil then
                        v32[v39] = nil;
                    end;
                    return;
                end;
            end;
        end;
    end);
end;
v16.Start = function(_) --[[ Line: 196 ]] --[[ Name: Start ]]
    -- upvalues: l_UserInputService_0 (copy), l_GuiService_0 (copy), l_Notification_0 (copy), v14 (copy), v16 (copy), l_PlayerGui_0 (copy)
    task.spawn(function() --[[ Line: 197 ]]
        -- upvalues: l_UserInputService_0 (ref), l_GuiService_0 (ref), l_Notification_0 (ref)
        if not l_UserInputService_0:GetLastInputType() then
            l_UserInputService_0.LastInputTypeChanged:Wait();
        end;
        if l_UserInputService_0.PreferredInput ~= Enum.PreferredInput.Touch then
            return;
        else
            local v56 = 60;
            if l_GuiService_0:IsTenFootInterface() then
                v56 = 100;
            end;
            local v57 = v56 + 5 + 5;
            l_Notification_0.AnchorPoint = Vector2.new(0.5, 1);
            l_Notification_0.Position = UDim2.fromScale(0.5, 1) - UDim2.fromOffset(0, v57);
            return;
        end;
    end);
    v14.OnClientEvent:Connect(function(...) --[[ Line: 217 ]]
        -- upvalues: v16 (ref)
        v16:Notify(...);
    end);
    local function v58() --[[ Line: 221 ]] --[[ Name: onTopbarInsetUpdate ]]
        -- upvalues: l_PlayerGui_0 (ref), l_GuiService_0 (ref)
        l_PlayerGui_0:WaitForChild("TopNotification").TopNotification.Position = UDim2.fromScale(0.5, 0.075) + UDim2.fromOffset(0, l_GuiService_0.TopbarInset.Height);
    end;
    l_GuiService_0:GetPropertyChangedSignal("TopbarInset"):Connect(v58);
    l_PlayerGui_0:WaitForChild("TopNotification").TopNotification.Position = UDim2.fromScale(0.5, 0.075) + UDim2.fromOffset(0, l_GuiService_0.TopbarInset.Height);
end;
return v16;