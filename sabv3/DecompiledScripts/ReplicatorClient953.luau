if _G.__ReplicatorClientReference then
    error("replicator has already been required on the client in another module.");
end;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = utf8.char(0);
local v2 = utf8.char(1);
local v3 = utf8.char(2);
local v4 = {};
local v5 = {};
local v6 = require(script.ReplicatorSignal);
local v7 = {};
local v8 = {};
local v9 = {};
local function _(v10, v11) --[[ Line: 58 ]] --[[ Name: runningPathHash ]]
    return (("%*\255%*"):format(v10, v11));
end;
local function v15(v13, v14) --[[ Line: 62 ]] --[[ Name: dictIncrement ]]
    v13[v14] = (v13[v14] or 0) + 1;
end;
local function v18(v16, v17) --[[ Line: 67 ]] --[[ Name: dictDecrement ]]
    v16[v17] = if not (v16[v17] ~= 1) or v16[v17] == nil then nil else v16[v17] - 1;
end;
local function v19(v20) --[[ Line: 72 ]] --[[ Name: deepCopy ]]
    -- upvalues: v19 (copy)
    local v21 = table.clone(v20);
    for v22, v23 in v21 do
        if type(v23) == "table" then
            v21[v22] = v19(v23);
        end;
    end;
    return v21;
end;
local function v27(v24) --[[ Line: 82 ]] --[[ Name: makeDotCallsError ]]
    for v25, v26 in v24 do
        if type(v26) == "function" then
            v24[v25] = function(...) --[[ Line: 85 ]]
                -- upvalues: v24 (copy), v25 (copy), v26 (copy)
                if select(1, ...) ~= v24 then
                    error((("called %* with .%*() instead of :%*()"):format(v25, v25, v25)));
                    return;
                else
                    return v26(...);
                end;
            end;
        end;
    end;
end;
local function v71(v28) --[[ Line: 96 ]] --[[ Name: handlePacket ]]
    -- upvalues: v1 (copy), v8 (copy), v7 (copy), v19 (copy), v2 (copy), v4 (copy), v3 (copy), v9 (copy)
    local v29 = v28[1];
    local v30 = v28[2];
    if v29 == v1 then
        local v31 = v28[3];
        local v32 = v28[4];
        for v33, v34 in v8 do
            if v34 == v31 and v33 ~= v30 then
                error((("client received 2 Replicators with the same Id \"%*\""):format(v31)));
            end;
        end;
        v8[v30] = v31;
        local v35 = v7.get(v31);
        v35.Data = v19(v32);
        for _, v37 in v35._observe_signals do
            v37.signal:Fire(v35:TryIndex(v37.path), nil);
        end;
        for _, v39 in v35._listen_signals do
            v39.signal:Fire(v35:TryIndex(v39.path));
        end;
        v35._listen_raw_signal:Fire(v35.Data, v35.Data);
        return;
    elseif v29 == v2 then
        local v40 = v8[v30];
        if not v40 then
            return;
        else
            local v41 = v7.get(v40);
            local l__signal_descendants_0 = v41._signal_descendants;
            local l__listen_signals_0 = v41._listen_signals;
            local l__observe_signals_0 = v41._observe_signals;
            local _ = v41._listen_raw_signal;
            local v46 = {};
            local function v47(v48, v49, v50) --[[ Line: 138 ]] --[[ Name: apply ]]
                -- upvalues: v47 (copy), l__signal_descendants_0 (copy), l__listen_signals_0 (copy), v46 (copy), v4 (ref), l__observe_signals_0 (copy), v19 (ref)
                if type(v49) == "table" and v49.__none == "__none" then
                    return nil;
                elseif type(v48) ~= "table" or type(v49) ~= "table" then
                    return v49;
                else
                    local v51 = v48[1] ~= nil;
                    for v52, v53 in next, v49 do
                        if v51 and type(v52) == "string" then
                            v52 = tonumber(v52) or v52;
                        end;
                        local v54 = v50 and ("%*\255%*"):format(v50, (tostring(v52)));
                        local v55 = v47(v48[v52] or {}, v53, if l__signal_descendants_0[v54] then v54 else nil);
                        if v54 then
                            local v56 = l__listen_signals_0[v54];
                            if v56 then
                                table.insert(v46, {
                                    v56.signal, 
                                    if v55 == nil then v4 else v55, 
                                    v49
                                });
                            end;
                            local v57 = l__observe_signals_0[v54];
                            if v57 then
                                local v58 = v48[v52];
                                table.insert(v46, {
                                    v57.signal, 
                                    if v55 == nil then v4 else v55, 
                                    if type(v58) == "table" then v19(v58) else v58
                                });
                            end;
                        end;
                        v48[v52] = v55;
                    end;
                    return v48;
                end;
            end;
            local v59 = v28[3];
            v47(v41.Data, v59, "\254");
            for _, v61 in v46 do
                local v62 = v61[1];
                local v63, v64 = unpack(v61, 2, 3);
                v62:Fire(if v63 == v4 then nil else v63, v64);
            end;
            v41._listen_raw_signal:Fire(v41.Data, v59);
            return;
        end;
    else
        if v29 == v3 then
            local v65 = v8[v30];
            local v66 = v7.get(v65);
            if v66._destroyed == true then
                error("received 2 DESTROY_CMD for the same replicator");
            end;
            v66.Destroying:Fire();
            for _, v68 in v66._listen_signals do
                v68.signal:DisconnectAll();
            end;
            table.clear(v66._listen_signals);
            for _, v70 in v66._observe_signals do
                v70.signal:DisconnectAll();
            end;
            table.clear(v66._observe_signals);
            table.clear(v66._signal_descendants);
            v66._destroyed = true;
            v9[v65] = nil;
        end;
        return;
    end;
