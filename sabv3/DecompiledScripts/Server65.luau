local l_MemoryStoreService_0 = game:GetService("MemoryStoreService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_DataStoreService_0 = game:GetService("DataStoreService");
local l_MessagingService_0 = game:GetService("MessagingService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local v6 = require(l_ReplicatedStorage_0.Packages.Replion);
local v7 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(script.Parent.Types);
local v9 = require(script.Parent.Environments);
local v10 = require(script.Parent.Overrides);
local v11 = (not (game.GameId == 7709344486) or l_RunService_0:IsStudio()) and 2 or 100;
local v12 = (not (game.GameId == 7709344486) or l_RunService_0:IsStudio()) and 2 or 25;
local v13 = Random.new();
local v14 = nil;
local v15 = nil;
local v16 = {
    _loaded = false, 
    _loadedSignal = v7.new(), 
    _updatedSignal = v7.new()
};
local function v22(v17, v18) --[[ Line: 73 ]] --[[ Name: waitForBudget ]]
    -- upvalues: l_DataStoreService_0 (copy)
    local v19 = v18 or 10;
    local v20 = os.clock();
    local l_v20_0 = v20;
    while l_DataStoreService_0:GetRequestBudgetForRequestType(v17) < 1 and l_v20_0 - v20 < v19 do
        task.wait();
        l_v20_0 = os.clock();
    end;
    return l_v20_0 - v20 < v19;
end;
v16.IsLoaded = function(v23) --[[ Line: 86 ]] --[[ Name: IsLoaded ]]
    return v23._loaded;
end;
v16.OnLoad = function(v24, v25) --[[ Line: 90 ]] --[[ Name: OnLoad ]]
    return v24._loadedSignal:Connect(v25);
end;
v16.OnUpdate = function(v26, v27) --[[ Line: 94 ]] --[[ Name: OnUpdate ]]
    return v26._updatedSignal:Connect(v27);
end;
v16.OnChange = function(_, v29, v30) --[[ Line: 98 ]] --[[ Name: OnChange ]]
    -- upvalues: v15 (ref)
    return v15:OnChange({
        "Values", 
        v29
    }, v30);
end;
v16.Get = function(v31, v32, v33) --[[ Line: 103 ]] --[[ Name: Get ]]
    -- upvalues: v15 (ref)
    if not v31:IsLoaded() then
        v31._loadedSignal:Wait();
    end;
    local v34 = v15:Get({
        "Values", 
        v32
    });
    if v34 == nil then
        return v33;
    else
        return v34;
    end;
end;
v16.GetInstant = function(_, v36, v37) --[[ Line: 116 ]] --[[ Name: GetInstant ]]
    -- upvalues: v15 (ref)
    local v38 = v15:Get({
        "Values", 
        v36
    });
    if v38 == nil then
        return v37;
    else
        return v38;
    end;
end;
v16.Set = function(v39, v40, v41, v42) --[[ Line: 125 ]] --[[ Name: Set ]]
    -- upvalues: v14 (ref), v15 (ref), v10 (copy), l_MessagingService_0 (copy), v11 (copy), l_MemoryStoreService_0 (copy), v12 (copy), l_DataStoreService_0 (copy), v22 (copy)
    if v42 == v14 or v42 == "all" or v42 == "local" then
        v15:Set({
            "Values", 
            v40
        }, v41);
        v15:Set("LastChange", workspace:GetServerTimeNow());
    end;
    if v42 == "local" then
        if not v10[v14] then
            v10[v14] = {};
        end;
        v10[v14][v40] = v41;
        return true;
    else
        if not v39:GetInstant("FFlagUpdateMessageDisabled", false) then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 141 ]]
                -- upvalues: l_MessagingService_0 (ref), v40 (copy), v41 (copy), v42 (copy)
                return l_MessagingService_0:PublishAsync("FFlagUpdate", {
                    Key = v40, 
                    Value = v41, 
                    Environment = v42
                });
            end);
            if not l_status_0 then
                warn((("Failed to send message for FFlag update: %*"):format(l_result_0)));
            end;
        end;
        local function v58(v45) --[[ Line: 154 ]] --[[ Name: transformData ]]
            -- upvalues: v41 (copy), v40 (copy), v42 (copy)
            local l_UnixTimestamp_0 = DateTime.now().UnixTimestamp;
            local v47 = if v45 and typeof(v45) == "table" and typeof(v45.Values) == "table" then v45 else {
                Values = {}, 
                LastUpdate = l_UnixTimestamp_0
            };
            if v41 == nil then
                for v48 = #v47.Values, 1, -1 do
                    local v49 = v47.Values[v48];
                    local v50 = v49[1];
                    local v51 = v49[3];
                    if v40 == v50 and v42 == v51 then
                        table.remove(v47.Values, v48);
                        break;
                    end;
                end;
                v47.LastUpdate = l_UnixTimestamp_0;
                return v47;
            else
                local v52 = false;
                for _, v54 in v47.Values do
                    local v55 = v54[1];
                    local v56 = v54[3];
                    if v40 == v55 and v42 == v56 then
                        v52 = true;
                        v54[2] = v41;
                        if v42 == nil then
                            table.remove(v54, 3);
                        else
                            v54[3] = v42;
                        end;
                    end;
                end;
                if not v52 then
                    local v57 = {
                        v40, 
                        v41
                    };
                    if v42 ~= nil then
                        table.insert(v57, v42);
                    end;
                    table.insert(v47.Values, v57);
                end;
                v47.LastUpdate = DateTime.now().UnixTimestamp;
                return v47;
            end;
        end;
        for v59 = 1, v11 do
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 223 ]]
                -- upvalues: l_MemoryStoreService_0 (ref), v59 (copy)
                return l_MemoryStoreService_0:GetHashMap((("FFlags-%*"):format(v59)));
            end);
            if not l_status_1 then
                warn((("Failed to save HashMap FFlags-%*/FFlags: %*"):format(v59, l_result_1)));
            else
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 232 ]]
                    -- upvalues: l_result_1 (copy), v58 (copy)
                    return l_result_1:UpdateAsync("FFlags", v58, 3888000);
                end);
                if not l_status_2 then
                    warn((("Failed to update HashMap FFlags-%*/FFlags: %*"):format(v59, l_result_2)));
                end;
            end;
        end;
        for v64 = 1, v12 do
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 247 ]]
                -- upvalues: l_DataStoreService_0 (ref), v64 (copy)
                return l_DataStoreService_0:GetDataStore((("FFlags-%*"):format(v64)));
            end);
            if not l_status_3 then
                warn((("Failed to save DataStore FFlags-%*/FFlags: %*"):format(v64, l_result_3)));
            elseif not v22(Enum.DataStoreRequestType.UpdateAsync, 30) then
                warn("No DataStore:UpdateAsync() request budget available");
                return false;
            else
                local l_status_4, l_result_4 = pcall(function() --[[ Line: 262 ]]
                    -- upvalues: l_result_3 (copy), v58 (copy)
                    return l_result_3:UpdateAsync("FFlags", v58);
                end);
                if not l_status_4 then
                    warn((("Failed to update DataStore FFlags-%*/FFlags: %*"):format(v64, l_result_4)));
                end;
            end;
        end;
        return true;
    end;
