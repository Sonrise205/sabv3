return function(v0, v1) --[[ Line: 3 ]]
    for v2, v3 in v0 do
        if v1(v3, v2) == true then
            return true;
        end;
    end;
    return false;
end;