end;
v7.get = function(v72) --[[ Line: 236 ]] --[[ Name: get ]]
    -- upvalues: v9 (copy), v6 (copy), v5 (copy), v15 (copy), v18 (copy), v27 (copy)
    local v73 = v9[v72];
    if v73 then
        return v73;
    else
        local v74 = {
            Id = v72, 
            Data = nil, 
            Ready = false, 
            Destroying = v6.new(), 
            _listen_signals = {}, 
            _listen_raw_signal = v6.new(), 
            _observe_signals = {}, 
            _destroyed = false, 
            _signal_descendants = {}
        };
        local function v88(v75, v76, v77) --[[ Line: 257 ]] --[[ Name: registerListener ]]
            -- upvalues: v5 (ref), v74 (copy), v6 (ref), v15 (ref), v18 (ref)
            if #v75 == 0 and v75 ~= v5 then
                warn("path:", v75);
                error("invalid path to register listener.");
            end;
            local v78 = ("\254\255%*"):format((table.concat(v75, "\255")));
            local l__signal_descendants_1 = v74._signal_descendants;
            local v80 = if v76 then v74._observe_signals else v74._listen_signals;
            local v81 = v80[v78];
            if not v81 then
                v81 = {
                    signal = v6.new(), 
                    path = v75, 
                    connected = 0
                };
                v80[v78] = v81;
            end;
            local function v85(v82) --[[ Line: 278 ]] --[[ Name: writeDescendantsCount ]]
                -- upvalues: l__signal_descendants_1 (copy), v75 (copy)
                local v83 = "\254";
                v82(l__signal_descendants_1, "\254");
                for v84 = 1, #v75 - 1 do
                    v83 = ("%*\255%*"):format(v83, v75[v84]);
                    v82(l__signal_descendants_1, v83);
                end;
            end;
            local v86 = v81.signal:Connect(v77);
            v81.connected = v81.connected + 1;
            v85(v15);
            return function() --[[ Line: 291 ]]
                -- upvalues: v86 (copy), v81 (ref), v80 (copy), v78 (copy), v85 (copy), v18 (ref)
                v86:Disconnect();
                local l_v81_0 = v81;
                l_v81_0.connected = l_v81_0.connected - 1;
                if v81.connected == 0 then
                    v80[v78] = nil;
                end;
                v85(v18);
            end;
        end;
        v74.Listen = function(_, v90, v91) --[[ Line: 304 ]] --[[ Name: Listen ]]
            -- upvalues: v88 (copy)
            if type(v90[1]) == "table" then
                local v92 = {};
                for _, v94 in v90 do
                    table.insert(v92, (v88(v94, false, v91)));
                end;
                return function() --[[ Line: 313 ]]
                    -- upvalues: v92 (copy)
                    for _, v96 in v92 do
                        v96();
                    end;
                    table.clear(v92);
                end;
            else
                return (v88(v90, false, v91));
            end;
        end;
        v74.ListenRaw = function(_, v98) --[[ Line: 325 ]] --[[ Name: ListenRaw ]]
            -- upvalues: v74 (copy)
            return v74._listen_raw_signal:Connect(v98);
        end;
        v74.Path = function(_, v100) --[[ Line: 329 ]] --[[ Name: Path ]]
            local v101 = if type(v100) == "string" then {
                v100
            } else v100;
            return function(v102) --[[ Line: 332 ]]
                -- upvalues: v101 (copy)
                local v103 = table.clone(v101);
                if v102 == nil then
                    return v103;
                elseif type(v102) == "string" then
                    table.insert(v103, v102);
                    return v103;
                else
                    table.move(v102, 1, #v102, #v103 + 1, v103);
                    return v103;
                end;
            end;
        end;
        v74.Observe = function(_, v105, v106) --[[ Line: 345 ]] --[[ Name: Observe ]]
            -- upvalues: v74 (copy), v88 (copy)
            task.spawn(v106, v74:TryIndex(v105), nil);
            return (v88(v105, true, v106));
        end;
        v74.Index = function(_, v108) --[[ Line: 350 ]] --[[ Name: Index ]]
            -- upvalues: v74 (copy)
            local l_Data_0 = v74.Data;
            if type(l_Data_0) ~= "table" then
                error("Replicator:Index() failed Data is not a table.");
            end;
            local v110 = #v108;
            for v111, v112 in v108 do
                l_Data_0 = l_Data_0[v112];
                if v111 < v110 and type(l_Data_0) ~= "table" then
                    error((("Replicator:Index() failed %* is not a table."):format((table.concat(v108, "/", 1, v111)))));
                end;
            end;
            return l_Data_0;
        end;
        v74.TryIndex = function(_, v114) --[[ Line: 367 ]] --[[ Name: TryIndex ]]
            -- upvalues: v74 (copy)
            local l_Data_1 = v74.Data;
            if type(l_Data_1) ~= "table" then
                return nil;
            else
                local v116 = #v114;
                for v117, v118 in v114 do
                    l_Data_1 = l_Data_1[v118];
                    if v117 < v116 and type(l_Data_1) ~= "table" then
                        return nil;
                    end;
                end;
                return l_Data_1;
            end;
        end;
        v74.WaitForLoaded = function(_) --[[ Line: 384 ]] --[[ Name: WaitForLoaded ]]
            -- upvalues: v74 (copy)
            local _ = coroutine.running();
            if not v74.Data then
                v74._listen_raw_signal:Wait();
            end;
        end;
        v9[v72] = v74;
        v27(v74);
        return v74;
    end;
end;
local v121 = false;
v7.init = function() --[[ Line: 399 ]] --[[ Name: init ]]
    -- upvalues: v121 (ref), l_ReplicatedStorage_0 (copy), v71 (copy)
    if v121 then
        return;
    else
        v121 = true;
        local v122 = coroutine.running();
        local v123 = false;
        local v124 = l_ReplicatedStorage_0:WaitForChild("__ReplicatorInternal", 1e999):WaitForChild("RemoteEvent", 1e999);
        v124.OnClientEvent:Connect(function(v125) --[[ Line: 413 ]]
            -- upvalues: v71 (ref), v123 (ref), v122 (copy)
            for _, v127 in v125 do
                v71(v127);
            end;
            if v123 and coroutine.status(v122) == "suspended" then
                task.spawn(v122);
                v123 = false;
            end;
        end);
        v124:FireServer();
        v123 = true;
        coroutine.yield();
        return;
    end;
end;
_G.ReplicatorClientReference = v7;
return v7;