end;
v16._loadMemoryStore = function(_, v70) --[[ Line: 275 ]] --[[ Name: _loadMemoryStore ]]
    -- upvalues: v13 (copy), v11 (copy), l_MemoryStoreService_0 (copy)
    local v71 = v70 or v13:NextInteger(1, v11);
    local l_status_5, l_result_5 = pcall(function() --[[ Line: 277 ]]
        -- upvalues: l_MemoryStoreService_0 (ref), v71 (copy)
        return l_MemoryStoreService_0:GetHashMap((("FFlags-%*"):format(v71)));
    end);
    if not l_status_5 then
        warn((("MemoryStoreService:GetHashMap() failed on 'FFlags-%*': %*"):format(v71, l_result_5)));
        return false;
    else
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 286 ]]
            -- upvalues: l_result_5 (copy)
            return l_result_5:GetAsync("FFlags");
        end);
        if not l_status_6 then
            warn((("Failed to load HashMap FFlags-%*/FFlags: %*"):format(v71, l_result_6)));
            return false;
        elseif typeof(l_result_6) ~= "table" or typeof(l_result_6.Values) ~= "table" then
            warn((("Invalid data format in HashMap FFlags-%*/FFlags: %*"):format(v71, l_result_6)));
            l_result_6 = {
                Values = {}, 
                LastUpdate = 0
            };
            return false;
        else
            local l_UnixTimestamp_1 = DateTime.now().UnixTimestamp;
            local _ = l_UnixTimestamp_1 - (if typeof(l_result_6.LastUpdate) == "number" then l_result_6.LastUpdate else l_UnixTimestamp_1) >= 2592000;
            return true, l_result_6;
        end;
    end;
