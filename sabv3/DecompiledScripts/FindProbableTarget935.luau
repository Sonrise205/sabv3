--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Shared.SafeCast);
local l_max_0 = math.max;
local l_abs_0 = math.abs;
local l_clamp_0 = math.clamp;
local l_sqrt_0 = math.sqrt;
local function _(v6, v7) --[[ Line: 30 ]] --[[ Name: Dist2ToAABBLocal ]]
    -- upvalues: l_abs_0 (copy), l_max_0 (copy)
    local v8 = l_max_0(0, l_abs_0(v6.X) - v7.X);
    local v9 = l_max_0(0, l_abs_0(v6.Y) - v7.Y);
    local v10 = l_max_0(0, l_abs_0(v6.Z) - v7.Z);
    return v8 * v8 + v9 * v9 + v10 * v10;
end;
local function _(v12, v13) --[[ Line: 38 ]] --[[ Name: ClampToAABBLocal ]]
    -- upvalues: l_clamp_0 (copy)
    return (Vector3.new(l_clamp_0(v12.X, -v13.X, v13.X), l_clamp_0(v12.Y, -v13.Y, v13.Y), (l_clamp_0(v12.Z, -v13.Z, v13.Z))));
end;
local function v33(v15, v16, v17) --[[ Line: 46 ]] --[[ Name: SegmentIntersectsAABBLocal ]]
    -- upvalues: l_abs_0 (copy)
    local v18 = v16 - v15;
    local v19 = 0;
    local v20 = 1;
    if l_abs_0(v18.X) < 1.0E-6 then
        if v15.X < -v17.X or v15.X > v17.X then
            return false, 0;
        end;
    else
        local v21 = 1 / v18.X;
        local v22 = (-v17.X - v15.X) * v21;
        local v23 = (v17.X - v15.X) * v21;
        if v23 < v22 then
            local l_v23_0 = v23;
            v23 = v22;
            v22 = l_v23_0;
        end;
        if v19 < v22 then
            v19 = v22;
        end;
        if v23 < v20 then
            v20 = v23;
        end;
        if v20 < v19 then
            return false, 0;
        end;
    end;
    if l_abs_0(v18.Y) < 1.0E-6 then
        if v15.Y < -v17.Y or v15.Y > v17.Y then
            return false, 0;
        end;
    else
        local v25 = 1 / v18.Y;
        local v26 = (-v17.Y - v15.Y) * v25;
        local v27 = (v17.Y - v15.Y) * v25;
        if v27 < v26 then
            local l_v27_0 = v27;
            v27 = v26;
            v26 = l_v27_0;
        end;
        if v19 < v26 then
            v19 = v26;
        end;
        if v27 < v20 then
            v20 = v27;
        end;
        if v20 < v19 then
            return false, 0;
        end;
    end;
    if l_abs_0(v18.Z) < 1.0E-6 then
        if v15.Z < -v17.Z or v15.Z > v17.Z then
            return false, 0;
        end;
    else
        local v29 = 1 / v18.Z;
        local v30 = (-v17.Z - v15.Z) * v29;
        local v31 = (v17.Z - v15.Z) * v29;
        if v31 < v30 then
            local l_v31_0 = v31;
            v31 = v30;
            v30 = l_v31_0;
        end;
        if v19 < v30 then
            v19 = v30;
        end;
        if v31 < v20 then
            v20 = v31;
        end;
        if v20 < v19 then
            return false, 0;
        end;
    end;
    if v20 < 0 or v19 > 1 then
        return false, 0;
    elseif v19 < 0 then
        return true, 0;
    else
        return true, v19;
    end;
