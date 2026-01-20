--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Net);
local v4 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v5 = v3:RemoteEvent("Snapshot/RealiableChannel");
local v6 = v3:UnreliableRemoteEvent("Snapshot/UnrealiableChannel");
local v7 = l_RunService_0:IsServer();
local l_v4_Instant_0 = v4:GetInstant("SnapshotDelay", 0.1);
local l_Lerp_0 = CFrame.identity.Lerp;
local l_ToOrientation_0 = CFrame.identity.ToOrientation;
local l_FuzzyEq_0 = CFrame.identity.FuzzyEq;
local l_BulkMoveTo_0 = workspace.BulkMoveTo;
local v13 = 0;
local v14 = {};
local v15 = {};
local v16 = {};
local v17 = {};
local function _(v18) --[[ Line: 37 ]] --[[ Name: getId ]]
    -- upvalues: v14 (copy), v13 (ref), v15 (copy), v16 (copy), v17 (copy)
    local v19 = v14[v18];
    if v19 then
        return v19;
    else
        v13 = v13 + 1;
        v13 = v13 % 65535;
        local l_v13_0 = v13;
        v14[v18] = l_v13_0;
        v15[l_v13_0] = v18;
        v16[tostring(l_v13_0)] = v18;
        v17[tostring(l_v13_0)] = v18;
        return l_v13_0;
    end;
end;
local function _(v22) --[[ Line: 54 ]] --[[ Name: getObjectFromId ]]
    -- upvalues: v15 (copy)
    return v15[v22];
end;
local function _(v24) --[[ Line: 58 ]] --[[ Name: clearId ]]
    -- upvalues: v15 (copy), v14 (copy), v16 (copy)
    if v15[v24] then
        v14[v15[v24]] = nil;
        v15[v24] = nil;
    end;
    v16[tostring(v24)] = nil;
end;
local v26 = {};
local function _(v27) --[[ Line: 67 ]] --[[ Name: removeObject ]]
    -- upvalues: v26 (copy), v14 (copy), v13 (ref), v15 (copy), v16 (copy), v17 (copy)
    local v28 = v26[v27];
    if v28 then
        local v29 = v14[v28];
        local v30;
        if v29 then
            v30 = v29;
        else
            v13 = v13 + 1;
            v13 = v13 % 65535;
            local l_v13_1 = v13;
            v14[v28] = l_v13_1;
            v15[l_v13_1] = v28;
            v16[tostring(l_v13_1)] = v28;
            v17[tostring(l_v13_1)] = v28;
            v30 = l_v13_1;
        end;
        if v15[v30] then
            v14[v15[v30]] = nil;
            v15[v30] = nil;
        end;
        v16[tostring(v30)] = nil;
    end;
    v26[v27] = nil;
end;
local function _(v33, v34) --[[ Line: 77 ]] --[[ Name: addObject ]]
    -- upvalues: v14 (copy), v13 (ref), v15 (copy), v16 (copy), v17 (copy), v26 (copy)
    if not v14[v34] then
        v13 = v13 + 1;
        v13 = v13 % 65535;
        local l_v13_2 = v13;
        v14[v34] = l_v13_2;
        v15[l_v13_2] = v34;
        v16[tostring(l_v13_2)] = v34;
        v17[tostring(l_v13_2)] = v34;
    end;
    v26[v33] = v34;