end;
v16._loadDataStore = function(_, v79) --[[ Line: 350 ]] --[[ Name: _loadDataStore ]]
    -- upvalues: v13 (copy), v12 (copy), l_DataStoreService_0 (copy), v22 (copy)
    local v80 = v79 or v13:NextInteger(1, v12);
    local l_status_7, l_result_7 = pcall(function() --[[ Line: 352 ]]
        -- upvalues: l_DataStoreService_0 (ref), v80 (copy)
        return l_DataStoreService_0:GetDataStore((("FFlags-%*"):format(v80)));
    end);
    if not l_status_7 then
        warn((("DataStoreService:GetDataStore() failed on 'FFlags-%*': %*"):format(v80, l_result_7)));
        return false;
    else
        local l_DataStoreGetOptions_0 = Instance.new("DataStoreGetOptions");
        l_DataStoreGetOptions_0.UseCache = false;
        if not v22(Enum.DataStoreRequestType.GetAsync) then
            warn("No DataStore:GetAsync() request budget available");
            return false;
        else
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 370 ]]
                -- upvalues: l_result_7 (copy), l_DataStoreGetOptions_0 (copy)
                return l_result_7:GetAsync("FFlags", l_DataStoreGetOptions_0);
            end);
            if not l_status_8 then
                warn((("Failed to load DataStore FFlags-%*/FFlags: %*"):format(v80, l_result_8)));
                return false;
            else
                if typeof(l_result_8) ~= "table" or typeof(l_result_8.Values) ~= "table" then
                    warn((("Invalid data format in DataStore FFlags-%*/FFlags: %*"):format(v80, l_result_8)));
                    l_result_8 = {
                        Values = {}, 
                        LastUpdate = 0
                    };
                end;
                return true, l_result_8;
            end;
        end;
    end;
end;
v16.Load = function(v86) --[[ Line: 392 ]] --[[ Name: Load ]]
    -- upvalues: l_RunService_0 (copy), v14 (ref), v15 (ref), v6 (copy), v10 (copy)
    local v87 = nil;
    local v88 = nil;
    if l_RunService_0:IsStudio() then
        local v89, v90 = v86:_loadDataStore();
        v87 = v89;
        v88 = v90;
    else
        local v91, v92 = v86:_loadMemoryStore();
        v87 = v91;
        v88 = v92;
    end;
    if not v87 then
        local v93 = 0;
        while v93 < 3 and not v87 do
            warn((("Failed to load FFlags %*, retrying..."):format(l_RunService_0:IsStudio() and "DataStore" or "MemoryStore HashMap")));
            v93 = v93 + 1;
            task.wait(v93 * 1);
            local v94, v95 = v86:_loadMemoryStore();
            v87 = v94;
            v88 = v95;
        end;
        if not v87 then
            warn("All attempts to load FFlags MemoryStore HashMaps failed, loading DataStore instead");
            local v96, v97 = v86:_loadDataStore();
            v87 = v96;
            v88 = v97;
        end;
    end;
    if not v87 or not v88 then
        warn("Failed to load FFlags: both MemoryStore and DataStore requests failed!");
        return false;
    else
        local v98 = {};
        for _, v100 in v88.Values do
            local v101 = v100[1];
            local v102 = v100[2];
            local v103 = v100[3] or "all";
            if v101 and (v103 ~= "all" or not v98[v101]) and (v103 == v14 or v103 == "all") then
                v98[v101] = v102;
            end;
        end;
        for v104, _ in v15.Data.Values do
            if v98[v104] == nil then
                v98[v104] = v6.None;
            end;
        end;
        if v10[v14] then
            for v106, v107 in v10[v14] do
                v98[v106] = v107;
            end;
        end;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        v15:Update({
            Loaded = true, 
            LastUpdate = l_workspace_ServerTimeNow_0, 
            LastChange = l_workspace_ServerTimeNow_0, 
            Values = v98
        });
        if not v86._loaded then
            v86._loaded = true;
            v86._loadedSignal:Fire(v15.Data);
        end;
        v86._updatedSignal:Fire(v15.Data);
        return true;
    end;
