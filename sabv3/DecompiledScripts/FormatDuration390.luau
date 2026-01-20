--!native
local v0 = {
    0, 
    2, 
    2, 
    2
};
return function(v1) --[[ Line: 22 ]] --[[ Name: FormatDuration ]]
    -- upvalues: v0 (copy)
    assert(type(v1) == "number");
    if v1 == 1e999 then
        return "Infinity";
    elseif v1 ~= v1 then
        return "NaN";
    else
        v1 = math.ceil((math.max(0, v1)));
        local v2 = v1 % 60;
        v1 = v1 // 60;
        local v3 = v1 % 60;
        v1 = v1 // 60;
        local v4 = v1 % 24;
        local v5 = {
            v1 // 24, 
            v4, 
            v3, 
            v2
        };
        local v6 = #v5;
        for v7, v8 in ipairs(v5) do
            if v8 > 0 then
                v6 = v7;
                break;
            end;
        end;
        if v6 == #v5 then
            return tostring(v2) .. "s";
        else
            local v9 = {
                (tostring(v5[v6]))
            };
            for v10 = v6 + 1, #v5 do
                local v11 = tostring(v5[v10]);
                local v12 = v0[v10];
                while #v11 < v12 do
                    v11 = "0" .. v11;
                end;
                table.insert(v9, ":" .. v11);
            end;
            return table.concat(v9);
        end;
    end;
end;