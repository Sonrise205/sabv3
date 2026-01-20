local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Internal.Utils);
local v2 = require(script.Parent.Parent.Signal);
local v3 = require(script.Parent.Internal.Network);
local v4 = require(script.ClientReplion);
local _ = require(script.Parent.Internal.Types);
local v6 = {};
local v7 = {};
local v8 = {};
local v9 = v2.new();
local v10 = v2.new();
local function _(v11) --[[ Line: 48 ]] --[[ Name: getWaitList ]]
    -- upvalues: v7 (copy)
    local v12 = v7[v11];
    if not v12 then
        v12 = {};
        v7[v11] = v12;
    end;
    return assert(v12, "Invalid wait list");
end;
local function v18(v14, v15) --[[ Line: 58 ]] --[[ Name: cancelWait ]]
    -- upvalues: v1 (copy), v8 (copy)
    for v16, v17 in v14 do
        if v17.thread == v15 then
            table.remove(v14, v16);
            if v17.async then
                v1.safeCancelThread(v15);
            else
                pcall(task.spawn, v15);
            end;
            v8[v15] = nil;
            return;
        end;
    end;
end;
local function _(v19, v20, v21) --[[ Line: 79 ]] --[[ Name: createTimeout ]]
    -- upvalues: v18 (copy)
    return task.delay(v20, v18, v19, v21);
end;
local function v29(v23) --[[ Line: 83 ]] --[[ Name: createReplion ]]
    -- upvalues: v6 (copy), v4 (copy), v9 (copy), v7 (copy)
    local v24 = v23[2];
    if v6[v24] then
        return;
    else
        local v25 = v4.new(v23);
        v6[v24] = v25;
        v6[v23[1]] = v25;
        v9:Fire(v25);
        local v26 = v7[v24];
        if v26 then
            for _, v28 in v26 do
                pcall(task.spawn, v28.thread, v25);
            end;
            v7[v24] = nil;
        end;
        return;
    end;
end;
local v60 = {
    OnReplionAdded = function(_, v31) --[[ Line: 120 ]] --[[ Name: OnReplionAdded ]]
        -- upvalues: v9 (copy)
        return v9:Connect(v31);
    end, 
    OnReplionRemoved = function(_, v33) --[[ Line: 131 ]] --[[ Name: OnReplionRemoved ]]
        -- upvalues: v10 (copy)
        return v10:Connect(v33);
    end, 
    OnReplionAddedWithTag = function(v34, v35, v36) --[[ Line: 143 ]] --[[ Name: OnReplionAddedWithTag ]]
        return v34:OnReplionAdded(function(v37) --[[ Line: 144 ]]
            -- upvalues: v35 (copy), v36 (copy)
            local l_Tags_0 = v37.Tags;
            if l_Tags_0 and table.find(l_Tags_0, v35) ~= nil then
                v36(v37);
            end;
        end);
    end, 
    OnReplionRemovedWithTag = function(v39, v40, v41) --[[ Line: 161 ]] --[[ Name: OnReplionRemovedWithTag ]]
        return v39:OnReplionRemoved(function(v42) --[[ Line: 162 ]]
            -- upvalues: v40 (copy), v41 (copy)
            local l_Tags_1 = v42.Tags;
            if l_Tags_1 and table.find(l_Tags_1, v40) ~= nil then
                v41(v42);
            end;
        end);
    end, 
    GetReplion = function(_, v45) --[[ Line: 176 ]] --[[ Name: GetReplion ]]
        -- upvalues: v6 (copy)
        return v6[v45];
    end, 
    WaitReplion = function(_, v47, v48) --[[ Line: 188 ]] --[[ Name: WaitReplion ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), v18 (copy)
        local v49 = v6[v47];
        if v49 then
            return v49;
        else
            local v50 = coroutine.running();
            local v51 = v7[v47];
            if not v51 then
                v51 = {};
                v7[v47] = v51;
            end;
            local v52 = assert(v51, "Invalid wait list");
            if v48 then
                v8[v50] = task.delay(v48, v18, v52, v50);
            end;
            table.insert(v52, {
                thread = v50
            });
            return coroutine.yield();
        end;
    end, 
    AwaitReplion = function(_, v54, v55, v56) --[[ Line: 216 ]] --[[ Name: AwaitReplion ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy), v18 (copy)
        local v57 = v6[v54];
        if v57 then
            return v55(v57);
        else
            local v58 = v7[v54];
            if not v58 then
                v58 = {};
                v7[v54] = v58;
            end;
            local v59 = assert(v58, "Invalid wait list");
            v58 = coroutine.create(v55);
            if v56 then
                v8[v58] = task.delay(v56, v18, v59, v58);
            end;
            table.insert(v59, {
                thread = v58, 
                async = true
            });
            return function() --[[ Line: 231 ]]
                -- upvalues: v18 (ref), v59 (copy), v58 (copy)
                v18(v59, v58);
            end;
        end;
    end
};
if not v1.ShouldMock and l_RunService_0:IsClient() then
    local v61 = v3.get("Added");
    local v62 = v3.get("Removed");
    local v63 = v3.get("Update");
    local v64 = v3.get("Set");
    local v65 = v3.get("UpdateReplicateTo");
    local v66 = v3.get("ArrayUpdate");
    v61.OnClientEvent:Connect(function(v67) --[[ Line: 244 ]]
        -- upvalues: v29 (copy)
        if type(v67[1]) == "table" then
            for _, v69 in v67 do
                v29(v69);
            end;
            return;
        else
            v29(v67);
            return;
        end;
    end);
    v62.OnClientEvent:Connect(function(v70) --[[ Line: 254 ]]
        -- upvalues: v6 (copy), v10 (copy)
        local v71 = v6[v70];
        if v71 then
            v6[v70] = nil;
            v6[v71._channel] = nil;
            v10:Fire(v71);
            v71:Destroy();
        end;
    end);
    v63.OnClientEvent:Connect(function(v72, v73, v74, v75) --[[ Line: 267 ]]
        -- upvalues: v6 (copy)
        local v76 = v6[v72];
        if v76 then
            v76:_update(v73, v74, v75);
        end;
    end);
    v65.OnClientEvent:Connect(function(v77, v78) --[[ Line: 276 ]]
        -- upvalues: v6 (copy)
        local v79 = v6[v77];
        if v79 then
            v79.ReplicateTo = v78;
        end;
    end);
    v64.OnClientEvent:Connect(function(v80, v81, v82) --[[ Line: 284 ]]
        -- upvalues: v6 (copy)
        local v83 = v6[v80];
        if v83 then
            v83:_set(v81, v82);
        end;
    end);
    v66.OnClientEvent:Connect(function(v84, v85, ...) --[[ Line: 292 ]]
        -- upvalues: v6 (copy)
        local v86 = v6[v84];
        if v86 then
            if v85 == "i" then
                v86:_insert(...);
                return;
            elseif v85 == "r" then
                v86:_remove(...);
                return;
            elseif v85 == "c" then
                v86:_clear(...);
            end;
        end;
    end);
end;
return table.freeze(v60);