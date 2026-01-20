return {
    A = function(_, v1) --[[ Line: 8 ]] --[[ Name: A ]]
        v1 = math.ceil(v1);
        local v2 = math.floor(v1 / 86400);
        v1 = v1 % 86400;
        local v3 = math.floor(v1 / 3600);
        v1 = v1 % 3600;
        local v4 = math.floor(v1 / 60);
        v1 = v1 % 60;
        local v5 = "";
        if v2 >= 1 then
            v5 = v5 .. ("%*d "):format(v2);
        end;
        if v2 >= 1 or v3 >= 1 then
            v5 = v5 .. ("%*h "):format(v3);
        end;
        if v3 >= 1 or v4 >= 1 then
            v5 = v5 .. ("%*m "):format(v4);
        end;
        if v3 <= 0 and v4 <= 0 and v2 <= 0 then
            v5 = v5 .. ("%*s"):format(v1);
        end;
        return v5;
    end, 
    B = function(_, v7) --[[ Line: 42 ]] --[[ Name: B ]]
        v7 = math.ceil(v7);
        local v8 = math.floor(v7 / 86400);
        v7 = v7 % 86400;
        local v9 = math.floor(v7 / 3600);
        v7 = v7 % 3600;
        local v10 = math.floor(v7 / 60);
        v7 = v7 % 60;
        local v11 = "";
        if v8 >= 1 then
            v11 = v11 .. string.format("%d:", v8);
        end;
        if v8 >= 1 or v9 >= 1 then
            v11 = v11 .. string.format("%02d:", v9);
        end;
        if v9 >= 1 or v10 >= 1 or v8 >= 1 then
            v11 = v11 .. string.format("%02d:", v10);
        end;
        return v11 .. string.format("%02d", v7);
    end, 
    C = function(_, v13) --[[ Line: 74 ]] --[[ Name: C ]]
        v13 = math.max(0, (math.floor((math.ceil(v13)))));
        return (string.format("%ds", v13));
    end, 
    D = function(_, v15) --[[ Line: 83 ]] --[[ Name: D ]]
        v15 = math.max(0, (math.floor((math.ceil(v15)))));
        local v16 = math.floor(v15 / 86400);
        v15 = v15 % 86400;
        local v17 = math.floor(v15 / 3600);
        v15 = v15 % 3600;
        local v18 = math.floor(v15 / 60);
        v15 = v15 % 60;
        local v19 = "";
        if v16 > 0 then
            return ((v19 .. ("%*d "):format(v16)) .. ("%*h "):format(v17)) .. ("%*m"):format(v18);
        elseif v17 > 0 then
            return ((v19 .. ("%*h "):format(v17)) .. ("%*m "):format(v18)) .. ("%*s"):format(v15);
        elseif v18 > 0 then
            return (v19 .. ("%*m "):format(v18)) .. ("%*s"):format(v15);
        else
            return v19 .. ("%*s"):format(v15);
        end;
    end, 
    E = function(_, v21) --[[ Line: 115 ]] --[[ Name: E ]]
        v21 = v21 < 0 and 0 or v21 // 1;
        local v22 = v21 // 86400;
        v21 = v21 % 86400;
        local v23 = v21 // 3600;
        v21 = v21 % 3600;
        local v24 = v21 // 60;
        v21 = v21 % 60;
        local v25 = "";
        if v22 > 0 then
            v25 = v25 .. ("%*d"):format(v22);
            if v23 > 0 then
                return v25 .. (" %*h"):format(v23);
            end;
        elseif v23 > 0 then
            v25 = v25 .. ("%*h"):format(v23);
            if v24 > 0 then
                return v25 .. (" %*m"):format(v24);
            end;
        elseif v24 > 0 then
            v25 = v25 .. ("%*m"):format(v24);
            if v21 > 0 then
                return v25 .. (" %*s"):format(v21);
            end;
        else
            v25 = v25 .. ("%*s"):format(v21);
        end;
        return v25;
    end
};