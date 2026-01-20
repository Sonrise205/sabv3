--!native
local function _(v0, v1, v2) --[[ Line: 48 ]] --[[ Name: hash ]]
    return (bit32.band(v0, 262143) * 262144 + bit32.band(v2, 262143)) * 131072 + bit32.band(v1, 131071);
end;
local function _(v4, v5) --[[ Line: 54 ]] --[[ Name: quantize ]]
    return v4.X // v5, v4.Y // v5, v4.Z // v5;
end;
local function _(v7, v8) --[[ Line: 58 ]] --[[ Name: key ]]
    local v9 = v7.X // v8;
    local v10 = v7.Y // v8;
    local v11 = v7.Z // v8;
    return (bit32.band(v9, 262143) * 262144 + bit32.band(v11, 262143)) * 131072 + bit32.band(v10, 131071);
end;
local v13 = {};
local v14 = table.freeze({
    __index = v13
});
v13.Insert = function(v15, v16, v17) --[[ Line: 68 ]] --[[ Name: Insert ]]
    assert(typeof(v16) == "Vector3");
    local l_Epsilon_0 = v15.Epsilon;
    local v19 = v16.X // l_Epsilon_0;
    local v20 = v16.Y // l_Epsilon_0;
    local v21 = v16.Z // l_Epsilon_0;
    local v22 = (bit32.band(v19, 262143) * 262144 + bit32.band(v21, 262143)) * 131072 + bit32.band(v20, 131071);
    l_Epsilon_0 = {
        Pos = v16, 
        Value = v17
    };
    v19 = v15.Table;
    if not v19[v22] then
        v19[v22] = {};
    end;
    table.insert(v19[v22], l_Epsilon_0);
end;
v13.Remove = function(v23, v24, v25) --[[ Line: 80 ]] --[[ Name: Remove ]]
    assert(typeof(v24) == "Vector3");
    local l_Epsilon_1 = v23.Epsilon;
    local v27 = v24.X // l_Epsilon_1;
    local v28 = v24.Y // l_Epsilon_1;
    local v29 = v24.Z // l_Epsilon_1;
    local v30 = (bit32.band(v27, 262143) * 262144 + bit32.band(v29, 262143)) * 131072 + bit32.band(v28, 131071);
    l_Epsilon_1 = v23.Table[v30];
    if not l_Epsilon_1 then
        return;
    else
        for v31 = #l_Epsilon_1, 1, -1 do
            if l_Epsilon_1[v31].Value == v25 then
                table.remove(l_Epsilon_1, v31);
            end;
        end;
        if #l_Epsilon_1 == 0 then
            v23.Table[v30] = nil;
        end;
        return;
    end;
end;
v13.Collect = function(v32, v33, v34) --[[ Line: 99 ]] --[[ Name: Collect ]]
    assert(typeof(v33) == "Vector3");
    local v35 = true;
    if v34 ~= nil then
        v35 = false;
        if type(v34) == "number" then
            v35 = false;
            if v34 > 0 then
                v35 = math.floor(v34) == v34;
            end;
        end;
    end;
    assert(v35);
    local l_Epsilon_2 = v32.Epsilon;
    local v37 = v33.X // l_Epsilon_2;
    v35 = v33.Y // l_Epsilon_2;
    local v38 = v33.Z // l_Epsilon_2;
    l_Epsilon_2 = v32.Table;
    local v39 = v34 or 1;
    local v40 = {};
    local v41 = 0;
    for v42 = -v39, v39 do
        for v43 = -v39, v39 do
            for v44 = -v39, v39 do
                local v45 = v37 + v42;
                local v46 = v35 + v43;
                local v47 = v38 + v44;
                v45 = l_Epsilon_2[(bit32.band(v45, 262143) * 262144 + bit32.band(v47, 262143)) * 131072 + bit32.band(v46, 131071)];
                if v45 then
                    for _, v49 in ipairs(v45) do
                        v41 = v41 + 1;
                        v40[v41] = v49.Value;
                    end;
                end;
            end;
        end;
    end;
    v40.n = v41;
    return v40;
end;
v13.Query = function(v50, v51, v52) --[[ Line: 128 ]] --[[ Name: Query ]]
    assert(typeof(v51) == "Vector3");
    local v53 = true;
    if v52 ~= nil then
        v53 = false;
        if type(v52) == "number" then
            v53 = false;
            if v52 > 0 then
                v53 = math.floor(v52) == v52;
            end;
        end;
    end;
    assert(v53);
    local l_Epsilon_3 = v50.Epsilon;
    local v55 = v51.X // l_Epsilon_3;
    v53 = v51.Y // l_Epsilon_3;
    local v56 = v51.Z // l_Epsilon_3;
    l_Epsilon_3 = v50.Table;
    local v57 = v52 or 1;
    local v58 = nil;
    local v59 = nil;
    for v60 = -v57, v57 do
        for v61 = -v57, v57 do
            for v62 = -v57, v57 do
                local v63 = v55 + v60;
                local v64 = v53 + v61;
                local v65 = v56 + v62;
                v63 = l_Epsilon_3[(bit32.band(v63, 262143) * 262144 + bit32.band(v65, 262143)) * 131072 + bit32.band(v64, 131071)];
                if v63 then
                    for _, v67 in ipairs(v63) do
                        local l_Magnitude_0 = (v67.Pos - v51).Magnitude;
                        if not v59 or l_Magnitude_0 < v59 then
                            v59 = l_Magnitude_0;
                            v58 = v67.Value;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v58;
end;
table.freeze(v13);
local v72 = {
    new = function(v69, _) --[[ Line: 163 ]] --[[ Name: new ]]
        -- upvalues: v14 (copy)
        local v71 = true;
        if v69 ~= nil then
            v71 = false;
            if type(v69) == "number" then
                v71 = v69 > 0;
            end;
        end;
        assert(v71);
        return (setmetatable({
            Table = {}, 
            Epsilon = v69 or 10
        }, v14));
    end
};
return table.freeze(v72);