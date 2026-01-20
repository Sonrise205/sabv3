local v0 = {
    "", 
    "K", 
    "M", 
    "B", 
    "T", 
    "Qa", 
    "Qi", 
    "Sx", 
    "Sp", 
    "Oc", 
    "No", 
    "Dc", 
    "Ud", 
    "Dd", 
    "Td", 
    "Qad", 
    "Qid", 
    "Sxd", 
    "Spd", 
    "Ocd", 
    "Nod", 
    "Vg", 
    "Uvg", 
    "Dvg", 
    "Tvg"
};
return {
    ToString = function(_, v2, v3) --[[ Line: 35 ]] --[[ Name: ToString ]]
        -- upvalues: v0 (copy)
        v3 = v3 or 1;
        local v4 = math.floor((math.log(math.max(1, (math.abs(v2))), 1000)));
        local v5 = v0[v4 + 1] or "e+" .. v4;
        local v6 = math.floor(v2 * (10 ^ v3 / 1000 ^ v4)) / 10 ^ v3;
        return ("%." .. v3 .. "f"):format(v6):gsub("%.?0+$", "") .. v5;
    end, 
    Comma = function(_, v8) --[[ Line: 43 ]] --[[ Name: Comma ]]
        local v9 = tostring(v8);
        local v10 = -1;
        while v10 ~= 0 do
            local v11, v12 = string.gsub(v9, "^(-?%d+)(%d%d%d)", "%1,%2");
            v9 = v11;
            v10 = v12;
        end;
        return v9;
    end
};