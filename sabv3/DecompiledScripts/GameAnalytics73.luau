local v0 = require(script.GAResourceFlowType);
local v1 = require(script.GAProgressionStatus);
local v2 = require(script.GAErrorSeverity);
local v3 = {
    EGAResourceFlowType = v0, 
    EGAProgressionStatus = v1, 
    EGAErrorSeverity = v2
};
local v4 = require(script.Logger);
local v5 = require(script.Threading);
local v6 = require(script.State);
local v7 = require(script.Validation);
local v8 = require(script.Store);
local v9 = require(script.Events);
local v10 = require(script.Utilities);
local l_Players_0 = game:GetService("Players");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v16 = require(script.Postie);
local v17 = nil;
local v18 = {};
local v19 = {};
local v20 = {};
local function v22(v21, ...) --[[ Line: 31 ]] --[[ Name: addToInitializationQueue ]]
    -- upvalues: v19 (ref), v4 (copy)
    if v19 ~= nil then
        table.insert(v19, {
            Func = v21, 
            Args = {
                ...
            }
        });
        v4:i("Added event to initialization queue");
        return;
    else
        v4:w("Initialization queue already cleared.");
        return;
    end;
end;
local function v25(v23, v24, ...) --[[ Line: 45 ]] --[[ Name: addToInitializationQueueByUserId ]]
    -- upvalues: v3 (copy), v20 (copy), v4 (copy)
    if not v3:isPlayerReady(v23) then
        if v20[v23] == nil then
            v20[v23] = {};
        end;
        table.insert(v20[v23], {
            Func = v24, 
            Args = {
                ...
            }
        });
        v4:i("Added event to player initialization queue");
        return;
    else
        v4:w("Player initialization queue already cleared.");
        return;
    end;
end;
local function v31(v26) --[[ Line: 65 ]] --[[ Name: isSdkReady ]]
    -- upvalues: v6 (copy), v4 (copy)
    local v27 = v26.playerId or nil;
    local v28 = v26.needsInitialized or true;
    local v29 = v26.shouldWarn or false;
    local v30 = v26.message or "";
    if v28 and not v6.Initialized then
        if v29 then
            v4:w(v30 .. " SDK is not initialized");
        end;
        return false;
    elseif v28 and v27 and not v6:isEnabled(v27) then
        if v29 then
            v4:w(v30 .. " SDK is disabled");
        end;
        return false;
    elseif v28 and v27 and not v6:sessionIsStarted(v27) then
        if v29 then
            v4:w(v30 .. " Session has not started yet");
        end;
        return false;
    else
        return true;
    end;
end;
v3.configureAvailableCustomDimensions01 = function(_, v33) --[[ Line: 101 ]] --[[ Name: configureAvailableCustomDimensions01 ]]
    -- upvalues: v31 (copy), v4 (copy), v6 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Available custom dimensions must be set before SDK is initialized");
        return;
    else
        v6:setAvailableCustomDimensions01(v33);
        return;
    end;
end;
v3.configureAvailableCustomDimensions02 = function(_, v35) --[[ Line: 110 ]] --[[ Name: configureAvailableCustomDimensions02 ]]
    -- upvalues: v31 (copy), v4 (copy), v6 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Available custom dimensions must be set before SDK is initialized");
        return;
    else
        v6:setAvailableCustomDimensions02(v35);
        return;
    end;
end;
v3.configureAvailableCustomDimensions03 = function(_, v37) --[[ Line: 119 ]] --[[ Name: configureAvailableCustomDimensions03 ]]
    -- upvalues: v31 (copy), v4 (copy), v6 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Available custom dimensions must be set before SDK is initialized");
        return;
    else
        v6:setAvailableCustomDimensions03(v37);
        return;
    end;
end;
v3.configureAvailableResourceCurrencies = function(_, v39) --[[ Line: 128 ]] --[[ Name: configureAvailableResourceCurrencies ]]
    -- upvalues: v31 (copy), v4 (copy), v9 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Available resource currencies must be set before SDK is initialized");
        return;
    else
        v9:setAvailableResourceCurrencies(v39);
        return;
    end;
