local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_CommerceService_0 = game:GetService("CommerceService");
local _ = game:GetService("ConfigService");
local l_CollectionService_0 = game:GetService("CollectionService");
local v7 = l_RunService_0:IsStudio() and true;
local v8 = l_RunService_0:IsStudio() and true;
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v10 = require(l_Controllers_0.InterfaceController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v12 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v13 = require(l_ReplicatedStorage_0.Packages.Spr);
local v14 = require(l_Packages_0.Synchronizer);
local v15 = require(l_Packages_0.Observers);
local v16 = require(l_Packages_0.Replion);
local v17 = require(l_Packages_0.FFlags);
local v18 = require(l_Packages_0.Signal);
local v19 = require(l_Packages_0.Timer);
local v20 = require(l_Packages_0.Trove);
local v21 = require(l_Packages_0.Net);
local v22 = require(l_ReplicatedStorage_0.Shared.Mutations);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v24 = require(l_Classes_0.AnimatedButton);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v26 = require(l_Utils_0.NumberUtils);
local v27 = require(l_Utils_0.TimeUtils);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v29 = require(l_Shared_0.Animals);
local v30 = require(l_Shared_0.Marketplace);
local v31 = require(l_Shared_0.Updates);
local v32 = require(l_Shared_0.Policy);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v34 = require(l_Datas_0.ServerLuck);
local v35 = require(l_Datas_0.LuckyBlocks);
local v36 = require(l_Datas_0.Mutations);
local v37 = require(l_Datas_0.Shop);
local v38 = require(l_ReplicatedStorage_0.Datas.MerchShopData);
local v39 = require(l_ReplicatedStorage_0.UserGenerated.ABTests);
local v40 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_Shop_0 = l_PlayerGui_0:WaitForChild("Shop").Shop;
local v44 = l_Shop_0:QueryDescendants(".Shop_BlackFridaySale");
local v45 = nil;
local l_GiftPlayer_0 = l_PlayerGui_0:WaitForChild("GiftPlayer").GiftPlayer;
local l_Close_0 = l_GiftPlayer_0:WaitForChild("Header"):WaitForChild("Close");
local l_List_0 = l_GiftPlayer_0:WaitForChild("Main"):WaitForChild("List");
local l_Template_0 = l_List_0:WaitForChild("Template");
local l_GiftPlayerSelect_0 = l_Shop_0.GiftPlayerSelect;
local l_GiftButton_0 = l_GiftPlayerSelect_0:WaitForChild("GiftButton");
local l_Txt_0 = l_GiftButton_0:WaitForChild("Txt");
local l_PlayerSelected_0 = l_GiftPlayerSelect_0:WaitForChild("PlayerSelected");
local l_Headshot_0 = l_PlayerSelected_0:WaitForChild("PlayerImage"):WaitForChild("Headshot");
local l_PlayerName_0 = l_PlayerSelected_0:WaitForChild("PlayerName");
local v56 = v21:RemoteEvent("ShopService/Purchase");
local v57 = v19.new(300);
local v58 = nil;
local v59 = v18.new();
local v60 = v18.new();
local v61 = nil;
local v62 = {
    GiftFrame = l_GiftPlayer_0, 
    ToggleGiftSignal = v59
};
local _ = function(v63) --[[ Line: 105 ]] --[[ Name: BLACKFRIDAY_toggleSaleLabels ]]
    -- upvalues: v45 (ref), v44 (copy)
    if v45 == v63 then
        return;
    else
        v45 = v63;
        for _, v65 in v44 do
            v65.Visible = v63;
        end;
        return;
    end;
end;
local function _(v67) --[[ Line: 115 ]] --[[ Name: formatPriceInRobux ]]
    -- upvalues: v26 (copy)
    if v67 == 999999999 then
        return "???";
    else
        return (v26:Comma(v67));
    end;
end;
local function _(v69) --[[ Line: 119 ]] --[[ Name: formatPriceInUSD ]]
    if v69 == 999999999 then
        return "$???";
    else
        return (("$%*"):format((string.format(v69, "%0.2f"))));
    end;
end;
local function _(v71) --[[ Line: 123 ]] --[[ Name: formatPriceInRobuxToUSD ]]
    if v71 == 999999999 then
        return "$???";
    else
        local v72 = math.ceil(0.012375 * v71 * 100) / 100;
        if v72 == 999999999 then
            return "$???";
        else
            return (("$%*"):format((string.format(v72, "%0.2f"))));
        end;
    end;
end;
local v74 = {};
local function _(v75) --[[ Line: 135 ]] --[[ Name: unbindLabelProductPrice ]]
    -- upvalues: v74 (copy)
    if v74[v75] then
        v74[v75]:Destroy();
    end;
end;
local function v97(v77, v78, v79, v80) --[[ Line: 141 ]] --[[ Name: bindLabelToProductPrice ]]
    -- upvalues: v17 (copy), v26 (copy), v30 (copy), v20 (copy), v74 (copy)
    v79 = v79 or "Product";
    local v81 = "\238\128\130";
    if v80 then
        v81 = ("<font weight=\"%*\">%*</font>"):format(v80, v81);
    end;
    local v82 = nil;
    local function v85() --[[ Line: 155 ]] --[[ Name: updateLabel ]]
        -- upvalues: v17 (ref), v78 (copy), v82 (ref), v77 (copy), v81 (ref), v26 (ref)
        local l_v17_Instant_0 = v17:GetInstant("CustomProductPrices", {});
        local v84 = l_v17_Instant_0 and l_v17_Instant_0[tostring(v78)] or v82;
        if not v84 then
            v77.Text = ("%*???"):format(v81);
            return;
        else
            v77.Text = ("%*%*"):format(v81, v84 == 999999999 and "???" or v26:Comma(v84));
            return;
        end;
    end;
    local function v88() --[[ Line: 166 ]] --[[ Name: updateRbxPrice ]]
        -- upvalues: v30 (ref), v78 (copy), v79 (ref), v82 (ref), v85 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 167 ]]
            -- upvalues: v30 (ref), v78 (ref), v79 (ref)
            return v30:GetProductInfo(v78, v79);
        end);
        if l_status_0 and l_result_0.PriceInRobux then
            v82 = l_result_0.PriceInRobux;
        else
            v82 = "???";
        end;
        v85();
    end;
    v85();
    local v89 = v20.new();
    v74[v77] = v89;
    v89:Add(function() --[[ Line: 184 ]]
        -- upvalues: v74 (ref), v77 (copy)
        v74[v77] = nil;
    end);
    v89:Add(v77.Destroying:Connect(function() --[[ Line: 188 ]]
        -- upvalues: v89 (copy)
        v89:Destroy();
    end));
    local l_v17_Instant_1 = v17:GetInstant("RefreshClientDisplayedPrices");
    local l_v17_Instant_2 = v17:GetInstant("CustomProductPrices");
    local function v96() --[[ Line: 195 ]] --[[ Name: checkForFFlagUpdates ]]
        -- upvalues: v17 (ref), l_v17_Instant_1 (ref), v30 (ref), v78 (copy), v79 (ref), v82 (ref), v85 (copy), l_v17_Instant_2 (ref)
        local l_v17_Instant_3 = v17:GetInstant("RefreshClientDisplayedPrices");
        if l_v17_Instant_3 ~= l_v17_Instant_1 then
            l_v17_Instant_1 = l_v17_Instant_3;
            v30:RemoveCache(v78);
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 167 ]]
                -- upvalues: v30 (ref), v78 (ref), v79 (ref)
                return v30:GetProductInfo(v78, v79);
            end);
            if l_status_1 and l_result_1.PriceInRobux then
                v82 = l_result_1.PriceInRobux;
            else
                v82 = "???";
            end;
            v85();
        end;
        local l_v17_Instant_4 = v17:GetInstant("CustomProductPrices");
        if l_v17_Instant_4 ~= l_v17_Instant_2 then
            l_v17_Instant_2 = l_v17_Instant_4;
            v85();
        end;
    end;
    v89:Add(v17:OnUpdate(v96));
    v89:Add(v17:OnChange("CustomProductPrices", v85));
    v89:Add(v17:OnChange("RefreshClientDisplayedPrices", v96));
    v89:Add(task.spawn(v88));
    return v89;
end;
local function _(v98, v99) --[[ Line: 220 ]] --[[ Name: SetLayoutOrder ]]
    local l_v98_Attribute_0 = v98:GetAttribute("OriginalOrder");
    if not l_v98_Attribute_0 then
        l_v98_Attribute_0 = v98.LayoutOrder;
        v98:SetAttribute("OriginalOrder", l_v98_Attribute_0);
    end;
    v98.LayoutOrder = v99 or l_v98_Attribute_0;
