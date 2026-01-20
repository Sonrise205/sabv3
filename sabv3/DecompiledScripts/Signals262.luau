--!native
local v0 = require(script.Parent.Parent.Parent.Signal);
local _ = require(script.Parent.Types);
local v2 = require(script.Parent.Utils);
local _ = function(v3, v4) --[[ Line: 13 ]] --[[ Name: getIn ]]
    for _, v6 in v4 do
        if not v3 then
            return nil;
        else
            v3 = v3[v6];
        end;
    end;
    return v3;
end;
local v8 = {};
v8.__index = v8;
v8.new = function() --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    return (setmetatable({
        _containers = {}
    }, v8));
end;
v8._getContainer = function(v9, v10, v11) --[[ Line: 51 ]] --[[ Name: _getContainer ]]
    assert(v9._containers, "You're trying to use a Replion that has been destroyed!");
    if v11 and not v9._containers[v10] then
        v9._containers[v10] = {};
    end;
    return v9._containers[v10];
end;
v8.Connect = function(v12, v13, v14, v15) --[[ Line: 61 ]] --[[ Name: Connect ]]
    -- upvalues: v2 (copy)
    if _G.__DEV__ and not _G.__IGNORE_INSTANCES_WARNING__ then
        local v16 = false;
        for _, v18 in v2.getPathTable(v14) do
            if typeof(v18) == "Instance" then
                v16 = true;
                break;
            end;
        end;
        if v16 then
            local v19, v20 = debug.info(3, "sl");
            task.spawn(error, ("[Memory Leak Warning] Instance used as a Connection index at %*:%*. "):format(v19, v20) .. "Using Instances will cause memory leaks as Replion cannot automatically " .. "dispose of such connections. Consider using a string or number as your index to prevent this issue.");
        end;
    end;
    return assert(v12:Get(v13, v14), "Signal does not exist!"):Connect(v15);
end;
v8.Get = function(v21, v22, v23, v24) --[[ Line: 92 ]] --[[ Name: Get ]]
    -- upvalues: v2 (copy), v0 (copy)
    local v25 = true;
    if v24 ~= nil then
        v25 = v24;
    end;
    local v26 = v21:_getContainer(v22, v25);
    if not v26 then
        return;
    else
        for _, v28 in v2.getPathTable(v23) do
            if not v26[v28] then
                if v25 then
                    v26[v28] = {};
                else
                    return nil;
                end;
            end;
            v26 = v26[v28];
            if not v26 then
                return nil;
            end;
        end;
        if v25 and not v26.__signal then
            v26.__signal = v0.new();
        end;
        return v26.__signal;
    end;
end;
v8.FireEvent = function(v29, v30, v31, ...) --[[ Line: 124 ]] --[[ Name: FireEvent ]]
    local v32 = v29:Get(v30, v31, false);
    if v32 then
        v32:Fire(...);
    end;
end;
v8.FireChange = function(v33, v34, v35, v36) --[[ Line: 131 ]] --[[ Name: FireChange ]]
    -- upvalues: v2 (copy)
    local v37 = false;
    local v38 = false;
    local v39 = false;
    local v40 = false;
    if not v33._containers or not next(v33._containers) then
        return;
    else
        local v41 = v2.getPathTable(v34);
        local v42 = #v41;
        local v43 = v33._containers.onDescendantChange ~= nil;
        for v44 = v42, 1, -1 do
            if v44 < v42 then
                v41[v44 + 1] = nil;
            end;
            local l_onChange_0 = v33._containers.onChange;
            local v46;
            for _, v48 in v41 do
                if not l_onChange_0 then
                    v46 = nil;
                    v37 = true;
                else
                    l_onChange_0 = l_onChange_0[v48];
                end;
                if v37 then
                    break;
                end;
            end;
            if not v37 then
                v46 = l_onChange_0;
            end;
            v37 = false;
            l_onChange_0 = if v46 then v46.__signal else nil;
            local v49 = nil;
            if v43 and v44 > 1 then
                local v50 = v41[v44];
                v41[v44] = nil;
                local l_onDescendantChange_0 = v33._containers.onDescendantChange;
                local v52;
                for _, v54 in v41 do
                    if not l_onDescendantChange_0 then
                        v52 = nil;
                        v38 = true;
                    else
                        l_onDescendantChange_0 = l_onDescendantChange_0[v54];
                    end;
                    if v38 then
                        break;
                    end;
                end;
                if not v38 then
                    v52 = l_onDescendantChange_0;
                end;
                v38 = false;
                v49 = if v52 then v52.__signal else nil;
                v41[v44] = v50;
            end;
            if l_onChange_0 or v49 then
                local l_v35_0 = v35;
                local v56;
                for _, v58 in v41 do
                    if not l_v35_0 then
                        v56 = nil;
                        v39 = true;
                    else
                        l_v35_0 = l_v35_0[v58];
                    end;
                    if v39 then
                        break;
                    end;
                end;
                if not v39 then
                    v56 = l_v35_0;
                end;
                v39 = false;
                local l_v36_0 = v36;
                for _, v61 in v41 do
                    if not l_v36_0 then
                        l_v35_0 = nil;
                        v40 = true;
                    else
                        l_v36_0 = l_v36_0[v61];
                    end;
                    if v40 then
                        break;
                    end;
                end;
                if not v40 then
                    l_v35_0 = l_v36_0;
                end;
                v40 = false;
                if l_onChange_0 then
                    l_onChange_0:Fire(v56, l_v35_0);
                end;
                if v49 then
                    v49:Fire(table.clone(v41), v56, l_v35_0);
                end;
            end;
        end;
        return;
    end;
end;
v8.Destroy = function(v62) --[[ Line: 188 ]] --[[ Name: Destroy ]]
    assert(v62._containers, "This Replion has already been destroyed!");
    local function v63(v64) --[[ Line: 191 ]] --[[ Name: destroySignals ]]
        -- upvalues: v63 (copy)
        if v64.__signal then
            v64.__signal:Destroy();
            v64.__signal = nil;
        end;
        for _, v66 in v64 do
            v63(v66);
        end;
    end;
    for _, v68 in v62._containers do
        if v68.__signal then
            v68.__signal:Destroy();
            v68.__signal = nil;
        end;
        for _, v70 in v68 do
            v63(v70);
        end;
    end;
    v62._containers = nil;
end;
return v8;