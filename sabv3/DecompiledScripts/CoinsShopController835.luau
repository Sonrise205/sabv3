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
local v16 = require(l_Datas_0.ShopItems);
local v17 = require(l_Controllers_0.NotificationController);
local v18 = require(l_Controllers_0.SoundController);
local v19 = require(l_Shared_0.Updates);
local v20 = v9:RemoteFunction("CoinsShopService/RequestBuy");
local v21 = v9:RemoteFunction("CoinsShopService/ToggleAutoBuy");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v24 = {};
local l_CoinsShop_0 = l_PlayerGui_0:WaitForChild("CoinsShop"):WaitForChild("CoinsShop");
local l_Items_0 = l_CoinsShop_0.Content.Items;
local l_Template_0 = l_Items_0.Template;
local l_Close_0 = l_CoinsShop_0.Header.Close;
local v29 = nil;
local v30 = v10.new();
local v31 = {};
local function v38(v32) --[[ Line: 53 ]] --[[ Name: CountPlayerTools ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local v33 = 0;
    for _, v35 in l_LocalPlayer_0.Backpack:GetChildren() do
        if v35.Name == v32 then
            v33 = v33 + 1;
        end;
    end;
    local l_Character_0 = l_LocalPlayer_0.Character;
    local v37 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Tool");
    if v37 and v37.Name == v32 then
        v33 = v33 + 1;
    end;
    return v33;
end;
local function v64() --[[ Line: 72 ]] --[[ Name: CreateCoinsShopItems ]]
    -- upvalues: v30 (copy), v14 (copy), l_LocalPlayer_0 (copy), v16 (copy), l_Template_0 (copy), v13 (copy), v21 (copy), v17 (copy), v18 (copy), v24 (copy), v38 (copy), v15 (copy), v20 (copy), l_Items_0 (copy)
    v30:Destroy();
    local v39 = v14:Get(l_LocalPlayer_0);
    if not v39 then
        return;
    else
        for v40, v41 in pairs(v16) do
            if v41.Currency == "Coins" then
                local v42 = v30:Clone(l_Template_0);
                local l_ItemInformation_0 = v42.ItemInformation;
                local l_ItemName_0 = l_ItemInformation_0.ItemName;
                local l_ItemDescription_0 = l_ItemInformation_0.ItemDescription;
                local l_ItemImage_0 = v42.ItemImage;
                local l_Buy_0 = v42.Buy;
                local l_Auto_0 = v42.Auto;
                local _ = v42.AutoLabel;
                local l_Price_0 = l_Buy_0.Price;
                local l_Locked_0 = v42.Locked;
                local l_Txt_0 = l_Locked_0.Txt;
                v42.Name = v40;
                l_ItemName_0.Text = v40;
                l_ItemDescription_0.Text = v41.Description;
                l_ItemImage_0.Image = v41.Icon;
                v42.LayoutOrder = v41.LayoutOrder or 0;
                local v53 = v13.new(l_Auto_0);
                v53:Animate();
                v53.OnActivated:Connect(function() --[[ Line: 105 ]]
                    -- upvalues: v21 (ref), v40 (copy), v17 (ref), v18 (ref)
                    local v54, v55 = v21:InvokeServer(v40);
                    if not v54 then
                        if v55 then
                            v17:Error(v55);
                        end;
                        v18:PlaySound("Sounds.Sfx.Error");
                    end;
                end);
                l_Auto_0.Yes.Visible = v39:Get((("AutoBuy.%*"):format(v40))) == true;
                v30:Add(v39:OnChanged(("AutoBuy.%*"):format(v40), function(v56) --[[ Line: 117 ]]
                    -- upvalues: l_Auto_0 (copy)
                    l_Auto_0.Yes.Visible = v56 == true;
                end));
                v30:Add(v39:OnChanged("Rebirth", function() --[[ Line: 121 ]] --[[ Name: updateLockState ]]
                    -- upvalues: l_Auto_0 (copy), l_Locked_0 (copy), l_Txt_0 (copy), l_Buy_0 (copy), v41 (copy), v39 (copy)
                    l_Auto_0.Visible = true;
                    l_Locked_0.Visible = true;
                    l_Txt_0.Visible = true;
                    l_Buy_0.Visible = true;
                    if v41.RebirthRequired then
                        if (v39:Get("Rebirth") or 0) >= v41.RebirthRequired then
                            l_Locked_0.Visible = false;
                            return;
                        else
                            l_Txt_0.Text = "YOU NEED " .. v41.RebirthRequired .. " REBIRTHS";
                            l_Buy_0.Visible = false;
                            l_Auto_0.Visible = false;
                            return;
                        end;
                    else
                        l_Locked_0.Visible = false;
                        l_Txt_0.Visible = false;
                        return;
                    end;
                end));
                l_Auto_0.Visible = true;
                l_Locked_0.Visible = true;
                l_Txt_0.Visible = true;
                l_Buy_0.Visible = true;
                if v41.RebirthRequired then
                    if (v39:Get("Rebirth") or 0) >= v41.RebirthRequired then
                        l_Locked_0.Visible = false;
                    else
                        l_Txt_0.Text = "YOU NEED " .. v41.RebirthRequired .. " REBIRTHS";
                        l_Buy_0.Visible = false;
                        l_Auto_0.Visible = false;
                    end;
                else
                    l_Locked_0.Visible = false;
                    l_Txt_0.Visible = false;
                end;
                v24[v40] = v38(v40);
                local v57 = v30:Extend();
                local function v62() --[[ Line: 148 ]] --[[ Name: updateBuyState ]]
                    -- upvalues: v57 (copy), v39 (copy), v41 (copy), v40 (copy), l_LocalPlayer_0 (ref), l_Price_0 (copy), v15 (ref), v24 (ref), l_Buy_0 (copy), v13 (ref), v20 (ref), v17 (ref), v18 (ref)
                    v57:Clean();
                    local v58 = (v39:Get("Coins") or 0) >= v41.Price;
                    if v58 then
                        if v40 == "Trap" then
                            v58 = (l_LocalPlayer_0:GetAttribute("TrapCount") or 0) < 5;
                            l_Price_0.Text = v58 and "$ " .. v15:ToString(v41.Price, 2) or "OWNED";
                        else
                            v58 = not v24[v40] or v24[v40] <= 0;
                        end;
                    end;
                    l_Price_0.Text = v24[v40] and v24[v40] > 0 and "OWNED" or "$ " .. v15:ToString(v41.Price, 2);
                    if v58 then
                        l_Buy_0.ImageColor3 = Color3.fromRGB(255, 255, 255);
                        local v59 = v57:Add(v13.new(l_Buy_0));
                        v59:Animate();
                        v57:Add(v59.OnActivated:Connect(function() --[[ Line: 168 ]]
                            -- upvalues: v20 (ref), v40 (ref), v17 (ref), v18 (ref), v24 (ref)
                            local v60, v61 = v20:InvokeServer(v40);
                            if v60 then
                                v17:Success(v61);
                                v18:PlaySound("Sounds.Sfx.Success");
                                v24[v40] = (v24[v40] or 0) + 1;
                                return;
                            else
                                v17:Error(v61);
                                v18:PlaySound("Sounds.Sfx.Error");
                                return;
                            end;
                        end));
                        return;
                    else
                        l_Buy_0.ImageColor3 = Color3.fromRGB(138, 138, 138);
                        return;
                    end;
                end;
                if v40 == "Trap" then
                    v30:Add(l_LocalPlayer_0:GetAttributeChangedSignal("TrapCount"):Connect(v62));
                end;
                v30:Add(v39:OnChanged("Coins", v62));
                v62();
                local _ = nil;
                v42.Visible = not v41.IsEnabled or v41.IsEnabled();
                v42.Parent = l_Items_0;
            end;
        end;
        return;
    end;
end;
v31.Start = function(_) --[[ Line: 204 ]] --[[ Name: Start ]]
    -- upvalues: v29 (ref), v11 (copy), l_CoinsShop_0 (copy), l_Close_0 (copy), v14 (copy), l_LocalPlayer_0 (copy), v19 (copy), v64 (copy)
    v29 = v11:Register("CoinsShop", l_CoinsShop_0, "TopQuint");
    v29:AttachCloseButton(l_Close_0);
    v29:Close();
    v14:WaitAndCall(l_LocalPlayer_0, function(_) --[[ Line: 210 ]]
        -- upvalues: v19 (ref), v64 (ref)
        v19.OnUpdateEnabled:Connect(function() --[[ Line: 211 ]]
            -- upvalues: v64 (ref)
            v64();
        end);
        v19.OnUpdateDisabled:Connect(function() --[[ Line: 215 ]]
            -- upvalues: v64 (ref)
            v64();
        end);
        v64();
    end);
end;
return v31;