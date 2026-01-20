local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.None);
local v2 = require(script.Parent.Parent.utils.isDataStructure);
local v3 = require(script.Parent.slice);
local v4 = require(script.Parent.get);
local l_remove_0 = require(script.Parent:FindFirstChild("remove"));
local v6 = require(script.Parent.set);
local function _(v7) --[[ Line: 12 ]] --[[ Name: toString ]]
    return table.concat(v7, ", ");
end;
local function v9(v10, v11, v12, v13, v14) --[[ Line: 16 ]] --[[ Name: updateInDeeply ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy), v9 (copy), l_remove_0 (copy), v6 (copy)
    local v15 = v10 == v1;
    if v12 == #v11 + 1 then
        local v16 = if v15 then v14 else v10;
        local v17 = v13(v16);
        if v17 == v16 then
            return v10;
        else
            return v17;
        end;
    else
        if not v15 and not v2(v10) then
            local l_error_0 = error;
            local v19 = "Cannot update within non-data-structure value in path [";
            local v20 = v3(v11, 1, v12 - 1);
            l_error_0(v19 .. table.concat(v20, ", ") .. "]: " .. tostring(v10));
        end;
        local v21 = v11[v12];
        local v22 = if v15 then v1 else v4(v10, v21, v1);
        local v23 = v9(v22, v11, v12 + 1, v13, v14);
        if v23 == v22 then
            return v10;
        elseif v23 == v1 then
            return (l_remove_0(v10, v21));
        else
            return (v6(if v15 then {} else v10, v21, v23));
        end;
    end;
end;
return function(v24, v25, v26, v27) --[[ Line: 49 ]]
    -- upvalues: v9 (copy), v1 (copy)
    local v28 = v9(v24, v25, 1, v26, v27);
    if v28 == v1 then
        return v27;
    else
        return v28;
    end;
end;