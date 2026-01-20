local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Timer);
local v2 = {};
v1.Simple(0.05, function() --[[ Line: 9 ]]
    -- upvalues: v2 (copy)
    local v3 = os.clock();
    for v4, v5 in v2 do
        if v5 <= v3 then
            v2[v4] = nil;
        end;
    end;
end);
return function(v6, v7, v8) --[[ Line: 18 ]]
    -- upvalues: v2 (copy)
    if v8 and v7 and v2[v6] then
        v2[v6] = os.clock() + v7;
        return;
    elseif v2[v6] then
        return true;
    elseif not v7 then
        return;
    else
        v2[v6] = os.clock() + v7;
        return;
    end;
end;