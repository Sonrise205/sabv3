--!native
local l_HttpService_0 = game:GetService("HttpService");
local function v2() --[[ Line: 22 ]] --[[ Name: GenerateEntropy ]]
    -- upvalues: l_HttpService_0 (copy)
    local v1 = l_HttpService_0:GenerateGUID(false);
    return tonumber(string.sub(v1, 1, 8), 16), tonumber(string.sub(v1, 10, 13) .. string.sub(v1, 25, 28), 16), (tonumber(string.sub(v1, 29, 36), 16));
end;
return function(v3) --[[ Line: 30 ]] --[[ Name: GenerateSeed ]]
    -- upvalues: v2 (copy)
    local v4 = table.create(v3, 0);
    local v5 = v3 // 3;
    for v6 = 0, v5 - 1 do
        local v7 = 1 + v6 * 3;
        local v8 = 2 + v6 * 3;
        local v9 = 3 + v6 * 3;
        local v10, v11, v12 = v2();
        v4[v7] = v10;
        v4[v8] = v11;
        v4[v9] = v12;
    end;
    local v13 = v3 - v5 * 3;
    if v13 == 1 then
        v4[v3] = v2();
        return v4;
    else
        if v13 == 2 then
            local v14 = v3 - 1;
            local v15, v16 = v2();
            v4[v14] = v15;
            v4[v3] = v16;
        end;
        return v4;
    end;
end;