end;
local function v74(v34, v35, v36, v37) --[[ Line: 105 ]] --[[ Name: NearestPointOnSegmentToOBB ]]
    -- upvalues: l_clamp_0 (copy), v33 (copy), l_abs_0 (copy), l_max_0 (copy), l_sqrt_0 (copy)
    local v38 = v35 - v34;
    local l_Magnitude_0 = v38.Magnitude;
    if l_Magnitude_0 < 1.0E-6 then
        local v40 = v36:PointToObjectSpace(v34);
        return 0, v34, (v40 - Vector3.new(l_clamp_0(v40.X, -v37.X, v37.X), l_clamp_0(v40.Y, -v37.Y, v37.Y), (l_clamp_0(v40.Z, -v37.Z, v37.Z)))).Magnitude;
    else
        local v41 = v38 / l_Magnitude_0;
        local v42 = v36:PointToObjectSpace(v34);
        local v43 = v36:PointToObjectSpace(v35);
        local v44, v45 = v33(v42, v43, v37);
        if v44 then
            local v46 = v45 * l_Magnitude_0;
            return v46, v34 + v41 * v46, 0;
        else
            v44 = function(v47) --[[ Line: 137 ]] --[[ Name: f ]]
                -- upvalues: v34 (copy), v41 (copy), v36 (copy), v37 (copy), l_abs_0 (ref), l_max_0 (ref)
                local v48 = v34 + v41 * v47;
                local v49 = v36:PointToObjectSpace(v48);
                local l_v37_0 = v37;
                local v51 = l_max_0(0, l_abs_0(v49.X) - l_v37_0.X);
                local v52 = l_max_0(0, l_abs_0(v49.Y) - l_v37_0.Y);
                local v53 = l_max_0(0, l_abs_0(v49.Z) - l_v37_0.Z);
                return v51 * v51 + v52 * v52 + v53 * v53;
            end;
            v45 = 0;
            local l_l_Magnitude_0_0 = l_Magnitude_0;
            local v55 = l_l_Magnitude_0_0 - (l_l_Magnitude_0_0 - v45) * 0.6180339887498949;
            local v56 = v45 + (l_l_Magnitude_0_0 - v45) * 0.6180339887498949;
            local v57 = v36:PointToObjectSpace(v34 + v41 * v55);
            local v58 = l_max_0(0, l_abs_0(v57.X) - v37.X);
            local v59 = l_max_0(0, l_abs_0(v57.Y) - v37.Y);
            local v60 = l_max_0(0, l_abs_0(v57.Z) - v37.Z);
            local v61 = v58 * v58 + v59 * v59 + v60 * v60;
            v58 = v36:PointToObjectSpace(v34 + v41 * v56);
            v59 = l_max_0(0, l_abs_0(v58.X) - v37.X);
            v60 = l_max_0(0, l_abs_0(v58.Y) - v37.Y);
            local v62 = l_max_0(0, l_abs_0(v58.Z) - v37.Z);
            local v63 = v59 * v59 + v60 * v60 + v62 * v62;
            for _ = 1, 22 do
                if v61 < v63 then
                    l_l_Magnitude_0_0 = v56;
                    v56 = v55;
                    v63 = v61;
                    v55 = l_l_Magnitude_0_0 - (l_l_Magnitude_0_0 - v45) * 0.6180339887498949;
                    v62 = v36:PointToObjectSpace(v34 + v41 * v55);
                    local v65 = l_max_0(0, l_abs_0(v62.X) - v37.X);
                    local v66 = l_max_0(0, l_abs_0(v62.Y) - v37.Y);
                    local v67 = l_max_0(0, l_abs_0(v62.Z) - v37.Z);
                    v61 = v65 * v65 + v66 * v66 + v67 * v67;
                else
                    v45 = v55;
                    v55 = v56;
                    v61 = v63;
                    v56 = v45 + (l_l_Magnitude_0_0 - v45) * 0.6180339887498949;
                    v62 = v36:PointToObjectSpace(v34 + v41 * v56);
                    local v68 = l_max_0(0, l_abs_0(v62.X) - v37.X);
                    local v69 = l_max_0(0, l_abs_0(v62.Y) - v37.Y);
                    local v70 = l_max_0(0, l_abs_0(v62.Z) - v37.Z);
                    v63 = v68 * v68 + v69 * v69 + v70 * v70;
                end;
            end;
            local v71 = 0.5 * (v45 + l_l_Magnitude_0_0);
            v57 = v34 + v41 * v71;
            v60 = v36:PointToObjectSpace(v34 + v41 * v71);
            v62 = l_max_0(0, l_abs_0(v60.X) - v37.X);
            local v72 = l_max_0(0, l_abs_0(v60.Y) - v37.Y);
            local v73 = l_max_0(0, l_abs_0(v60.Z) - v37.Z);
            return v71, v57, (l_sqrt_0(v62 * v62 + v72 * v72 + v73 * v73));
        end;
    end;
end;
local function _(v75) --[[ Line: 171 ]] --[[ Name: GetHitbox ]]
    local l___HITBOX_0 = v75:FindFirstChild("__HITBOX");
    if l___HITBOX_0 and l___HITBOX_0:IsA("BasePart") then
        return l___HITBOX_0.CFrame, l___HITBOX_0.Size;
    else
        return v75:GetBoundingBox();
    end;
end;
local function _(v78) --[[ Line: 179 ]] --[[ Name: GetCharacter ]]
    local l_v78_FirstAncestorOfClass_0 = v78:FindFirstAncestorOfClass("Model");
    if not l_v78_FirstAncestorOfClass_0 then
        return nil, nil;
    else
        local l_PrimaryPart_0 = l_v78_FirstAncestorOfClass_0.PrimaryPart;
        if not l_PrimaryPart_0 then
            return nil, nil;
        elseif not l_v78_FirstAncestorOfClass_0:FindFirstChildOfClass("Humanoid") then
            return nil, nil;
        else
            return l_v78_FirstAncestorOfClass_0, l_PrimaryPart_0;
        end;
    end;
