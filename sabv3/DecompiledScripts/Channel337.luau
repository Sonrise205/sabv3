local l_RunService_0 = game:GetService("RunService");
local l_Debris_0 = game:GetService("Debris");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(script.Parent.Parent.Signal);
local v4 = l_RunService_0:IsServer();
local l_RequestData_0 = script.Parent:WaitForChild("RequestData");
local v6 = {};
v6.__index = v6;
local function v17(v7, v8) --[[ Line: 77 ]] --[[ Name: ReadPath ]]
    local v9 = typeof(v7) == "table";
    local v10 = if v9 then v7 else string.split(v7, ".");
    local l_v8_0 = v8;
    local v12 = nil;
    local v13 = nil;
    for v14 = 1, #v10 do
        local v15 = v10[v14];
        local v16 = nil;
        v16 = if v9 then v15 else tonumber(v15) or v15;
        v12 = l_v8_0;
        l_v8_0 = l_v8_0[v16];
        v13 = v16;
        if l_v8_0 == nil then
            return nil, v12, v13;
        end;
    end;
    return l_v8_0, v12, v13;
end;
local function _(v18, v19) --[[ Line: 97 ]] --[[ Name: FireAction ]]
    local v20 = v19[1];
    if typeof(v20) == "table" then
        v20 = table.concat(v20, ".");
    end;
    local v21 = v19[2];
    if v20 ~= "" then
        local v22 = v18.Signals[v21][v20];
        if v22 then
            v22:Fire(v19[3], v19[4], v19[5]);
        end;
    end;
end;
local function v32(v24) --[[ Line: 114 ]] --[[ Name: DispatchQueuedActions ]]
    -- upvalues: v4 (copy)
    if #v24.Queue == 0 then
        return;
    else
        for v25 = 1, #v24.Queue do
            local v26 = v24.Queue[v25];
            local v27 = v26[1];
            if typeof(v27) == "table" then
                v27 = table.concat(v27, ".");
            end;
            local v28 = v26[2];
            if v27 ~= "" then
                local v29 = v24.Signals[v28][v27];
                if v29 then
                    v29:Fire(v26[3], v26[4], v26[5]);
                end;
            end;
        end;
        if v4 then
            for _, v31 in v24.Listeners do
                v24.CommunicationRoute:FireClient(v31, v24.Queue);
            end;
        end;
        table.clear(v24.Queue);
        return;
    end;
end;
local function v38(v33, v34) --[[ Line: 135 ]] --[[ Name: InsertOnQueue ]]
    local v35 = v34[1];
    local v36 = v34[2];
    if typeof(v35) == "table" then
        v35 = table.concat(v35, ".");
    end;
    if v36 ~= "ArrayInsert" and v36 ~= "ArrayRemoved" and v36 ~= "DictionaryInsert" and v36 ~= "DictionaryRemoved" then
        for v37 = #v33.Queue, 1, -1 do
            if v33.Queue[v37][1] == v35 and v33.Queue[v37][2] == v36 then
                table.remove(v33.Queue, v37);
                break;
            end;
        end;
    end;
    table.insert(v33.Queue, v34);