end;
v3.configureAvailableResourceItemTypes = function(_, v41) --[[ Line: 137 ]] --[[ Name: configureAvailableResourceItemTypes ]]
    -- upvalues: v31 (copy), v4 (copy), v9 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Available resource item types must be set before SDK is initialized");
        return;
    else
        v9:setAvailableResourceItemTypes(v41);
        return;
    end;
end;
v3.configureBuild = function(_, v43) --[[ Line: 146 ]] --[[ Name: configureBuild ]]
    -- upvalues: v31 (copy), v4 (copy), v9 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Build version must be set before SDK is initialized.");
        return;
    else
        v9:setBuild(v43);
        return;
    end;
end;
v3.configureAvailableGamepasses = function(_, v45) --[[ Line: 155 ]] --[[ Name: configureAvailableGamepasses ]]
    -- upvalues: v31 (copy), v4 (copy), v6 (copy)
    if v31({
        needsInitialized = true, 
        shouldWarn = false
    }) then
        v4:w("Available gamepasses must be set before SDK is initialized.");
        return;
    else
        v6:setAvailableGamepasses(v45);
        return;
    end;
end;
v3.startNewSession = function(_, v47, v48) --[[ Line: 164 ]] --[[ Name: startNewSession ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 165 ]]
        -- upvalues: v6 (ref), v4 (ref), v47 (copy), v48 (copy)
        if not v6:isEventSubmissionEnabled() then
            return;
        elseif not v6.Initialized then
            v4:w("Cannot start new session. SDK is not initialized yet.");
            return;
        else
            v6:startNewSession(v47, v48);
            return;
        end;
    end);
end;
v3.endSession = function(_, v50) --[[ Line: 179 ]] --[[ Name: endSession ]]
    -- upvalues: v5 (copy), v6 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 180 ]]
        -- upvalues: v6 (ref), v50 (copy)
        if not v6:isEventSubmissionEnabled() then
            return;
        else
            v6:endSession(v50);
            return;
        end;
    end);
end;
v3.filterForBusinessEvent = function(_, v52) --[[ Line: 188 ]] --[[ Name: filterForBusinessEvent ]]
    return string.gsub(v52, "[^A-Za-z0-9%s%-_%.%(%)!%?]", "");
end;
v3.addBusinessEvent = function(_, v54, v55) --[[ Line: 192 ]] --[[ Name: addBusinessEvent ]]
    -- upvalues: v5 (copy), v6 (copy), v31 (copy), v25 (copy), v3 (copy), v22 (copy), v9 (copy), l_Players_0 (copy), v8 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 193 ]]
        -- upvalues: v6 (ref), v31 (ref), v54 (copy), v25 (ref), v3 (ref), v55 (copy), v22 (ref), v9 (ref), l_Players_0 (ref), v8 (ref)
        if not v6:isEventSubmissionEnabled() then
            return;
        elseif not v31({
            playerId = v54, 
            needsInitialized = true, 
            shouldWarn = false, 
            message = "Could not add business event"
        }) then
            if v54 then
                v25(v54, v3.addBusinessEvent, v3, v54, v55);
                return;
            else
                v22(v3.addBusinessEvent, v3, v54, v55);
                return;
            end;
        else
            local v56 = v55.amount or 0;
            local v57 = v55.itemType or "";
            local v58 = v55.itemId or "";
            local v59 = v55.cartType or "";
            local v60 = math.floor(v56 * 0.7 * 0.35);
            local v61 = v55.gamepassId or nil;
            v9:addBusinessEvent(v54, "USD", v60, v57, v58, v59);
            if v57 == "Gamepass" and v59 ~= "Website" then
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v54);
                local l_v8_PlayerDataFromCache_0 = v8:GetPlayerDataFromCache(v54);
                if not l_v8_PlayerDataFromCache_0.OwnedGamepasses then
                    l_v8_PlayerDataFromCache_0.OwnedGamepasses = {};
                end;
                table.insert(l_v8_PlayerDataFromCache_0.OwnedGamepasses, v61);
                v8.PlayerCache[v54] = l_v8_PlayerDataFromCache_0;
                v8:SavePlayerData(l_l_Players_0_PlayerByUserId_0);
            end;
            return;
        end;
    end);
