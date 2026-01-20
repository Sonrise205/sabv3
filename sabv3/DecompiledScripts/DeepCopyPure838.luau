--!native
DeepCopyPure = function(v0, v1) --[[ Line: 31 ]] --[[ Name: DeepCopyPure ]]
    if type(v0) ~= "table" then
        return v0;
    else
        assert(not getmetatable(v0));
        local v2 = v1 or {};
        assert(not v2[v0]);
        v2[v0] = true;
        local v3 = {};
        for v4, v5 in next, v0 do
            v3[DeepCopyPure(v4, v2)] = DeepCopyPure(v5, v2);
        end;
        v2[v0] = nil;
        return v3;
    end;
end;
return DeepCopyPure;