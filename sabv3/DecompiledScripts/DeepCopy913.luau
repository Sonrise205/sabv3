--!native
DeepCopyWithMetatables = function(v0, v1) --[[ Line: 33 ]] --[[ Name: DeepCopyWithMetatables ]]
    if type(v0) ~= "table" then
        return v0;
    else
        local v2 = v1 or {};
        local v3 = v2[v0];
        if v3 then
            return v3;
        else
            local v4 = {};
            v2[v0] = v4;
            for v5, v6 in next, v0 do
                v4[DeepCopyWithMetatables(v5, v2)] = DeepCopyWithMetatables(v6, v2);
            end;
            local v7 = getmetatable(v0);
            if v7 then
                setmetatable(v4, v7);
            end;
            return v4;
        end;
    end;
end;
return DeepCopyWithMetatables;