end;
v3.addResourceEvent = function(_, v65, v66) --[[ Line: 229 ]] --[[ Name: addResourceEvent ]]
    -- upvalues: v5 (copy), v6 (copy), v31 (copy), v25 (copy), v3 (copy), v22 (copy), v9 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 230 ]]
        -- upvalues: v6 (ref), v31 (ref), v65 (copy), v25 (ref), v3 (ref), v66 (copy), v22 (ref), v9 (ref)
        if not v6:isEventSubmissionEnabled() then
            return;
        elseif not v31({
            playerId = v65, 
            needsInitialized = true, 
            shouldWarn = false, 
            message = "Could not add resource event"
        }) then
            if v65 then
                v25(v65, v3.addResourceEvent, v3, v65, v66);
                return;
            else
                v22(v3.addResourceEvent, v3, v65, v66);
                return;
            end;
        else
            local v67 = v66.flowType or 0;
            local v68 = v66.currency or "";
            local v69 = v66.amount or 0;
            local v70 = v66.itemType or "";
            local v71 = v66.itemId or "";
            v9:addResourceEvent(v65, v67, v68, v69, v70, v71);
            return;
        end;
    end);
end;
v3.addProgressionEvent = function(_, v73, v74) --[[ Line: 254 ]] --[[ Name: addProgressionEvent ]]
    -- upvalues: v5 (copy), v6 (copy), v31 (copy), v25 (copy), v3 (copy), v22 (copy), v9 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 255 ]]
        -- upvalues: v6 (ref), v31 (ref), v73 (copy), v25 (ref), v3 (ref), v74 (copy), v22 (ref), v9 (ref)
        if not v6:isEventSubmissionEnabled() then
            return;
        elseif not v31({
            playerId = v73, 
            needsInitialized = true, 
            shouldWarn = false, 
            message = "Could not add progression event"
        }) then
            if v73 then
                v25(v73, v3.addProgressionEvent, v3, v73, v74);
                return;
            else
                v22(v3.addProgressionEvent, v3, v73, v74);
                return;
            end;
        else
            local v75 = v74.progressionStatus or 0;
            local v76 = v74.progression01 or "";
            local v77 = v74.progression02 or nil;
            local v78 = v74.progression03 or nil;
            local v79 = v74.score or nil;
            v9:addProgressionEvent(v73, v75, v76, v77, v78, v79);
            return;
        end;
    end);
end;
v3.addDesignEvent = function(_, v81, v82) --[[ Line: 279 ]] --[[ Name: addDesignEvent ]]
    -- upvalues: v5 (copy), v6 (copy), v31 (copy), v25 (copy), v3 (copy), v22 (copy), v9 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 280 ]]
        -- upvalues: v6 (ref), v31 (ref), v81 (copy), v25 (ref), v3 (ref), v82 (copy), v22 (ref), v9 (ref)
        if not v6:isEventSubmissionEnabled() then
            return;
        elseif not v31({
            playerId = v81, 
            needsInitialized = true, 
            shouldWarn = false, 
            message = "Could not add design event"
        }) then
            if v81 then
                v25(v81, v3.addDesignEvent, v3, v81, v82);
                return;
            else
                v22(v3.addDesignEvent, v3, v81, v82);
                return;
            end;
        else
            local v83 = v82.eventId or "";
            local v84 = v82.value or nil;
            v9:addDesignEvent(v81, v83, v84);
            return;
        end;
    end);
end;
v3.addErrorEvent = function(_, v86, v87) --[[ Line: 301 ]] --[[ Name: addErrorEvent ]]
    -- upvalues: v5 (copy), v6 (copy), v31 (copy), v25 (copy), v3 (copy), v22 (copy), v9 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 302 ]]
        -- upvalues: v6 (ref), v31 (ref), v86 (copy), v25 (ref), v3 (ref), v87 (copy), v22 (ref), v9 (ref)
        if not v6:isEventSubmissionEnabled() then
            return;
        elseif not v31({
            playerId = v86, 
            needsInitialized = true, 
            shouldWarn = false, 
            message = "Could not add error event"
        }) then
            if v86 then
                v25(v86, v3.addErrorEvent, v3, v86, v87);
                return;
            else
                v22(v3.addErrorEvent, v3, v86, v87);
                return;
            end;
        else
            local v88 = v87.severity or 0;
            local v89 = v87.message or "";
            v9:addErrorEvent(v86, v88, v89);
            return;
        end;
    end);
