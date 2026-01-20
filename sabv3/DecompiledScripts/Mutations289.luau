local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Trove);
local v2 = {
    {
        "CursedEvent", 
        "Cursed"
    }, 
    {
        "RadioactiveEvent", 
        "Radioactive"
    }, 
    {
        "YinYangEvent", 
        "YinYang"
    }, 
    {
        "GalaxyEvent", 
        "Galaxy"
    }, 
    {
        "MoltenEvent", 
        "Lava"
    }, 
    {
        "CandyEvent", 
        "Candy"
    }, 
    {
        "BloodmoonEvent", 
        "Bloodrot"
    }
};
local function v6() --[[ Line: 15 ]] --[[ Name: getList ]]
    -- upvalues: v2 (copy), l_ReplicatedStorage_0 (copy)
    local v3 = {};
    for _, v5 in v2 do
        if l_ReplicatedStorage_0:GetAttribute(v5[1]) then
            table.insert(v3, v5[2]);
        end;
    end;
    return v3;
end;
local function _(v7, v8) --[[ Line: 25 ]] --[[ Name: shallowEquals ]]
    if #v7 ~= #v8 then
        return false;
    else
        for v9, v10 in v7 do
            if v8[v9] ~= v10 then
                return false;
            end;
        end;
        return true;
    end;
end;
return {
    getList = v6, 
    get = function() --[[ Line: 39 ]] --[[ Name: get ]]
        -- upvalues: v6 (copy)
        return v6()[1];
    end, 
    watch = function(v12) --[[ Line: 43 ]] --[[ Name: watch ]]
        -- upvalues: v6 (copy), v1 (copy), v2 (copy), l_ReplicatedStorage_0 (copy)
        local v13 = v6();
        local function v20() --[[ Line: 45 ]] --[[ Name: tryUpdate ]]
            -- upvalues: v6 (ref), v13 (ref), v12 (copy)
            local v14 = false;
            local v15 = v6();
            local l_v13_0 = v13;
            local v17;
            if #l_v13_0 ~= #v15 then
                v17 = false;
            else
                for v18, v19 in l_v13_0 do
                    if v15[v18] ~= v19 then
                        v17 = false;
                        v14 = true;
                    end;
                    if v14 then
                        break;
                    end;
                end;
                if not v14 then
                    v17 = true;
                end;
            end;
            v14 = false;
            if v17 then
                return;
            else
                v13 = v15;
                v12();
                return;
            end;
        end;
        local v21 = v1.new();
        for _, v23 in v2 do
            v21:Add(l_ReplicatedStorage_0:GetAttributeChangedSignal(v23[1]):Connect(v20));
        end;
        return v21:WrapClean();
    end
};