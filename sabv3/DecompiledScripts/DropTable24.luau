--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Randoms.ISAAC).Unique();
local v3 = v1.Table({
    Weight = v1.FinitePositive, 
    Value = v1.Any
});
local v4 = v1.Table({
    Weight = v1.FinitePositive, 
    Chance = v1.Range(0, 1), 
    Value = v1.Any
});
local v5 = {};
local function v11(v6, v7) --[[ Line: 73 ]] --[[ Name: Search ]]
    local v8 = 1;
    local v9 = #v6;
    while v8 < v9 do
        local v10 = v8 + (v9 - v8) // 2;
        if v7 < v6[v10] then
            v9 = v10;
        else
            v8 = v10 + 1;
        end;
    end;
    return v8;
end;
v5.Next = function(v12) --[[ Line: 90 ]] --[[ Name: Next ]]
    -- upvalues: v2 (copy), v11 (copy)
    local v13 = v2:NextDouble();
    local v14 = v11(v12.Uppers, v12.TotalWeight * v13);
    local v15 = v12.Entries[v14];
    return v15.Value, v15;
end;
v5.Pick = function(v16, v17) --[[ Line: 102 ]] --[[ Name: Pick ]]
    -- upvalues: v11 (copy)
    local v18 = false;
    if v17 >= 0 then
        v18 = v17 <= 1;
    end;
    assert(v18);
    local v19 = v11(v16.Uppers, v16.TotalWeight * v17);
    v18 = v16.Entries[v19];
    return v18.Value, v18;
end;
local v20 = table.freeze({
    __index = table.freeze(v5)
});
local function v23(v21, v22) --[[ Line: 115 ]] --[[ Name: CompareOrderedEntry ]]
    if v21.Weight ~= v22.Weight then
        return v21.Weight < v22.Weight;
    else
        return v21.Index < v22.Index;
    end;
end;
local function v39(v24) --[[ Line: 123 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy), v23 (copy), v20 (copy)
    v1.Array(v3)(v24);
    local v25 = #v24;
    assert(v25 > 0);
    local v26 = {};
    for v27, v28 in ipairs(v24) do
        table.insert(v26, {
            Index = v27, 
            Weight = v28.Weight
        });
    end;
    table.sort(v26, v23);
    local v29 = 0;
    local v30 = table.create(v25, 0);
    local v31 = {};
    for v32, v33 in ipairs(v26) do
        local v34 = v24[v33.Index];
        local l_Weight_0 = v34.Weight;
        v29 = v29 + l_Weight_0;
        v30[v32] = v29;
        table.insert(v31, {
            Weight = l_Weight_0, 
            Chance = 0, 
            Value = v34.Value
        });
    end;
    table.freeze(v30);
    for _, v37 in ipairs(v31) do
        v37.Chance = v37.Weight / v29;
        table.freeze(v37);
    end;
    table.freeze(v31);
    local v38 = setmetatable({
        TotalWeight = v29, 
        Entries = v31, 
        Uppers = v30
    }, v20);
    table.freeze(v38);
    return v38;
end;
local function v42(v40) --[[ Line: 176 ]] --[[ Name: IsA ]]
    -- upvalues: v20 (copy)
    local v41 = false;
    if type(v40) == "table" then
        v41 = getmetatable(v40) == v20;
    end;
    return v41;
end;
local function v44(v43) --[[ Line: 180 ]] --[[ Name: Assert ]]
    -- upvalues: v20 (copy)
    if type(v43) ~= "table" then
        error("table", 2);
    end;
    if getmetatable(v43) ~= v20 then
        error("DropTable", 2);
    end;
    return v43;
end;
local v49 = {
    Add = function(v45, v46, v47) --[[ Line: 211 ]] --[[ Name: Add ]]
        -- upvalues: v1 (copy)
        v1.FinitePositive(v46);
        v45.AssertValue(v47);
        table.insert(v45.Entries, {
            Weight = v46, 
            Value = v47
        });
        return v45;
    end, 
    Build = function(v48) --[[ Line: 221 ]] --[[ Name: Build ]]
        -- upvalues: v39 (copy)
        return (v39(v48.Entries));
    end
};
local v50 = table.freeze({
    __index = table.freeze(v49)
});
local v56 = {
    new = v39, 
    IsA = v42, 
    Assert = v44, 
    AssertEntry = v4, 
    Builder = function(v51) --[[ Line: 227 ]] --[[ Name: Builder ]]
        -- upvalues: v1 (copy), v50 (copy)
        v1.Function(v51);
        local v52 = setmetatable({
            AssertValue = v51, 
            Entries = {}
        }, v50);
        table.freeze(v52);
        return v52;
    end, 
    IsABuilder = function(v53) --[[ Line: 241 ]] --[[ Name: IsABuilder ]]
        -- upvalues: v50 (copy)
        local v54 = false;
        if type(v53) == "table" then
            v54 = getmetatable(v53) == v50;
        end;
        return v54;
    end, 
    AssertBuilder = function(v55) --[[ Line: 245 ]] --[[ Name: AssertBuilder ]]
        -- upvalues: v50 (copy)
        if type(v55) ~= "table" then
            error("table", 2);
        end;
        if getmetatable(v55) ~= v50 then
            error("table", 2);
        end;
        return v55;
    end, 
    AssertBuilderEntry = v3
};
return table.freeze(v56);