end;
local function v57(v37, v38) --[[ Line: 82 ]] --[[ Name: create ]]
    -- upvalues: v7 (copy), v14 (copy), v13 (ref), v15 (copy), v16 (copy), v17 (copy), v26 (copy)
    assert(v7, "create can only be used by server");
    if not v14[v38] then
        v13 = v13 + 1;
        v13 = v13 % 65535;
        local l_v13_3 = v13;
        v14[v38] = l_v13_3;
        v15[l_v13_3] = v38;
        v16[tostring(l_v13_3)] = v38;
        v17[tostring(l_v13_3)] = v38;
    end;
    v26[v37] = v38;
    local v45 = v38.Destroying:Once(function() --[[ Line: 87 ]]
        -- upvalues: v37 (copy), v26 (ref), v14 (ref), v13 (ref), v15 (ref), v16 (ref), v17 (ref)
        local l_v37_0 = v37;
        local v41 = v26[l_v37_0];
        if v41 then
            local v42 = v14[v41];
            local v43;
            if v42 then
                v43 = v42;
            else
                v13 = v13 + 1;
                v13 = v13 % 65535;
                local l_v13_4 = v13;
                v14[v41] = l_v13_4;
                v15[l_v13_4] = v41;
                v16[tostring(l_v13_4)] = v41;
                v17[tostring(l_v13_4)] = v41;
                v43 = l_v13_4;
            end;
            if v15[v43] then
                v14[v15[v43]] = nil;
                v15[v43] = nil;
            end;
            v16[tostring(v43)] = nil;
        end;
        v26[l_v37_0] = nil;
    end);
    local v51 = v37.Destroying:Once(function() --[[ Line: 91 ]]
        -- upvalues: v37 (copy), v26 (ref), v14 (ref), v13 (ref), v15 (ref), v16 (ref), v17 (ref)
        local l_v37_1 = v37;
        local v47 = v26[l_v37_1];
        if v47 then
            local v48 = v14[v47];
            local v49;
            if v48 then
                v49 = v48;
            else
                v13 = v13 + 1;
                v13 = v13 % 65535;
                local l_v13_5 = v13;
                v14[v47] = l_v13_5;
                v15[l_v13_5] = v47;
                v16[tostring(l_v13_5)] = v47;
                v17[tostring(l_v13_5)] = v47;
                v49 = l_v13_5;
            end;
            if v15[v49] then
                v14[v15[v49]] = nil;
                v15[v49] = nil;
            end;
            v16[tostring(v49)] = nil;
        end;
        v26[l_v37_1] = nil;
    end);
    return function() --[[ Line: 95 ]]
        -- upvalues: v45 (copy), v51 (copy), v37 (copy), v26 (ref), v14 (ref), v13 (ref), v15 (ref), v16 (ref), v17 (ref)
        v45:Disconnect();
        v51:Disconnect();
        local l_v37_2 = v37;
        local v53 = v26[l_v37_2];
        if v53 then
            local v54 = v14[v53];
            local v55;
            if v54 then
                v55 = v54;
            else
                v13 = v13 + 1;
                v13 = v13 % 65535;
                local l_v13_6 = v13;
                v14[v53] = l_v13_6;
                v15[l_v13_6] = v53;
                v16[tostring(l_v13_6)] = v53;
                v17[tostring(l_v13_6)] = v53;
                v55 = l_v13_6;
            end;
            if v15[v55] then
                v14[v15[v55]] = nil;
                v15[v55] = nil;
            end;
            v16[tostring(v55)] = nil;
        end;
        v26[l_v37_2] = nil;
    end;