end;
v6.new = function(v39, v40, v41) --[[ Line: 155 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v3 (copy), v4 (copy), l_RequestData_0 (copy), v17 (copy), l_RunService_0 (copy), v32 (copy)
    local v42 = setmetatable({}, v6);
    v42.Index = v39;
    v42.Queue = {};
    v42.Synchronizer = v41;
    v42.Connections = {};
    v42.SavedConnections = {};
    v42.OnDestroyed = v3.new();
    v42.Listeners = {};
    v42.Signals = {
        Changed = {}, 
        ArrayInsert = {}, 
        ArrayRemoved = {}, 
        DictionaryInsert = {}, 
        DictionaryRemoved = {}
    };
    if v4 then
        v42.ReferenceTable = v40;
    end;
    if v4 then
        local l_RemoteEvent_0 = Instance.new("RemoteEvent");
        l_RemoteEvent_0.Name = tostring(v39);
        l_RemoteEvent_0.Parent = script;
        v42.CommunicationRoute = l_RemoteEvent_0;
    else
        v42.CommunicationRoute = script:WaitForChild((tostring(v39)));
    end;
    if not v4 then
        v42.CacheTable = l_RequestData_0:InvokeServer(v42:GetIndex());
        table.insert(v42.Connections, v42.CommunicationRoute.OnClientEvent:Connect(function(v44) --[[ Line: 198 ]]
            -- upvalues: v17 (ref), v42 (copy)
            for v45 = 1, #v44 do
                local v46 = v44[v45];
                local v47 = v46[1];
                local v48, v49, v50 = v17(v47, v42:GetTable());
                if v46[2] == "Changed" then
                    local v51 = v46[3];
                    local _ = v46[4];
                    v46[4] = v48;
                    v49[v50] = v51;
                elseif v46[2] == "ArrayInsert" then
                    table.insert(v48, v46[4], v46[3]);
                elseif v46[2] == "ArrayRemoved" then
                    table.remove(v48, v46[4]);
                elseif v46[2] == "DictionaryInsert" then
                    v48[v46[4]] = v46[3];
                elseif v46[2] == "DictionaryRemoved" then
                    v48[v46[4]] = nil;
                end;
                local l_v42_0 = v42;
                local v54 = v46[1];
                if typeof(v54) == "table" then
                    v54 = table.concat(v54, ".");
                end;
                local v55 = v46[2];
                if v54 ~= "" then
                    local v56 = l_v42_0.Signals[v55][v54];
                    if v56 then
                        v56:Fire(v46[3], v46[4], v46[5]);
                    end;
                end;
            end;
        end));
    end;
    if v4 then
        table.insert(v42.Connections, l_RunService_0.Stepped:Connect(function() --[[ Line: 230 ]]
            -- upvalues: v32 (ref), v42 (copy)
            debug.profilebegin("Synchronizer:DispatchQueuedActions");
            v32(v42);
            debug.profileend();
        end));
    end;
    return v42;
end;
v6.InsertOnDictionary = function(v57, v58, v59, v60) --[[ Line: 242 ]] --[[ Name: InsertOnDictionary ]]
    -- upvalues: v17 (copy), v38 (copy)
    assert(v58 and typeof(v58) == "string", "Invalid path string required!");
    assert(v60, "Value is nil!");
    assert(v59, "Index is nil!");
    local v61, _, _ = v17(v58, v57:GetTable());
    if not v61 then
        return;
    else
        v61[v59] = v60;
        v38(v57, {
            v58, 
            "DictionaryInsert", 
            v60, 
            v59
        });
        return;
    end;
end;
v6.RemoveFromDictionary = function(v64, v65, v66) --[[ Line: 258 ]] --[[ Name: RemoveFromDictionary ]]
    -- upvalues: v17 (copy), v38 (copy)
    assert(v65 and typeof(v65) == "string", "Invalid path string required!");
    assert(v66, "Index is nil!");
    local v67, _, _ = v17(v65, v64:GetTable());
    if not v67 then
        return;
    else
        local v70 = v67[v66];
        v67[v66] = nil;
        v38(v64, {
            v65, 
            "DictionaryRemoved", 
            v70, 
            v66
        });
        return v70;
    end;
end;
v6.InsertOnArray = function(v71, v72, v73, v74) --[[ Line: 274 ]] --[[ Name: InsertOnArray ]]
    -- upvalues: v17 (copy), v38 (copy)
    assert(v72 and typeof(v72) == "string", "Invalid path string required!");
    assert(v73, "Value is nil!");
    if v74 then
        assert(v74 and typeof(v74) == "number", "Invalid target index!");
    end;
    local v75, _, _ = v17(v72, v71:GetTable());
    if not v75 then
        return;
    else
        local v78 = nil;
        if v74 then
            table.insert(v75, v74, v73);
            v78 = v74;
        else
            table.insert(v75, v73);
            v78 = #v75;
        end;
        v38(v71, {
            v72, 
            "ArrayInsert", 
            v73, 
            v78
        });
        return v78;
    end;
end;
v6.RemoveFromArray = function(v79, v80, v81) --[[ Line: 300 ]] --[[ Name: RemoveFromArray ]]
    -- upvalues: v17 (copy), v38 (copy)
    assert(v80 and (typeof(v80) == "string" or typeof(v80) == "table"), "Invalid path required!");
    assert(v81, "Target index is invalid!");
    local v82, _, _ = v17(v80, v79:GetTable());
    if not v82 then
        return;
    else
        local v85 = table.remove(v82, v81);
        v38(v79, {
            v80, 
            "ArrayRemoved", 
            v85, 
            v81
        });
        return v85;
    end;
end;
v6.Set = function(v86, v87, v88) --[[ Line: 314 ]] --[[ Name: Set ]]
    -- upvalues: v17 (copy), v38 (copy)
    assert(v87 and (typeof(v87) == "string" or typeof(v87) == "table"), "Invalid path required!");
    local v89, v90, v91 = v17(v87, v86:GetTable());
    if not v90 then
        return v86;
    else
        v90[v91] = v88;
        v38(v86, {
            v87, 
            "Changed", 
            v88, 
            v89
        });
        return v86;
    end;
end;
v6.Increase = function(v92, v93, v94) --[[ Line: 326 ]] --[[ Name: Increase ]]
    -- upvalues: v17 (copy), v38 (copy)
    assert(v93 and (typeof(v93) == "string" or typeof(v93) == "table"), "Invalid path required!");
    assert(v94 and typeof(v94) == "number", "Invalid value number required!");
    local v95, v96, v97 = v17(v93, v92:GetTable());
    if not v96 or not v97 then
        return v92;
    else
        v96[v97] = v95 + v94;
        v38(v92, {
            v93, 
            "Changed", 
            v95 + v94, 
            v95
        });
        return v92;
    end;
end;
v6.OnChanged = function(v98, v99, v100, v101) --[[ Line: 340 ]] --[[ Name: OnChanged ]]
    -- upvalues: v3 (copy)
    assert(v99 and (typeof(v99) == "string" or typeof(v99) == "table"), "Invalid path required!");
    local v102 = if typeof(v99) == "table" then table.concat(v99, ".") else v99;
    local v103 = v98.Signals.Changed[v102];
    if not v103 then
        v103 = v3.new();
        v98.Signals.Changed[v102] = v103;
    end;
    if v101 == true then
        v100(v98:Get(v102), nil);
    end;
    return (v103:Connect(v100));
end;
v6.OnDictionaryInserted = function(v104, v105, v106) --[[ Line: 359 ]] --[[ Name: OnDictionaryInserted ]]
    -- upvalues: v3 (copy)
    assert(v105 and (typeof(v105) == "string" or typeof(v105) == "table"), "Invalid path required!");
    local v107 = if typeof(v105) == "table" then table.concat(v105, ".") else v105;
    local v108 = v104.Signals.DictionaryInsert[v107];
    if not v108 then
        v108 = v3.new();
        v104.Signals.DictionaryInsert[v107] = v108;
    end;
    return (v108:Connect(v106));
end;
v6.OnDictionaryRemoved = function(v109, v110, v111) --[[ Line: 375 ]] --[[ Name: OnDictionaryRemoved ]]
    -- upvalues: v3 (copy)
    assert(v110 and (typeof(v110) == "string" or typeof(v110) == "table"), "Invalid path required!");
    local v112 = if typeof(v110) == "table" then table.concat(v110, ".") else v110;
    local v113 = v109.Signals.DictionaryRemoved[v112];
    if not v113 then
        v113 = v3.new();
        v109.Signals.DictionaryRemoved[v112] = v113;
    end;
    return (v113:Connect(v111));
end;
v6.OnArrayInserted = function(v114, v115, v116) --[[ Line: 390 ]] --[[ Name: OnArrayInserted ]]
    -- upvalues: v3 (copy)
    assert(v115 and (typeof(v115) == "string" or typeof(v115) == "table"), "Invalid path required!");
    local v117 = if typeof(v115) == "table" then table.concat(v115, ".") else v115;
    local v118 = v114.Signals.ArrayInsert[v117];
    if not v118 then
        v118 = v3.new();
        v114.Signals.ArrayInsert[v117] = v118;
    end;
    return (v118:Connect(v116));
end;
v6.OnArrayRemoved = function(v119, v120, v121) --[[ Line: 405 ]] --[[ Name: OnArrayRemoved ]]
    -- upvalues: v3 (copy)
    assert(v120 and (typeof(v120) == "string" or typeof(v120) == "table"), "Invalid path required!");
    local v122 = if typeof(v120) == "table" then table.concat(v120, ".") else v120;
    local v123 = v119.Signals.ArrayRemoved[v122];
    if not v123 then
        v123 = v3.new();
        v119.Signals.ArrayRemoved[v122] = v123;
    end;
    return (v123:Connect(v121));
end;
v6.AddListener = function(v124, v125) --[[ Line: 422 ]] --[[ Name: AddListener ]]
    if table.find(v124.Listeners, v125) then
        return v124;
    else
        table.insert(v124.Listeners, v125);
        v124.Synchronizer.OnChannelListenerAdded:Fire(v124, v125);
        return v124;
    end;
end;
v6.RemoveListener = function(v126, v127) --[[ Line: 433 ]] --[[ Name: RemoveListener ]]
    local v128 = table.find(v126.Listeners, v127);
    if not v128 then
        return v126;
    else
        table.remove(v126.Listeners, v128);
        v126.Synchronizer.OnChannelListenerRemoved:Fire(v126, v127);
        return v126;
    end;
end;
v6.Get = function(v129, v130) --[[ Line: 446 ]] --[[ Name: Get ]]
    -- upvalues: v17 (copy)
    if not v130 then
        return v129:GetTable();
    else
        return v17(v130, v129:GetTable());
    end;
end;
v6.GetIndex = function(v131) --[[ Line: 453 ]] --[[ Name: GetIndex ]]
    return v131.Index;
end;
v6.GetTable = function(v132) --[[ Line: 457 ]] --[[ Name: GetTable ]]
    -- upvalues: v4 (copy)
    return v4 and v132.ReferenceTable or v132.CacheTable;
end;
v6.Destroy = function(v133, v134) --[[ Line: 461 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy), l_HttpService_0 (copy), l_Debris_0 (copy)
    if v134 ~= true then
        return v133.Synchronizer:Destroy(v133:GetIndex());
    else
        if v4 then
            for _, v136 in v133.Listeners do
                v133:RemoveListener(v136);
            end;
            v133.CommunicationRoute.Name = l_HttpService_0:GenerateGUID(false);
            l_Debris_0:AddItem(v133.CommunicationRoute, 5);
        end;
        v133.OnDestroyed:Fire(v133);
        v133.OnDestroyed:DisconnectAll();
        for _, v138 in v133.Connections do
            v138:Disconnect();
        end;
        for _, v140 in v133.SavedConnections do
            v140:Disconnect();
        end;
        v133.OnDestroyed:Destroy();
        for _, v142 in v133.Signals do
            for _, v144 in v142 do
                v144:DisconnectAll();
                v144:Destroy();
            end;
        end;
        setmetatable(v133, nil);
        return nil;
    end;
end;
return v6;