observeChildren = function(v0, v1) --[[ Line: 4 ]] --[[ Name: observeChildren ]]
    local v2 = {};
    local v3 = nil;
    local v4 = nil;
    local function v7(v5) --[[ Line: 10 ]] --[[ Name: OnInstanceRemoved ]]
        -- upvalues: v2 (copy)
        local v6 = v2[v5];
        v2[v5] = nil;
        if typeof(v6) == "function" then
            task.spawn(v6);
        end;
    end;
    local function v9(v8) --[[ Line: 19 ]] --[[ Name: OnInstanceAdded ]]
        -- upvalues: v3 (ref), v2 (copy), v1 (copy)
        if not v3.Connected or v2[v8] then
            return;
        else
            v2[v8] = true;
            v2[v8] = v1(v8);
            return;
        end;
    end;
    v3 = v0.ChildAdded:Connect(v9);
    v4 = v0.ChildRemoved:Connect(v7);
    task.defer(function() --[[ Line: 34 ]]
        -- upvalues: v3 (ref), v0 (copy), v9 (copy)
        if not v3.Connected then
            return;
        else
            for _, v11 in v0:GetChildren() do
                task.spawn(v9, v11);
            end;
            return;
        end;
    end);
    return function() --[[ Line: 45 ]]
        -- upvalues: v3 (ref), v4 (ref), v2 (copy)
        v3:Disconnect();
        v4:Disconnect();
        local v12 = next(v2);
        while v12 do
            local l_v12_0 = v12;
            local v14 = v2[l_v12_0];
            v2[l_v12_0] = nil;
            if typeof(v14) == "function" then
                task.spawn(v14);
            end;
            v12 = next(v2);
        end;
    end;
end;
return observeChildren;