end;
v16.Start = function(v109) --[[ Line: 474 ]] --[[ Name: Start ]]
    -- upvalues: v9 (copy), v14 (ref), l_RunService_0 (copy), l_MessagingService_0 (copy), l_HttpService_0 (copy), v15 (ref), v13 (copy)
    for v110, v111 in v9 do
        if v111.UniverseIds and table.find(v111.UniverseIds, game.GameId) then
            v14 = if l_RunService_0:IsStudio() and v111.StudioEnvironment then v111.StudioEnvironment else v110;
            break;
        elseif not v111.UniverseIds or #v111.UniverseIds == 0 and not v14 then
            v14 = v110;
        end;
    end;
    if v14 then
        task.spawn(function() --[[ Line: 492 ]]
            -- upvalues: l_MessagingService_0 (ref), l_HttpService_0 (ref), v14 (ref), v15 (ref), v109 (copy)
            l_MessagingService_0:SubscribeAsync("FFlagUpdate", function(v112) --[[ Line: 493 ]]
                -- upvalues: l_HttpService_0 (ref), v14 (ref), v15 (ref), v109 (ref)
                if typeof(v112) == "string" then
                    local l_status_9, l_result_9 = pcall(function() --[[ Line: 495 ]]
                        -- upvalues: v112 (ref), l_HttpService_0 (ref)
                        v112 = l_HttpService_0:JSONDecode(v112);
                    end);
                    if not l_status_9 then
                        warn((("Failed to JSONDecode FFlagUpdate message data %*: %*"):format(v112, l_result_9)));
                        return;
                    end;
                end;
                local l_Data_0 = v112.Data;
                if typeof(l_Data_0) ~= "table" or not l_Data_0.Key then
                    warn((("Invalid FFlagUpdate message data %*"):format(v112)));
                    return;
                else
                    print(("FFlag update received - updating: %* to"):format(l_Data_0.Key), l_Data_0.Value, (("(%*)"):format((typeof(l_Data_0.Value)))));
                    if l_Data_0.Key and (l_Data_0.Environment == nil or l_Data_0.Environment == v14 or l_Data_0.Environment == "all") then
                        v15:Set({
                            "Values", 
                            l_Data_0.Key
                        }, l_Data_0.Value);
                        v15:Set("LastChange", workspace:GetServerTimeNow());
                        v109._updatedSignal:Fire(v15.Data);
                    end;
                    return;
                end;
            end);
        end);
        local v116 = 0;
        while true do
            local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
            if v116 < l_workspace_ServerTimeNow_1 then
                v116 = l_workspace_ServerTimeNow_1 + 600 * v13:NextNumber(0.7, 1.3);
                v109:Load();
            end;
            task.wait(1);
        end;
    end;
    warn((("Failed to find matching Environment for UniverseId %*"):format(game.GameId)));
end;
v15 = v6.Server.new({
    Channel = "FFlags", 
    ReplicateTo = "All", 
    Data = {
        Values = {}, 
        Loaded = false, 
        LastUpdate = 0, 
        LastChange = 0
    }
});
task.spawn(v16.Start, v16);
return v16;