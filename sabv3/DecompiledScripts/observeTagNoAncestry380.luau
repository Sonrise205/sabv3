local l_CollectionService_0 = game:GetService("CollectionService");
observeTagNoAncestry = function(v1, v2) --[[ Line: 5 ]] --[[ Name: observeTagNoAncestry ]]
    -- upvalues: l_CollectionService_0 (copy)
    local v3 = {};
    local v4 = nil;
    local v5 = nil;
    local function v15(v6) --[[ Line: 11 ]] --[[ Name: OnInstanceAdded ]]
        -- upvalues: v4 (ref), v2 (copy), v1 (copy), v3 (copy)
        if not v4.Connected then
            return;
        else
            task.defer(function() --[[ Line: 17 ]]
                -- upvalues: v2 (ref), v6 (copy), v1 (ref), v3 (ref)
                local v10, v11 = xpcall(function(v7) --[[ Line: 19 ]]
                    -- upvalues: v2 (ref)
                    local v8 = v2(v7);
                    local v9 = true;
                    if typeof(v8) ~= "nil" then
                        v9 = typeof(v8) == "function";
                    end;
                    assert(v9, "callback must return a function");
                    return v8;
                end, debug.traceback, v6);
                if not v10 then
                    local v12 = "";
                    local v13 = string.split(v11, "\n")[1];
                    local v14 = string.find(v13, ": ");
                    if v14 then
                        v12 = v13:sub(v14 + 1);
                    end;
                    warn((("error while calling observeTag(\"%*\") callback:%*\n%*"):format(v1, v12, v11)));
                    return;
                else
                    if type(v11) == "function" then
                        if not v6:HasTag(v1) then
                            task.spawn(v11);
                            return;
                        else
                            v3[v6] = v11;
                        end;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v18(v16) --[[ Line: 49 ]] --[[ Name: OnInstanceRemoved ]]
        -- upvalues: v3 (copy)
        local v17 = v3[v16];
        if typeof(v17) == "function" then
            task.spawn(v17);
        end;
    end;
    v4 = l_CollectionService_0:GetInstanceAddedSignal(v1):Connect(v15);
    v5 = l_CollectionService_0:GetInstanceRemovedSignal(v1):Connect(v18);
    task.defer(function() --[[ Line: 61 ]]
        -- upvalues: v4 (ref), l_CollectionService_0 (ref), v1 (copy), v15 (copy)
        if not v4.Connected then
            return;
        else
            for _, v20 in l_CollectionService_0:GetTagged(v1) do
                task.spawn(v15, v20);
            end;
            return;
        end;
    end);
    return function() --[[ Line: 72 ]]
        -- upvalues: v4 (ref), v5 (ref), v3 (copy)
        v4:Disconnect();
        v5:Disconnect();
        local v21 = next(v3);
        while v21 do
            local v22 = v3[v21];
            if typeof(v22) == "function" then
                task.spawn(v22);
            end;
            v21 = next(v3);
        end;
    end;
end;
return observeTagNoAncestry;