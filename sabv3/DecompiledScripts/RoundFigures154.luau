--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Math.StableExp10);
return function(v2, v3, v4, v5) --[[ Line: 40 ]] --[[ Name: RoundFigures ]]
    -- upvalues: v1 (copy)
    assert(type(v2) == "number");
    local v6 = true;
    if v3 ~= nil then
        v6 = type(v3) == "number";
    end;
    assert(v6);
    v6 = true;
    if v4 ~= nil then
        v6 = type(v4) == "number";
    end;
    assert(v6);
    v6 = true;
    if v5 ~= nil then
        v6 = type(v5) == "function";
    end;
    assert(v6);
    if v2 ~= v2 or v2 == 1e999 or v2 == -1e999 then
        return v2;
    else
        local v7 = v3 or 3;
        v6 = v4 or 1;
        local v8 = v5 or math.round;
        local v9 = math.sign(v2);
        if v9 == 0 then
            return 0;
        else
            v2 = v2 * v9;
            local v10 = math.floor((math.log10(v2))) - v7 + 1;
            local l_v2_0 = v2;
            if v6 ~= 1 then
                l_v2_0 = l_v2_0 / v6;
            end;
            l_v2_0 = v8((v1(l_v2_0, -v10)));
            return v1(l_v2_0 * v6, v10) * v9;
        end;
    end;
end;