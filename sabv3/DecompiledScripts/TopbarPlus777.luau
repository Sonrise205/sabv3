local l_UserInputService_0 = game:GetService("UserInputService");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(script.Types);
local l_script_0 = script;
local v6 = require(l_script_0.Reference);
local v7 = v6.getObject();
local v8 = v7 and v7.Value;
if v8 and v8 ~= l_script_0 then
    return (require(v8));
else
    if not v7 then
        v6.addToReplicatedStorage();
    end;
    local v9 = require(l_script_0.Packages.GoodSignal);
    local v10 = require(l_script_0.Packages.Janitor);
    local v11 = require(l_script_0.Utility);
    local v12 = require(l_script_0.Features.Themes);
    local v13 = require(l_script_0.Features.Gamepad);
    local v14 = require(l_script_0.Features.Overflow);
    local v15 = {};
    v15.__index = v15;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_Themes_0 = l_script_0.Features.Themes;
    local v18 = {};
    local v19 = v9.new();
    local l_Elements_0 = l_script_0.Elements;
    local v21 = 0;
    v15.baseDisplayOrderChanged = v9.new();
    v15.baseDisplayOrder = 10;
    v15.baseTheme = require(l_Themes_0.Default);
    v15.isOldTopbar = false;
    v15.iconsDictionary = v18;
    v15.insetHeightChanged = v9.new();
    v15.container = require(l_Elements_0.Container)(v15);
    v15.topbarEnabled = true;
    v15.iconAdded = v9.new();
    v15.iconRemoved = v9.new();
    v15.iconChanged = v9.new();
    v15.getIcons = function() --[[ Line: 105 ]] --[[ Name: getIcons ]]
        -- upvalues: v15 (copy)
        return v15.iconsDictionary;
    end;
    v15.getIconByUID = function(v22) --[[ Line: 109 ]] --[[ Name: getIconByUID ]]
        -- upvalues: v15 (copy)
        local v23 = v15.iconsDictionary[v22];
        if v23 then
            return v23;
        else
            return nil;
        end;
    end;
    v15.getIcon = function(v24) --[[ Line: 117 ]] --[[ Name: getIcon ]]
        -- upvalues: v15 (copy), v18 (copy)
        local v25 = v15.getIconByUID(v24);
        if v25 then
            return v25;
        else
            for _, v27 in pairs(v18) do
                if v27.name == v24 then
                    return v27;
                end;
            end;
            return nil;
        end;
    end;
    v15.setTopbarEnabled = function(v28, v29) --[[ Line: 130 ]] --[[ Name: setTopbarEnabled ]]
        -- upvalues: v15 (copy)
        if typeof(v28) ~= "boolean" then
            v28 = v15.topbarEnabled;
        end;
        if not v29 then
            v15.topbarEnabled = v28;
        end;
        for _, v31 in pairs(v15.container) do
            v31.Enabled = v28;
        end;
    end;
    v15.modifyBaseTheme = function(v32) --[[ Line: 142 ]] --[[ Name: modifyBaseTheme ]]
        -- upvalues: v12 (copy), v15 (copy), v18 (copy)
        v32 = v12.getModifications(v32);
        for _, v34 in pairs(v32) do
            for _, v36 in pairs(v15.baseTheme) do
                v12.merge(v36, v34);
            end;
        end;
        for _, v38 in pairs(v18) do
            v38:setTheme(v15.baseTheme);
        end;
    end;
    v15.setDisplayOrder = function(v39) --[[ Line: 154 ]] --[[ Name: setDisplayOrder ]]
        -- upvalues: v15 (copy)
        v15.baseDisplayOrder = v39;
        v15.baseDisplayOrderChanged:Fire(v39);
    end;
    task.defer(v13.start, v15);
    task.defer(v14.start, v15);
    task.defer(function() --[[ Line: 164 ]]
        -- upvalues: l_LocalPlayer_0 (copy), v15 (copy), l_script_0 (copy)
        local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
        for _, v42 in pairs(v15.container) do
            v42.Parent = l_PlayerGui_0;
        end;
        require(l_script_0.Attribute);
    end);
    v15.new = function() --[[ Line: 175 ]] --[[ Name: new ]]
        -- upvalues: v15 (copy), v10 (copy), v11 (copy), v18 (copy), v9 (copy), l_script_0 (copy), l_Elements_0 (copy), v21 (ref), l_UserInputService_0 (copy), v19 (copy), l_StarterGui_0 (copy)
        local v43 = {};
        setmetatable(v43, v15);
        local v44 = v10.new();
        v43.janitor = v44;
        v43.themesJanitor = v44:add(v10.new());
        v43.singleClickJanitor = v44:add(v10.new());
        v43.captionJanitor = v44:add(v10.new());
        v43.joinJanitor = v44:add(v10.new());
        v43.menuJanitor = v44:add(v10.new());
        v43.dropdownJanitor = v44:add(v10.new());
        local v45 = v11.generateUID();
        v18[v45] = v43;
        v44:add(function() --[[ Line: 192 ]]
            -- upvalues: v18 (ref), v45 (copy)
            v18[v45] = nil;
        end);
        v43.selected = v44:add(v9.new());
        v43.deselected = v44:add(v9.new());
        v43.toggled = v44:add(v9.new());
        v43.viewingStarted = v44:add(v9.new());
        v43.viewingEnded = v44:add(v9.new());
        v43.stateChanged = v44:add(v9.new());
        v43.notified = v44:add(v9.new());
        v43.noticeStarted = v44:add(v9.new());
        v43.noticeChanged = v44:add(v9.new());
        v43.endNotices = v44:add(v9.new());
        v43.toggleKeyAdded = v44:add(v9.new());
        v43.fakeToggleKeyChanged = v44:add(v9.new());
        v43.alignmentChanged = v44:add(v9.new());
        v43.updateSize = v44:add(v9.new());
        v43.resizingComplete = v44:add(v9.new());
        v43.joinedParent = v44:add(v9.new());
        v43.menuSet = v44:add(v9.new());
        v43.dropdownSet = v44:add(v9.new());
        v43.updateMenu = v44:add(v9.new());
        v43.startMenuUpdate = v44:add(v9.new());
        v43.childThemeModified = v44:add(v9.new());
        v43.indicatorSet = v44:add(v9.new());
        v43.dropdownChildAdded = v44:add(v9.new());
        v43.menuChildAdded = v44:add(v9.new());
        v43.iconModule = l_script_0;
        v43.UID = v45;
        v43.isEnabled = true;
        v43.enabled = v43.isEnabled;
        v43.isSelected = false;
        v43.isViewing = false;
        v43.joinedFrame = false;
        v43.parentIconUID = false;
        v43.deselectWhenOtherIconSelected = true;
        v43.totalNotices = 0;
        v43.activeState = "Deselected";
        v43.alignment = "";
        v43.originalAlignment = "";
        v43.appliedTheme = {};
        v43.appearance = {};
        v43.cachedInstances = {};
        v43.cachedNamesToInstances = {};
        v43.cachedCollectives = {};
        v43.bindedToggleKeys = {};
        v43.customBehaviours = {};
        v43.toggleItems = {};
        v43.bindedEvents = {};
        v43.notices = {};
        v43.menuIcons = {};
        v43.dropdownIcons = {};
        v43.childIconsDict = {};
        v43.creationTime = os.clock();
        v43.widget = v44:add(require(l_Elements_0.Widget)(v43, v15));
        v43:setAlignment();
        v21 = v21 + 1;
        local v46 = v21 * 0.01 + 1;
        v43:setOrder(v46, "deselected");
        v43:setOrder(v46, "selected");
        v43:setTheme(v15.baseTheme);
        local v47 = v43:getInstance("ClickRegion");
        local function _() --[[ Line: 268 ]] --[[ Name: handleToggle ]]
            -- upvalues: v43 (copy)
            if v43.locked then
                return;
            elseif v43.isSelected then
                v43:deselect("User", v43);
                return;
            else
                v43:select("User", v43);
                return;
            end;
        end;
        local v49 = false;
        local v50 = false;
        v47.MouseButton1Click:Connect(function() --[[ Line: 280 ]]
            -- upvalues: v49 (ref), v50 (ref), v43 (copy)
            if v49 then
                return;
            else
                v50 = true;
                task.delay(0.01, function() --[[ Line: 285 ]]
                    -- upvalues: v50 (ref)
                    v50 = false;
                end);
                if v43.locked then
                    return;
                elseif v43.isSelected then
                    v43:deselect("User", v43);
                    return;
                else
                    v43:select("User", v43);
                    return;
                end;
            end;
        end);
        v47.TouchTap:Connect(function() --[[ Line: 290 ]]
            -- upvalues: v50 (ref), v49 (ref), v43 (copy)
            if v50 then
                return;
            else
                v49 = true;
                task.delay(0.01, function() --[[ Line: 297 ]]
                    -- upvalues: v49 (ref)
                    v49 = false;
                end);
                if v43.locked then
                    return;
                elseif v43.isSelected then
                    v43:deselect("User", v43);
                    return;
                else
                    v43:select("User", v43);
                    return;
                end;
            end;
        end);
        v44:add(l_UserInputService_0.InputBegan:Connect(function(v51, v52) --[[ Line: 304 ]]
            -- upvalues: v43 (copy)
            if v43.locked then
                return;
            else
                if v43.bindedToggleKeys[v51.KeyCode] and not v52 then
                    if v43.locked then
                        return;
                    elseif v43.isSelected then
                        v43:deselect("User", v43);
                        return;
                    else
                        v43:select("User", v43);
                    end;
                end;
                return;
            end;
        end));
        local function v54(v53) --[[ Line: 316 ]] --[[ Name: viewingStarted ]]
            -- upvalues: v43 (copy)
            if v43.locked then
                return;
            else
                v43.isViewing = true;
                v43.viewingStarted:Fire(true);
                if not v53 then
                    v43:setState("Viewing", "User", v43);
                end;
                return;
            end;
        end;
        local function v55() --[[ Line: 326 ]] --[[ Name: viewingEnded ]]
            -- upvalues: v43 (copy)
            if v43.locked then
                return;
            else
                v43.isViewing = false;
                v43.viewingEnded:Fire(true);
                v43:setState(nil, "User", v43);
                return;
            end;
        end;
        v43.joinedParent:Connect(function() --[[ Line: 334 ]]
            -- upvalues: v43 (copy)
            if v43.isViewing then
                if v43.locked then
                    return;
                else
                    v43.isViewing = false;
                    v43.viewingEnded:Fire(true);
                    v43:setState(nil, "User", v43);
                end;
            end;
        end);
        v47.MouseEnter:Connect(function() --[[ Line: 339 ]]
            -- upvalues: l_UserInputService_0 (ref), v43 (copy)
            local v56 = not l_UserInputService_0.KeyboardEnabled;
            if v43.locked then
                return;
            else
                v43.isViewing = true;
                v43.viewingStarted:Fire(true);
                if not v56 then
                    v43:setState("Viewing", "User", v43);
                end;
                return;
            end;
        end);
        local v57 = 0;
        v44:add(l_UserInputService_0.TouchEnded:Connect(v55));
        v47.MouseLeave:Connect(v55);
        v47.SelectionGained:Connect(v54);
        v47.SelectionLost:Connect(v55);
        v47.MouseButton1Down:Connect(function() --[[ Line: 348 ]]
            -- upvalues: v43 (copy), l_UserInputService_0 (ref), v57 (ref)
            if not v43.locked and l_UserInputService_0.TouchEnabled then
                v57 = v57 + 1;
                local l_v57_0 = v57;
                task.delay(0.2, function() --[[ Line: 352 ]]
                    -- upvalues: l_v57_0 (copy), v57 (ref), v43 (ref)
                    if l_v57_0 == v57 then
                        if v43.locked then
                            return;
                        else
                            v43.isViewing = true;
                            v43.viewingStarted:Fire(true);
                            v43:setState("Viewing", "User", v43);
                        end;
                    end;
                end);
            end;
        end);
        v47.MouseButton1Up:Connect(function() --[[ Line: 359 ]]
            -- upvalues: v57 (ref)
            v57 = v57 + 1;
        end);
        local v59 = v43:getInstance("IconOverlay");
        v43.viewingStarted:Connect(function() --[[ Line: 365 ]]
            -- upvalues: v59 (copy), v43 (copy)
            v59.Visible = not v43.overlayDisabled;
        end);
        v43.viewingEnded:Connect(function() --[[ Line: 368 ]]
            -- upvalues: v59 (copy)
            v59.Visible = false;
        end);
        v44:add(v19:Connect(function(v60) --[[ Line: 373 ]]
            -- upvalues: v43 (copy)
            if v60 ~= v43 and v43.deselectWhenOtherIconSelected and v60.deselectWhenOtherIconSelected then
                v43:deselect("AutoDeselect", v60);
            end;
        end));
        local v61 = debug.info(2, "s");
        local v62 = string.split(v61, ".");
        local l_game_0 = game;
        local v64 = nil;
        for _, v66 in pairs(v62) do
            l_game_0 = l_game_0:FindFirstChild(v66);
            if l_game_0 then
                if l_game_0:IsA("ScreenGui") then
                    v64 = l_game_0;
                end;
            else
                break;
            end;
        end;
        if l_game_0 and v64 and v64.ResetOnSpawn == true then
            v43.originsScreenGui = v64;
            v11.localPlayerRespawned(function() --[[ Line: 399 ]]
                -- upvalues: v43 (copy)
                v43:destroy();
            end);
        end;
        v43.toggled:Connect(function(v67) --[[ Line: 405 ]]
            -- upvalues: v43 (copy), v15 (ref)
            v43.noticeChanged:Fire(v43.totalNotices);
            for v68, _ in pairs(v43.childIconsDict) do
                local v70 = v15.getIconByUID(v68);
                v70.noticeChanged:Fire(v70.totalNotices);
                if not v67 and v70.isSelected then
                    for _, _ in pairs(v70.childIconsDict) do
                        v70:deselect("HideParentFeature", v43);
                    end;
                end;
            end;
        end);
        v43.selected:Connect(function() --[[ Line: 428 ]]
            -- upvalues: v43 (copy), l_StarterGui_0 (ref)
            if #v43.dropdownIcons > 0 then
                if l_StarterGui_0:GetCore("ChatActive") and v43.alignment ~= "Right" then
                    v43.chatWasPreviouslyActive = true;
                    l_StarterGui_0:SetCore("ChatActive", false);
                end;
                if l_StarterGui_0:GetCoreGuiEnabled("PlayerList") and v43.alignment ~= "Left" then
                    v43.playerlistWasPreviouslyActive = true;
                    l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false);
                end;
            end;
        end);
        v43.deselected:Connect(function() --[[ Line: 441 ]]
            -- upvalues: v43 (copy), l_StarterGui_0 (ref)
            if v43.chatWasPreviouslyActive then
                v43.chatWasPreviouslyActive = nil;
                l_StarterGui_0:SetCore("ChatActive", true);
            end;
            if v43.playerlistWasPreviouslyActive then
                v43.playerlistWasPreviouslyActive = nil;
                l_StarterGui_0:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true);
            end;
        end);
        task.delay(0.1, function() --[[ Line: 455 ]]
            -- upvalues: v43 (copy)
            if v43.activeState == "Deselected" then
                v43.stateChanged:Fire("Deselected");
                v43:refresh();
            end;
        end);
        v15.iconAdded:Fire(v43);
        return v43;
    end;
    v15.setName = function(v73, v74) --[[ Line: 471 ]] --[[ Name: setName ]]
        v73.widget.Name = v74;
        v73.name = v74;
        return v73;
    end;
    v15.setState = function(v75, v76, v77, v78) --[[ Line: 477 ]] --[[ Name: setState ]]
        -- upvalues: v11 (copy), v19 (copy)
        if not v76 then
            v76 = v75.isSelected and "Selected" or "Deselected";
        end;
        local v79 = v11.formatStateName(v76);
        if v75.activeState == v79 then
            return;
        else
            local l_isSelected_0 = v75.isSelected;
            v75.activeState = v79;
            if v79 == "Deselected" then
                v75.isSelected = false;
                if l_isSelected_0 then
                    v75.toggled:Fire(false, v77, v78);
                    v75.deselected:Fire(v77, v78);
                end;
                v75:_setToggleItemsVisible(false, v77, v78);
            elseif v79 == "Selected" then
                v75.isSelected = true;
                if not l_isSelected_0 then
                    v75.toggled:Fire(true, v77, v78);
                    v75.selected:Fire(v77, v78);
                    v19:Fire(v75, v77, v78);
                end;
                v75:_setToggleItemsVisible(true, v77, v78);
            end;
            v75.stateChanged:Fire(v79, v77, v78);
            return;
        end;
    end;
    v15.getInstance = function(v81, v82) --[[ Line: 510 ]] --[[ Name: getInstance ]]
        -- upvalues: v12 (copy)
        local v83 = v81.cachedNamesToInstances[v82];
        if v83 then
            return v83;
        else
            local function v88(v84, v85) --[[ Line: 518 ]] --[[ Name: cacheInstance ]]
                -- upvalues: v81 (copy)
                if not v81.cachedInstances[v85] then
                    local l_v85_Attribute_0 = v85:GetAttribute("Collective");
                    local v87 = l_v85_Attribute_0 and v81.cachedCollectives[l_v85_Attribute_0];
                    if v87 then
                        table.insert(v87, v85);
                    end;
                    v81.cachedNamesToInstances[v84] = v85;
                    v81.cachedInstances[v85] = true;
                    v85.Destroying:Once(function() --[[ Line: 528 ]]
                        -- upvalues: v81 (ref), v84 (copy), v85 (copy)
                        v81.cachedNamesToInstances[v84] = nil;
                        v81.cachedInstances[v85] = nil;
                    end);
                end;
            end;
            local l_widget_0 = v81.widget;
            v88("Widget", l_widget_0);
            if v82 == "Widget" then
                return l_widget_0;
            else
                local v90 = nil;
                local function v91(v92) --[[ Line: 541 ]] --[[ Name: scanChildren ]]
                    -- upvalues: v81 (copy), v12 (ref), v91 (copy), v88 (copy), v82 (copy), v90 (ref)
                    for _, v94 in pairs(v92:GetChildren()) do
                        local l_v94_Attribute_0 = v94:GetAttribute("WidgetUID");
                        if not l_v94_Attribute_0 or l_v94_Attribute_0 == v81.UID then
                            local v96 = v12.getRealInstance(v94);
                            if v96 then
                                v94 = v96;
                            end;
                            v91(v94);
                            if v94:IsA("GuiBase") or v94:IsA("UIBase") or v94:IsA("ValueBase") then
                                local l_Name_0 = v94.Name;
                                v88(l_Name_0, v94);
                                if l_Name_0 == v82 then
                                    v90 = v94;
                                end;
                            end;
                        end;
                    end;
                end;
                v91(l_widget_0);
                return v90;
            end;
        end;
    end;
    v15.getCollective = function(v98, v99) --[[ Line: 570 ]] --[[ Name: getCollective ]]
        local v100 = v98.cachedCollectives[v99];
        if v100 then
            return v100;
        else
            v100 = {};
            for v101, _ in pairs(v98.cachedInstances) do
                if v101:GetAttribute("Collective") == v99 then
                    table.insert(v100, v101);
                end;
            end;
            v98.cachedCollectives[v99] = v100;
            return v100;
        end;
    end;
    v15.getInstanceOrCollective = function(v103, v104) --[[ Line: 591 ]] --[[ Name: getInstanceOrCollective ]]
        local v105 = {};
        local v106 = v103:getInstance(v104);
        if v106 then
            table.insert(v105, v106);
        end;
        if #v105 == 0 then
            v105 = v103:getCollective(v104);
        end;
        return v105;
    end;
    v15.getStateGroup = function(v107, v108) --[[ Line: 605 ]] --[[ Name: getStateGroup ]]
        local v109 = v108 or v107.activeState;
        local v110 = v107.appearance[v109];
        if not v110 then
            v110 = {};
            v107.appearance[v109] = v110;
        end;
        return v110;
    end;
    v15.refreshAppearance = function(v111, v112, v113) --[[ Line: 615 ]] --[[ Name: refreshAppearance ]]
        -- upvalues: v12 (copy)
        v12.refresh(v111, v112, v113);
        return v111;
    end;
    v15.refresh = function(v114) --[[ Line: 620 ]] --[[ Name: refresh ]]
        v114:refreshAppearance(v114.widget);
        v114.updateSize:Fire();
        return v114;
    end;
    v15.updateParent = function(v115) --[[ Line: 626 ]] --[[ Name: updateParent ]]
        -- upvalues: v15 (copy)
        local v116 = v15.getIconByUID(v115.parentIconUID);
        if v116 then
            v116.updateSize:Fire();
        end;
    end;
    v15.setBehaviour = function(v117, v118, v119, v120, v121) --[[ Line: 633 ]] --[[ Name: setBehaviour ]]
        local v122 = v118 .. "-" .. v119;
        v117.customBehaviours[v122] = v120;
        if v121 then
            local v123 = v117:getInstanceOrCollective(v118);
            for _, v125 in pairs(v123) do
                v117:refreshAppearance(v125, v119);
            end;
        end;
    end;
    v15.modifyTheme = function(v126, v127, v128) --[[ Line: 646 ]] --[[ Name: modifyTheme ]]
        -- upvalues: v12 (copy)
        return v126, (v12.modify(v126, v127, v128));
    end;
    v15.modifyChildTheme = function(v129, v130, v131) --[[ Line: 651 ]] --[[ Name: modifyChildTheme ]]
        -- upvalues: v15 (copy)
        v129.childModifications = v130;
        v129.childModificationsUID = v131;
        for v132, _ in pairs(v129.childIconsDict) do
            v15.getIconByUID(v132):modifyTheme(v130, v131);
        end;
        v129.childThemeModified:Fire();
        return v129;
    end;
    v15.removeModification = function(v134, v135) --[[ Line: 664 ]] --[[ Name: removeModification ]]
        -- upvalues: v12 (copy)
        v12.remove(v134, v135);
        return v134;
    end;
    v15.removeModificationWith = function(v136, v137, v138, v139) --[[ Line: 669 ]] --[[ Name: removeModificationWith ]]
        -- upvalues: v12 (copy)
        v12.removeWith(v136, v137, v138, v139);
        return v136;
    end;
    v15.setTheme = function(v140, v141) --[[ Line: 674 ]] --[[ Name: setTheme ]]
        -- upvalues: v12 (copy)
        v12.set(v140, v141);
        return v140;
    end;
    v15.setEnabled = function(v142, v143) --[[ Line: 679 ]] --[[ Name: setEnabled ]]
        v142.isEnabled = v143;
        v142.enabled = v142.isEnabled;
        v142.widget.Visible = v143;
        v142:updateParent();
        return v142;
    end;
    v15.select = function(v144, v145, v146) --[[ Line: 687 ]] --[[ Name: select ]]
        v144:setState("Selected", v145, v146);
        return v144;
    end;
    v15.deselect = function(v147, v148, v149) --[[ Line: 692 ]] --[[ Name: deselect ]]
        v147:setState("Deselected", v148, v149);
        return v147;
    end;
    v15.notify = function(v150, v151, v152) --[[ Line: 697 ]] --[[ Name: notify ]]
        -- upvalues: l_Elements_0 (copy), v15 (copy)
        if not v150.notice then
            v150.notice = require(l_Elements_0.Notice)(v150, v15);
        end;
        v150.noticeStarted:Fire(v151, v152);
        return v150;
    end;
    v15.clearNotices = function(v153) --[[ Line: 711 ]] --[[ Name: clearNotices ]]
        v153.endNotices:Fire();
        return v153;
    end;
    v15.disableOverlay = function(v154, v155) --[[ Line: 716 ]] --[[ Name: disableOverlay ]]
        v154.overlayDisabled = v155;
        return v154;
    end;
    v15.disableStateOverlay = v15.disableOverlay;
    v15.setImage = function(v156, v157, v158) --[[ Line: 722 ]] --[[ Name: setImage ]]
        -- upvalues: l_ContentProvider_0 (copy)
        v156:modifyTheme({
            "IconImage", 
            "Image", 
            v157, 
            v158
        });
        task.spawn(function() --[[ Line: 726 ]]
            -- upvalues: v157 (copy), l_ContentProvider_0 (ref)
            local v159 = if tonumber(v157) then ("rbxassetid://%*"):format(v157) else v157;
            if l_ContentProvider_0:GetAssetFetchStatus(v159) ~= Enum.AssetFetchStatus.Success then
                pcall(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, {
                    v159
                });
            end;
        end);
        return v156;
    end;
    v15.setLabel = function(v160, v161, v162) --[[ Line: 738 ]] --[[ Name: setLabel ]]
        v160:modifyTheme({
            "IconLabel", 
            "Text", 
            v161, 
            v162
        });
        return v160;
    end;
    v15.setOrder = function(v163, v164, v165) --[[ Line: 743 ]] --[[ Name: setOrder ]]
        local v166 = v164 * 100;
        v163:modifyTheme({
            "IconSpot", 
            "LayoutOrder", 
            v166, 
            v165
        });
        v163:modifyTheme({
            "Widget", 
            "LayoutOrder", 
            v166, 
            v165
        });
        return v163;
    end;
    v15.setCornerRadius = function(v167, v168, v169) --[[ Line: 752 ]] --[[ Name: setCornerRadius ]]
        v167:modifyTheme({
            "IconCorners", 
            "CornerRadius", 
            v168, 
            v169
        });
        return v167;
    end;
    v15.align = function(v170, v171, v172) --[[ Line: 757 ]] --[[ Name: align ]]
        -- upvalues: v15 (copy)
        local v173 = tostring(v171):lower();
        if v173 == "mid" or v173 == "centre" then
            v173 = "center";
        end;
        if v173 ~= "left" and v173 ~= "center" and v173 ~= "right" then
            v173 = "left";
        end;
        local v174 = v173 == "center" and v15.container.TopbarCentered or v15.container.TopbarStandard;
        local l_Holders_0 = v174.Holders;
        local v176 = string.upper((string.sub(v173, 1, 1))) .. string.sub(v173, 2);
        if not v172 then
            v170.originalAlignment = v176;
        end;
        local l_joinedFrame_0 = v170.joinedFrame;
        local v178 = l_Holders_0[v176];
        v170.screenGui = v174;
        v170.alignmentHolder = v178;
        if not v170.isDestroyed then
            v170.widget.Parent = l_joinedFrame_0 or v178;
        end;
        v170.alignment = v176;
        v170.alignmentChanged:Fire(v176);
        v15.iconChanged:Fire(v170);
        return v170;
    end;
    v15.setAlignment = v15.align;
    v15.setLeft = function(v179) --[[ Line: 786 ]] --[[ Name: setLeft ]]
        v179:setAlignment("Left");
        return v179;
    end;
    v15.setMid = function(v180) --[[ Line: 791 ]] --[[ Name: setMid ]]
        v180:setAlignment("Center");
        return v180;
    end;
    v15.setRight = function(v181) --[[ Line: 796 ]] --[[ Name: setRight ]]
        v181:setAlignment("Right");
        return v181;
    end;
    v15.setWidth = function(v182, v183, v184) --[[ Line: 801 ]] --[[ Name: setWidth ]]
        v182:modifyTheme({
            "Widget", 
            "DesiredWidth", 
            v183, 
            v184
        });
        return v182;
    end;
    v15.setImageScale = function(v185, v186, v187) --[[ Line: 809 ]] --[[ Name: setImageScale ]]
        v185:modifyTheme({
            "IconImageScale", 
            "Value", 
            v186, 
            v187
        });
        return v185;
    end;
    v15.setImageRatio = function(v188, v189, v190) --[[ Line: 814 ]] --[[ Name: setImageRatio ]]
        v188:modifyTheme({
            "IconImageRatio", 
            "AspectRatio", 
            v189, 
            v190
        });
        return v188;
    end;
    v15.setTextSize = function(v191, v192, v193) --[[ Line: 819 ]] --[[ Name: setTextSize ]]
        v191:modifyTheme({
            "IconLabel", 
            "TextSize", 
            v192, 
            v193
        });
        return v191;
    end;
    v15.setTextFont = function(v194, v195, v196, v197, v198) --[[ Line: 824 ]] --[[ Name: setTextFont ]]
        v196 = v196 or Enum.FontWeight.Regular;
        v197 = v197 or Enum.FontStyle.Normal;
        local v199 = nil;
        local v200 = typeof(v195);
        if v200 == "number" then
            v199 = Font.fromId(v195, v196, v197);
        elseif v200 == "EnumItem" then
            v199 = Font.fromEnum(v195);
        elseif v200 == "string" and not v195:match("rbxasset") then
            v199 = Font.fromName(v195, v196, v197);
        end;
        if not v199 then
            v199 = Font.new(v195, v196, v197);
        end;
        v194:modifyTheme({
            "IconLabel", 
            "FontFace", 
            v199, 
            v198
        });
        return v194;
    end;
    v15.bindToggleItem = function(v201, v202) --[[ Line: 845 ]] --[[ Name: bindToggleItem ]]
        if not v202:IsA("GuiObject") and not v202:IsA("LayerCollector") then
            error("Toggle item must be a GuiObject or LayerCollector!");
        end;
        v201.toggleItems[v202] = true;
        v201:_updateSelectionInstances();
        return v201;
    end;
    v15.unbindToggleItem = function(v203, v204) --[[ Line: 854 ]] --[[ Name: unbindToggleItem ]]
        v203.toggleItems[v204] = nil;
        v203:_updateSelectionInstances();
        return v203;
    end;
    v15._updateSelectionInstances = function(v205) --[[ Line: 860 ]] --[[ Name: _updateSelectionInstances ]]
        for v206, _ in pairs(v205.toggleItems) do
            local v208 = {};
            for _, v210 in pairs(v206:GetDescendants()) do
                if (v210:IsA("TextButton") or v210:IsA("ImageButton")) and v210.Active then
                    table.insert(v208, v210);
                end;
            end;
            v205.toggleItems[v206] = v208;
        end;
    end;
    v15._setToggleItemsVisible = function(v211, v212, _, v214) --[[ Line: 874 ]] --[[ Name: _setToggleItemsVisible ]]
        for v215, _ in pairs(v211.toggleItems) do
            if not v214 or v214 == v211 or v214.toggleItems[v215] == nil then
                local v217 = "Visible";
                if v215:IsA("LayerCollector") then
                    v217 = "Enabled";
                end;
                v215[v217] = v212;
            end;
        end;
    end;
    v15.bindEvent = function(v218, v219, v220) --[[ Line: 886 ]] --[[ Name: bindEvent ]]
        local v221 = v218[v219];
        assert(v221 and typeof(v221) == "table" and v221.Connect, "argument[1] must be a valid topbarplus icon event name!");
        assert(typeof(v220) == "function", "argument[2] must be a function!");
        v218.bindedEvents[v219] = v221:Connect(function(...) --[[ Line: 890 ]]
            -- upvalues: v220 (copy), v218 (copy)
            v220(v218, ...);
        end);
        return v218;
    end;
    v15.unbindEvent = function(v222, v223) --[[ Line: 896 ]] --[[ Name: unbindEvent ]]
        local v224 = v222.bindedEvents[v223];
        if v224 then
            v224:Disconnect();
            v222.bindedEvents[v223] = nil;
        end;
        return v222;
    end;
    v15.bindToggleKey = function(v225, v226) --[[ Line: 905 ]] --[[ Name: bindToggleKey ]]
        assert(typeof(v226) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v225.bindedToggleKeys[v226] = true;
        v225.toggleKeyAdded:Fire(v226);
        v225:setCaption("_hotkey_");
        return v225;
    end;
    v15.unbindToggleKey = function(v227, v228) --[[ Line: 913 ]] --[[ Name: unbindToggleKey ]]
        assert(typeof(v228) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v227.bindedToggleKeys[v228] = nil;
        return v227;
    end;
    v15.call = function(v229, v230, ...) --[[ Line: 919 ]] --[[ Name: call ]]
        local v231 = table.pack(...);
        task.spawn(function() --[[ Line: 921 ]]
            -- upvalues: v230 (copy), v229 (copy), v231 (copy)
            v230(v229, table.unpack(v231));
        end);
        return v229;
    end;
    v15.addToJanitor = function(v232, v233, v234, v235) --[[ Line: 927 ]] --[[ Name: addToJanitor ]]
        v232.janitor:add(v233, v234, v235);
        return v232;
    end;
    v15.lock = function(v236) --[[ Line: 932 ]] --[[ Name: lock ]]
        v236:getInstance("ClickRegion").Visible = false;
        v236.locked = true;
        return v236;
    end;
    v15.unlock = function(v237) --[[ Line: 940 ]] --[[ Name: unlock ]]
        v237:getInstance("ClickRegion").Visible = true;
        v237.locked = false;
        return v237;
    end;
    v15.debounce = function(v238, v239) --[[ Line: 947 ]] --[[ Name: debounce ]]
        v238:lock();
        task.wait(v239);
        v238:unlock();
        return v238;
    end;
    v15.autoDeselect = function(v240, v241) --[[ Line: 954 ]] --[[ Name: autoDeselect ]]
        if v241 == nil then
            v241 = true;
        end;
        v240.deselectWhenOtherIconSelected = v241;
        return v240;
    end;
    v15.oneClick = function(v242, v243) --[[ Line: 964 ]] --[[ Name: oneClick ]]
        local l_singleClickJanitor_0 = v242.singleClickJanitor;
        l_singleClickJanitor_0:clean();
        if v243 or v243 == nil then
            l_singleClickJanitor_0:add(v242.selected:Connect(function() --[[ Line: 970 ]]
                -- upvalues: v242 (copy)
                v242:deselect("OneClick", v242);
            end));
        end;
        v242.oneClickEnabled = true;
        return v242;
    end;
    v15.setCaption = function(v245, v246) --[[ Line: 978 ]] --[[ Name: setCaption ]]
        -- upvalues: l_Elements_0 (copy)
        if v246 == "_hotkey_" and v245.captionText then
            return v245;
        else
            local l_captionJanitor_0 = v245.captionJanitor;
            v245.captionJanitor:clean();
            if not v246 or v246 == "" then
                v245.caption = nil;
                v245.captionText = nil;
                return v245;
            else
                local v248 = l_captionJanitor_0:add(require(l_Elements_0.Caption)(v245));
                v248:SetAttribute("CaptionText", v246);
                v245.caption = v248;
                v245.captionText = v246;
                return v245;
            end;
        end;
    end;
    v15.setCaptionHint = function(v249, v250) --[[ Line: 996 ]] --[[ Name: setCaptionHint ]]
        assert(typeof(v250) == "EnumItem", "argument[1] must be a KeyCode EnumItem!");
        v249.fakeToggleKey = v250;
        v249.fakeToggleKeyChanged:Fire(v250);
        v249:setCaption("_hotkey_");
        return v249;
    end;
    v15.leave = function(v251) --[[ Line: 1004 ]] --[[ Name: leave ]]
        v251.joinJanitor:clean();
        return v251;
    end;
    v15.joinMenu = function(v252, v253) --[[ Line: 1010 ]] --[[ Name: joinMenu ]]
        -- upvalues: v11 (copy)
        v11.joinFeature(v252, v253, v253.menuIcons, v253:getInstance("Menu"));
        v253.menuChildAdded:Fire(v252);
        return v252;
    end;
    v15.setMenu = function(v254, v255) --[[ Line: 1016 ]] --[[ Name: setMenu ]]
        v254.menuSet:Fire(v255);
        return v254;
    end;
    v15.setFrozenMenu = function(v256, v257) --[[ Line: 1021 ]] --[[ Name: setFrozenMenu ]]
        v256:freezeMenu(v257);
        v256:setMenu(v257);
    end;
    v15.freezeMenu = function(v258) --[[ Line: 1026 ]] --[[ Name: freezeMenu ]]
        v258:select("FrozenMenu", v258);
        v258:bindEvent("deselected", function(v259) --[[ Line: 1030 ]]
            -- upvalues: v258 (copy)
            v259:select("FrozenMenu", v258);
        end);
        v258:modifyTheme({
            "IconSpot", 
            "Visible", 
            false
        });
    end;
    v15.joinDropdown = function(v260, v261) --[[ Line: 1036 ]] --[[ Name: joinDropdown ]]
        -- upvalues: v11 (copy)
        v261:getDropdown();
        v11.joinFeature(v260, v261, v261.dropdownIcons, v261:getInstance("DropdownScroller"));
        v261.dropdownChildAdded:Fire(v260);
        return v260;
    end;
    v15.getDropdown = function(v262) --[[ Line: 1043 ]] --[[ Name: getDropdown ]]
        -- upvalues: l_Elements_0 (copy)
        local l_dropdown_0 = v262.dropdown;
        if not l_dropdown_0 then
            l_dropdown_0 = require(l_Elements_0.Dropdown)(v262);
            v262.dropdown = l_dropdown_0;
            v262:clipOutside(l_dropdown_0);
        end;
        return l_dropdown_0;
    end;
    v15.setDropdown = function(v264, v265) --[[ Line: 1053 ]] --[[ Name: setDropdown ]]
        v264:getDropdown();
        v264.dropdownSet:Fire(v265);
        return v264;
    end;
    v15.clipOutside = function(v266, v267) --[[ Line: 1059 ]] --[[ Name: clipOutside ]]
        -- upvalues: v11 (copy)
        local v268 = v11.clipOutside(v266, v267);
        v266:refreshAppearance(v267);
        return v266, v268;
    end;
    v15.setIndicator = function(v269, v270) --[[ Line: 1070 ]] --[[ Name: setIndicator ]]
        -- upvalues: l_Elements_0 (copy), v15 (copy)
        if not v269.indicator then
            v269.indicator = v269.janitor:add(require(l_Elements_0.Indicator)(v269, v15));
        end;
        v269.indicatorSet:Fire(v270);
    end;
    v15.convertLabelToNumberSpinner = function(v271, v272, v273) --[[ Line: 1082 ]] --[[ Name: convertLabelToNumberSpinner ]]
        task.defer(function() --[[ Line: 1083 ]]
            -- upvalues: v271 (copy), v272 (copy), v273 (copy)
            local v274 = v271:getInstance("IconLabel");
            v274.Transparency = 1;
            v272.Parent = v274.Parent;
            v272.Size = UDim2.fromScale(1, 1);
            v272.AnchorPoint = Vector2.new(0.5, 0.5);
            v272.Position = UDim2.new(0.5, 0, 0.5, 0);
            v272.TextXAlignment = Enum.TextXAlignment.Center;
            v272.ClipsDescendants = false;
            for _, v276 in ipairs({
                "FontFace", 
                "BorderSizePixel", 
                "BorderColor3", 
                "Rotation", 
                "TextStrokeTransparency", 
                "TextStrokeColor3", 
                "TextStrokeTransparency", 
                "TextColor3"
            }) do
                v272[v276] = v274[v276];
                v271:addToJanitor(v274:GetPropertyChangedSignal(v276):Connect(function() --[[ Line: 1106 ]]
                    -- upvalues: v272 (ref), v276 (copy), v274 (copy)
                    v272[v276] = v274[v276];
                end));
            end;
            local function v282() --[[ Line: 1113 ]] --[[ Name: getSpinnerSizeAndDigitCount ]]
                -- upvalues: v272 (ref)
                local v277 = 0;
                local v278 = 0;
                for _, v280 in v272.Frame:GetChildren() do
                    local v281 = string.lower(v280.Name);
                    if v281 == "digit" then
                        v277 = v277 + v280.AbsoluteSize.X;
                        v278 = v278 + 1;
                    elseif (v281 == "prefix" or v281 == "suffix" or v281 == "comma") and v280.Text ~= "" then
                        v277 = v277 + v280.AbsoluteSize.X;
                        v278 = v278 + 1;
                    end;
                end;
                return v277, v278;
            end;
            local function _() --[[ Line: 1131 ]] --[[ Name: getLabelParentContainerXSize ]]
                -- upvalues: v274 (copy), v272 (ref)
                local l_Parent_0 = v274.Parent;
                local v284 = l_Parent_0 and l_Parent_0.Parent;
                if v284 == nil then
                    return 0;
                elseif v284.IconImage.Visible == true then
                    return v272.Frame.AbsoluteSize.X + v274.Parent.Parent.IconImage.AbsoluteSize.X;
                else
                    return v284.AbsoluteSize.X;
                end;
            end;
            local function _() --[[ Line: 1143 ]] --[[ Name: getNumberSpinnerXSize ]]
                -- upvalues: v272 (ref)
                return v272.Frame.AbsoluteSize.X;
            end;
            local function v295() --[[ Line: 1147 ]] --[[ Name: adjustSize ]]
                -- upvalues: v282 (copy), v271 (ref), v272 (ref), v274 (copy)
                local v287, v288 = v282();
                if v288 < 18 then
                    v271:setLabel(v272.Value);
                end;
                local l_X_0 = v272.Frame.AbsoluteSize.X;
                while v287 < l_X_0 and v271.isDestroyed ~= true do
                    task.wait(0.05);
                    if v288 > 0 and v288 < 8 then
                        v272.TextSize = v274.TextSize;
                        break;
                    else
                        local l_v272_0 = v272;
                        l_v272_0.TextSize = l_v272_0.TextSize + 1;
                        l_X_0 = v272.Frame.AbsoluteSize.X;
                        local v291;
                        l_v272_0, v291 = v282();
                        v287 = l_v272_0;
                        v288 = v291;
                    end;
                end;
                local l_Parent_1 = v274.Parent;
                local v293 = l_Parent_1 and l_Parent_1.Parent;
                local v294 = v293 == nil and 0 or if v293.IconImage.Visible == true then v272.Frame.AbsoluteSize.X + v274.Parent.Parent.IconImage.AbsoluteSize.X else v293.AbsoluteSize.X;
                while true do
                    if v294 < v287 and v271.isDestroyed ~= true then
                        task.wait(0.05);
                        if v288 < 8 and v288 > 0 then
                            v272.TextSize = v274.TextSize;
                            return;
                        else
                            l_Parent_1 = v272;
                            l_Parent_1.TextSize = l_Parent_1.TextSize - 1;
                            l_Parent_1 = v274.Parent;
                            v293 = l_Parent_1 and l_Parent_1.Parent;
                            v294 = v293 == nil and 0 or if v293.IconImage.Visible == true then v272.Frame.AbsoluteSize.X + v274.Parent.Parent.IconImage.AbsoluteSize.X else v293.AbsoluteSize.X;
                            l_Parent_1, v293 = v282();
                            v287 = l_Parent_1;
                            v288 = v293;
                        end;
                    else
                        return;
                    end;
                end;
            end;
            v271:addToJanitor(v272.Frame.ChildAdded:Connect(v295));
            v271:addToJanitor(v272.Frame.ChildRemoved:Connect(v295));
            v271:addToJanitor(v271.iconAdded:Connect(function() --[[ Line: 1185 ]]
                -- upvalues: v295 (copy)
                task.wait(1);
                v295();
            end));
            v271:updateParent();
            v272.Name = "LabelSpinner";
            v272.Prefix = "$";
            v272.Commas = true;
            v272.Decimals = 0;
            v272.Duration = 0.25;
            v272.Value = 10;
            task.wait(0.2);
            if typeof(v273) == "function" then
                v273();
            end;
        end);
        return v271;
    end;
    v15.destroy = function(v296) --[[ Line: 1212 ]] --[[ Name: destroy ]]
        -- upvalues: v15 (copy)
        if v296.isDestroyed then
            return;
        else
            v296:clearNotices();
            if v296.parentIconUID then
                v296:leave();
            end;
            v296.isDestroyed = true;
            v296.janitor:clean();
            v15.iconRemoved:Fire(v296);
            return;
        end;
    end;
    v15.Destroy = v15.destroy;
    return v15;
end;