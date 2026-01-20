--!native
DeepFreeze = function(v0, v1) --[[ Line: 32 ]] --[[ Name: DeepFreeze ]]
    if type(v0) ~= "table" then
        return v0;
    else
        if not table.isfrozen(v0) then
            table.freeze(v0);
        end;
        local v2 = v1 or {};
        if not v2[v0] then
            v2[v0] = true;
            for v3, v4 in next, v0 do
                DeepFreeze(v3, v2);
                DeepFreeze(v4, v2);
            end;
            v2[v0] = nil;
        end;
        return v0;
    end;
end;
return DeepFreeze;