end;
return function(v82, v83, v84, v85, v86) --[[ Line: 193 ]] --[[ Name: FindProbableTarget ]]
    -- upvalues: v1 (copy), v74 (copy)
    assert(typeof(v82) == "Vector3", "p0 must be Vector3");
    assert(typeof(v83) == "Vector3", "p1 must be Vector3");
    local v87 = false;
    if type(v84) == "number" then
        v87 = v84 >= 0;
    end;
    assert(v87, "radius > 0");
    assert(typeof(v85) == "RaycastParams");
    assert(typeof(v86) == "OverlapParams");
    local v88 = {};
    v87 = v1(v82, v83, v84, v85);
    if v87 then
        local l_FirstAncestorOfClass_0 = v87.Instance:FindFirstAncestorOfClass("Model");
        local v90, v91;
        if not l_FirstAncestorOfClass_0 then
            v90 = nil;
            v91 = nil;
        else
            local l_PrimaryPart_1 = l_FirstAncestorOfClass_0.PrimaryPart;
            if not l_PrimaryPart_1 then
                v90 = nil;
                v91 = nil;
            elseif not l_FirstAncestorOfClass_0:FindFirstChildOfClass("Humanoid") then
                v90 = nil;
                v91 = nil;
            else
                v90 = l_FirstAncestorOfClass_0;
                v91 = l_PrimaryPart_1;
            end;
        end;
        if v90 and v91 then
            local l___HITBOX_1 = v90:FindFirstChild("__HITBOX");
            local v94;
            if l___HITBOX_1 and l___HITBOX_1:IsA("BasePart") then
                v94 = l___HITBOX_1.CFrame;
                l_FirstAncestorOfClass_0 = l___HITBOX_1.Size;
            else
                local l_v90_BoundingBox_0, v96 = v90:GetBoundingBox();
                v94 = l_v90_BoundingBox_0;
                l_FirstAncestorOfClass_0 = v96;
            end;
            return v94.Position;
        else
            v83 = v87.Ending;
        end;
    end;
    local v97 = v83 - v82;
    local l_Magnitude_1 = v97.Magnitude;
    if l_Magnitude_1 < 1.0E-6 then
        return nil;
    elseif v84 <= 0 then
        return nil;
    else
        local v99 = v97 / l_Magnitude_1;
        local v100 = 0.5 * l_Magnitude_1;
        local v101 = CFrame.lookAt(v82 + v99 * v100, v83);
        local v102 = Vector3.new(v84 * 2, v84 * 2, l_Magnitude_1);
        local l_workspace_PartBoundsInBox_0 = workspace:GetPartBoundsInBox(v101, v102, v86);
        local _ = v84 * v84;
        local v105 = nil;
        local v106 = 1e999;
        for _, v108 in ipairs(l_workspace_PartBoundsInBox_0) do
            local l_v108_FirstAncestorOfClass_0 = v108:FindFirstAncestorOfClass("Model");
            local v110, v111;
            if not l_v108_FirstAncestorOfClass_0 then
                v110 = nil;
                v111 = nil;
            else
                local l_PrimaryPart_2 = l_v108_FirstAncestorOfClass_0.PrimaryPart;
                if not l_PrimaryPart_2 then
                    v110 = nil;
                    v111 = nil;
                elseif not l_v108_FirstAncestorOfClass_0:FindFirstChildOfClass("Humanoid") then
                    v110 = nil;
                    v111 = nil;
                else
                    v110 = l_v108_FirstAncestorOfClass_0;
                    v111 = l_PrimaryPart_2;
                end;
            end;
            if v110 and v111 and not v88[v110] then
                v88[v110] = true;
                local l___HITBOX_2 = v110:FindFirstChild("__HITBOX");
                local v114;
                if l___HITBOX_2 and l___HITBOX_2:IsA("BasePart") then
                    l_v108_FirstAncestorOfClass_0 = l___HITBOX_2.CFrame;
                    v114 = l___HITBOX_2.Size;
                else
                    local l_v110_BoundingBox_0, v116 = v110:GetBoundingBox();
                    l_v108_FirstAncestorOfClass_0 = l_v110_BoundingBox_0;
                    v114 = v116;
                end;
                local v117, v118;
                l___HITBOX_2, v117, v118 = v74(v82, v83, l_v108_FirstAncestorOfClass_0, v114 * 0.5);
                if v84 > v118 and v118 < v106 then
                    v105 = l_v108_FirstAncestorOfClass_0.Position;
                    v106 = v118;
                end;
            end;
        end;
        return v105;
    end;
end;