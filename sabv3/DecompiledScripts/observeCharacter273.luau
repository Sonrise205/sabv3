return function(v0, v1) --[[ Line: 18 ]] --[[ Name: observeCharacter ]]
    local v2 = nil;
    local v3 = nil;
    local function v10(v4) --[[ Line: 23 ]] --[[ Name: OnCharacterAdded ]]
        -- upvalues: v1 (copy), v0 (copy), v3 (ref), v2 (ref)
        local v5 = nil;
        task.defer(function() --[[ Line: 27 ]]
            -- upvalues: v1 (ref), v0 (ref), v4 (copy), v3 (ref), v5 (ref), v2 (ref)
            local v6 = v1(v0, v4);
            if typeof(v6) == "function" then
                if v3.Connected and v4.Parent then
                    v5 = v6;
                    v2 = v6;
                    return;
                else
                    task.spawn(v6);
                end;
            end;
        end);
        local v7 = nil;
        v7 = v4.AncestryChanged:Connect(function(_, v9) --[[ Line: 43 ]]
            -- upvalues: v7 (ref), v5 (ref), v2 (ref)
            if v9 == nil and v7.Connected then
                v7:Disconnect();
                if v5 ~= nil then
                    task.spawn(v5);
                    if v2 == v5 then
                        v2 = nil;
                    end;
                    v5 = nil;
                end;
            end;
        end);
    end;
    v3 = v0.CharacterAdded:Connect(v10);
    task.defer(function() --[[ Line: 61 ]]
        -- upvalues: v0 (copy), v3 (ref), v10 (copy)
        if v0.Character and v3.Connected then
            task.spawn(v10, v0.Character);
        end;
    end);
    return function() --[[ Line: 68 ]]
        -- upvalues: v3 (ref), v2 (ref)
        v3:Disconnect();
        if v2 ~= nil then
            task.spawn(v2);
            v2 = nil;
        end;
    end;
end;