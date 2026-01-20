--!native
BufferToHex = function(v0) --[[ Line: 20 ]] --[[ Name: BufferToHex ]]
    local v1 = buffer.len(v0);
    local v2 = buffer.create(v1 * 2);
    for v3 = 0, v1 - 1 do
        local v4 = buffer.readu8(v0, v3);
        local v5 = bit32.rshift(v4, 4);
        local v6 = bit32.band(v4, 15);
        buffer.writeu8(v2, v3 * 2 + 0, if v5 < 10 then v5 + 48 else v5 + 87);
        buffer.writeu8(v2, v3 * 2 + 1, if v6 < 10 then v6 + 48 else v6 + 87);
    end;
    return buffer.tostring(v2);
end;
return BufferToHex;