local l_Players_0 = game:GetService("Players");
return function(v1) --[[ Line: 21 ]] --[[ Name: observePlayer ]]
    -- upvalues: l_Players_0 (copy)
    local v2 = nil;
    local v3 = nil;
    local v4 = {};
    local function v7(v5) --[[ Line: 27 ]] --[[ Name: OnPlayerAdded ]]
        -- upvalues: v2 (ref), v1 (copy), v4 (copy)
        if not v2.Connected then
            return;
        else
            task.spawn(function() --[[ Line: 32 ]]
                -- upvalues: v1 (ref), v5 (copy), v2 (ref), v4 (ref)
                local v6 = v1(v5);
                if typeof(v6) == "function" then
                    if v2.Connected and v5.Parent then
                        v4[v5] = v6;
                        return;
                    else
                        task.spawn(v6);
                    end;
                end;
            end);
            return;
        end;
    end;
    local function v10(v8) --[[ Line: 44 ]] --[[ Name: OnPlayerRemoving ]]
        -- upvalues: v4 (copy)
        local v9 = v4[v8];
        v4[v8] = nil;
        if typeof(v9) == "function" then
            task.spawn(v9);
        end;
    end;
    v2 = l_Players_0.PlayerAdded:Connect(v7);
    v3 = l_Players_0.PlayerRemoving:Connect(v10);
    task.defer(function() --[[ Line: 57 ]]
        -- upvalues: v2 (ref), l_Players_0 (ref), v7 (copy)
        if not v2.Connected then
            return;
        else
            for _, v12 in l_Players_0:GetPlayers() do
                task.spawn(v7, v12);
            end;
            return;
        end;
    end);
    return function() --[[ Line: 68 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (copy)
        v2:Disconnect();
        v3:Disconnect();
        local v13 = next(v4);
        while v13 do
            local l_v13_0 = v13;
            local v15 = v4[l_v13_0];
            v4[l_v13_0] = nil;
            if typeof(v15) == "function" then
                task.spawn(v15);
            end;
            v13 = next(v4);
        end;
    end;
end;