end;
if v7 then
    local v58 = 0;
    local v59 = {};
    local v60 = {};
    do
        local l_v58_0 = v58;
        l_RunService_0.PostSimulation:Connect(function(v62) --[[ Line: 108 ]]
            -- upvalues: l_v58_0 (ref), v17 (copy), v60 (copy), v5 (copy), v6 (copy), v26 (copy), v14 (copy), v13 (ref), v15 (copy), v16 (copy), v59 (copy), l_FuzzyEq_0 (copy), l_ToOrientation_0 (copy)
            l_v58_0 = l_v58_0 + v62;
            if l_v58_0 < 0.05 then
                return;
            else
                l_v58_0 = 0;
                debug.profilebegin("Snapshot:Step");
                if next(v17) then
                    for _, v64 in v60 do
                        v5:FireClient(v64, v17);
                    end;
                    table.clear(v17);
                end;
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local v66 = buffer.create(890);
                local v67 = 0;
                local v68 = 0;
                local function v72() --[[ Line: 132 ]] --[[ Name: sendBuffer ]]
                    -- upvalues: v68 (ref), v66 (ref), l_workspace_ServerTimeNow_0 (copy), v67 (ref), v60 (ref), v6 (ref)
                    if v68 == 0 then
                        return;
                    else
                        debug.profilebegin("Snapshot:SendBuffer");
                        local v69 = buffer.create(v68 + 10);
                        buffer.copy(v69, 10, v66, 0, v68);
                        buffer.writef64(v69, 0, l_workspace_ServerTimeNow_0);
                        buffer.writeu16(v69, 8, v67);
                        for _, v71 in v60 do
                            v6:FireClient(v71, v69);
                        end;
                        v66 = buffer.create(890);
                        v67 = 0;
                        v68 = 0;
                        debug.profileend();
                        return;
                    end;
                end;
                debug.profilebegin("Snapshot:BuildBuffer");
                for v73, v74 in v26 do
                    local v75 = v14[v74];
                    local v76;
                    if v75 then
                        v76 = v75;
                    else
                        v13 = v13 + 1;
                        v13 = v13 % 65535;
                        local l_v13_7 = v13;
                        v14[v74] = l_v13_7;
                        v15[l_v13_7] = v74;
                        v16[tostring(l_v13_7)] = v74;
                        v17[tostring(l_v13_7)] = v74;
                        v76 = l_v13_7;
                    end;
                    v75 = v73:GetPivot();
                    local v78 = v59[v73];
                    if not v78 or not l_FuzzyEq_0(v75, v78) then
                        if v68 + 26 > 900 then
                            v72();
                        end;
                        v59[v73] = v75;
                        v67 = v67 + 1;
                        buffer.writeu16(v66, v68, v76);
                        local v79 = v68 + 2;
                        local l_X_0 = v75.X;
                        buffer.writef32(v66, v79, l_X_0);
                        v79 = v68 + 6;
                        l_X_0 = v75.Y;
                        buffer.writef32(v66, v79, l_X_0);
                        v79 = v68 + 10;
                        l_X_0 = v75.Z;
                        buffer.writef32(v66, v79, l_X_0);
                        local v81, v82;
                        v81, v82, v79 = l_ToOrientation_0(v75);
                        local v83 = v68 + 14;
                        buffer.writef32(v66, v83, v81);
                        v83 = v68 + 18;
                        buffer.writef32(v66, v83, v82);
                        v83 = v68 + 22;
                        buffer.writef32(v66, v83, v79);
                        v68 = v68 + 26;
                    end;
                end;
                debug.profileend();
                v72();
                debug.profileend();
                return;
            end;
        end);
        local function v85(v84) --[[ Line: 192 ]] --[[ Name: onPlayerLoaded ]]
            -- upvalues: v60 (copy), v16 (copy), v5 (copy)
            if table.find(v60, v84) then
                return;
            else
                table.insert(v60, v84);
                if next(v16) then
                    v5:FireClient(v84, v16);
                end;
                return;
            end;
        end;
        l_Players_0.PlayerRemoving:Connect(function(v86) --[[ Line: 205 ]]
            -- upvalues: v60 (copy)
            local v87 = table.find(v60, v86);
            if v87 then
                table.remove(v60, v87);
            end;
        end);
        v5.OnServerEvent:Connect(v85);
        for _, v89 in l_Players_0:GetPlayers() do
            task.defer(v85, v89);
        end;
    end;
