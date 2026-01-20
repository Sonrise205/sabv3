local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("TweenService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v9 = require(l_Packages_0.Net);
local v10 = require(l_Packages_0.Trove);
local v11 = require(l_Controllers_0.InterfaceController);
local _ = require(l_Controllers_0.CameraController);
local v13 = require(l_Classes_0.AnimatedButton);
local v14 = require(l_Packages_0.Synchronizer);
local v15 = require(l_Utils_0.NumberUtils);
local v16 = require(l_Datas_0.RodsShopItems);
local v17 = require(l_Controllers_0.NotificationController);
local v18 = require(l_Controllers_0.SoundController);
local v19 = require(l_Shared_0.Updates);
local v20 = v9:RemoteFunction("RodsShopService/RequestBuy");
local v21 = v9:RemoteFunction("RodsShopService/RequestEquip");
local v22 = v9:RemoteEvent("RodsShopService/UpdateOwnedRods");
local v23 = v9:RemoteEvent("RodsShopService/UpdateEquippedRod");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v26 = {
    ["Starter Rod"] = true
};
local v27 = "Starter Rod";
local l_RodsShop_0 = l_PlayerGui_0:WaitForChild("RodsShop"):WaitForChild("RodsShop");
local l_Items_0 = l_RodsShop_0.Content.Items;
local l_Template_0 = l_Items_0.UIListLayout.Template;
local l_Close_0 = l_RodsShop_0.Header.Close;
local v32 = nil;
local v33 = v10.new();
local v34 = {};
local function v54() --[[ Line: 57 ]] --[[ Name: CreateRodsShopItems ]]
    -- upvalues: v33 (copy), v14 (copy), l_LocalPlayer_0 (copy), v16 (copy), l_Template_0 (copy), v27 (ref), v26 (copy), v15 (copy), v13 (copy), v21 (copy), v20 (copy), v17 (copy), v18 (copy), l_Items_0 (copy)
    v33:Destroy();
    local v35 = v14:Get(l_LocalPlayer_0);
    if not v35 then
        return;
    else
        for v36, v37 in pairs(v16) do
            if v37.Currency == "Coins" then
                local v38 = v33:Clone(l_Template_0);
                local l_ItemInformation_0 = v38.ItemInformation;
                local l_ItemName_0 = l_ItemInformation_0.ItemName;
                local l_ItemDescription_0 = l_ItemInformation_0.ItemDescription;
                local l_ItemImage_0 = v38.ItemImage;
                local l_Buy_0 = v38.Buy;
                local l_Price_0 = l_Buy_0.Price;
                local l_Locked_0 = v38.Locked;
                local l_Txt_0 = l_Locked_0.Txt;
                v38.Name = v36;
                l_ItemName_0.Text = v36;
                l_ItemDescription_0.Text = v37.Description;
                l_ItemImage_0.Image = v37.Icon;
                v38.Luck.Text = ("[%*x Cast Luck]"):format(v37.Luck);
                v38.LayoutOrder = v37.LayoutOrder or 0;
                v33:Add(v35:OnChanged("Rebirth", function() --[[ Line: 88 ]] --[[ Name: updateLockState ]]
                    -- upvalues: l_Locked_0 (copy), l_Txt_0 (copy), l_Buy_0 (copy), v37 (copy), v35 (copy)
                    l_Locked_0.Visible = true;
                    l_Txt_0.Visible = true;
                    l_Buy_0.Visible = true;
                    if v37.RebirthRequired then
                        if (v35:Get("Rebirth") or 0) >= v37.RebirthRequired then
                            l_Locked_0.Visible = false;
                            return;
                        else
                            l_Txt_0.Text = "YOU NEED " .. v37.RebirthRequired .. " REBIRTHS";
                            l_Buy_0.Visible = false;
                            return;
                        end;
                    else
                        l_Locked_0.Visible = false;
                        l_Txt_0.Visible = false;
                        return;
                    end;
                end));
                l_Locked_0.Visible = true;
                l_Txt_0.Visible = true;
                l_Buy_0.Visible = true;
                if v37.RebirthRequired then
                    if (v35:Get("Rebirth") or 0) >= v37.RebirthRequired then
                        l_Locked_0.Visible = false;
                    else
                        l_Txt_0.Text = "YOU NEED " .. v37.RebirthRequired .. " REBIRTHS";
                        l_Buy_0.Visible = false;
                    end;
                else
                    l_Locked_0.Visible = false;
                    l_Txt_0.Visible = false;
                end;
                local v47 = v33:Extend();
                local function v52() --[[ Line: 111 ]] --[[ Name: updateBuyState ]]
                    -- upvalues: v47 (copy), v35 (copy), v37 (copy), l_Price_0 (copy), v27 (ref), v36 (copy), v26 (ref), v15 (ref), l_Buy_0 (copy), v13 (ref), v21 (ref), v20 (ref), v17 (ref), v18 (ref)
                    v47:Clean();
                    local _ = (v35:Get("Coins") or 0) >= v37.Price;
                    l_Price_0.Text = v27 == v36 and "OWNED" or v26[v36] and "EQUIP" or "$ " .. v15:ToString(v37.Price, 2);
                    if v27 == v36 then
                        l_Buy_0.ImageColor3 = Color3.fromRGB(138, 138, 138);
                        return;
                    else
                        l_Buy_0.ImageColor3 = Color3.fromRGB(255, 255, 255);
                        local v49 = v47:Add(v13.new(l_Buy_0));
                        v49:Animate();
                        v47:Add(v49.OnActivated:Connect(function() --[[ Line: 126 ]]
                            -- upvalues: v26 (ref), v36 (ref), v21 (ref), v20 (ref), v17 (ref), v18 (ref)
                            local v50, v51 = (if v26[v36] then v21 else v20):InvokeServer(v36);
                            if v50 then
                                v17:Success(v51);
                                v18:PlaySound("Sounds.Sfx.Success");
                                return;
                            else
                                v17:Error(v51);
                                v18:PlaySound("Sounds.Sfx.Error");
                                return;
                            end;
                        end));
                        return;
                    end;
                end;
                v33:Add(v35:OnChanged("Coins", v52));
                v52();
                local _ = nil;
                v38.Visible = not v37.IsEnabled or v37.IsEnabled();
                v38.Parent = l_Items_0;
            end;
        end;
        return;
    end;
end;
v34.Start = function(_) --[[ Line: 155 ]] --[[ Name: Start ]]
    -- upvalues: v32 (ref), v11 (copy), l_RodsShop_0 (copy), l_Close_0 (copy), v14 (copy), l_LocalPlayer_0 (copy), v19 (copy), v54 (copy), v22 (copy), v26 (copy), v23 (copy), v27 (ref)
    v32 = v11:Register("RodsShop", l_RodsShop_0, "TopQuint");
    v32:AttachCloseButton(l_Close_0);
    v32:Close();
    v14:WaitAndCall(l_LocalPlayer_0, function(_) --[[ Line: 161 ]]
        -- upvalues: v19 (ref), v54 (ref)
        v19.OnUpdateEnabled:Connect(function() --[[ Line: 162 ]]
            -- upvalues: v54 (ref)
            v54();
        end);
        v19.OnUpdateDisabled:Connect(function() --[[ Line: 166 ]]
            -- upvalues: v54 (ref)
            v54();
        end);
        v54();
    end);
    v22.OnClientEvent:Connect(function(v57) --[[ Line: 173 ]]
        -- upvalues: v26 (ref), v54 (ref)
        table.clear(v26);
        for v58, v59 in v57 do
            v26[v58] = v59;
        end;
        v54();
    end);
    v23.OnClientEvent:Connect(function(v60) --[[ Line: 183 ]]
        -- upvalues: v27 (ref), v54 (ref)
        v27 = v60;
        v54();
    end);
    v22:FireServer();
end;
return v34;