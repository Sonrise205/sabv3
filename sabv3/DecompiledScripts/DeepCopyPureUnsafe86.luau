--!native
DeepCopyPureUnsafe = function(v0) --[[ Line: 31 ]] --[[ Name: DeepCopyPureUnsafe ]]
    if type(v0) ~= "table" then
        return v0;
    else
        local v1 = {};
        for v2, v3 in next, v0 do
            v1[DeepCopyPureUnsafe(v2)] = DeepCopyPureUnsafe(v3);
        end;
        return v1;
    end;
end;
return DeepCopyPureUnsafe;