end;
v3.setEnabledDebugLog = function(_, v91) --[[ Line: 323 ]] --[[ Name: setEnabledDebugLog ]]
    -- upvalues: l_RunService_0 (copy), v4 (copy)
    if l_RunService_0:IsStudio() then
        if v91 then
            v4:setDebugLog(v91);
            v4:i("Debug logging enabled");
            return;
        else
            v4:i("Debug logging disabled");
            v4:setDebugLog(v91);
            return;
        end;
    else
        v4:i("setEnabledDebugLog can only be used in studio");
        return;
    end;
end;
v3.setEnabledInfoLog = function(_, v93) --[[ Line: 337 ]] --[[ Name: setEnabledInfoLog ]]
    -- upvalues: v4 (copy)
    if v93 then
        v4:setInfoLog(v93);
        v4:i("Info logging enabled");
        return;
    else
        v4:i("Info logging disabled");
        v4:setInfoLog(v93);
        return;
    end;
end;
v3.setEnabledVerboseLog = function(_, v95) --[[ Line: 347 ]] --[[ Name: setEnabledVerboseLog ]]
    -- upvalues: v4 (copy)
    if v95 then
        v4:setVerboseLog(v95);
        v4:ii("Verbose logging enabled");
        return;
    else
        v4:ii("Verbose logging disabled");
        v4:setVerboseLog(v95);
        return;
    end;
end;
v3.setEnabledEventSubmission = function(_, v97) --[[ Line: 358 ]] --[[ Name: setEnabledEventSubmission ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 359 ]]
        -- upvalues: v97 (copy), v6 (ref), v4 (ref)
        if v97 then
            v6:setEventSubmission(v97);
            v4:i("Event submission enabled");
            return;
        else
            v4:i("Event submission disabled");
            v6:setEventSubmission(v97);
            return;
        end;
    end);
end;
v3.setCustomDimension01 = function(_, v99, v100) --[[ Line: 370 ]] --[[ Name: setCustomDimension01 ]]
    -- upvalues: v5 (copy), v7 (copy), v6 (copy), v4 (copy), v31 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 371 ]]
        -- upvalues: v7 (ref), v6 (ref), v100 (copy), v4 (ref), v31 (ref), v99 (copy)
        if not v7:validateDimension(v6._availableCustomDimensions01, v100) then
            v4:w("Could not set custom01 dimension value to '" .. v100 .. "'. Value not found in available custom01 dimension values");
            return;
        elseif not v31({
            playerId = v99, 
            needsInitialized = true, 
            shouldWarn = true, 
            message = "Could not set custom01 dimension"
        }) then
            return;
        else
            v6:setCustomDimension01(v99, v100);
            return;
        end;
    end);
end;
v3.setCustomDimension02 = function(_, v102, v103) --[[ Line: 385 ]] --[[ Name: setCustomDimension02 ]]
    -- upvalues: v5 (copy), v7 (copy), v6 (copy), v4 (copy), v31 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 386 ]]
        -- upvalues: v7 (ref), v6 (ref), v103 (copy), v4 (ref), v31 (ref), v102 (copy)
        if not v7:validateDimension(v6._availableCustomDimensions02, v103) then
            v4:w("Could not set custom02 dimension value to '" .. v103 .. "'. Value not found in available custom02 dimension values");
            return;
        elseif not v31({
            playerId = v102, 
            needsInitialized = true, 
            shouldWarn = true, 
            message = "Could not set custom02 dimension"
        }) then
            return;
        else
            v6:setCustomDimension02(v102, v103);
            return;
        end;
    end);
end;
v3.setCustomDimension03 = function(_, v105, v106) --[[ Line: 400 ]] --[[ Name: setCustomDimension03 ]]
    -- upvalues: v5 (copy), v7 (copy), v6 (copy), v4 (copy), v31 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 401 ]]
        -- upvalues: v7 (ref), v6 (ref), v106 (copy), v4 (ref), v31 (ref), v105 (copy)
        if not v7:validateDimension(v6._availableCustomDimensions03, v106) then
            v4:w("Could not set custom03 dimension value to '" .. v106 .. "'. Value not found in available custom03 dimension values");
            return;
        elseif not v31({
            playerId = v105, 
            needsInitialized = true, 
            shouldWarn = true, 
            message = "Could not set custom03 dimension"
        }) then
            return;
        else
            v6:setCustomDimension03(v105, v106);
            return;
        end;
    end);
