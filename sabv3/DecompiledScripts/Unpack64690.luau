--!native
return function(v0) --[[ Line: 20 ]] --[[ Name: Unpack64 ]]
    if v0 < 0 then
        local v1 = -1 - v0;
        return bit32.bnot(v1 // 4294967296), (bit32.bnot(v1));
    else
        return bit32.bor(v0 // 4294967296, 0), (bit32.bor(v0, 0));
    end;
end;