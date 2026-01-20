if not game then
    script = require("test/relative-string");
end;
local v0 = game and Vector3 or require("test/mock").Vector3;
local v1 = require(script.Parent.throw);
local v2 = require(script.Parent.graph);
local l_create_node_0 = v2.create_node;
local l_create_source_node_0 = v2.create_source_node;
local l_assert_stable_scope_0 = v2.assert_stable_scope;
local l_evaluate_node_0 = v2.evaluate_node;
local l_update_descendants_0 = v2.update_descendants;
local l_push_child_to_scope_0 = v2.push_child_to_scope;
local function v12(v9, v10, v11) --[[ Line: 40 ]] --[[ Name: Vec3 ]]
    -- upvalues: v0 (copy)
    return v0.new(v9, v10, v11);
end;
local v13 = v0.new(0, 0, 0);
local v35 = {
    number = function(v14) --[[ Line: 69 ]]
        -- upvalues: v0 (copy), v13 (copy)
        return v0.new(v14, 0, 0), v13;
    end, 
    CFrame = function(v15) --[[ Line: 73 ]]
        -- upvalues: v12 (copy)
        return v15.Position, v12(v15:ToEulerAnglesXYZ());
    end, 
    Color3 = function(v16) --[[ Line: 77 ]]
        -- upvalues: v0 (copy), v13 (copy)
        local l_R_0 = v16.R;
        local l_G_0 = v16.G;
        local l_B_0 = v16.B;
        return v0.new(l_R_0, l_G_0, l_B_0), v13;
    end, 
    UDim = function(v20) --[[ Line: 82 ]]
        -- upvalues: v0 (copy), v13 (copy)
        local l_Scale_0 = v20.Scale;
        local l_Offset_0 = v20.Offset;
        return v0.new(l_Scale_0, l_Offset_0, 0), v13;
    end, 
    UDim2 = function(v23) --[[ Line: 86 ]]
        -- upvalues: v0 (copy), v12 (copy)
        local l_Scale_1 = v23.X.Scale;
        local l_Offset_1 = v23.X.Offset;
        local l_Scale_2 = v23.Y.Scale;
        return v0.new(l_Scale_1, l_Offset_1, l_Scale_2), v12(v23.Y.Offset, 0, 0);
    end, 
    Vector2 = function(v27) --[[ Line: 90 ]]
        -- upvalues: v0 (copy), v13 (copy)
        local l_X_0 = v27.X;
        local l_Y_0 = v27.Y;
        return v0.new(l_X_0, l_Y_0, 0), v13;
    end, 
    Vector3 = function(v30) --[[ Line: 94 ]]
        -- upvalues: v13 (copy)
        return v30, v13;
    end, 
    Rect = function(v31) --[[ Line: 98 ]]
        -- upvalues: v0 (copy), v12 (copy)
        local l_X_1 = v31.Min.X;
        local l_Y_1 = v31.Min.Y;
        local l_X_2 = v31.Max.X;
        return v0.new(l_X_1, l_Y_1, l_X_2), v12(v31.Max.Y, 0, 0);
    end
};
local v48 = {
    number = function(v36, _) --[[ Line: 104 ]]
        return v36.X;
    end, 
    CFrame = function(v38, v39) --[[ Line: 108 ]]
        return CFrame.new(v38) * CFrame.fromEulerAnglesXYZ(v39.X, v39.Y, v39.Z);
    end, 
    Color3 = function(v40) --[[ Line: 112 ]]
        return Color3.new(math.clamp(v40.X, 0, 1), math.clamp(v40.Y, 0, 1), (math.clamp(v40.Z, 0, 1)));
    end, 
    UDim = function(v41) --[[ Line: 116 ]]
        return UDim.new(v41.X, (math.round(v41.Y)));
    end, 
    UDim2 = function(v42, v43) --[[ Line: 120 ]]
        return UDim2.new(v42.X, math.round(v42.Y), v42.Z, (math.round(v43.X)));
    end, 
    Vector2 = function(v44) --[[ Line: 124 ]]
        return Vector2.new(v44.X, v44.Y);
    end, 
    Vector3 = function(v45) --[[ Line: 128 ]]
        return v45;
    end, 
    Rect = function(v46, v47) --[[ Line: 132 ]]
        return Rect.new(v46.X, v46.Y, v46.Z, v47.X);
    end
};
local v51 = {
    __index = function(_, v50) --[[ Line: 138 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy)
        v1((("cannot spring type %*"):format(v50)));
    end
};
setmetatable(v35, v51);
setmetatable(v48, v51);
local v52 = {};
setmetatable(v52, {
    __mode = "v"
});
local function v76(v53, v54, v55) --[[ Line: 151 ]] --[[ Name: spring ]]
    -- upvalues: l_assert_stable_scope_0 (copy), v1 (copy), v13 (copy), l_create_source_node_0 (copy), v35 (copy), v52 (copy), l_create_node_0 (copy), l_evaluate_node_0 (copy), l_push_child_to_scope_0 (copy)
    local v56 = l_assert_stable_scope_0();
    local v57 = 6.283185307179586 / (v54 or 1);
    local v58 = v55 or 1;
    local v59 = v57 ^ 2;
    local v60 = v58 * (2 * v57);
    if v60 > 240 then
        v1("spring damping too high, consider reducing damping or increasing period");
    end;
    local v61 = {
        k = v59, 
        c = v60, 
        x0_123 = v13, 
        x1_123 = v13, 
        v_123 = v13, 
        x0_456 = v13, 
        x1_456 = v13, 
        v_456 = v13, 
        source_value = false
    };
    local v62 = l_create_source_node_0(false);
    local v68 = l_create_node_0(v56, function() --[[ Line: 186 ]] --[[ Name: updater_effect ]]
        -- upvalues: v53 (copy), v61 (copy), v35 (ref), v52 (ref), v62 (copy)
        local v63 = v53();
        local l_v61_0 = v61;
        local l_v61_1 = v61;
        local v66, v67 = v35[typeof(v63)](v63);
        l_v61_0.x1_123 = v66;
        l_v61_1.x1_456 = v67;
        v61.source_value = v63;
        v52[v61] = v62;
        return v63;
    end, false);
    l_evaluate_node_0(v68);
    local l_x1_123_0 = v61.x1_123;
    local l_x1_456_0 = v61.x1_456;
    v61.x0_123 = l_x1_123_0;
    v61.x0_456 = l_x1_456_0;
    v62.cache = v61.source_value;
    return function(...) --[[ Line: 204 ]]
        -- upvalues: l_push_child_to_scope_0 (ref), v62 (copy), v61 (copy), v35 (ref), v13 (ref), v52 (ref)
        if select("#", ...) == 0 then
            l_push_child_to_scope_0(v62);
            return v62.cache;
        else
            local v71 = ...;
            local l_v61_2 = v61;
            local l_v61_3 = v61;
            local v74, v75 = v35[typeof(v71)](v71);
            l_v61_2.x0_123 = v74;
            l_v61_3.x0_456 = v75;
            v61.v_123 = v13;
            v61.v_456 = v13;
            v52[v61] = v62;
            v62.cache = v71;
            return v71;
        end;
    end;
end;
local function v99(v77) --[[ Line: 228 ]] --[[ Name: step_springs ]]
    -- upvalues: v52 (copy)
    for v78 in next, v52 do
        local l_k_0 = v78.k;
        local l_c_0 = v78.c;
        local l_x0_123_0 = v78.x0_123;
        local l_x1_123_1 = v78.x1_123;
        local l_v_123_0 = v78.v_123;
        local l_x0_456_0 = v78.x0_456;
        local l_x1_456_1 = v78.x1_456;
        local l_v_456_0 = v78.v_456;
        local v87 = l_x0_123_0 - l_x1_123_1;
        local v88 = l_x0_456_0 - l_x1_456_1;
        local v89 = v87 * -l_k_0;
        local v90 = v88 * -l_k_0;
        local v91 = l_v_123_0 * -l_c_0;
        local v92 = l_v_456_0 * -l_c_0;
        local v93 = (v89 + v91) * v77;
        local v94 = (v90 + v92) * v77;
        local v95 = l_v_123_0 + v93;
        local v96 = l_v_456_0 + v94;
        local v97 = l_x0_123_0 + v95 * v77;
        local v98 = l_x0_456_0 + v96 * v77;
        v78.x0_123 = v97;
        v78.x0_456 = v98;
        v78.v_123 = v95;
        v78.v_456 = v96;
    end;
end;
local v100 = {};
local function v113() --[[ Line: 268 ]] --[[ Name: update_spring_sources ]]
    -- upvalues: v52 (copy), v100 (copy), v48 (copy), l_update_descendants_0 (copy)
    for v101, v102 in next, v52 do
        local l_x0_123_1 = v101.x0_123;
        local l_x1_123_2 = v101.x1_123;
        local l_v_123_1 = v101.v_123;
        local l_x0_456_1 = v101.x0_456;
        local l_x1_456_2 = v101.x1_456;
        local l_v_456_1 = v101.v_456;
        local v109 = l_x0_123_1 - l_x1_123_2;
        local v110 = l_x0_456_1 - l_x1_456_2;
        if (l_v_123_1 + l_v_456_1 + v109 + v110).Magnitude < 1.0E-4 then
            table.insert(v100, v101);
            v102.cache = v101.source_value;
        else
            v102.cache = v48[typeof(v101.source_value)](l_x0_123_1, l_x0_456_1);
        end;
        l_update_descendants_0(v102);
    end;
    for _, v112 in next, v100 do
        v52[v112] = nil;
    end;
    table.clear(v100);
end;
return function() --[[ Line: 298 ]]
    -- upvalues: v76 (copy), v99 (copy), v113 (copy)
    local v114 = 0;
    return v76, function(v115) --[[ Line: 301 ]]
        -- upvalues: v114 (ref), v99 (ref), v113 (ref)
        v114 = v114 + v115;
        while v114 > 0.008333333333333333 do
            v114 = v114 - 0.008333333333333333;
            v99(0.008333333333333333);
        end;
        v113();
    end;
end;