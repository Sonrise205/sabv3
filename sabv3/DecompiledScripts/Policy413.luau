local l_PolicyService_0 = game:GetService("PolicyService");
local l_Players_0 = game:GetService("Players");
local v2 = {};
local v3 = {};
local v4 = {};
v2.getPolicy = function(v5) --[[ Line: 21 ]] --[[ Name: getPolicy ]]
    -- upvalues: v3 (copy), v4 (copy), l_PolicyService_0 (copy), l_Players_0 (copy)
    while v3[v5] do
        task.wait();
    end;
    local v6 = v4[v5];
    if v6 then
        return v6;
    else
        v3[v5] = true;
        local v7, v8 = xpcall(function() --[[ Line: 33 ]]
            -- upvalues: l_PolicyService_0 (ref), v5 (copy)
            return l_PolicyService_0:GetPolicyInfoForPlayerAsync(v5);
        end, warn);
        local v9 = v5:IsDescendantOf(l_Players_0);
        if v7 and v9 then
            v4[v5] = v8;
        end;
        v3[v5] = nil;
        if not v9 then
            return nil;
        else
            return v8;
        end;
    end;
end;
l_Players_0.PlayerRemoving:Connect(function(v10) --[[ Line: 51 ]]
    -- upvalues: v4 (copy)
    v4[v10] = nil;
end);
return v2;