--!native
DeepFreezeUnsafe = function(v0) --[[ Line: 31 ]] --[[ Name: DeepFreezeUnsafe ]]
    if type(v0) ~= "table" then
        return v0;
    else
        if not table.isfrozen(v0) then
            table.freeze(v0);
        end;
        for v1, v2 in next, v0 do
            DeepFreezeUnsafe(v1);
            DeepFreezeUnsafe(v2);
        end;
        return v0;
    end;
end;
return DeepFreezeUnsafe;