end;
v3.setEnabledReportErrors = function(_, v108) --[[ Line: 415 ]] --[[ Name: setEnabledReportErrors ]]
    -- upvalues: v5 (copy), v6 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 416 ]]
        -- upvalues: v6 (ref), v108 (copy)
        v6.ReportErrors = v108;
    end);
end;
v3.setEnabledCustomUserId = function(_, v110) --[[ Line: 421 ]] --[[ Name: setEnabledCustomUserId ]]
    -- upvalues: v5 (copy), v6 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 422 ]]
        -- upvalues: v6 (ref), v110 (copy)
        v6.UseCustomUserId = v110;
    end);
end;
v3.setEnabledAutomaticSendBusinessEvents = function(_, v112) --[[ Line: 427 ]] --[[ Name: setEnabledAutomaticSendBusinessEvents ]]
    -- upvalues: v5 (copy), v6 (copy)
    v5:performTaskOnGAThread(function() --[[ Line: 428 ]]
        -- upvalues: v6 (ref), v112 (copy)
        v6.AutomaticSendBusinessEvents = v112;
    end);
end;
v3.addGameAnalyticsTeleportData = function(_, v114, v115) --[[ Line: 433 ]] --[[ Name: addGameAnalyticsTeleportData ]]
    -- upvalues: v8 (copy)
    local v116 = {};
    for _, v118 in ipairs(v114) do
        local l_v8_PlayerDataFromCache_1 = v8:GetPlayerDataFromCache(v118);
        l_v8_PlayerDataFromCache_1.PlayerTeleporting = true;
        local v120 = {
            SessionID = l_v8_PlayerDataFromCache_1.SessionID, 
            Sessions = l_v8_PlayerDataFromCache_1.Sessions, 
            SessionStart = l_v8_PlayerDataFromCache_1.SessionStart
        };
        v116[tostring(v118)] = v120;
    end;
    v115.gameanalyticsData = v116;
    return v115;
end;
v3.getRemoteConfigsValueAsString = function(_, v122, v123) --[[ Line: 452 ]] --[[ Name: getRemoteConfigsValueAsString ]]
    -- upvalues: v6 (copy)
    local v124 = v123.key or "";
    local v125 = v123.defaultValue or nil;
    return v6:getRemoteConfigsStringValue(v122, v124, v125);
end;
v3.isRemoteConfigsReady = function(_, v127) --[[ Line: 458 ]] --[[ Name: isRemoteConfigsReady ]]
    -- upvalues: v6 (copy)
    return v6:isRemoteConfigsReady(v127);
end;
v3.getRemoteConfigsContentAsString = function(_, v129) --[[ Line: 462 ]] --[[ Name: getRemoteConfigsContentAsString ]]
    -- upvalues: v6 (copy)
    return v6:getRemoteConfigsContentAsString(v129);
