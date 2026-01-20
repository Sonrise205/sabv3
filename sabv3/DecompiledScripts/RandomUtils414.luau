return {
    RandomOnArray = function(_, v1, v2, v3) --[[ Line: 8 ]] --[[ Name: RandomOnArray ]]
        local v4 = 1 + (v2 or 0) / 3;
        local v5 = 0;
        local v6 = {};
        for v7 = 1, #v1 do
            local v8 = v1[v7] ^ (1 / v4);
            table.insert(v6, v8);
            v5 = v5 + v8;
        end;
        local v9 = v3 and v3:NextNumber(0, v5) or Random.new():NextNumber(0, 1) * v5;
        local v10 = 0;
        for v11 = 1, #v6 do
            v10 = v10 + v6[v11];
            if v9 <= v10 then
                return v11;
            end;
        end;
        return nil;
    end, 
    RandomOnDict = function(_, v13, v14, v15) --[[ Line: 34 ]] --[[ Name: RandomOnDict ]]
        local v16 = 1 + (v14 or 0) / 3;
        local v17 = 0;
        local v18 = {};
        for v19, v20 in v13 do
            local v21 = v20 ^ (1 / v16);
            v18[v19] = v21;
            v17 = v17 + v21;
        end;
        local v22 = v15 and v15:NextNumber(0, v17) or Random.new():NextNumber(0, 1) * v17;
        local v23 = 0;
        for v24, v25 in v18 do
            v23 = v23 + v25;
            if v22 <= v23 then
                return v24;
            end;
        end;
        return nil;
    end, 
    RandomOnArrayWithChance = function(_, v27, v28, v29) --[[ Line: 59 ]] --[[ Name: RandomOnArrayWithChance ]]
        local v30 = 1 + (v28 or 0) / 3;
        local v31 = 0;
        local v32 = {};
        for v33 = 1, #v27 do
            local v34 = v27[v33].Chance ^ (1 / v30);
            table.insert(v32, v34);
            v31 = v31 + v34;
        end;
        local v35 = v29 and v29:NextNumber(0, v31) or Random.new():NextNumber(0, 1) * v31;
        local v36 = 0;
        for v37 = 1, #v32 do
            v36 = v36 + v32[v37];
            if v35 <= v36 then
                return v27[v37];
            end;
        end;
        return nil;
    end, 
    GetPercentage = function(_, v39, v40) --[[ Line: 84 ]] --[[ Name: GetPercentage ]]
        local v41 = 1 + (v40 or 0) / 3;
        local v42 = 0;
        local v43 = {};
        for v44 = 1, #v39 do
            local v45 = v39[v44] ^ (1 / v41);
            table.insert(v43, v45);
            v42 = v42 + v45;
        end;
        local v46 = {};
        for v47 = 1, #v43 do
            table.insert(v46, v43[v47] / v42 * 100);
        end;
        return v46;
    end
};