else
    local v90 = {};
    local v91 = 0;
    local v92 = 0;
    local function v101(v93, v94) --[[ Line: 224 ]] --[[ Name: getClosestSnapshotToRenderTime ]]
        local v95 = #v94;
        if v95 < 2 then
            return nil, nil;
        else
            local v96 = 1;
            local l_v95_0 = v95;
            while v96 <= l_v95_0 do
                local v98 = (v96 + l_v95_0) // 2;
                if v94[v98].t <= v93 then
                    v96 = v98 + 1;
                else
                    l_v95_0 = v98 - 1;
                end;
            end;
            local v99 = v94[l_v95_0];
            local v100 = v94[l_v95_0 + 1];
            if v99 and v100 and v99.t == v100.t then
                return nil, nil;
            else
                return v99, v100;
            end;
        end;
    end;
    local v102 = nil;
    do
        local l_v91_0, l_v92_0, l_v102_0 = v91, v92, v102;
        l_RunService_0.PreRender:Connect(function(v106) --[[ Line: 253 ]]
            -- upvalues: l_v91_0 (ref), l_v92_0 (ref), l_v102_0 (ref), l_v4_Instant_0 (copy), v90 (copy), v101 (copy), l_Lerp_0 (copy), l_BulkMoveTo_0 (copy)
            debug.profilebegin("snapshot:interpolate");
            debug.profilebegin("calculateRenderTime");
            local v107 = l_v91_0 + (os.clock() - l_v92_0);
            l_v102_0 = (l_v102_0 or v107 - l_v4_Instant_0) + v106;
            local v108 = l_v4_Instant_0 - (v107 - l_v102_0);
            if math.abs(v108) > l_v4_Instant_0 then
                l_v102_0 = v107 - l_v4_Instant_0;
            elseif v108 > 0.01 then
                l_v102_0 = math.max(v107 - l_v4_Instant_0, l_v102_0 - v106 * 0.1);
            elseif v108 < -0.01 then
                l_v102_0 = math.min(v107 - l_v4_Instant_0, l_v102_0 + v106 * 0.1);
            end;
            debug.profileend();
            debug.profilebegin("interpolateSnapshots");
            local v109 = 0;
            local v110 = {};
            local v111 = {};
            for v112, v113 in v90 do
                debug.profilebegin("getClosestSnapshotToRenderTime");
                local v114, v115 = v101(l_v102_0, v113);
                debug.profileend();
                if v114 and v115 then
                    local v116 = math.clamp((l_v102_0 - v114.t) / (v115.t - v114.t), 0, 1.1);
                    v109 = v109 + 1;
                    v110[v109] = v112;
                    v111[v109] = l_Lerp_0(v114.cf, v115.cf, v116);
                end;
            end;
            debug.profileend();
            debug.profilebegin("bulkMoveTo");
            l_BulkMoveTo_0(workspace, v110, v111, Enum.BulkMoveMode.FireCFrameChanged);
            debug.profileend();
            debug.profileend();
        end);
        v6.OnClientEvent:Connect(function(v117) --[[ Line: 298 ]]
            -- upvalues: l_v91_0 (ref), l_v92_0 (ref), v15 (copy), v90 (copy)
            local v118 = 0;
            local v119 = buffer.readf64(v117, v118);
            v118 = v118 + 8;
            if v119 < l_v91_0 then
                return;
            else
                l_v91_0 = v119;
                l_v92_0 = os.clock();
                local v120 = buffer.readu16(v117, v118);
                v118 = v118 + 2;
                for _ = 1, v120 do
                    local v122 = buffer.readu16(v117, v118);
                    local v123 = CFrame.new(buffer.readf32(v117, v118 + 2), buffer.readf32(v117, v118 + 6), (buffer.readf32(v117, v118 + 10))) * CFrame.fromOrientation(buffer.readf32(v117, v118 + 14), buffer.readf32(v117, v118 + 18), (buffer.readf32(v117, v118 + 22)));
                    v118 = v118 + 26;
                    local v124 = v15[v122];
                    if v124 and v124.Parent then
                        local v125 = {
                            t = v119, 
                            cf = v123
                        };
                        if not v90[v124] then
                            v90[v124] = {
                                v125
                            };
                        else
                            table.insert(v90[v124], v125);
                        end;
                        if #v90[v124] > 25 then
                            table.remove(v90[v124], 1);
                        end;
                    end;
                end;
                return;
            end;
        end);
        v5.OnClientEvent:Connect(function(v126) --[[ Line: 350 ]]
            -- upvalues: v14 (copy), v15 (copy), v16 (copy), v90 (copy)
            for v127, v128 in v126 do
                v127 = tonumber(v127);
                if typeof(v128) ~= "Instance" or not v128.Parent then
                    --[[ close >= 4 ]]
                else
                    if v128:IsA("BasePart") then
                        v128.Anchored = true;
                    end;
                    v14[v128] = v127;
                    v15[v127] = v128;
                    do
                        local l_v127_0 = v127;
                        v128.Destroying:Once(function() --[[ Line: 366 ]]
                            -- upvalues: l_v127_0 (ref), v15 (ref), v14 (ref), v16 (ref), v90 (ref), v128 (copy)
                            local l_l_v127_0_0 = l_v127_0;
                            if v15[l_l_v127_0_0] then
                                v14[v15[l_l_v127_0_0]] = nil;
                                v15[l_l_v127_0_0] = nil;
                            end;
                            v16[tostring(l_l_v127_0_0)] = nil;
                            v90[v128] = nil;
                        end);
                    end;
                end;
            end;
        end);
        v5:FireServer();
    end;
end;
return {
    DELAY = l_v4_Instant_0, 
    create = v57
};