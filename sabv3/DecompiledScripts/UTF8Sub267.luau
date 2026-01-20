--!native
return function(v0, v1, v2) --[[ Line: 20 ]] --[[ Name: UTF8Sub ]]
    local v3 = v2 or -1;
    local v4 = nil;
    local v5 = utf8.offset(v0, v1);
    if not v5 then
        if v1 > 0 then
            return "";
        else
            v4 = 1;
        end;
    else
        v4 = v5;
    end;
    local v6 = nil;
    if v3 == -1 then
        v6 = #v0;
    else
        local v7 = utf8.offset(v0, v3 + 1);
        v6 = if v7 then v7 - 1 else v3 < 0 and 0 or #v0;
    end;
    return (string.sub(v0, v4, v6));
end;