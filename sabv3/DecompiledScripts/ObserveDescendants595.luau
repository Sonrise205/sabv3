observeDescendants = function(v0, v1) --[[ Line: 8 ]] --[[ Name: observeDescendants ]]
    local v2 = {};
    local v3 = nil;
    local v4 = nil;
    local function v7(v5) --[[ Line: 14 ]] --[[ Name: OnInstanceRemoved ]]
        -- upvalues: v2 (copy)
        local v6 = v2[v5];
        v2[v5] = nil;
        if typeof(v6) == "function" then
            task.spawn(v6);
        end;
    end;
    local function v9(v8) --[[ Line: 23 ]] --[[ Name: OnInstanceAdded ]]
        -- upvalues: v3 (ref), v1 (copy), v2 (copy)
        if not v3 or not v3.Connected then
            return;
        else
            v2[v8] = v1(v8);
            return;
        end;
    end;
    v3 = v0.DescendantAdded:Connect(v9);
    v4 = v0.DescendantRemoving:Connect(v7);
    task.defer(function() --[[ Line: 37 ]]
        -- upvalues: v3 (ref), v0 (copy), v1 (copy), v2 (copy), v9 (copy)
        if not v3 or not v3.Connected then
            return;
        else
            local l_v0_0 = v0;
            if v3 and v3.Connected then
                v2[l_v0_0] = v1(l_v0_0);
            end;
            for _, v12 in v0:GetDescendants() do
                task.spawn(v9, v12);
            end;
            return;
        end;
    end);
    return function(v13) --[[ Line: 49 ]]
        -- upvalues: v3 (ref), v4 (ref), v2 (copy), v0 (copy), v9 (copy), v7 (copy)
        if v13 == nil then
            if v3 then
                v3:Disconnect();
            end;
            if v4 then
                v4:Disconnect();
            end;
            local v14 = next(v2);
            while v14 do
                local l_v14_0 = v14;
                local v16 = v2[l_v14_0];
                v2[l_v14_0] = nil;
                if typeof(v16) == "function" then
                    task.spawn(v16);
                end;
                v14 = next(v2);
            end;
        elseif v13 == true then
            if v3 or v4 then
                return;
            else
                v3 = v0.DescendantAdded:Connect(v9);
                v4 = v0.DescendantRemoving:Connect(v7);
                return;
            end;
        elseif v13 == false then
            if v3 then
                v3:Disconnect();
                v3 = nil;
            end;
            if v4 then
                v4:Disconnect();
                v4 = nil;
            end;
        end;
    end;
end;
return observeDescendants;