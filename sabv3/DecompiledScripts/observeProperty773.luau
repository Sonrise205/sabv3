return function(v0, v1, v2) --[[ Line: 19 ]] --[[ Name: observeProperty ]]
    local v3 = nil;
    local v4 = nil;
    local v5 = 0;
    local function v9() --[[ Line: 25 ]] --[[ Name: OnPropertyChanged ]]
        -- upvalues: v3 (ref), v5 (ref), v0 (copy), v1 (copy), v2 (copy), v4 (ref)
        if v3 ~= nil then
            task.spawn(v3);
            v3 = nil;
        end;
        v5 = v5 + 1;
        local l_v5_0 = v5;
        local v7 = v0[v1];
        task.spawn(function() --[[ Line: 36 ]]
            -- upvalues: v2 (ref), v7 (copy), l_v5_0 (copy), v5 (ref), v4 (ref), v3 (ref)
            local v8 = v2(v7);
            if l_v5_0 == v5 and v4.Connected then
                v3 = v8;
                return;
            else
                if v8 then
                    task.spawn(v8);
                end;
                return;
            end;
        end);
    end;
    v4 = v0:GetPropertyChangedSignal(v1):Connect(v9);
    task.defer(function() --[[ Line: 50 ]]
        -- upvalues: v4 (ref), v3 (ref), v5 (ref), v0 (copy), v1 (copy), v2 (copy)
        if not v4.Connected then
            return;
        else
            if v3 ~= nil then
                task.spawn(v3);
                v3 = nil;
            end;
            v5 = v5 + 1;
            local l_v5_1 = v5;
            local v11 = v0[v1];
            task.spawn(function() --[[ Line: 36 ]]
                -- upvalues: v2 (ref), v11 (copy), l_v5_1 (copy), v5 (ref), v4 (ref), v3 (ref)
                local v12 = v2(v11);
                if l_v5_1 == v5 and v4.Connected then
                    v3 = v12;
                    return;
                else
                    if v12 then
                        task.spawn(v12);
                    end;
                    return;
                end;
            end);
            return;
        end;
    end);
    return function() --[[ Line: 58 ]]
        -- upvalues: v4 (ref), v3 (ref)
        v4:Disconnect();
        if v3 ~= nil then
            task.spawn(v3);
            v3 = nil;
        end;
    end;
end;