end;
local function v195() --[[ Line: 232 ]] --[[ Name: SetupLuckyBlocks ]]
    -- upvalues: l_Shop_0 (copy), v32 (copy), l_Players_0 (copy), v17 (copy), v27 (copy), v20 (copy), v22 (copy), v29 (copy), l_RunService_0 (copy), v31 (copy), v61 (ref), v35 (copy), v36 (copy), v24 (copy), v56 (copy), v58 (ref), v97 (copy), v14 (copy), l_LocalPlayer_0 (copy), v19 (copy), v39 (copy)
    local l_LuckyBlocksList_0 = l_Shop_0.Content.List.LuckyBlocksList;
    local l_LuckyBlocks_0 = l_Shop_0.Content.List.LuckyBlocks;
    l_LuckyBlocksList_0.Visible = false;
    l_LuckyBlocks_0.Visible = false;
    l_Shop_0.Content.List["Festive Lucky Block"].Visible = false;
    local v104 = v32.getPolicy(l_Players_0.LocalPlayer);
    if not v104 or v104.ArePaidRandomItemsRestricted then
        return;
    else
        l_LuckyBlocksList_0.Visible = true;
        l_LuckyBlocks_0.Visible = true;
        l_Shop_0.Content.List["Festive Lucky Block"].Visible = true;
        task.spawn(function() --[[ Line: 250 ]]
            -- upvalues: v17 (ref), l_LuckyBlocks_0 (copy), v27 (ref)
            while true do
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local v106 = v17:GetInstant("LuckyBlockEndTimer", 1753545600) - l_workspace_ServerTimeNow_0;
                l_LuckyBlocks_0.Text = if v106 > 0 then ("LUCKY BLOCKS (<font color=\"#ffff00\">%*</font>)"):format((v27:E(v106))) else "LUCKY BLOCKS";
                task.wait(1);
            end;
        end);
        local function v135(v107, v108) --[[ Line: 259 ]] --[[ Name: setupOdds ]]
            -- upvalues: v20 (ref), v22 (ref), v29 (ref), l_RunService_0 (ref), v31 (ref), v61 (ref)
            local v109 = v20.new();
            local v110 = nil;
            local function v134(v111) --[[ Line: 266 ]] --[[ Name: setOddsVisibility ]]
                -- upvalues: v107 (copy), v110 (ref), v22 (ref), v108 (copy), v109 (copy), v29 (ref), l_RunService_0 (ref)
                v107.Visible = v111;
                if v111 == v110 then
                    return;
                else
                    v110 = v111;
                    if v111 then
                        local v112 = v22.get();
                        local v113 = {};
                        for _, v115 in v108.Animals do
                            if (not v115.IsEnabled or v115.IsEnabled()) and v115.Chance then
                                table.insert(v113, {
                                    animal = v115.Name, 
                                    chance = v115.Chance
                                });
                            end;
                        end;
                        table.sort(v113, function(v116, v117) --[[ Line: 291 ]]
                            return v117.chance < v116.chance;
                        end);
                        local v118 = v107:GetAttribute("XScalar") or 1;
                        local v119 = v107.Template.Size.X.Scale * v118;
                        local v120 = math.ceil(1 / v119) + 1;
                        local v121 = math.ceil(v120 / #v113) * #v113;
                        local v122 = table.create(v121);
                        local v123 = 0;
                        for v124 = 1, v121 do
                            local v125 = v113[1 + (v124 - 1) % #v113];
                            local v126 = v109:Clone(v107.Template);
                            v126.Name = tostring(v124);
                            v126.LayoutOrder = v124;
                            v126.Chance.Text = ("%*%%"):format(v125.chance);
                            v126.Visible = true;
                            v126.Position = UDim2.fromScale(v123, 0.5);
                            v126.Parent = v107;
                            v123 = v123 + v119;
                            v122[v124] = v126;
                            local v127 = v29:AttachOnViewport(v125.animal, v126, true, v112);
                            if v127 then
                                v109:Add(v127);
                            end;
                        end;
                        if v120 <= #v122 then
                            local v128 = 0.5;
                            if v118 > 1 then
                                v128 = v128 * v118;
                            end;
                            do
                                local l_v128_0 = v128;
                                v109:Add(l_RunService_0.PreRender:Connect(function(v130) --[[ Line: 353 ]]
                                    -- upvalues: v119 (ref), l_v128_0 (ref), v122 (copy)
                                    local v131 = v119 * v130 * l_v128_0;
                                    for _, v133 in v122 do
                                        v133.Position = v133.Position - UDim2.fromScale(v131, 0);
                                        if v133.Position.X.Scale <= -v119 then
                                            v133.Position = v133.Position + UDim2.fromScale(v119 * #v122, 0);
                                        end;
                                    end;
                                end));
                            end;
                        end;
                        return;
                    else
                        v109:Clean();
                        return;
                    end;
                end;
            end;
            v31.OnUpdateEnabled:Connect(function() --[[ Line: 369 ]]
                -- upvalues: v107 (copy), v61 (ref), v110 (ref), v109 (copy), v134 (copy)
                if v107.Visible and v61:IsOpened() then
                    v107.Visible = false;
                    if v110 ~= false then
                        v110 = false;
                        v109:Clean();
                    end;
                    v134(true);
                end;
            end);
            v31.OnUpdateDisabled:Connect(function() --[[ Line: 376 ]]
                -- upvalues: v107 (copy), v61 (ref), v110 (ref), v109 (copy), v134 (copy)
                if v107.Visible and v61:IsOpened() then
                    v107.Visible = false;
                    if v110 ~= false then
                        v110 = false;
                        v109:Clean();
                    end;
                    v134(true);
                end;
            end);
            v61.OnClose:Connect(function() --[[ Line: 383 ]]
                -- upvalues: v107 (copy), v110 (ref), v109 (copy)
                v107.Visible = false;
                if v110 == false then
                    return;
                else
                    v110 = false;
                    v109:Clean();
                    return;
                end;
            end);
            v61.OnOpen:Connect(function() --[[ Line: 387 ]]
                -- upvalues: v134 (copy)
                v134(true);
            end);
            v22.watch(function() --[[ Line: 391 ]]
                -- upvalues: v107 (copy), v61 (ref), v110 (ref), v109 (copy), v134 (copy)
                if v107.Visible and v61:IsOpened() then
                    v107.Visible = false;
                    if v110 ~= false then
                        v110 = false;
                        v109:Clean();
                    end;
                    v134(true);
                end;
            end);
        end;
        local function v155(v136, v137, v138) --[[ Line: 399 ]] --[[ Name: setup ]]
            -- upvalues: v35 (ref), v135 (copy), v20 (ref), v61 (ref), v22 (ref), v36 (ref), v29 (ref), v24 (ref), v56 (ref), v58 (ref), v97 (ref)
            local v139 = v137 or v136.Name;
            local v140 = v35[v139];
            if not v140 then
                return;
            else
                local v141 = v138 or v140.ProductId;
                if not v141 then
                    return;
                else
                    for _, v143 in ipairs(v136:GetChildren()) do
                        if v143.Name == "Odds" then
                            local v144 = v143:GetAttribute("LuckyBlock") or v139;
                            v135(v143, v35[v144]);
                        end;
                    end;
                    local v145 = v20.new();
                    local function v152() --[[ Line: 425 ]] --[[ Name: updateInfo ]]
                        -- upvalues: v145 (copy), v61 (ref), v22 (ref), v36 (ref), v136 (copy), v139 (copy), v29 (ref)
                        v145:Destroy();
                        if not v61:IsOpened() then
                            return;
                        else
                            local v146 = v22.get();
                            local v147 = v146 and v36[v146];
                            if v147 then
                                v136.Mutation.Text = v147.DisplayWithRichText;
                                v136.Mutation.Visible = true;
                            else
                                v136.Mutation.Visible = nil;
                            end;
                            for _, v149 in ipairs(v136:GetChildren()) do
                                if v149:IsA("ViewportFrame") and v149.Name == "IconViewport" then
                                    local v150 = v149:GetAttribute("LuckyBlock") or v139;
                                    local v151 = v29:AttachOnViewport(v150, v149, true, v146);
                                    if v151 then
                                        v145:Add(v151);
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end;
                    task.spawn(v152);
                    v61.OnClose:Connect(function() --[[ Line: 454 ]]
                        -- upvalues: v152 (copy)
                        v152();
                    end);
                    v61.OnOpen:Connect(function() --[[ Line: 458 ]]
                        -- upvalues: v152 (copy)
                        v152();
                    end);
                    v22.watch(function() --[[ Line: 462 ]]
                        -- upvalues: v152 (copy)
                        task.spawn(v152);
                    end);
                    local v153 = v24.new(v136.Buy);
                    v153:Animate();
                    v153.OnActivated:Connect(function() --[[ Line: 468 ]]
                        -- upvalues: v136 (copy), v56 (ref), v141 (copy), v58 (ref)
                        local l_Attribute_0 = v136.Buy:GetAttribute("GiftProductId");
                        v56:FireServer(l_Attribute_0 or v141, v58);
                    end);
                    task.spawn(function() --[[ Line: 474 ]]
                        -- upvalues: v97 (ref), v136 (copy), v141 (copy)
                        v97(v136.Buy.Price, v141, "Product", 100);
                    end);
                    return;
                end;
            end;
        end;
        task.spawn(function() --[[ Line: 481 ]]
            -- upvalues: v17 (ref), l_Shop_0 (ref), v135 (copy), v35 (ref), v20 (ref), v61 (ref), v22 (ref), v36 (ref), v29 (ref), v24 (ref), v56 (ref), v58 (ref), v14 (ref), l_LocalPlayer_0 (ref), v97 (ref), v19 (ref), v27 (ref)
            local function _() --[[ Line: 485 ]] --[[ Name: isLuckyBlockActive ]]
                -- upvalues: v17 (ref)
                return workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
            end;
            local v157 = l_Shop_0.Content.List["Festive Lucky Block"];
            for _, v159 in ipairs(v157:GetChildren()) do
                if v159.Name == "Odds" then
                    v135(v159, v35["Premium Festive Lucky Block"]);
                end;
            end;
            local v160 = v20.new();
            local function v166() --[[ Line: 505 ]] --[[ Name: updateInfo ]]
                -- upvalues: v160 (copy), v61 (ref), v22 (ref), v36 (ref), v157 (copy), v29 (ref)
                v160:Destroy();
                if not v61:IsOpened() then
                    return;
                else
                    local v161 = v22.get();
                    local v162 = v161 and v36[v161];
                    if v162 then
                        v157.Mutation.Text = v162.DisplayWithRichText;
                        v157.Mutation.Visible = true;
                    else
                        v157.Mutation.Visible = nil;
                    end;
                    for _, v164 in ipairs(v157:GetChildren()) do
                        if v164:IsA("ViewportFrame") and v164.Name == "IconViewport" then
                            local v165 = v29:AttachOnViewport("Premium Festive Lucky Block", v164, true, v161);
                            if v165 then
                                v160:Add(v165);
                            end;
                        end;
                    end;
                    return;
                end;
            end;
            task.spawn(v166);
            v61.OnClose:Connect(function() --[[ Line: 533 ]]
                -- upvalues: v166 (copy)
                v166();
            end);
            v61.OnOpen:Connect(function() --[[ Line: 537 ]]
                -- upvalues: v166 (copy)
                v166();
            end);
            v22.watch(function() --[[ Line: 541 ]]
                -- upvalues: v166 (copy)
                task.spawn(v166);
            end);
            local v167 = v24.new(v157.Buttons.Buy);
            v167:Animate();
            v167.OnActivated:Connect(function() --[[ Line: 547 ]]
                -- upvalues: v56 (ref), v58 (ref)
                v56:FireServer(3478819642, v58);
            end);
            local v168 = v24.new(v157.Buttons.Buy3);
            v168:Animate();
            v168.OnActivated:Connect(function() --[[ Line: 553 ]]
                -- upvalues: v56 (ref), v58 (ref)
                v56:FireServer(3478819641, v58);
            end);
            local v169 = v24.new(v157.Buttons.Buy10);
            v169:Animate();
            v169.OnActivated:Connect(function() --[[ Line: 559 ]]
                -- upvalues: v56 (ref), v58 (ref)
                v56:FireServer(3478819648, v58);
            end);
            local function v172() --[[ Line: 563 ]] --[[ Name: updateBuyVisibility ]]
                -- upvalues: v14 (ref), l_LocalPlayer_0 (ref), v169 (copy), v168 (copy)
                local v170 = v14:Get(l_LocalPlayer_0);
                if not v170 then
                    return;
                else
                    local v171 = v170:Get({
                        "LuckyBlocks", 
                        (tostring(3478819641))
                    }) or 0;
                    v169.Instance.Visible = v171 >= 5;
                    v168.Instance.Visible = v171 < 5;
                    return;
                end;
            end;
            task.spawn(function() --[[ Line: 577 ]]
                -- upvalues: v97 (ref), v157 (copy)
                v97(v157.Buttons.Buy.Price, 3478819642, "Product");
                v97(v157.Buttons.Buy3.Price, 3478819641, "Product");
                v97(v157.Buttons.Buy10.Price, 3478819648, "Product");
            end);
            task.spawn(function() --[[ Line: 583 ]]
                -- upvalues: v14 (ref), l_LocalPlayer_0 (ref), v172 (copy)
                local v173 = v14:Wait(l_LocalPlayer_0);
                if not v173 then
                    return;
                else
                    v173:OnChanged({
                        "LuckyBlocks", 
                        (tostring(3478819641))
                    }, v172);
                    v172();
                    return;
                end;
            end);
            task.spawn(v172);
            local l_Timer_0 = v157:WaitForChild("Timer");
            v19.Simple(1, function() --[[ Line: 596 ]]
                -- upvalues: v157 (copy), v17 (ref), l_Timer_0 (copy), v27 (ref)
                v157.Visible = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                local l_v17_Instant_5 = v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                if l_Timer_0 then
                    l_Timer_0.Text = ("%* left"):format((v27:E(l_v17_Instant_5 - l_workspace_ServerTimeNow_1)));
                end;
            end);
        end);
        for _, v178 in l_LuckyBlocksList_0:GetChildren() do
            v155(v178);
        end;
        task.spawn(function() --[[ Line: 612 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo1_0 = l_Shop_0.Content.List.ItemsListPromo1;
            v155(l_ItemsListPromo1_0["Secret Lucky Block"]);
            local function v180() --[[ Line: 615 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo1_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo1_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.FlyingCarpetPromo", false);
            end;
            v39.Loaded:Connect(v180);
            l_ItemsListPromo1_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.FlyingCarpetPromo", false);
        end);
        task.spawn(function() --[[ Line: 625 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo2_0 = l_Shop_0.Content.List.ItemsListPromo2;
            v155(l_ItemsListPromo2_0["Secret Lucky Block"]);
            local function v182() --[[ Line: 628 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo2_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo2_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.AdminPanelPromo", false);
            end;
            v39.Loaded:Connect(v182);
            l_ItemsListPromo2_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.AdminPanelPromo", false);
        end);
        task.spawn(function() --[[ Line: 638 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo3_0 = l_Shop_0.Content.List.ItemsListPromo3;
            v155(l_ItemsListPromo3_0["Secret Lucky Block"]);
            v155(l_ItemsListPromo3_0["Secret Lucky Block x3"], "Secret Lucky Block", 3437062543);
            local function v184() --[[ Line: 642 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo3_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo3_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.SecretLuckyBlockX3Promo", false);
            end;
            v39.Loaded:Connect(v184);
            l_ItemsListPromo3_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.SecretLuckyBlockX3Promo", false);
        end);
        task.spawn(function() --[[ Line: 652 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo4_0 = l_Shop_0.Content.List.ItemsListPromo4;
            v155(l_ItemsListPromo4_0["Secret Lucky Block x3"], "Secret Lucky Block", 3437062543);
            v155(l_ItemsListPromo4_0["Secret Lucky Block x8"], "Secret Lucky Block", 3437979356);
            local function v186() --[[ Line: 657 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo4_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo4_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.SecretLuckyBlockX8Promo", false);
            end;
            v39.Loaded:Connect(v186);
            l_ItemsListPromo4_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.SecretLuckyBlockX8Promo", false);
        end);
        task.spawn(function() --[[ Line: 667 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo5_0 = l_Shop_0.Content.List.ItemsListPromo5;
            v155(l_ItemsListPromo5_0["All Lucky Blocks"], "Secret Lucky Block", 3437989614);
            v155(l_ItemsListPromo5_0["Secret Lucky Block"]);
            local function v188() --[[ Line: 671 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo5_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo5_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.AllLuckyBlockPromo", false);
            end;
            v39.Loaded:Connect(v188);
            l_ItemsListPromo5_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.AllLuckyBlockPromo", false);
        end);
        task.spawn(function() --[[ Line: 681 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo6_0 = l_Shop_0.Content.List.ItemsListPromo6;
            v155(l_ItemsListPromo6_0["Secret Lucky Block"]);
            local function v190() --[[ Line: 684 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo6_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo6_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.LaserGunPromo", false);
            end;
            v39.Loaded:Connect(v190);
            l_ItemsListPromo6_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.LaserGunPromo", false);
        end);
        task.spawn(function() --[[ Line: 694 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo7_0 = l_Shop_0.Content.List.ItemsListPromo7;
            v155(l_ItemsListPromo7_0["Secret Lucky Block"]);
            local function v192() --[[ Line: 697 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo7_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo7_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.BlackholeSlapPromo", false);
            end;
            v39.Loaded:Connect(v192);
            l_ItemsListPromo7_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.BlackholeSlapPromo", false);
        end);
        task.spawn(function() --[[ Line: 707 ]]
            -- upvalues: l_Shop_0 (ref), v155 (copy), v39 (ref), l_LocalPlayer_0 (ref)
            local l_ItemsListPromo8_0 = l_Shop_0.Content.List.ItemsListPromo8;
            v155(l_ItemsListPromo8_0["Secret Lucky Block"]);
            local function v194() --[[ Line: 710 ]] --[[ Name: update ]]
                -- upvalues: l_ItemsListPromo8_0 (copy), v39 (ref), l_LocalPlayer_0 (ref)
                l_ItemsListPromo8_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.BanHammerPromo", false);
            end;
            v39.Loaded:Connect(v194);
            l_ItemsListPromo8_0.Visible = v39.GetAttribute(l_LocalPlayer_0, "Shop.BanHammerPromo", false);
        end);
        return;
    end;
end;
local function _() --[[ Line: 722 ]] --[[ Name: SetupServerLuck ]]
    -- upvalues: l_Shop_0 (copy), v14 (copy), v27 (copy), v34 (copy), v30 (copy), v97 (copy), v19 (copy), v24 (copy), v56 (copy)
    local l_ServerLuck_0 = l_Shop_0.Content.List.ServerLuck;
    v14:WaitAndCall("ServerLuck", function(v197) --[[ Line: 725 ]]
        -- upvalues: l_ServerLuck_0 (copy), v27 (ref), v34 (ref), v30 (ref), v97 (ref), v19 (ref), v24 (ref), v56 (ref)
        local v198 = nil;
        local v199 = os.clock();
        local function v208() --[[ Line: 729 ]] --[[ Name: update ]]
            -- upvalues: v199 (ref), v198 (ref), v197 (copy), l_ServerLuck_0 (ref), v27 (ref), v34 (ref), v30 (ref), v97 (ref)
            if os.clock() - v199 >= 300 then
                v199 = os.clock();
                v198 = nil;
            end;
            local v200 = v197:Get("EndTime");
            if v200 then
                local v201 = math.clamp(math.floor(v200 - workspace:GetServerTimeNow()), 0, 1e999);
                if v201 <= 0 then
                    v200 = nil;
                    v198 = nil;
                else
                    l_ServerLuck_0.Frame.Timer.Text = v27:A(v201);
                end;
            end;
            l_ServerLuck_0.Frame.Timer.Visible = v200 ~= nil;
            local v202 = v197:Get("Index") or 0;
            local v203 = #v34;
            local v204 = math.min(v202 + 1, v203);
            if v202 ~= v198 then
                v198 = v202;
                local v205 = nil;
                v205 = v203 <= v202 and "<font color=\"#FFFF00\">MAX</font>" or ("<font color=\"#FFFFFF\">%dx</font> &gt; <font color=\"#FFFF00\">%dx</font>"):format(v202 == 0 and 1 or v34[v202].Multiplier, v34[v204].Multiplier);
                local v206 = v34[v204];
                local l_v30_ProductInfo_0 = v30:GetProductInfo(v206.ProductId, "Product");
                v97(l_ServerLuck_0.Frame.Buy.Price, v206.ProductId);
                l_ServerLuck_0.Frame.LuckVector.Image = l_v30_ProductInfo_0.Icon;
                l_ServerLuck_0.Frame.Pattern.Image = l_v30_ProductInfo_0.Icon;
                l_ServerLuck_0.Frame.Amount.Text = v205;
            end;
        end;
        v197:OnChanged("Index", v208);
        v197:OnChanged("EndTime", v208);
        v19.Simple(1, v208);
        local v209 = v24.new(l_ServerLuck_0.Frame.Buy);
        v209:Animate();
        v209.OnActivated:Connect(function() --[[ Line: 780 ]]
            -- upvalues: v197 (copy), v34 (ref), v56 (ref)
            local v210 = v197:Get("Index") or 0;
            local v211 = #v34;
            local v212 = math.min(v210 + 1, v211);
            v56:FireServer(v34[v212].ProductId);
        end);
    end);
end;
local v214 = nil;
local function v220(v215) --[[ Line: 796 ]] --[[ Name: ClearGiftProduct ]]
    -- upvalues: v37 (copy), v74 (copy), v97 (copy)
    local l_Buy_0 = v215:FindFirstChild("Buy");
    if l_Buy_0 then
        l_Buy_0:SetAttribute("GiftProductId", nil);
    end;
    local v217 = v215:GetAttribute("ForceProductId") or tonumber(v215.Name) or v215:GetAttribute("ProductId");
    local v218 = v217 and v37[v217];
    local v219 = l_Buy_0 and (l_Buy_0:FindFirstChild("Price") or l_Buy_0:FindFirstChild("Txt"));
    if v219 and v218 then
        if v74[v219] then
            v74[v219]:Destroy();
        end;
        v97(v219, v217, v218.Type == "Gamepass" and "Gamepass" or "Product");
    end;
end;
local function v227(v221) --[[ Line: 813 ]] --[[ Name: UpdateGiftProduct ]]
    -- upvalues: v214 (ref), v37 (copy), v74 (copy), v97 (copy)
    if v214 == nil then
        return;
    else
        local v222 = v221:GetAttribute("ForceProductId") or tonumber(v221.Name) or v221:GetAttribute("ProductId");
        local v223 = v222 and v37[v222];
        if not v223 then
            warn(("Failed to find ShopData for product %*"):format(v222), v221:GetFullName());
            return;
        else
            local v224 = if v214 then v223.GiftProduct else v223.GiftProductNoRegional or v223.GiftProduct;
            if not v224 then
                return;
            else
                local l_Buy_1 = v221:FindFirstChild("Buy");
                local v226 = l_Buy_1 and (l_Buy_1:FindFirstChild("Price") or l_Buy_1:FindFirstChild("Txt"));
                if not l_Buy_1 or not v226 then
                    return;
                else
                    l_Buy_1:SetAttribute("GiftProductId", v224);
                    if v74[v226] then
                        v74[v226]:Destroy();
                    end;
                    v97(v226, v224, "Product");
                    return;
                end;
            end;
        end;
    end;
end;
local function v232() --[[ Line: 853 ]] --[[ Name: UpdateGiftProducts ]]
    -- upvalues: v214 (ref), v58 (ref), l_CollectionService_0 (copy), v220 (copy), v17 (copy), v21 (copy), v227 (copy)
    v214 = nil;
    if not v58 then
        for _, v229 in l_CollectionService_0:GetTagged("ProductFrame") do
            v220(v229);
        end;
        return;
    elseif v17:Get("DevProductRegionalPricingDisabled", false) then
        return;
    else
        v214 = v21:Invoke("ShopService/UseRegionalPriceGifts", v58);
        for _, v231 in l_CollectionService_0:GetTagged("ProductFrame") do
            v227(v231);
        end;
        return;
    end;
end;
local function _() --[[ Line: 874 ]] --[[ Name: SetupGiftPlayerSelect ]]
    -- upvalues: v24 (copy), l_GiftButton_0 (copy), v58 (ref), l_PlayerSelected_0 (copy), l_Txt_0 (copy), v59 (copy), v232 (copy), l_GiftPlayer_0 (copy)
    local v233 = v24.new(l_GiftButton_0);
    v233:Animate();
    v233.OnActivated:Connect(function() --[[ Line: 877 ]]
        -- upvalues: v58 (ref), l_PlayerSelected_0 (ref), l_Txt_0 (ref), v59 (ref), v232 (ref), l_GiftPlayer_0 (ref)
        if v58 then
            v58 = nil;
            l_PlayerSelected_0.Visible = false;
            l_Txt_0.Text = "Gift Player";
            v59:Fire(false);
            v232();
            return;
        else
            l_GiftPlayer_0.Visible = not l_GiftPlayer_0.Visible;
            return;
        end;
    end);
end;
local function _() --[[ Line: 892 ]] --[[ Name: SetupGiftPlayer ]]
    -- upvalues: v24 (copy), l_Close_0 (copy), l_GiftPlayer_0 (copy), v59 (copy)
    local v235 = v24.new(l_Close_0);
    v235:Animate();
    v235.OnActivated:Connect(function() --[[ Line: 895 ]]
        -- upvalues: l_GiftPlayer_0 (ref), v59 (ref)
        l_GiftPlayer_0.Visible = false;
        v59:Fire(false);
    end);
end;
local function v243(v237) --[[ Line: 901 ]] --[[ Name: AddPlayerToGiftList ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_Template_0 (copy), l_Players_0 (copy), v24 (copy), v58 (ref), l_GiftPlayer_0 (copy), l_Txt_0 (copy), l_PlayerSelected_0 (copy), l_PlayerName_0 (copy), l_Headshot_0 (copy), v59 (copy), v232 (copy), l_List_0 (copy)
    if v237 == l_LocalPlayer_0 then
        return;
    else
        local v238 = l_Template_0:Clone();
        v238.Name = v237.Name;
        v238.PlayerName.Text = v237.Name;
        local l_Headshot_1 = v238.PlayerImage.Headshot;
        local v240 = "";
        if pcall(function() --[[ Line: 910 ]]
            -- upvalues: v240 (ref), l_Players_0 (ref), v237 (copy)
            v240 = l_Players_0:GetUserThumbnailAsync(v237.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
        end) then
            l_Headshot_1.Image = v240;
        end;
        local l_Gift_0 = v238.Gift;
        local v242 = v24.new(l_Gift_0);
        v242:Animate();
        v242.OnActivated:Connect(function() --[[ Line: 920 ]]
            -- upvalues: v58 (ref), v237 (copy), l_GiftPlayer_0 (ref), l_Txt_0 (ref), l_PlayerSelected_0 (ref), l_PlayerName_0 (ref), l_Headshot_0 (ref), v240 (ref), v59 (ref), v232 (ref)
            v58 = v237.UserId;
            l_GiftPlayer_0.Visible = false;
            l_Txt_0.Text = "Back";
            l_PlayerSelected_0.Visible = true;
            l_PlayerName_0.Text = "@" .. v237.Name;
            l_Headshot_0.Image = v240;
            v59:Fire(true);
            v232();
        end);
        v238.Visible = true;
        v238.Parent = l_List_0;
        return;
    end;
end;
local function _(v244) --[[ Line: 936 ]] --[[ Name: RemovePlayerFromGiftList ]]
    -- upvalues: l_List_0 (copy)
    local l_l_List_0_FirstChild_0 = l_List_0:FindFirstChild(v244.Name);
    if l_l_List_0_FirstChild_0 then
        l_l_List_0_FirstChild_0:Destroy();
    end;
end;
local _ = function() --[[ Line: 943 ]] --[[ Name: SetupBlackFridayEvent ]]
    -- upvalues: v17 (copy), l_Shop_0 (copy), v27 (copy), v45 (ref), v44 (copy), v19 (copy)
    local v247 = nil;
    local function v254() --[[ Line: 945 ]] --[[ Name: updateBlackfridaySale ]]
        -- upvalues: v17 (ref), l_Shop_0 (ref), v27 (ref), v247 (ref), v45 (ref), v44 (ref)
        local l_workspace_ServerTimeNow_2 = workspace:GetServerTimeNow();
        local l_v17_Instant_6 = v17:GetInstant("BlackfridaySale/EndTimestamp", 0);
        local v250 = l_v17_Instant_6 - l_workspace_ServerTimeNow_2;
        local v251 = workspace:GetServerTimeNow() <= l_v17_Instant_6;
        l_Shop_0.Txt1.Text = ("<font color=\"rgb(255,255,255)\">BLACK FRIDAY SALE: </font>%* left"):format((v27:E((math.max(v250, 0)))));
        if v247 == v251 then
            return;
        else
            v247 = v251;
            if v45 == v251 then
                return;
            else
                v45 = v251;
                for _, v253 in v44 do
                    v253.Visible = v251;
                end;
                return;
            end;
        end;
    end;
    v17:OnUpdate(v254);
    v19.Simple(1, v254);
    task.spawn(v254);
end;
local function v355(v256) --[[ Line: 968 ]] --[[ Name: SortShopByProductRank ]]
    -- upvalues: v14 (copy), l_LocalPlayer_0 (copy), l_Shop_0 (copy), v34 (copy), v37 (copy), l_MarketplaceService_0 (copy), v17 (copy)
    local v257 = v14:Get(l_LocalPlayer_0);
    local l_List_1 = l_Shop_0.Content.List;
    local v259 = {
        ServerLuck = {
            Frame = l_List_1.ServerLuck, 
            Title = l_List_1.ServerLuckTitle, 
            ProductIds = {
                v34[1].ProductId, 
                v34[2].ProductId
            }
        }, 
        StarterPack = {
            Frame = l_List_1.StarterPack, 
            Title = l_List_1.Title, 
            ProductIds = {
                3290334159
            }
        }, 
        LuckyBlocks = {
            Frame = l_List_1.LuckyBlocksList, 
            Title = l_List_1.LuckyBlocks, 
            ProductIds = {
                3329528158, 
                3329527999, 
                3329528437
            }
        }, 
        Gear = {
            Frame = l_List_1.ItemsList, 
            Title = l_List_1.Gear, 
            ProductIds = {}
        }, 
        Gamepasses = {
            Frame = l_List_1.GamepassList, 
            Title = l_List_1.Gamepass, 
            ProductIds = {}
        }, 
        Money = {
            Frame = l_List_1.MoneyList, 
            Title = l_List_1.Money, 
            ProductIds = {}
        }
    };
    local function v265(v260, v261) --[[ Line: 1006 ]] --[[ Name: addProductIds ]]
        for _, v263 in v261:GetChildren() do
            local v264 = tonumber(v263.Name);
            if v264 then
                table.insert(v260, v264);
            end;
        end;
    end;
    v265(v259.Gear.ProductIds, v259.Gear.Frame);
    v265(v259.Gamepasses.ProductIds, v259.Gamepasses.Frame);
    v265(v259.Gamepasses.ProductIds, v259.Gamepasses.Frame.Main);
    for _, v267 in v259.Money.Frame:GetChildren() do
        if v267:IsA("GuiObject") then
            v265(v259.Money.ProductIds, v267);
        end;
    end;
    local v268 = {};
    for _, v270 in v259 do
        for _, v272 in v270.ProductIds do
            local v273 = v37[v272];
            if not v273 then
                warn((("Invalid productId %* appears in the shop but not found in ShopData"):format(v272)));
            else
                table.insert(v268, {
                    Id = v272, 
                    InfoType = if v273.Type == "Gamepass" then Enum.InfoType.GamePass else Enum.InfoType.Product
                });
            end;
        end;
    end;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 1050 ]]
        -- upvalues: l_MarketplaceService_0 (ref), v268 (copy)
        return l_MarketplaceService_0:RankProductsAsync(v268);
    end);
    if not l_status_2 or typeof(l_result_2) ~= "table" then
        warn((("MarketplaceService:RankProductsAsync() failed: %*"):format(l_result_2)));
        return;
    else
        local v276 = {};
        for v277, v278 in l_result_2 do
            v276[v278.ProductIdentifier.Id] = v277;
        end;
        for _, v280 in v259 do
            local v281 = 0;
            for _, v283 in v280.ProductIds do
                local v284 = v276[v283];
                if v284 then
                    v281 = v281 + v284;
                end;
            end;
            v280.Rank = v281 / #v280.ProductIds;
        end;
        local v285 = {};
        for v286, _ in v259 do
            table.insert(v285, v286);
        end;
        local v288 = {
            Gear = 0, 
            ServerLuck = 100, 
            LuckyBlocks = 0, 
            Gamepasses = 0, 
            StarterPack = 0, 
            Money = 0
        };
        for _, v290 in v285 do
            v288[v290] = (v288[v290] or 0) + v17:Get(("ShopSectionRankOverrides/%*"):format(v290), 0);
            local v291 = v259[v290];
            v291.Rank = v291.Rank - v288[v290];
        end;
        table.sort(v285, function(v292, v293) --[[ Line: 1101 ]]
            -- upvalues: v259 (copy)
            return v259[v292].Rank < v259[v293].Rank;
        end);
        local v294 = {};
        for v295, v296 in v285 do
            v294[v296] = v295;
        end;
        if v256 then
            for v297, v298 in v259 do
                local v299 = 5 + (v294[v297] or 1) * 10;
                if v298.Frame then
                    local l_Frame_0 = v298.Frame;
                    local l_l_Frame_0_Attribute_0 = l_Frame_0:GetAttribute("OriginalOrder");
                    if not l_l_Frame_0_Attribute_0 then
                        l_l_Frame_0_Attribute_0 = l_Frame_0.LayoutOrder;
                        l_Frame_0:SetAttribute("OriginalOrder", l_l_Frame_0_Attribute_0);
                    end;
                    l_Frame_0.LayoutOrder = v299 or l_l_Frame_0_Attribute_0;
                end;
                if v298.Title then
                    local l_Title_0 = v298.Title;
                    local v303 = v299 - 1;
                    local l_l_Title_0_Attribute_0 = l_Title_0:GetAttribute("OriginalOrder");
                    if not l_l_Title_0_Attribute_0 then
                        l_l_Title_0_Attribute_0 = l_Title_0.LayoutOrder;
                        l_Title_0:SetAttribute("OriginalOrder", l_l_Title_0_Attribute_0);
                    end;
                    l_Title_0.LayoutOrder = v303 or l_l_Title_0_Attribute_0;
                end;
            end;
        end;
        for v305, _ in v276 do
            local v307 = v37[v305];
            if v307 and v257 and if v307.Type == "Gamepass" then v257:Get((("Gamepass.%*"):format(v307.Display))) else v307.Type == "Item" and v257:Get((("Items.%*"):format(v307.Display))) then
                v276[v305] = v276[v305] + 1000;
            end;
        end;
        for _, v309 in v259.Gear.Frame:GetChildren() do
            local v310 = tonumber(v309.Name);
            if v310 and v309:IsA("GuiObject") then
                local v311 = v276[v310] or 1;
                local l_v309_Attribute_0 = v309:GetAttribute("OriginalOrder");
                if not l_v309_Attribute_0 then
                    l_v309_Attribute_0 = v309.LayoutOrder;
                    v309:SetAttribute("OriginalOrder", l_v309_Attribute_0);
                end;
                v309.LayoutOrder = v311 or l_v309_Attribute_0;
            end;
        end;
        local v313 = v276[1227013099] or 1;
        local v314 = true;
        for _, v316 in v259.Gamepasses.ProductIds do
            if (v276[v316] or 1) < v313 then
                v314 = false;
                break;
            end;
        end;
        v259.Gamepasses.Frame.Main.LayoutOrder = v314 and 100 or -1;
        for _, v318 in v259.Gamepasses.Frame.Main:GetChildren() do
            local v319 = tonumber(v318.Name);
            if v319 and v318:IsA("GuiObject") then
                local v320 = v276[v319] or 1;
                local l_v318_Attribute_0 = v318:GetAttribute("OriginalOrder");
                if not l_v318_Attribute_0 then
                    l_v318_Attribute_0 = v318.LayoutOrder;
                    v318:SetAttribute("OriginalOrder", l_v318_Attribute_0);
                end;
                v318.LayoutOrder = v320 or l_v318_Attribute_0;
            end;
        end;
        local l_1_0 = v259.Money.Frame:FindFirstChild("1");
        local l_2_0 = v259.Money.Frame:FindFirstChild("2");
        if not l_2_0 or not l_1_0 then
            return;
        else
            local l_GuiObject_0 = l_2_0:FindFirstChildWhichIsA("GuiObject");
            local l_GuiObject_1 = l_1_0:FindFirstChildWhichIsA("GuiObject");
            local l_UIListLayout_0 = l_2_0.UIListLayout;
            local l_UIListLayout_1 = l_1_0.UIListLayout;
            if not l_GuiObject_1 or not l_GuiObject_0 then
                return;
            else
                local v328 = l_GuiObject_1:Clone();
                local v329 = l_GuiObject_0:Clone();
                l_2_0.LayoutOrder = 1;
                l_1_0.LayoutOrder = 2;
                v259.Money.Frame.UIListLayout.Padding = UDim.new(0.05, 0);
                l_UIListLayout_0.Parent = l_2_0;
                l_UIListLayout_1.Parent = l_1_0;
                local v330 = {};
                for _, v332 in l_result_2 do
                    local v333 = tostring(v332.ProductIdentifier.Id);
                    v330[v333] = (v330[v333] or 0) + v17:Get(("ShopProductRankOverrides/%*"):format(v333), 0);
                    local l_Id_0 = v332.ProductIdentifier.Id;
                    v276[l_Id_0] = v276[l_Id_0] - v330[v333];
                end;
                local v335 = v259.Money.ProductIds[1];
                local v336 = {};
                local v337 = {};
                for _, v339 in v259.Money.ProductIds do
                    if (v276[v339] or 1) < (v276[v335] or 1) then
                        v335 = v339;
                    end;
                    table.insert(v336, v339);
                    local v340 = v37[v339];
                    if not v340 then
                        return;
                    else
                        v337[v339] = v340.Value;
                    end;
                end;
                local v341 = true;
                if v335 == v336[#v336] then
                    v341 = false;
                end;
                table.sort(v336, function(v342, v343) --[[ Line: 1261 ]]
                    -- upvalues: v341 (ref), v337 (copy)
                    if v341 then
                        return v337[v342] < v337[v343];
                    else
                        return v337[v342] > v337[v343];
                    end;
                end);
                local v344 = {
                    v335
                };
                for _, v346 in v336 do
                    if v346 ~= v335 then
                        table.insert(v344, v346);
                    end;
                end;
                for v347, v348 in v344 do
                    local v349 = l_1_0:FindFirstChild((tostring(v348))) or l_2_0:FindFirstChild((tostring(v348)));
                    if v349 then
                        v349.LayoutOrder = v347;
                        local v350 = v347 <= 2;
                        local v351 = if v350 then v329 else v328;
                        v349.Size = v351.Size;
                        v349.Image = v351.Image;
                        for _, v353 in v349:GetChildren() do
                            local l_v351_FirstChild_0 = v351:FindFirstChild(v353.Name);
                            if v353:IsA("GuiObject") and l_v351_FirstChild_0 then
                                v353.Size = l_v351_FirstChild_0.Size;
                                v353.Position = l_v351_FirstChild_0.Position;
                                v353.AnchorPoint = l_v351_FirstChild_0.AnchorPoint;
                            end;
                        end;
                        v349.Parent = if v350 then l_2_0 else l_1_0;
                    end;
                end;
                v328:Destroy();
                v329:Destroy();
                return;
            end;
        end;
    end;
end;
local function v387() --[[ Line: 1312 ]] --[[ Name: SetupMerchShop ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Shop_0 (copy), v38 (copy), v29 (copy), v12 (copy), v32 (copy), l_Players_0 (copy), v17 (copy), v31 (copy), v26 (copy), v13 (copy), l_CommerceService_0 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy), v40 (copy), v21 (copy)
    local v356 = require(l_ReplicatedStorage_0.Controllers.StockEventController.ClientAPI);
    local v357 = false;
    local v358 = false;
    local v359 = v356.create("Festive 67");
    local l_List_2 = l_Shop_0.Content.List;
    local l_Plush_0 = l_List_2.Plush;
    local v362 = {
        l_Plush_0, 
        l_List_2.Codes, 
        l_List_2.Redeem
    };
    local l_CurrentItem_0 = v38.CurrentItem;
    v29:AttachOnViewportWithOptimizations("Festive 67", l_Plush_0.Frame.Item.ViewportFrame);
    v12.apply(l_Plush_0.Frame.Item.UIStroke, "Zebra");
    v12.apply(l_Plush_0.Frame.Item.Title, "Zebra");
    local function v371() --[[ Line: 1330 ]] --[[ Name: updateMerchVisibility ]]
        -- upvalues: v32 (ref), l_Players_0 (ref), v38 (ref), v357 (ref), v17 (ref), v362 (copy), l_Plush_0 (copy)
        local v364 = v32.getPolicy(l_Players_0.LocalPlayer);
        local v365 = true;
        if not v364 or not v364.IsEligibleToPurchaseCommerceProduct then
            v365 = false;
        end;
        local v366 = v38.IsEnabled() and not v357;
        if not v365 and v17:GetInstant("MerchShopHideIfPolicyDisabledV2", false) then
            v366 = false;
        end;
        local l_v17_Instant_7 = v17:GetInstant("MerchShopHideAllFrontend", false);
        local l_v17_Instant_8 = v17:GetInstant("MerchShopOnlyShowRedeemCode", true);
        for _, v370 in v362 do
            if v370 == l_Plush_0 and l_v17_Instant_8 and v366 or l_v17_Instant_7 then
                v370.Visible = false;
            else
                v370.Visible = v366;
            end;
        end;
        l_Plush_0.Frame.Buy.Visible = v365;
        l_Plush_0.Frame.CodeRedeem.Visible = not v365;
        l_Plush_0.Frame.WebsiteLink.Visible = not v365;
    end;
    v371();
    v17:OnUpdate(v371);
    v31.OnUpdateEnabled:Connect(v371);
    v31.OnUpdateDisabled:Connect(v371);
    if not v38.CurrentItem then
        v357 = true;
        v371();
        return;
    else
        local function v373() --[[ Line: 1373 ]] --[[ Name: updateStock ]]
            -- upvalues: v359 (copy), v358 (ref), l_Plush_0 (copy), v26 (ref), v13 (ref)
            local l_v359_Stock_0 = v359:GetStock("Festive 67");
            if typeof(l_v359_Stock_0) == "number" then
                v358 = l_v359_Stock_0 <= 0;
                l_Plush_0.Frame.Stock.Text = l_v359_Stock_0 <= 0 and "SOLD OUT" or ("%* LEFT"):format((v26:Comma(l_v359_Stock_0)));
            else
                l_Plush_0.Frame.Stock.Text = "??? LEFT";
            end;
            if v358 then
                v13.target(l_Plush_0.Frame.Buy, 1, 5, {
                    BackgroundColor3 = Color3.fromRGB(122, 122, 122)
                });
                return;
            else
                v13.target(l_Plush_0.Frame.Buy, 1, 5, {
                    BackgroundColor3 = Color3.fromRGB(81, 158, 86)
                });
                return;
            end;
        end;
        v359:OnStockChange("Festive 67", v373);
        task.spawn(v373);
        l_Plush_0.Frame.Buy.Price.Text = "???";
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 1395 ]]
            -- upvalues: l_CommerceService_0 (ref), v38 (ref)
            return l_CommerceService_0:GetCommerceProductInfoAsync(v38.CurrentItem.CommerceProductId);
        end);
        if l_RunService_0:IsStudio() and not l_status_3 then
            l_result_3 = v38.TestProductInfo;
            l_status_3 = true;
        end;
        if not l_status_3 or typeof(l_result_3) ~= "table" or typeof(l_result_3.Item) ~= "table" then
            v357 = true;
            v371();
            return;
        else
            l_Plush_0.Frame.Buy.Price.Text = l_result_3 and l_result_3.Item and l_result_3.Item.DisplayPrice or "$29.99";
            l_Plush_0.Frame.Buy.Activated:Connect(function() --[[ Line: 1419 ]]
                -- upvalues: v358 (ref), l_CommerceService_0 (ref), l_LocalPlayer_0 (ref), l_CurrentItem_0 (copy)
                if v358 then
                    return;
                else
                    l_CommerceService_0:PromptCommerceProductPurchase(l_LocalPlayer_0, l_CurrentItem_0.CommerceProductId);
                    return;
                end;
            end);
            local function v386(v376) --[[ Line: 1427 ]] --[[ Name: initTextbox ]]
                -- upvalues: v38 (ref), v40 (ref), v21 (ref)
                local v377 = false;
                local function v382() --[[ Line: 1430 ]] --[[ Name: submitCode ]]
                    -- upvalues: v377 (ref), v376 (copy), v38 (ref), v40 (ref), v21 (ref)
                    if v377 or not v376.Active then
                        return;
                    else
                        local l_Text_0 = v376.Text;
                        if #l_Text_0 ~= v38.CodeLength then
                            v40:Error("Invalid code");
                            return;
                        else
                            v377 = true;
                            v376.Text = "";
                            v376.PlaceholderText = "Redeeming...";
                            v376.Selectable = false;
                            v376.Active = false;
                            v376:ReleaseFocus();
                            local v379, v380, v381 = pcall(function() --[[ Line: 1449 ]]
                                -- upvalues: v21 (ref), l_Text_0 (copy)
                                return v21:RemoteFunction("RequestRedemption"):InvokeServer(l_Text_0);
                            end);
                            if not v379 then
                                v40:Error("Unexpected error");
                                warn(v380);
                            elseif not v380 then
                                v40:Error(if typeof(v381) == "string" then v381 else "Request failed");
                            elseif v379 and v380 then
                                v40:Success("Code redeemed!");
                            end;
                            v376.Text = "";
                            v376.PlaceholderText = "Code Here...";
                            task.wait(0.5);
                            v376.Selectable = true;
                            v376.Active = true;
                            v377 = false;
                            return;
                        end;
                    end;
                end;
                v376.FocusLost:Connect(function(v383) --[[ Line: 1471 ]]
                    -- upvalues: v382 (copy)
                    if not v383 then
                        return;
                    else
                        v382();
                        return;
                    end;
                end);
                v376:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1479 ]]
                    -- upvalues: v376 (copy), v38 (ref), v382 (copy)
                    local l_Text_1 = v376.Text;
                    local v385 = string.sub(string.upper(string.gsub(l_Text_1, "[^%w]", "")), 1, v38.CodeLength);
                    if v385 ~= l_Text_1 then
                        v376.Text = v385;
                    end;
                    if #v385 == v38.CodeLength then
                        v382();
                    end;
                end);
            end;
            v386(l_Plush_0.Frame.CodeRedeem.TextBox);
            v386(l_List_2.Codes.CodeRedeem.TextBox);
            return;
        end;
    end;
end;
v62.Start = function(_) --[[ Line: 1504 ]] --[[ Name: Start ]]
    -- upvalues: v61 (ref), v10 (copy), l_Shop_0 (copy), v14 (copy), l_LocalPlayer_0 (copy), v17 (copy), v15 (copy), v37 (copy), v26 (copy), v30 (copy), v97 (copy), v24 (copy), v56 (copy), v58 (ref), v57 (copy), l_Players_0 (copy), v74 (copy), v59 (copy), v20 (copy), v60 (copy), v32 (copy), v227 (copy), v19 (copy), v27 (copy), v12 (copy), v34 (copy), l_GiftButton_0 (copy), l_PlayerSelected_0 (copy), l_Txt_0 (copy), v232 (copy), l_GiftPlayer_0 (copy), l_Close_0 (copy), v195 (copy), v45 (ref), v44 (copy), v387 (copy), v243 (copy), l_List_0 (copy), v39 (copy), v62 (copy), v7 (copy), v8 (copy), v355 (copy), v16 (copy)
    v61 = v10:Register("Shop", l_Shop_0, "TopQuint");
    v61:AttachCloseButton(l_Shop_0.Header.Close);
    v61:Close();
    v14:WaitAndCall(l_LocalPlayer_0, function(v389) --[[ Line: 1510 ]]
        -- upvalues: v17 (ref), v15 (ref), v37 (ref), v26 (ref), v30 (ref), v97 (ref), v24 (ref), v56 (ref), v58 (ref), v57 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v74 (ref), v59 (ref), v20 (ref), v60 (ref), v32 (ref), v227 (ref), v19 (ref), v27 (ref), v12 (ref), v34 (ref)
        local function _() --[[ Line: 1514 ]] --[[ Name: isSantasSleighActive ]]
            -- upvalues: v17 (ref)
            return workspace:GetServerTimeNow() < v17:GetInstant("SantasSleighPackEndTime", 1767470400);
        end;
        local function _() --[[ Line: 1521 ]] --[[ Name: isGingerbreadBaseActive ]]
            -- upvalues: v17 (ref)
            return workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
        end;
        v15.observeTag("CashProduct", function(v392) --[[ Line: 1525 ]]
            -- upvalues: v37 (ref), v389 (copy), v26 (ref), v30 (ref), v97 (ref), v24 (ref), v56 (ref), v58 (ref), v57 (ref)
            local v393 = tonumber(v392.Name);
            local v394 = v37[v393];
            if not v394 then
                return;
            else
                v392:AddTag("ProductFrame");
                local v395 = v392:WaitForChild("Buy", 5);
                local v396 = v392:WaitForChild("Icon", 5);
                local v397 = v392:WaitForChild("Amount", 5);
                if v394.Icon then
                    v396.ScaleType = Enum.ScaleType.Fit;
                    v396.Image = v394.Icon;
                end;
                local function v400() --[[ Line: 1541 ]] --[[ Name: updateAmountLabel ]]
                    -- upvalues: v397 (copy), v394 (copy), v389 (ref), v26 (ref)
                    if v397 then
                        local v398 = v394.Value or 0;
                        local v399 = v389:Get("Rebirth") or 0;
                        if v399 > 0 then
                            v398 = v398 * (v399 <= 1 and 1.5 or v399);
                        end;
                        v397.Text = ("$%*"):format((v26:Comma(v398)));
                    end;
                end;
                local function _() --[[ Line: 1557 ]] --[[ Name: updateInfo ]]
                    -- upvalues: v30 (ref), v393 (copy), v395 (copy), v97 (ref), v396 (copy), v394 (copy)
                    local l_v30_ProductInfo_1 = v30:GetProductInfo(v393, "Product");
                    if v395 then
                        v97(v395.Txt, v393);
                    end;
                    if v396 and l_v30_ProductInfo_1.Icon then
                        v396.ScaleType = Enum.ScaleType.Fit;
                        if not v394.Icon then
                            v396.Image = l_v30_ProductInfo_1.Icon;
                        end;
                    end;
                end;
                local l_v30_ProductInfo_2 = v30:GetProductInfo(v393, "Product");
                if v395 then
                    v97(v395.Txt, v393);
                end;
                if v396 and l_v30_ProductInfo_2.Icon then
                    v396.ScaleType = Enum.ScaleType.Fit;
                    if not v394.Icon then
                        v396.Image = l_v30_ProductInfo_2.Icon;
                    end;
                end;
                v389:OnChanged("Rebirth", v400, true);
                l_v30_ProductInfo_2 = v24.new(v395);
                l_v30_ProductInfo_2:Animate();
                l_v30_ProductInfo_2.OnActivated:Connect(function() --[[ Line: 1580 ]]
                    -- upvalues: v395 (copy), v56 (ref), v393 (copy), v58 (ref)
                    local l_v395_Attribute_0 = v395:GetAttribute("GiftProductId");
                    v56:FireServer(l_v395_Attribute_0 or v393, v58);
                end);
                v57.Tick:Connect(function() --[[ Line: 1585 ]]
                    -- upvalues: v30 (ref), v393 (copy), v395 (copy), v97 (ref), v396 (copy), v394 (copy)
                    local l_v30_ProductInfo_3 = v30:GetProductInfo(v393, "Product");
                    if v395 then
                        v97(v395.Txt, v393);
                    end;
                    if v396 and l_v30_ProductInfo_3.Icon then
                        v396.ScaleType = Enum.ScaleType.Fit;
                        if not v394.Icon then
                            v396.Image = l_v30_ProductInfo_3.Icon;
                        end;
                    end;
                end);
                return;
            end;
        end);
        v15.observeTag("ItemProduct", function(v406) --[[ Line: 1591 ]]
            -- upvalues: v37 (ref), v58 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v17 (ref), v74 (ref), v30 (ref), v97 (ref), v59 (ref), v57 (ref), v389 (copy), v24 (ref), v56 (ref)
            local v407 = tonumber(v406.Name);
            local v408 = v37[v407];
            if not v408 then
                return;
            else
                v406:AddTag("ProductFrame");
                local v409 = v406:WaitForChild("Buy", 5);
                local v410 = v409 and v409:WaitForChild("Price", 5);
                local v411 = v406:WaitForChild("Icon", 5);
                local v412 = false;
                local v413 = false;
                if v408.Icon then
                    v411.ScaleType = Enum.ScaleType.Fit;
                    v411.Image = v408.Icon;
                end;
                local function v417() --[[ Line: 1609 ]] --[[ Name: updateVisibility ]]
                    -- upvalues: v58 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v407 (copy), v406 (copy), v17 (ref)
                    local v414 = v58 and l_Players_0:GetPlayerByUserId(v58) or l_LocalPlayer_0;
                    if v407 == 3290152513 then
                        local l_3483721069_0 = v406.Parent:FindFirstChild("3483721069");
                        if not l_3483721069_0 then
                            return;
                        else
                            local v416 = v414:GetAttribute("HasFlyingCarpet") and workspace:GetServerTimeNow() < v17:GetInstant("SantasSleighPackEndTime", 1767470400);
                            v406.Visible = not v416;
                            if l_3483721069_0 then
                                l_3483721069_0.LayoutOrder = v406.LayoutOrder;
                                l_3483721069_0.Visible = v416;
                            end;
                        end;
                    end;
                end;
                local function _() --[[ Line: 1627 ]] --[[ Name: updateOwned ]]
                    -- upvalues: v417 (copy), v412 (ref), v410 (copy), v74 (ref)
                    v417();
                    v412 = true;
                    local l_v410_0 = v410;
                    if v74[l_v410_0] then
                        v74[l_v410_0]:Destroy();
                    end;
                    v410.Text = "Owned";
                end;
                local function v421() --[[ Line: 1634 ]] --[[ Name: updateInfo ]]
                    -- upvalues: v417 (copy), v30 (ref), v407 (copy), v410 (copy), v412 (ref), v413 (ref), v97 (ref), v411 (copy), v408 (copy)
                    v417();
                    local l_v30_ProductInfo_4 = v30:GetProductInfo(v407, "Product");
                    if v410 and (v412 == false or v413 == true) then
                        v97(v410, v407);
                    end;
                    if l_v30_ProductInfo_4.Icon and v411 then
                        v411.ScaleType = Enum.ScaleType.Fit;
                        if not v408.Icon then
                            v411.Image = l_v30_ProductInfo_4.Icon;
                        end;
                    end;
                end;
                local v422 = nil;
                v59:Connect(function(v423) --[[ Line: 1653 ]]
                    -- upvalues: v422 (ref), v58 (ref), l_Players_0 (ref), v407 (copy), v417 (copy), v413 (ref), v412 (ref), v410 (copy), v74 (ref), v421 (copy)
                    if v422 then
                        v422:Disconnect();
                        v422 = nil;
                    end;
                    local v424 = v58 and v423 and l_Players_0:GetPlayerByUserId(v58);
                    if v424 and v407 == 3290152513 then
                        v422 = v424:GetAttributeChangedSignal("HasFlyingCarpet"):Connect(v417);
                    end;
                    v413 = v423;
                    if not v423 and v412 then
                        v417();
                        v412 = true;
                        local l_v410_1 = v410;
                        if v74[l_v410_1] then
                            v74[l_v410_1]:Destroy();
                        end;
                        v410.Text = "Owned";
                    else
                        v421();
                    end;
                    v417();
                end);
                v57.Tick:Connect(function() --[[ Line: 1674 ]]
                    -- upvalues: v417 (copy), v412 (ref), v421 (copy)
                    v417();
                    if v412 == false then
                        v421();
                    end;
                end);
                v389:OnDictionaryInserted("Items", function(_, v427) --[[ Line: 1683 ]]
                    -- upvalues: v417 (copy), v408 (copy), v413 (ref), v412 (ref), v410 (copy), v74 (ref)
                    v417();
                    if v427 == v408.Display and v413 == false then
                        v417();
                        v412 = true;
                        local l_v410_2 = v410;
                        if v74[l_v410_2] then
                            v74[l_v410_2]:Destroy();
                        end;
                        v410.Text = "Owned";
                    end;
                end);
                if v389:Get((("Items.%*"):format(v408.Display))) == true then
                    v417();
                    v412 = true;
                    if v74[v410] then
                        v74[v410]:Destroy();
                    end;
                    v410.Text = "Owned";
                end;
                v421();
                v417();
                local v429 = v24.new(v409);
                v429:Animate();
                v429.OnActivated:Connect(function() --[[ Line: 1699 ]]
                    -- upvalues: v409 (copy), v56 (ref), v407 (copy), v58 (ref)
                    local l_v409_Attribute_0 = v409:GetAttribute("GiftProductId");
                    v56:FireServer(l_v409_Attribute_0 or v407, v58);
                end);
                return;
            end;
        end);
        v15.observeTag("GamepassProduct", function(v431) --[[ Line: 1706 ]]
            -- upvalues: v37 (ref), v74 (ref), v97 (ref), v59 (ref), v57 (ref), v389 (copy), v24 (ref), v58 (ref), v56 (ref)
            local v432 = tonumber(v431.Name);
            local v433 = v37[v432];
            if not v433 then
                return;
            else
                v431:AddTag("ProductFrame");
                local v434 = v431:WaitForChild("Buy", 5);
                local v435 = v434 and v434:WaitForChild("Price", 5);
                local _ = v431:WaitForChild("Icon", 5);
                local v437 = false;
                local v438 = false;
                local function _() --[[ Line: 1719 ]] --[[ Name: updateOwned ]]
                    -- upvalues: v437 (ref), v435 (copy), v74 (ref)
                    v437 = true;
                    local l_v435_0 = v435;
                    if v74[l_v435_0] then
                        v74[l_v435_0]:Destroy();
                    end;
                    v435.Text = "Owned";
                end;
                local function _() --[[ Line: 1727 ]] --[[ Name: updateInfo ]]
                    -- upvalues: v435 (copy), v437 (ref), v438 (ref), v97 (ref), v431 (copy), v432 (copy)
                    if v435 and (v437 == false or v438) then
                        if v438 then
                            v97(v435, v431:GetAttribute("ProductId"), "Product");
                            return;
                        else
                            v97(v435, v432, "Gamepass");
                        end;
                    end;
                end;
                v59:Connect(function(v442) --[[ Line: 1746 ]]
                    -- upvalues: v438 (ref), v437 (ref), v435 (copy), v74 (ref), v97 (ref), v431 (copy), v432 (copy)
                    v438 = v442;
                    if not v442 and v437 then
                        v437 = true;
                        local l_v435_1 = v435;
                        if v74[l_v435_1] then
                            v74[l_v435_1]:Destroy();
                        end;
                        v435.Text = "Owned";
                        return;
                    else
                        if v435 and (v437 == false or v438) then
                            if v438 then
                                v97(v435, v431:GetAttribute("ProductId"), "Product");
                                return;
                            else
                                v97(v435, v432, "Gamepass");
                            end;
                        end;
                        return;
                    end;
                end);
                v57.Tick:Connect(function() --[[ Line: 1755 ]]
                    -- upvalues: v437 (ref), v435 (copy), v438 (ref), v97 (ref), v431 (copy), v432 (copy)
                    if v437 == false and v435 and (v437 == false or v438) then
                        if v438 then
                            v97(v435, v431:GetAttribute("ProductId"), "Product");
                            return;
                        else
                            v97(v435, v432, "Gamepass");
                        end;
                    end;
                end);
                v389:OnDictionaryInserted("Gamepass", function(_, v445) --[[ Line: 1763 ]]
                    -- upvalues: v433 (copy), v437 (ref), v435 (copy), v74 (ref)
                    if v445 == v433.Display then
                        v437 = true;
                        local l_v435_2 = v435;
                        if v74[l_v435_2] then
                            v74[l_v435_2]:Destroy();
                        end;
                        v435.Text = "Owned";
                    end;
                end);
                if v389:Get((("Gamepass.%*"):format(v433.Display))) == true then
                    v437 = true;
                    if v74[v435] then
                        v74[v435]:Destroy();
                    end;
                    v435.Text = "Owned";
                end;
                if v435 and (v437 == false or v438) then
                    if v438 then
                        v97(v435, v431:GetAttribute("ProductId"), "Product");
                    else
                        v97(v435, v432, "Gamepass");
                    end;
                end;
                local v447 = v24.new(v434);
                v447:Animate();
                v447.OnActivated:Connect(function() --[[ Line: 1778 ]]
                    -- upvalues: v58 (ref), v434 (copy), v431 (copy), v56 (ref), v432 (copy)
                    if v58 then
                        local v448 = v434:GetAttribute("GiftProductId") or v431:GetAttribute("ProductId");
                        v56:FireServer(v448 or v432, v58);
                        return;
                    else
                        v56:FireServer(v432, v58);
                        return;
                    end;
                end);
                return;
            end;
        end);
        v15.observeTag("StarterPack", function(v449) --[[ Line: 1789 ]]
            -- upvalues: v20 (ref), v37 (ref), v74 (ref), v389 (copy), v97 (ref), v60 (ref), v59 (ref), v57 (ref), v24 (ref), v56 (ref), v58 (ref)
            local v450 = v20.new();
            local v451 = v37[3290334159];
            if not v451 then
                return v450:WrapClean();
            else
                v449:SetAttribute("ProductId", 3290334159);
                v449:AddTag("ProductFrame");
                local v452 = v449:WaitForChild("Buy", 5);
                local v453 = v452 and v452:WaitForChild("Price", 5);
                local v454 = false;
                local v455 = false;
                local v456 = v449.Parent and v449.Parent:FindFirstChild("Title");
                local function _() --[[ Line: 1809 ]] --[[ Name: updateOwned ]]
                    -- upvalues: v454 (ref), v453 (copy), v74 (ref)
                    v454 = true;
                    local l_v453_0 = v453;
                    if v74[l_v453_0] then
                        v74[l_v453_0]:Destroy();
                    end;
                    v453.Text = "Owned";
                end;
                local function v461() --[[ Line: 1815 ]] --[[ Name: ToggleVisibility ]]
                    -- upvalues: v451 (copy), v389 (ref), v455 (ref), v449 (copy), v456 (copy)
                    for _, v460 in v451.Rewards.Items do
                        if v389:Get("Items." .. v460) == true and v455 == false then
                            v449.Visible = false;
                            if v456 then
                                v456.Visible = false;
                            end;
                            return;
                        end;
                    end;
                    v449.Visible = true;
                    if v456 then
                        v456.Visible = true;
                    end;
                end;
                local function _() --[[ Line: 1832 ]] --[[ Name: updateInfo ]]
                    -- upvalues: v453 (copy), v454 (ref), v455 (ref), v97 (ref)
                    if v453 and (v454 == false or v455 == true) then
                        v97(v453, 3290334159);
                    end;
                end;
                v450:Add(v60:Connect(v461));
                v450:Add(v59:Connect(function(v463) --[[ Line: 1842 ]]
                    -- upvalues: v455 (ref), v454 (ref), v453 (copy), v74 (ref), v97 (ref), v461 (copy)
                    v455 = v463;
                    if not v463 and v454 then
                        v454 = true;
                        local l_v453_1 = v453;
                        if v74[l_v453_1] then
                            v74[l_v453_1]:Destroy();
                        end;
                        v453.Text = "Owned";
                    elseif v453 and (v454 == false or v455 == true) then
                        v97(v453, 3290334159);
                    end;
                    v461();
                end));
                v450:Add(v57.Tick:Connect(function() --[[ Line: 1852 ]]
                    -- upvalues: v454 (ref), v453 (copy), v455 (ref), v97 (ref)
                    if v454 == false and v453 and (v454 == false or v455 == true) then
                        v97(v453, 3290334159);
                    end;
                end));
                v461();
                v450:Add(v389:OnDictionaryInserted("Items", v461));
                if v453 and (v454 == false or v455 == true) then
                    v97(v453, 3290334159);
                end;
                local v465 = v24.new(v452);
                v450:Add(v465);
                v465:Animate();
                v465.OnActivated:Connect(function() --[[ Line: 1866 ]]
                    -- upvalues: v452 (copy), v56 (ref), v58 (ref)
                    local l_v452_Attribute_0 = v452:GetAttribute("GiftProductId");
                    v56:FireServer(l_v452_Attribute_0 or 3290334159, v58);
                end);
                return v450:WrapClean();
            end;
        end);
        v15.observeTag("SantasSleigh", function(v467) --[[ Line: 1874 ]]
            -- upvalues: v20 (ref), v32 (ref), l_Players_0 (ref), v74 (ref), v37 (ref), v389 (copy), v17 (ref), v227 (ref), v97 (ref), v59 (ref), v57 (ref), v19 (ref), v27 (ref), v24 (ref), v56 (ref), v58 (ref)
            local v468 = v20.new();
            v467.Visible = false;
            local v469 = v32.getPolicy(l_Players_0.LocalPlayer);
            local v470 = v467.Parent and v467.Parent:FindFirstChild("SantasSleighSpacer");
            local v471 = v467:WaitForChild("Buy", 5);
            local v472 = v471 and v471:WaitForChild("Price", 5);
            local v473 = false;
            local v474 = false;
            local function _() --[[ Line: 1888 ]] --[[ Name: getProductId ]]
                -- upvalues: v469 (copy)
                if not v469 or v469.ArePaidRandomItemsRestricted then
                    return 3483721069;
                else
                    return 3481756179;
                end;
            end;
            v467.LuckyBlock.Visible = ((not v469 or v469.ArePaidRandomItemsRestricted) and 3483721069 or 3481756179) == 3481756179;
            v467.Visible = true;
            v467:SetAttribute("ProductId", (not v469 or v469.ArePaidRandomItemsRestricted) and 3483721069 or 3481756179);
            v467:AddTag("ProductFrame");
            local function _() --[[ Line: 1902 ]] --[[ Name: updateOwned ]]
                -- upvalues: v473 (ref), v472 (copy), v74 (ref)
                v473 = true;
                local l_v472_0 = v472;
                if v74[l_v472_0] then
                    v74[l_v472_0]:Destroy();
                end;
                v472.Text = "Owned";
            end;
            local v478 = false;
            local function v483() --[[ Line: 1910 ]] --[[ Name: ToggleVisibility ]]
                -- upvalues: v37 (ref), v469 (copy), v389 (ref), v474 (ref), v467 (copy), v470 (copy), v17 (ref)
                local v479 = v37[(not v469 or v469.ArePaidRandomItemsRestricted) and 3483721069 or 3481756179];
                if v479.Type == "Item" then
                    if v389:Get("Items." .. v479.Display) == true and v474 == false then
                        v467.Visible = false;
                        if v470 then
                            v470.Visible = false;
                        end;
                        return;
                    end;
                else
                    for _, v481 in v479.Rewards.Items do
                        if v389:Get("Items." .. v481) == true and v474 == false then
                            v467.Visible = false;
                            if v470 then
                                v470.Visible = false;
                            end;
                            return;
                        end;
                    end;
                end;
                local v482 = workspace:GetServerTimeNow() < v17:GetInstant("SantasSleighPackEndTime", 1767470400);
                v467.Visible = v482;
                if v470 then
                    v470.Visible = v482;
                end;
            end;
            local function v485() --[[ Line: 1939 ]] --[[ Name: updateInfo ]]
                -- upvalues: v469 (copy), v467 (copy), v227 (ref), v472 (copy), v473 (ref), v474 (ref), v97 (ref)
                local v484 = (not v469 or v469.ArePaidRandomItemsRestricted) and 3483721069 or 3481756179;
                v467:SetAttribute("ProductId", v484);
                task.spawn(v227, v467);
                v467.LuckyBlock.Visible = v484 == 3481756179;
                if v472 and (v473 == false or v474 == true) then
                    v97(v472, v484);
                end;
            end;
            v468:Add(v59:Connect(function(v486) --[[ Line: 1949 ]]
                -- upvalues: v474 (ref), v473 (ref), v472 (copy), v74 (ref), v485 (copy), v483 (copy)
                v474 = v486;
                if not v486 and v473 then
                    v473 = true;
                    local l_v472_1 = v472;
                    if v74[l_v472_1] then
                        v74[l_v472_1]:Destroy();
                    end;
                    v472.Text = "Owned";
                else
                    v485();
                end;
                v483();
            end));
            v468:Add(v57.Tick:Connect(function() --[[ Line: 1959 ]]
                -- upvalues: v473 (ref), v485 (copy)
                if v473 == false then
                    v485();
                end;
            end));
            v468:Add(v17:OnUpdate(function() --[[ Line: 1965 ]]
                -- upvalues: v483 (copy)
                v483();
            end));
            local v488 = v467:WaitForChild("Timer", 5);
            v468:Add(v19.Simple(1, function() --[[ Line: 1970 ]]
                -- upvalues: v17 (ref), v488 (copy), v27 (ref), v478 (ref), v483 (copy)
                local l_v17_Instant_9 = v17:GetInstant("SantasSleighPackEndTime", 1767470400);
                local l_workspace_ServerTimeNow_3 = workspace:GetServerTimeNow();
                if v488 then
                    v488.Text = ("%* left"):format((v27:E(l_v17_Instant_9 - l_workspace_ServerTimeNow_3)));
                end;
                if l_v17_Instant_9 <= l_workspace_ServerTimeNow_3 then
                    if not v478 then
                        v478 = true;
                        v483();
                        return;
                    end;
                elseif v478 then
                    v478 = false;
                    v483();
                end;
            end));
            v483();
            v468:Add(v389:OnDictionaryInserted("Items", v483));
            v485();
            local v491 = v24.new(v471);
            v468:Add(v491);
            v491:Animate();
            v491.OnActivated:Connect(function() --[[ Line: 1998 ]]
                -- upvalues: v471 (copy), v56 (ref), v469 (copy), v58 (ref)
                local l_v471_Attribute_0 = v471:GetAttribute("GiftProductId");
                v56:FireServer(l_v471_Attribute_0 or (not v469 or v469.ArePaidRandomItemsRestricted) and 3483721069 or 3481756179, v58);
            end);
            return v468:WrapClean();
        end);
        v15.observeTag("GingerbreadBase", function(v493) --[[ Line: 2006 ]]
            -- upvalues: v20 (ref), v32 (ref), l_Players_0 (ref), v389 (copy), v17 (ref), v227 (ref), v97 (ref), v59 (ref), v57 (ref), v19 (ref), v27 (ref), v24 (ref), v56 (ref), v58 (ref)
            local v494 = v20.new();
            v493.Visible = false;
            local v495 = v32.getPolicy(l_Players_0.LocalPlayer);
            local v496 = v493.Parent and v493.Parent:FindFirstChild("GingerbreadBaseSpacer");
            local v497 = v493:WaitForChild("Buy", 5);
            local v498 = v497 and v497:WaitForChild("Price", 5);
            local v499 = false;
            local v500 = false;
            local function _() --[[ Line: 2020 ]] --[[ Name: getProductId ]]
                -- upvalues: v495 (copy)
                if not v495 or v495.ArePaidRandomItemsRestricted then
                    return 3483736285;
                else
                    return 3483709817;
                end;
            end;
            v493.LuckyBlock.Visible = ((not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817) == 3483709817;
            v493.Visible = true;
            v493:SetAttribute("ProductId", (not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817);
            v493:AddTag("ProductFrame");
            local function v503() --[[ Line: 2034 ]] --[[ Name: ToggleVisibility ]]
                -- upvalues: v389 (ref), v499 (ref), v493 (copy), v496 (copy), v17 (ref)
                if v389:Get("UnlockedBaseSkins.Gingerbread") == true and v499 == false then
                    v493.Visible = false;
                    if v496 then
                        v496.Visible = false;
                    end;
                    return;
                else
                    local v502 = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                    v493.Visible = v502;
                    if v496 then
                        v496.Visible = v502;
                    end;
                    return;
                end;
            end;
            local function _() --[[ Line: 2050 ]] --[[ Name: updateInfo ]]
                -- upvalues: v495 (copy), v493 (copy), v227 (ref), v498 (copy), v97 (ref)
                local v504 = (not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817;
                v493:SetAttribute("ProductId", v504);
                task.spawn(v227, v493);
                v493.LuckyBlock.Visible = v504 == 3483709817;
                if v498 then
                    v97(v498, v504);
                end;
            end;
            v494:Add(v59:Connect(function(v506) --[[ Line: 2060 ]]
                -- upvalues: v499 (ref), v495 (copy), v493 (copy), v227 (ref), v498 (copy), v97 (ref), v389 (ref), v496 (copy), v17 (ref)
                v499 = v506;
                local v507 = (not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817;
                v493:SetAttribute("ProductId", v507);
                task.spawn(v227, v493);
                v493.LuckyBlock.Visible = v507 == 3483709817;
                if v498 then
                    v97(v498, v507);
                end;
                if v389:Get("UnlockedBaseSkins.Gingerbread") == true and v499 == false then
                    v493.Visible = false;
                    if v496 then
                        v496.Visible = false;
                        return;
                    end;
                else
                    v507 = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                    v493.Visible = v507;
                    if v496 then
                        v496.Visible = v507;
                    end;
                end;
            end));
            v494:Add(v57.Tick:Connect(function() --[[ Line: 2066 ]]
                -- upvalues: v495 (copy), v493 (copy), v227 (ref), v498 (copy), v97 (ref)
                local v508 = (not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817;
                v493:SetAttribute("ProductId", v508);
                task.spawn(v227, v493);
                v493.LuckyBlock.Visible = v508 == 3483709817;
                if v498 then
                    v97(v498, v508);
                end;
            end));
            v494:Add(v17:OnUpdate(function() --[[ Line: 2070 ]]
                -- upvalues: v389 (ref), v499 (ref), v493 (copy), v496 (copy), v17 (ref)
                if v389:Get("UnlockedBaseSkins.Gingerbread") == true and v499 == false then
                    v493.Visible = false;
                    if v496 then
                        v496.Visible = false;
                        return;
                    end;
                else
                    local v509 = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                    v493.Visible = v509;
                    if v496 then
                        v496.Visible = v509;
                    end;
                end;
            end));
            local v510 = v493:WaitForChild("Timer", 5);
            v494:Add(v19.Simple(1, function() --[[ Line: 2075 ]]
                -- upvalues: v17 (ref), v510 (copy), v27 (ref), v500 (ref), v389 (ref), v499 (ref), v493 (copy), v496 (copy)
                local l_v17_Instant_10 = v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                local l_workspace_ServerTimeNow_4 = workspace:GetServerTimeNow();
                if v510 then
                    v510.Text = ("%* left"):format((v27:E(l_v17_Instant_10 - l_workspace_ServerTimeNow_4)));
                end;
                if l_v17_Instant_10 <= l_workspace_ServerTimeNow_4 then
                    if not v500 then
                        v500 = true;
                        if v389:Get("UnlockedBaseSkins.Gingerbread") == true and v499 == false then
                            v493.Visible = false;
                            if v496 then
                                v496.Visible = false;
                                return;
                            end;
                        else
                            local v513 = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                            v493.Visible = v513;
                            if v496 then
                                v496.Visible = v513;
                                return;
                            end;
                        end;
                    end;
                elseif v500 then
                    v500 = false;
                    if v389:Get("UnlockedBaseSkins.Gingerbread") == true and v499 == false then
                        v493.Visible = false;
                        if v496 then
                            v496.Visible = false;
                            return;
                        end;
                    else
                        local v514 = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                        v493.Visible = v514;
                        if v496 then
                            v496.Visible = v514;
                        end;
                    end;
                end;
            end));
            if v389:Get("UnlockedBaseSkins.Gingerbread") == true and v499 == false then
                v493.Visible = false;
                if v496 then
                    v496.Visible = false;
                end;
            else
                local v515 = workspace:GetServerTimeNow() < v17:GetInstant("GingerbreadBasePackEndTime", 1767470400);
                v493.Visible = v515;
                if v496 then
                    v496.Visible = v515;
                end;
            end;
            v494:Add(v389:OnDictionaryInserted("UnlockedBaseSkins", v503));
            local v516 = (not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817;
            v493:SetAttribute("ProductId", v516);
            task.spawn(v227, v493);
            v493.LuckyBlock.Visible = v516 == 3483709817;
            if v498 then
                v97(v498, v516);
            end;
            v516 = v24.new(v497);
            v494:Add(v516);
            v516:Animate();
            v516.OnActivated:Connect(function() --[[ Line: 2103 ]]
                -- upvalues: v497 (copy), v56 (ref), v495 (copy), v58 (ref)
                local l_v497_Attribute_0 = v497:GetAttribute("GiftProductId");
                v56:FireServer(l_v497_Attribute_0 or (not v495 or v495.ArePaidRandomItemsRestricted) and 3483736285 or 3483709817, v58);
            end);
            return v494:WrapClean();
        end);
        v15.observeTag("RainbowText", function(v518) --[[ Line: 2111 ]]
            -- upvalues: v12 (ref)
            return v12.apply(v518, "Rainbow");
        end);
        v15.observeTag("ZebraText", function(v519) --[[ Line: 2115 ]]
            -- upvalues: v12 (ref)
            return v12.apply(v519, "Zebra");
        end);
        v57:Start();
        (function(v520) --[[ Line: 2123 ]] --[[ Name: preloadProductIds ]]
            -- upvalues: v30 (ref)
            for _, v522 in v520 do
                task.defer(v30.GetProductInfo, v30, v522, "Product");
            end;
        end)({
            v34[2].ProductId
        });
    end);
    local v523 = v24.new(l_GiftButton_0);
    v523:Animate();
    v523.OnActivated:Connect(function() --[[ Line: 877 ]]
        -- upvalues: v58 (ref), l_PlayerSelected_0 (ref), l_Txt_0 (ref), v59 (ref), v232 (ref), l_GiftPlayer_0 (ref)
        if v58 then
            v58 = nil;
            l_PlayerSelected_0.Visible = false;
            l_Txt_0.Text = "Gift Player";
            v59:Fire(false);
            v232();
            return;
        else
            l_GiftPlayer_0.Visible = not l_GiftPlayer_0.Visible;
            return;
        end;
    end);
    v523 = v24.new(l_Close_0);
    v523:Animate();
    v523.OnActivated:Connect(function() --[[ Line: 895 ]]
        -- upvalues: l_GiftPlayer_0 (ref), v59 (ref)
        l_GiftPlayer_0.Visible = false;
        v59:Fire(false);
    end);
    v523 = l_Shop_0.Content.List.ServerLuck;
    local l_v523_0 = v523 --[[ copy: 1 -> 8 ]];
    v14:WaitAndCall("ServerLuck", function(v525) --[[ Line: 725 ]]
        -- upvalues: l_v523_0 (copy), v27 (ref), v34 (ref), v30 (ref), v97 (ref), v19 (ref), v24 (ref), v56 (ref)
        local v526 = nil;
        local v527 = os.clock();
        local function v536() --[[ Line: 729 ]] --[[ Name: update ]]
            -- upvalues: v527 (ref), v526 (ref), v525 (copy), l_v523_0 (ref), v27 (ref), v34 (ref), v30 (ref), v97 (ref)
            if os.clock() - v527 >= 300 then
                v527 = os.clock();
                v526 = nil;
            end;
            local v528 = v525:Get("EndTime");
            if v528 then
                local v529 = math.clamp(math.floor(v528 - workspace:GetServerTimeNow()), 0, 1e999);
                if v529 <= 0 then
                    v528 = nil;
                    v526 = nil;
                else
                    l_v523_0.Frame.Timer.Text = v27:A(v529);
                end;
            end;
            l_v523_0.Frame.Timer.Visible = v528 ~= nil;
            local v530 = v525:Get("Index") or 0;
            local v531 = #v34;
            local v532 = math.min(v530 + 1, v531);
            if v530 ~= v526 then
                v526 = v530;
                local v533 = nil;
                v533 = v531 <= v530 and "<font color=\"#FFFF00\">MAX</font>" or ("<font color=\"#FFFFFF\">%dx</font> &gt; <font color=\"#FFFF00\">%dx</font>"):format(v530 == 0 and 1 or v34[v530].Multiplier, v34[v532].Multiplier);
                local v534 = v34[v532];
                local l_v30_ProductInfo_5 = v30:GetProductInfo(v534.ProductId, "Product");
                v97(l_v523_0.Frame.Buy.Price, v534.ProductId);
                l_v523_0.Frame.LuckVector.Image = l_v30_ProductInfo_5.Icon;
                l_v523_0.Frame.Pattern.Image = l_v30_ProductInfo_5.Icon;
                l_v523_0.Frame.Amount.Text = v533;
            end;
        end;
        v525:OnChanged("Index", v536);
        v525:OnChanged("EndTime", v536);
        v19.Simple(1, v536);
        local v537 = v24.new(l_v523_0.Frame.Buy);
        v537:Animate();
        v537.OnActivated:Connect(function() --[[ Line: 780 ]]
            -- upvalues: v525 (copy), v34 (ref), v56 (ref)
            local v538 = v525:Get("Index") or 0;
            local v539 = #v34;
            local v540 = math.min(v538 + 1, v539);
            v56:FireServer(v34[v540].ProductId);
        end);
    end);
    v195();
    v523 = nil;
    do
        local l_v523_1 = v523;
        local function v548() --[[ Line: 945 ]] --[[ Name: updateBlackfridaySale ]]
            -- upvalues: v17 (ref), l_Shop_0 (ref), v27 (ref), l_v523_1 (ref), v45 (ref), v44 (ref)
            local l_workspace_ServerTimeNow_5 = workspace:GetServerTimeNow();
            local l_v17_Instant_11 = v17:GetInstant("BlackfridaySale/EndTimestamp", 0);
            local v544 = l_v17_Instant_11 - l_workspace_ServerTimeNow_5;
            local v545 = workspace:GetServerTimeNow() <= l_v17_Instant_11;
            l_Shop_0.Txt1.Text = ("<font color=\"rgb(255,255,255)\">BLACK FRIDAY SALE: </font>%* left"):format((v27:E((math.max(v544, 0)))));
            if l_v523_1 == v545 then
                return;
            else
                l_v523_1 = v545;
                if v45 == v545 then
                    return;
                else
                    v45 = v545;
                    for _, v547 in v44 do
                        v547.Visible = v545;
                    end;
                    return;
                end;
            end;
        end;
        v17:OnUpdate(v548);
        v19.Simple(1, v548);
        task.spawn(v548);
    end;
    task.spawn(v387);
    for _, v550 in l_Players_0:GetPlayers() do
        v243(v550);
    end;
    l_Players_0.PlayerAdded:Connect(function(v551) --[[ Line: 2150 ]]
        -- upvalues: v243 (ref)
        v243(v551);
    end);
    l_Players_0.PlayerRemoving:Connect(function(v552) --[[ Line: 2154 ]]
        -- upvalues: l_List_0 (ref)
        local l_l_List_0_FirstChild_1 = l_List_0:FindFirstChild(v552.Name);
        if l_l_List_0_FirstChild_1 then
            l_l_List_0_FirstChild_1:Destroy();
        end;
    end);
    for _, v555 in l_Shop_0.Header.Main:GetChildren() do
        if v555:IsA("ImageButton") then
            local l_FirstChild_0 = l_Shop_0.Content.List:FindFirstChild(v555.Name);
            if l_FirstChild_0 then
                local v557 = v24.new(v555);
                v557:Animate();
                v557.OnActivated:Connect(function() --[[ Line: 2164 ]]
                    -- upvalues: l_Shop_0 (ref), l_FirstChild_0 (copy)
                    local l_List_3 = l_Shop_0.Content.List;
                    local v559 = l_FirstChild_0.AbsolutePosition.Y - l_List_3.AbsolutePosition.Y + l_List_3.CanvasPosition.Y;
                    l_List_3.CanvasPosition = Vector2.new(l_List_3.CanvasPosition.X, v559);
                end);
            end;
        end;
    end;
    task.spawn(function() --[[ Line: 2172 ]]
        -- upvalues: v37 (ref), v61 (ref), v39 (ref), l_LocalPlayer_0 (ref), l_Shop_0 (ref), v14 (ref)
        local v560 = v37[3442292161];
        local function v564() --[[ Line: 2175 ]] --[[ Name: update ]]
            -- upvalues: v61 (ref), v39 (ref), l_LocalPlayer_0 (ref), l_Shop_0 (ref)
            local l_Size_0 = v61.Defaults.Size;
            local v562 = v39.GetAttribute(l_LocalPlayer_0, "Shop.Scale", 1);
            local v563 = UDim2.new(l_Size_0.X.Scale * v562, l_Size_0.X.Offset, l_Size_0.Y.Scale * v562, l_Size_0.Y.Offset);
            if v563.X.Scale ~= v61.Defaults.Size.X.Scale or v563.Y.Scale ~= v61.Defaults.Size.Y.Scale then
                l_Shop_0.Size = v563;
                v61.Defaults.Size = v563;
            end;
            v562 = v39.GetAttribute(l_LocalPlayer_0, "Shop.HideLuckyBlocksTitle", false);
            l_Shop_0.Content.List.LuckyBlocks.Visible = not v562;
            v562 = v39.GetAttribute(l_LocalPlayer_0, "Shop.PromoTitle", nil);
            if v562 then
                l_Shop_0.Content.List.PromoTitle.Text = v562;
                l_Shop_0.Content.List.PromoTitle.Visible = true;
                return;
            else
                l_Shop_0.Content.List.PromoTitle.Visible = false;
                return;
            end;
        end;
        v39.Loaded:Connect(v564);
        v564();
        v14:WaitAndCall(l_LocalPlayer_0, function(v565) --[[ Line: 2274 ]]
            -- upvalues: v564 (copy), v560 (copy)
            v564();
            v565:OnDictionaryInserted("Gamepass", function(_, v567) --[[ Line: 2276 ]]
                -- upvalues: v560 (ref), v564 (ref)
                if v567 == v560.Display then
                    v564();
                end;
            end);
        end);
    end);
    v61.OnClose:Connect(function() --[[ Line: 2284 ]]
        -- upvalues: v62 (ref)
        v62:RemoveGiftingTarget();
    end);
    v523 = false;
    local function v571(v568) --[[ Line: 2289 ]] --[[ Name: RunExperiments ]]
        -- upvalues: v523 (ref), v7 (ref), v8 (ref), v355 (ref)
        if v523 then
            return;
        else
            v523 = true;
            local v569 = v568:Get({
                "Configs", 
                "ShopProductRankSorting"
            }) or v7;
            local v570 = v568:Get({
                "Configs", 
                "ShopSectionRankSorting"
            }) or v8;
            if v569 or v570 then
                v355(v570 == true);
            end;
            return;
        end;
    end;
    v14:WaitAndCall(l_LocalPlayer_0, function(_) --[[ Line: 2306 ]]
        -- upvalues: v16 (ref), l_LocalPlayer_0 (ref), v571 (copy)
        local v573 = v16.Client:WaitReplion(("%*_Configs"):format(l_LocalPlayer_0.Name), 60);
        if not v573 then
            return;
        else
            v571(v573);
            return;
        end;
    end);
    v16.Client:OnReplionAddedWithTag("PlayerConfigs", function(v574) --[[ Line: 2315 ]]
        -- upvalues: v14 (ref), l_LocalPlayer_0 (ref), v571 (copy)
        local _ = v14:Wait(l_LocalPlayer_0);
        v571(v574);
    end);
end;
v62.OpenGiftingScreen = function(_) --[[ Line: 2321 ]] --[[ Name: OpenGiftingScreen ]]
    -- upvalues: l_GiftPlayer_0 (copy)
    l_GiftPlayer_0.Visible = true;
end;
v62.CloseGiftingScreen = function(_) --[[ Line: 2325 ]] --[[ Name: CloseGiftingScreen ]]
    -- upvalues: l_GiftPlayer_0 (copy)
    l_GiftPlayer_0.Visible = false;
end;
v62.RemoveGiftingTarget = function(_) --[[ Line: 2329 ]] --[[ Name: RemoveGiftingTarget ]]
    -- upvalues: v58 (ref), l_PlayerSelected_0 (copy), l_Txt_0 (copy), v59 (copy)
    if v58 then
        v58 = nil;
        l_PlayerSelected_0.Visible = false;
        l_Txt_0.Text = "Gift Player";
        v59:Fire(false);
    end;
end;
v62.GetGiftingTarget = function(_) --[[ Line: 2338 ]] --[[ Name: GetGiftingTarget ]]
    -- upvalues: v58 (ref)
    return v58;
end;
v62.BindLabelToProductPrice = function(_, v581, v582, v583, v584) --[[ Line: 2342 ]] --[[ Name: BindLabelToProductPrice ]]
    -- upvalues: v97 (copy)
    return (v97(v581, v582, v583, v584));
end;
v62.UnbindLabelProductPrice = function(_, v586) --[[ Line: 2346 ]] --[[ Name: UnbindLabelProductPrice ]]
    -- upvalues: v74 (copy)
    if v74[v586] then
        v74[v586]:Destroy();
    end;
end;
return v62;