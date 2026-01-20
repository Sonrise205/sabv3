local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Parent.Freeze);
local v3 = require(script.Parent.Internal.Utils);
local v4 = require(script.Parent.Internal.Network);
local v5 = require(script.ServerReplion);
local v6 = require(script.Parent.Parent.Signal);
local _ = require(script.Parent.Internal.Types);
local v8 = v6.new();
local v9 = v6.new();
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = {};
local function _(v14, v15) --[[ Line: 62 ]] --[[ Name: getCache ]]
    local v16 = v14[v15];
    if not v16 then
        v16 = {};
        v14[v15] = v16;
    end;
    return v16;
end;
local function v22(v18, v19) --[[ Line: 73 ]] --[[ Name: cancelWait ]]
    -- upvalues: v3 (copy), v13 (copy)
    for v20, v21 in v18 do
        if v21.thread == v19 then
            table.remove(v18, v20);
            if v21.async then
                v3.safeCancelThread(v19);
            else
                pcall(task.spawn, v19);
            end;
            v13[v19] = nil;
            return;
        end;
    end;
end;
local function _(v23, v24, v25) --[[ Line: 94 ]] --[[ Name: createTimeout ]]
    -- upvalues: v22 (copy)
    return task.delay(v24, v22, v23, v25);
end;
local v126 = {
    new = function(v27) --[[ Line: 112 ]] --[[ Name: new ]]
        -- upvalues: v10 (copy), v5 (copy), v9 (copy), v12 (copy), v8 (copy), v3 (copy), v11 (copy), v13 (copy)
        local v28 = assert(v27.Channel, "Channel is required!");
        local l_v10_0 = v10;
        local v30 = l_v10_0[v28];
        if not v30 then
            v30 = {};
            l_v10_0[v28] = v30;
        end;
        local l_v30_0 = v30;
        l_v10_0 = v27.ReplicateTo;
        for _, v33 in l_v30_0 do
            local l_ReplicateTo_0 = v33.ReplicateTo;
            local v35 = l_ReplicateTo_0 == l_v10_0;
            if not v35 and type(l_ReplicateTo_0) == "table" and type(l_v10_0) == "table" then
                for _, v37 in l_ReplicateTo_0 do
                    v35 = table.find(l_v10_0, v37) ~= nil;
                    if v35 then
                        break;
                    end;
                end;
            end;
            if v35 then
                local v38 = nil;
                if typeof(l_ReplicateTo_0) == "Instance" or typeof(v38) == "userdata" then
                    v38 = tostring(l_ReplicateTo_0);
                elseif type(l_ReplicateTo_0) == "string" then
                    v38 = l_ReplicateTo_0;
                elseif type(l_ReplicateTo_0) == "table" then
                    for _, v40 in l_ReplicateTo_0 do
                        v38 = (if v38 then v38 .. ", " else "") .. tostring(v40);
                    end;
                end;
                error((("Channel \"%*\" already exists! for \"%*\""):format(v28, v38)));
            end;
        end;
        v30 = v5.new(v27);
        v30:BeforeDestroy(function() --[[ Line: 151 ]]
            -- upvalues: l_v30_0 (copy), v30 (ref), v10 (ref), v28 (copy), v9 (ref)
            l_v30_0[v30._id] = nil;
            if not next(l_v30_0) then
                v10[v28] = nil;
            end;
            v9:Fire(v28, v30);
            v30 = nil;
        end);
        v30._replicateToChanged:Connect(function(v41, v42) --[[ Line: 164 ]]
            -- upvalues: v12 (ref), v28 (copy), v30 (ref)
            if typeof(v42) == "Player" then
                local v43 = v12[v42];
                if not v43 then
                    return;
                else
                    v43[v28] = nil;
                end;
            elseif typeof(v42) == "table" then
                for _, v45 in v42 do
                    local v46 = v12[v45];
                    if v46 then
                        v46[v28] = nil;
                    end;
                end;
            end;
            if typeof(v41) == "Player" then
                local l_v12_0 = v12;
                local v48 = l_v12_0[v41];
                if not v48 then
                    v48 = {};
                    l_v12_0[v41] = v48;
                end;
                v48[v28] = v30._id;
                return;
            else
                if typeof(v41) == "table" then
                    for _, v50 in v41 do
                        local l_v12_1 = v12;
                        local v52 = l_v12_1[v50];
                        if not v52 then
                            v52 = {};
                            l_v12_1[v50] = v52;
                        end;
                        v52[v28] = v30._id;
                    end;
                end;
                return;
            end;
        end);
        l_v30_0[v30._id] = v30;
        v8:Fire(v28, v30);
        if typeof(l_v10_0) == "Instance" or v3.ShouldMock and typeof(l_v10_0) == "userdata" then
            local l_v12_2 = v12;
            local v54 = l_v12_2[l_v10_0];
            if not v54 then
                v54 = {};
                l_v12_2[l_v10_0] = v54;
            end;
            v54[v28] = v30._id;
        elseif type(l_v10_0) == "table" then
            for _, v56 in l_v10_0 do
                local l_v12_3 = v12;
                local v58 = l_v12_3[v56];
                if not v58 then
                    v58 = {};
                    l_v12_3[v56] = v58;
                end;
                v58[v28] = v30._id;
            end;
        end;
        local v59 = v11[v28];
        if v59 then
            for v60 = #v59, 1, -1 do
                local v61 = v59[v60];
                local l_thread_0 = v61.thread;
                local l_player_0 = v61.player;
                if l_player_0 then
                    local v64 = false;
                    if typeof(l_v10_0) == "Instance" or typeof(l_v10_0) == "userdata" then
                        v64 = l_v10_0 == l_player_0;
                    elseif type(l_v10_0) == "table" then
                        v64 = table.find(l_v10_0, l_player_0) ~= nil;
                    end;
                    if not v64 then
                        continue;
                    end;
                end;
                local v65 = v13[l_thread_0];
                if v65 then
                    v3.safeCancelThread(v65);
                    v13[l_thread_0] = nil;
                end;
                if coroutine.status(l_thread_0) == "suspended" then
                    task.spawn(l_thread_0, v30);
                end;
                table.remove(v59, v60);
            end;
        end;
        return v30;
    end, 
    GetReplion = function(_, v67) --[[ Line: 253 ]] --[[ Name: GetReplion ]]
        -- upvalues: v10 (copy), v2 (copy)
        local v68 = v10[v67];
        if not v68 then
            return nil;
        else
            assert(v2.Dictionary.count(v68) == 1, (("There are multiple replions with the channel \"%*\". Did you mean to use GetReplionFor?"):format(v67)));
            local _, v70 = next(v68);
            return v70;
        end;
    end, 
    GetReplionFor = function(_, v72, v73) --[[ Line: 274 ]] --[[ Name: GetReplionFor ]]
        -- upvalues: v10 (copy), v12 (copy)
        local v74 = v10[v73];
        if not v74 then
            return;
        else
            local v75 = v12[v72];
            if not v75 then
                return;
            else
                return v74[v75[v73]];
            end;
        end;
    end, 
    GetReplionsFor = function(_, v77) --[[ Line: 293 ]] --[[ Name: GetReplionsFor ]]
        -- upvalues: v10 (copy)
        local v78 = {};
        for _, v80 in v10 do
            for _, v82 in v80 do
                local l_ReplicateTo_1 = v82.ReplicateTo;
                if l_ReplicateTo_1 == "All" or if type(l_ReplicateTo_1) == "table" then table.find(l_ReplicateTo_1, v77) ~= nil else l_ReplicateTo_1 == v77 then
                    table.insert(v78, v82);
                end;
            end;
        end;
        return v78;
    end, 
    WaitReplion = function(v84, v85, v86) --[[ Line: 326 ]] --[[ Name: WaitReplion ]]
        -- upvalues: v11 (copy), v13 (copy), v22 (copy)
        local l_v84_Replion_0 = v84:GetReplion(v85);
        if l_v84_Replion_0 then
            return l_v84_Replion_0;
        else
            local v88 = coroutine.running();
            local l_v11_0 = v11;
            local v90 = l_v11_0[v85];
            if not v90 then
                v90 = {};
                l_v11_0[v85] = v90;
            end;
            local l_v90_0 = v90;
            if v86 then
                v13[v88] = task.delay(v86, v22, l_v90_0, v88);
            end;
            table.insert(l_v90_0, {
                thread = v88
            });
            return coroutine.yield();
        end;
    end, 
    WaitReplionFor = function(v92, v93, v94, v95) --[[ Line: 353 ]] --[[ Name: WaitReplionFor ]]
        -- upvalues: l_Players_0 (copy), v11 (copy), v13 (copy), v22 (copy)
        local l_v92_ReplionFor_0 = v92:GetReplionFor(v93, v94);
        if l_v92_ReplionFor_0 then
            return l_v92_ReplionFor_0;
        elseif typeof(v93) == "Instance" and not v93:IsDescendantOf(l_Players_0) then
            if _G.__DEV__ then
                local v97, v98 = debug.info(2, "sl");
                warn((("Warning: Trying to wait for a player that is not in the game at %*:%*"):format(v97, v98)));
            end;
            return nil;
        else
            local v99 = coroutine.running();
            local l_v11_1 = v11;
            local v101 = l_v11_1[v94];
            if not v101 then
                v101 = {};
                l_v11_1[v94] = v101;
            end;
            local l_v101_0 = v101;
            if v95 then
                v13[v99] = task.delay(v95, v22, l_v101_0, v99);
            end;
            table.insert(l_v101_0, {
                thread = v99, 
                player = v93
            });
            return coroutine.yield();
        end;
    end, 
    AwaitReplion = function(v103, v104, v105, v106) --[[ Line: 391 ]] --[[ Name: AwaitReplion ]]
        -- upvalues: v11 (copy), v13 (copy), v22 (copy)
        local l_v103_Replion_0 = v103:GetReplion(v104);
        if l_v103_Replion_0 then
            return v105(l_v103_Replion_0);
        else
            local l_v11_2 = v11;
            local v109 = l_v11_2[v104];
            if not v109 then
                v109 = {};
                l_v11_2[v104] = v109;
            end;
            local l_v109_0 = v109;
            l_v11_2 = coroutine.create(v105);
            if v106 then
                v13[l_v11_2] = task.delay(v106, v22, l_v109_0, l_v11_2);
            end;
            table.insert(l_v109_0, {
                thread = l_v11_2, 
                async = true
            });
            return function() --[[ Line: 406 ]]
                -- upvalues: v22 (ref), l_v109_0 (copy), l_v11_2 (copy)
                v22(l_v109_0, l_v11_2);
            end;
        end;
    end, 
    AwaitReplionFor = function(v111, v112, v113, v114, v115) --[[ Line: 422 ]] --[[ Name: AwaitReplionFor ]]
        -- upvalues: v11 (copy), v13 (copy), v22 (copy)
        local l_v111_ReplionFor_0 = v111:GetReplionFor(v112, v113);
        if l_v111_ReplionFor_0 then
            return v114(l_v111_ReplionFor_0);
        elseif typeof(v112) == "Instance" and v112.Parent == nil then
            if _G.__DEV__ then
                local v117, v118 = debug.info(2, "sl");
                warn((("Warning: Trying to await for a player that is not in the game at %*:%*"):format(v117, v118)));
            end;
            return nil;
        else
            local l_v11_3 = v11;
            local v120 = l_v11_3[v113];
            if not v120 then
                v120 = {};
                l_v11_3[v113] = v120;
            end;
            local l_v120_0 = v120;
            l_v11_3 = coroutine.create(v114);
            if v115 then
                v13[l_v11_3] = task.delay(v115, v22, l_v120_0, l_v11_3);
            end;
            table.insert(l_v120_0, {
                thread = l_v11_3, 
                player = v112, 
                async = true
            });
            return function() --[[ Line: 447 ]]
                -- upvalues: v22 (ref), l_v120_0 (copy), l_v11_3 (copy)
                v22(l_v120_0, l_v11_3);
            end;
        end;
    end, 
    OnReplionAdded = function(_, v123) --[[ Line: 459 ]] --[[ Name: OnReplionAdded ]]
        -- upvalues: v8 (copy)
        return v8:Connect(v123);
    end, 
    OnReplionRemoved = function(_, v125) --[[ Line: 470 ]] --[[ Name: OnReplionRemoved ]]
        -- upvalues: v9 (copy)
        return v9:Connect(v125);
    end
};
if not v3.ShouldMock and l_RunService_0:IsServer() then
    v4.create({
        "Added", 
        "Removed", 
        "Update", 
        "UpdateReplicateTo", 
        "Set", 
        "ArrayUpdate"
    });
    local function v132(v127) --[[ Line: 485 ]] --[[ Name: onPlayerAdded ]]
        -- upvalues: v126 (copy), v4 (copy)
        local l_v126_ReplionsFor_0 = v126:GetReplionsFor(v127);
        local v129 = {};
        for _, v131 in l_v126_ReplionsFor_0 do
            table.insert(v129, v131:_serialize());
        end;
        if #v129 > 0 then
            v4.sendTo(v127, "Added", v129);
        end;
    end;
    for _, v134 in l_Players_0:GetPlayers() do
        task.spawn(v132, v134);
    end;
    l_Players_0.PlayerAdded:Connect(v132);
    l_Players_0.PlayerRemoving:Connect(function(v135) --[[ Line: 504 ]]
        -- upvalues: v10 (copy), v2 (copy), v12 (copy), v11 (copy), v3 (copy), v13 (copy)
        local v136 = {};
        for _, v138 in v10 do
            for _, v140 in v138 do
                local l_ReplicateTo_2 = v140.ReplicateTo;
                if l_ReplicateTo_2 ~= "All" then
                    if type(l_ReplicateTo_2) == "table" then
                        v140:SetReplicateTo(v2.List.removeValue(l_ReplicateTo_2, v135));
                    elseif l_ReplicateTo_2 == v135 then
                        if not v140.DisableAutoDestroy then
                            v140:Destroy();
                        else
                            v140:BeforeDestroy(function() --[[ Line: 523 ]]
                                -- upvalues: v136 (copy), v140 (copy), v12 (ref), v135 (copy)
                                local v142 = table.find(v136, v140);
                                if not v142 then
                                    return;
                                else
                                    table.remove(v136, v142);
                                    if #v136 == 0 then
                                        v12[v135] = nil;
                                    end;
                                    return;
                                end;
                            end);
                            table.insert(v136, v140);
                        end;
                    end;
                end;
            end;
        end;
        if #v136 == 0 then
            v12[v135] = nil;
        end;
        for v143, v144 in v11 do
            for v145 = #v144, 1, -1 do
                local v146 = v144[v145];
                local l_thread_1 = v146.thread;
                if v146.player == v135 then
                    if v146.async then
                        v3.safeCancelThread(l_thread_1);
                    else
                        pcall(task.spawn, l_thread_1);
                    end;
                    v13[l_thread_1] = nil;
                    table.remove(v144, v145);
                end;
            end;
            if #v144 == 0 then
                v11[v143] = nil;
            end;
        end;
    end);
end;
return v126;