end;
v3.PlayerJoined = function(_, v131) --[[ Line: 466 ]] --[[ Name: PlayerJoined ]]
    -- upvalues: v8 (copy), v16 (copy), v10 (copy), l_LocalizationService_0 (copy), v9 (copy), v6 (copy), v4 (copy), v3 (copy), v17 (ref), l_ReplicatedStorage_0 (copy), l_MarketplaceService_0 (copy), v18 (copy), v20 (copy)
    local l_TeleportData_0 = v131:GetJoinData().TeleportData;
    local v133 = nil;
    local l_v8_PlayerData_0 = v8:GetPlayerData(v131);
    if l_TeleportData_0 then
        v133 = l_TeleportData_0.gameanalyticsData and l_TeleportData_0.gameanalyticsData[tostring(v131.UserId)];
    end;
    local l_v8_PlayerDataFromCache_2 = v8:GetPlayerDataFromCache(v131.UserId);
    if l_v8_PlayerDataFromCache_2 then
        if v133 then
            l_v8_PlayerDataFromCache_2.SessionID = v133.SessionID;
            l_v8_PlayerDataFromCache_2.SessionStart = v133.SessionStart;
        end;
        l_v8_PlayerDataFromCache_2.PlayerTeleporting = false;
        return;
    else
        local v136 = "unknown";
        local v137, v138 = v16.invokeClient("getPlatform", v131, 5);
        if v137 then
            v136 = v138;
        end;
        for v139, v140 in pairs(v8.BasePlayerData) do
            if not l_v8_PlayerData_0[v139] then
                if typeof(v140) == "table" then
                    l_v8_PlayerData_0[v139] = v10:copyTable(v140);
                else
                    l_v8_PlayerData_0[v139] = v140;
                end;
            end;
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 507 ]]
            -- upvalues: l_LocalizationService_0 (ref), v131 (copy)
            return l_LocalizationService_0:GetCountryRegionForPlayerAsync(v131);
        end);
        if l_status_0 then
            l_v8_PlayerData_0.CountryCode = l_result_0;
        end;
        v8.PlayerCache[v131.UserId] = l_v8_PlayerData_0;
        l_v8_PlayerData_0.Platform = v136 == "Console" and "uwp_console" or v136 == "Mobile" and "uwp_mobile" or v136 == "Desktop" and "uwp_desktop" or "uwp_desktop";
        l_v8_PlayerData_0.OS = l_v8_PlayerData_0.Platform .. " 0.0.0";
        if not l_status_0 then
            v9:addSdkErrorEvent(v131.UserId, "event_validation", "player_joined", "string_empty_or_null", "country_code", "");
        end;
        local v143 = "";
        if v6.UseCustomUserId then
            local v144, v145 = v16.invokeClient("getCustomUserId", v131, 5);
            if v144 then
                v143 = v145;
            end;
        end;
        if not v10:isStringNullOrEmpty(v143) then
            v4:i("Using custom id: " .. v143);
            l_v8_PlayerData_0.CustomUserId = v143;
        end;
        v3:startNewSession(v131, v133);
        v17 = v17 or l_ReplicatedStorage_0:WaitForChild("OnPlayerReadyEvent");
        v17:Fire(v131);
        if v6.AutomaticSendBusinessEvents then
            if l_v8_PlayerData_0.OwnedGamepasses == nil then
                l_v8_PlayerData_0.OwnedGamepasses = {};
                for _, v147 in ipairs(v6._availableGamepasses) do
                    if l_MarketplaceService_0:UserOwnsGamePassAsync(v131.UserId, v147) then
                        table.insert(l_v8_PlayerData_0.OwnedGamepasses, v147);
                    end;
                end;
                v8.PlayerCache[v131.UserId] = l_v8_PlayerData_0;
                v8:SavePlayerData(v131);
            else
                local v148 = {};
                for _, v150 in ipairs(v6._availableGamepasses) do
                    if l_MarketplaceService_0:UserOwnsGamePassAsync(v131.UserId, v150) then
                        table.insert(v148, v150);
                    end;
                end;
                local v151 = {};
                for _, v153 in ipairs(l_v8_PlayerData_0.OwnedGamepasses) do
                    v151[v153] = true;
                end;
                for _, v155 in ipairs(v148) do
                    if not v151[v155] then
                        table.insert(l_v8_PlayerData_0.OwnedGamepasses, v155);
                        local v156 = v18[v155];
                        if not v156 then
                            v156 = l_MarketplaceService_0:GetProductInfo(v155, Enum.InfoType.GamePass);
                            v18[v155] = v156;
                        end;
                        v3:addBusinessEvent(v131.UserId, {
                            amount = v156.PriceInRobux, 
                            itemType = "Gamepass", 
                            itemId = v3:filterForBusinessEvent(v156.Name), 
                            cartType = "Website"
                        });
                    end;
                end;
                v8.PlayerCache[v131.UserId] = l_v8_PlayerData_0;
                v8:SavePlayerData(v131);
            end;
        end;
        local v157 = v20[v131.UserId];
        if v157 then
            v20[v131.UserId] = nil;
            for _, v159 in ipairs(v157) do
                v159.Func(unpack(v159.Args));
            end;
            v4:i("Player initialization queue called #" .. #v157 .. " events");
        end;
        return;
    end;
end;
v3.PlayerRemoved = function(_, v161) --[[ Line: 610 ]] --[[ Name: PlayerRemoved ]]
    -- upvalues: v8 (copy), v3 (copy)
    v8:SavePlayerData(v161);
    local l_v8_PlayerDataFromCache_3 = v8:GetPlayerDataFromCache(v161.UserId);
    if l_v8_PlayerDataFromCache_3 then
        if not l_v8_PlayerDataFromCache_3.PlayerTeleporting then
            v3:endSession(v161.UserId);
            return;
        else
            v8.PlayerCache[v161.UserId] = nil;
            v8.DataStoreQueue.RemoveKey(v161.UserId);
        end;
    end;
end;
v3.isPlayerReady = function(_, v164) --[[ Line: 625 ]] --[[ Name: isPlayerReady ]]
    -- upvalues: v8 (copy)
    if v8:GetPlayerDataFromCache(v164) then
        return true;
    else
        return false;
    end;
end;
v3.ProcessReceiptCallback = function(_, v166) --[[ Line: 633 ]] --[[ Name: ProcessReceiptCallback ]]
    -- upvalues: v18 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local v167 = v18[v166.ProductId];
    if not v167 then
        pcall(function() --[[ Line: 640 ]]
            -- upvalues: v167 (ref), l_MarketplaceService_0 (ref), v166 (copy), v18 (ref)
            v167 = l_MarketplaceService_0:GetProductInfo(v166.ProductId, Enum.InfoType.Product);
            v18[v166.ProductId] = v167;
        end);
    end;
    if v167 then
        v3:addBusinessEvent(v166.PlayerId, {
            amount = v166.CurrencySpent, 
            itemType = "DeveloperProduct", 
            itemId = v3:filterForBusinessEvent(v167.Name)
        });
    end;
end;
v3.GamepassPurchased = function(_, v169, v170, v171) --[[ Line: 656 ]] --[[ Name: GamepassPurchased ]]
    -- upvalues: v18 (copy), l_MarketplaceService_0 (copy), v3 (copy)
    local v172 = v18[v170];
    if not v172 then
        v172 = l_MarketplaceService_0:GetProductInfo(v170, Enum.InfoType.GamePass);
        v18[v170] = v172;
    end;
    local v173 = 0;
    local v174 = "GamePass";
    if v171 then
        v173 = v171.PriceInRobux;
        v174 = v171.Name;
    elseif v172 then
        v173 = v172.PriceInRobux;
        v174 = v172.Name;
    end;
    v3:addBusinessEvent(v169.UserId, {
        amount = v173 or 0, 
        itemType = "Gamepass", 
        itemId = v3:filterForBusinessEvent(v174), 
        gamepassId = v170
    });
end;
local v175 = {
    "gameKey", 
    "secretKey"
};
v3.initServer = function(_, v177, v178) --[[ Line: 687 ]] --[[ Name: initServer ]]
    -- upvalues: v3 (copy)
    v3:initialize({
        gameKey = v177, 
        secretKey = v178
    });
end;
v3.initialize = function(_, v180) --[[ Line: 694 ]] --[[ Name: initialize ]]
    -- upvalues: v5 (copy), v175 (copy), v4 (copy), v3 (copy), v31 (copy), v7 (copy), v9 (copy), v6 (copy), l_Players_0 (copy), v19 (ref)
    v5:performTaskOnGAThread(function() --[[ Line: 695 ]]
        -- upvalues: v175 (ref), v180 (copy), v4 (ref), v3 (ref), v31 (ref), v7 (ref), v9 (ref), v6 (ref), l_Players_0 (ref), v19 (ref)
        for _, v182 in ipairs(v175) do
            if v180[v182] == nil then
                v4:e("Initialize '" .. v182 .. "' option missing");
                return;
            end;
        end;
        if v180.enableInfoLog ~= nil and v180.enableInfoLog then
            v3:setEnabledInfoLog(v180.enableInfoLog);
        end;
        if v180.enableVerboseLog ~= nil and v180.enableVerboseLog then
            v3:setEnabledVerboseLog(v180.enableVerboseLog);
        end;
        if v180.availableCustomDimensions01 ~= nil and #v180.availableCustomDimensions01 > 0 then
            v3:configureAvailableCustomDimensions01(v180.availableCustomDimensions01);
        end;
        if v180.availableCustomDimensions02 ~= nil and #v180.availableCustomDimensions02 > 0 then
            v3:configureAvailableCustomDimensions02(v180.availableCustomDimensions02);
        end;
        if v180.availableCustomDimensions03 ~= nil and #v180.availableCustomDimensions03 > 0 then
            v3:configureAvailableCustomDimensions03(v180.availableCustomDimensions03);
        end;
        if v180.availableResourceCurrencies ~= nil and #v180.availableResourceCurrencies > 0 then
            v3:configureAvailableResourceCurrencies(v180.availableResourceCurrencies);
        end;
        if v180.availableResourceItemTypes ~= nil and #v180.availableResourceItemTypes > 0 then
            v3:configureAvailableResourceItemTypes(v180.availableResourceItemTypes);
        end;
        if v180.build ~= nil and #v180.build > 0 then
            v3:configureBuild(v180.build);
        end;
        if v180.availableGamepasses ~= nil and #v180.availableGamepasses > 0 then
            v3:configureAvailableGamepasses(v180.availableGamepasses);
        end;
        if v180.enableDebugLog ~= nil then
            v3:setEnabledDebugLog(v180.enableDebugLog);
        end;
        if v180.automaticSendBusinessEvents ~= nil then
            v3:setEnabledAutomaticSendBusinessEvents(v180.automaticSendBusinessEvents);
        end;
        if v180.reportErrors ~= nil then
            v3:setEnabledReportErrors(v180.reportErrors);
        end;
        if v180.useCustomUserId ~= nil then
            v3:setEnabledCustomUserId(v180.useCustomUserId);
        end;
        if v31({
            needsInitialized = true, 
            shouldWarn = false
        }) then
            v4:w("SDK already initialized. Can only be called once.");
            return;
        else
            local l_gameKey_0 = v180.gameKey;
            local l_secretKey_0 = v180.secretKey;
            if not v7:validateKeys(l_gameKey_0, l_secretKey_0) then
                v4:w("SDK failed initialize. Game key or secret key is invalid. Can only contain characters A-z 0-9, gameKey is 32 length, secretKey is 40 length. Failed keys - gameKey: " .. l_gameKey_0 .. ", secretKey: " .. l_secretKey_0);
                return;
            else
                v9.GameKey = l_gameKey_0;
                v9.SecretKey = l_secretKey_0;
                v6.Initialized = true;
                l_Players_0.PlayerAdded:Connect(function(v185) --[[ Line: 763 ]]
                    -- upvalues: v3 (ref)
                    v3:PlayerJoined(v185);
                end);
                l_Players_0.PlayerRemoving:Connect(function(v186) --[[ Line: 768 ]]
                    -- upvalues: v3 (ref)
                    v3:PlayerRemoved(v186);
                end);
                for _, v188 in ipairs(l_Players_0:GetPlayers()) do
                    coroutine.wrap(v3.PlayerJoined)(v3, v188);
                end;
                for _, v190 in ipairs(v19) do
                    task.spawn(v190.Func, unpack(v190.Args));
                end;
                v4:i("Server initialization queue called #" .. #v19 .. " events");
                v19 = nil;
                v9:processEventQueue();
                return;
            end;
        end;
    end);
end;
if not l_ReplicatedStorage_0:FindFirstChild("GameAnalyticsRemoteConfigs") then
    local l_RemoteEvent_0 = Instance.new("RemoteEvent");
    l_RemoteEvent_0.Name = "GameAnalyticsRemoteConfigs";
    l_RemoteEvent_0.Parent = l_ReplicatedStorage_0;
end;
if not l_ReplicatedStorage_0:FindFirstChild("OnPlayerReadyEvent") then
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    l_BindableEvent_0.Name = "OnPlayerReadyEvent";
    l_BindableEvent_0.Parent = l_ReplicatedStorage_0;
end;
l_MarketplaceService_0.PromptGamePassPurchaseFinished:Connect(function(v193, v194, v195) --[[ Line: 803 ]]
    -- upvalues: v6 (copy), v3 (copy)
    if not v6.AutomaticSendBusinessEvents or not v195 then
        return;
    else
        v3:GamepassPurchased(v193, v194);
        return;
    end;
end);
return v3;