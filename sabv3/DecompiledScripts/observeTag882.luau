local l_CollectionService_0 = game:GetService("CollectionService");
observeTag = function(v1, v2, v3) --[[ Line: 56 ]] --[[ Name: observeTag ]]
    -- upvalues: l_CollectionService_0 (copy)
    local v4 = {};
    local v5 = {};
    local v6 = nil;
    local v7 = nil;
    local _ = function(v8) --[[ Line: 63 ]] --[[ Name: IsGoodAncestor ]]
        -- upvalues: v3 (copy)
        if v3 == nil then
            return true;
        else
            for _, v10 in v3 do
                if v8:IsDescendantOf(v10) then
                    return true;
                end;
            end;
            return false;
        end;
    end;
    local function _(v12) --[[ Line: 77 ]] --[[ Name: AttemptStartup ]]
        -- upvalues: v4 (copy), v2 (copy), v1 (copy)
        v4[v12] = "__inflight__";
        task.defer(function() --[[ Line: 82 ]]
            -- upvalues: v4 (ref), v12 (copy), v2 (ref), v1 (ref)
            if v4[v12] ~= "__inflight__" then
                return;
            else
                local v16, v17 = xpcall(function(v13) --[[ Line: 88 ]]
                    -- upvalues: v2 (ref)
                    local v14 = v2(v13);
                    local v15 = true;
                    if typeof(v14) ~= "nil" then
                        v15 = typeof(v14) == "function";
                    end;
                    assert(v15, "callback must return a function");
                    return v14;
                end, debug.traceback, v12);
                if not v16 then
                    local v18 = "";
                    local v19 = string.split(v17, "\n")[1];
                    local v20 = string.find(v19, ": ");
                    if v20 then
                        v18 = v19:sub(v20 + 1);
                    end;
                    warn((("error while calling observeTag(\"%*\") callback:%*\n%*"):format(v1, v18, v17)));
                    return;
                else
                    if type(v17) == "function" then
                        if v4[v12] ~= "__inflight__" then
                            task.spawn(v17);
                            return;
                        else
                            v4[v12] = v17;
                        end;
                    end;
                    return;
                end;
            end;
        end);
    end;
    local function _(v22) --[[ Line: 118 ]] --[[ Name: AttemptCleanup ]]
        -- upvalues: v4 (copy)
        local v23 = v4[v22];
        v4[v22] = "__dead__";
        if typeof(v23) == "function" then
            task.spawn(v23);
        end;
    end;
    local _ = function(v25) --[[ Line: 127 ]] --[[ Name: OnAncestryChanged ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy), v1 (copy)
        local v26 = false;
        local v27;
        if v3 == nil then
            v27 = true;
        else
            for _, v29 in v3 do
                if v25:IsDescendantOf(v29) then
                    v27 = true;
                    v26 = true;
                end;
                if v26 then
                    break;
                end;
            end;
            if not v26 then
                v27 = false;
            end;
        end;
        v26 = false;
        if v27 then
            if v4[v25] == "__dead__" then
                v4[v25] = "__inflight__";
                task.defer(function() --[[ Line: 82 ]]
                    -- upvalues: v4 (ref), v25 (copy), v2 (ref), v1 (ref)
                    if v4[v25] ~= "__inflight__" then
                        return;
                    else
                        local v33, v34 = xpcall(function(v30) --[[ Line: 88 ]]
                            -- upvalues: v2 (ref)
                            local v31 = v2(v30);
                            local v32 = true;
                            if typeof(v31) ~= "nil" then
                                v32 = typeof(v31) == "function";
                            end;
                            assert(v32, "callback must return a function");
                            return v31;
                        end, debug.traceback, v25);
                        if not v33 then
                            local v35 = "";
                            local v36 = string.split(v34, "\n")[1];
                            local v37 = string.find(v36, ": ");
                            if v37 then
                                v35 = v36:sub(v37 + 1);
                            end;
                            warn((("error while calling observeTag(\"%*\") callback:%*\n%*"):format(v1, v35, v34)));
                            return;
                        else
                            if type(v34) == "function" then
                                if v4[v25] ~= "__inflight__" then
                                    task.spawn(v34);
                                    return;
                                else
                                    v4[v25] = v34;
                                end;
                            end;
                            return;
                        end;
                    end;
                end);
                return;
            end;
        else
            v27 = v4[v25];
            v4[v25] = "__dead__";
            if typeof(v27) == "function" then
                task.spawn(v27);
            end;
        end;
    end;
    local function v65(v39) --[[ Line: 137 ]] --[[ Name: OnInstanceAdded ]]
        -- upvalues: v6 (ref), v4 (copy), v5 (copy), v3 (copy), v2 (copy), v1 (copy)
        local v40 = false;
        if not v6.Connected then
            return;
        elseif v4[v39] ~= nil then
            return;
        else
            v4[v39] = "__dead__";
            v5[v39] = v39.AncestryChanged:Connect(function() --[[ Line: 147 ]]
                -- upvalues: v39 (copy), v3 (ref), v4 (ref), v2 (ref), v1 (ref)
                local v41 = false;
                local l_v39_0 = v39;
                local v43;
                if v3 == nil then
                    v43 = true;
                else
                    for _, v45 in v3 do
                        if l_v39_0:IsDescendantOf(v45) then
                            v43 = true;
                            v41 = true;
                        end;
                        if v41 then
                            break;
                        end;
                    end;
                    if not v41 then
                        v43 = false;
                    end;
                end;
                v41 = false;
                if v43 then
                    if v4[l_v39_0] == "__dead__" then
                        v4[l_v39_0] = "__inflight__";
                        task.defer(function() --[[ Line: 82 ]]
                            -- upvalues: v4 (ref), l_v39_0 (copy), v2 (ref), v1 (ref)
                            if v4[l_v39_0] ~= "__inflight__" then
                                return;
                            else
                                local v49, v50 = xpcall(function(v46) --[[ Line: 88 ]]
                                    -- upvalues: v2 (ref)
                                    local v47 = v2(v46);
                                    local v48 = true;
                                    if typeof(v47) ~= "nil" then
                                        v48 = typeof(v47) == "function";
                                    end;
                                    assert(v48, "callback must return a function");
                                    return v47;
                                end, debug.traceback, l_v39_0);
                                if not v49 then
                                    local v51 = "";
                                    local v52 = string.split(v50, "\n")[1];
                                    local v53 = string.find(v52, ": ");
                                    if v53 then
                                        v51 = v52:sub(v53 + 1);
                                    end;
                                    warn((("error while calling observeTag(\"%*\") callback:%*\n%*"):format(v1, v51, v50)));
                                    return;
                                else
                                    if type(v50) == "function" then
                                        if v4[l_v39_0] ~= "__inflight__" then
                                            task.spawn(v50);
                                            return;
                                        else
                                            v4[l_v39_0] = v50;
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        return;
                    end;
                else
                    v43 = v4[l_v39_0];
                    v4[l_v39_0] = "__dead__";
                    if typeof(v43) == "function" then
                        task.spawn(v43);
                    end;
                end;
            end);
            local v54;
            if v3 == nil then
                v54 = true;
            else
                for _, v56 in v3 do
                    if v39:IsDescendantOf(v56) then
                        v54 = true;
                        v40 = true;
                    end;
                    if v40 then
                        break;
                    end;
                end;
                if not v40 then
                    v54 = false;
                end;
            end;
            v40 = false;
            if v54 then
                if v4[v39] == "__dead__" then
                    v4[v39] = "__inflight__";
                    task.defer(function() --[[ Line: 82 ]]
                        -- upvalues: v4 (ref), v39 (copy), v2 (ref), v1 (ref)
                        if v4[v39] ~= "__inflight__" then
                            return;
                        else
                            local v60, v61 = xpcall(function(v57) --[[ Line: 88 ]]
                                -- upvalues: v2 (ref)
                                local v58 = v2(v57);
                                local v59 = true;
                                if typeof(v58) ~= "nil" then
                                    v59 = typeof(v58) == "function";
                                end;
                                assert(v59, "callback must return a function");
                                return v58;
                            end, debug.traceback, v39);
                            if not v60 then
                                local v62 = "";
                                local v63 = string.split(v61, "\n")[1];
                                local v64 = string.find(v63, ": ");
                                if v64 then
                                    v62 = v63:sub(v64 + 1);
                                end;
                                warn((("error while calling observeTag(\"%*\") callback:%*\n%*"):format(v1, v62, v61)));
                                return;
                            else
                                if type(v61) == "function" then
                                    if v4[v39] ~= "__inflight__" then
                                        task.spawn(v61);
                                        return;
                                    else
                                        v4[v39] = v61;
                                    end;
                                end;
                                return;
                            end;
                        end;
                    end);
                    return;
                end;
            else
                v54 = v4[v39];
                v4[v39] = "__dead__";
                if typeof(v54) == "function" then
                    task.spawn(v54);
                end;
            end;
            return;
        end;
    end;
    local function v68(v66) --[[ Line: 153 ]] --[[ Name: OnInstanceRemoved ]]
        -- upvalues: v4 (copy), v5 (copy)
        local v67 = v4[v66];
        v4[v66] = "__dead__";
        if typeof(v67) == "function" then
            task.spawn(v67);
        end;
        v67 = v5[v66];
        if v67 then
            v67:Disconnect();
            v5[v66] = nil;
        end;
        v4[v66] = nil;
    end;
    v6 = l_CollectionService_0:GetInstanceAddedSignal(v1):Connect(v65);
    v7 = l_CollectionService_0:GetInstanceRemovedSignal(v1):Connect(v68);
    task.defer(function() --[[ Line: 170 ]]
        -- upvalues: v6 (ref), l_CollectionService_0 (ref), v1 (copy), v65 (copy)
        if not v6.Connected then
            return;
        else
            for _, v70 in l_CollectionService_0:GetTagged(v1) do
                task.spawn(v65, v70);
            end;
            return;
        end;
    end);
    return function() --[[ Line: 181 ]]
        -- upvalues: v6 (ref), v7 (ref), v4 (copy), v5 (copy)
        v6:Disconnect();
        v7:Disconnect();
        local v71 = next(v4);
        while v71 do
            local l_v71_0 = v71;
            local v73 = v4[l_v71_0];
            v4[l_v71_0] = "__dead__";
            if typeof(v73) == "function" then
                task.spawn(v73);
            end;
            v73 = v5[l_v71_0];
            if v73 then
                v73:Disconnect();
                v5[l_v71_0] = nil;
            end;
            v4[l_v71_0] = nil;
            v71 = next(v4);
        end;
    end;
end;
return observeTag;