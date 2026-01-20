local l_Players_0 = game:GetService("Players");
local l_CommonUtils_0 = script.Parent.Parent.Parent:WaitForChild("CommonUtils");
local l_FlagUtil_0 = require(l_CommonUtils_0:WaitForChild("FlagUtil"));
local l_CameraWrapper_0 = require(l_CommonUtils_0:WaitForChild("CameraWrapper"));
local l_ConnectionUtil_0 = require(l_CommonUtils_0:WaitForChild("ConnectionUtil"));
local v5 = l_FlagUtil_0.getUserFlag("UserRaycastUpdateAPI");
local v6 = l_FlagUtil_0.getUserFlag("UserCurrentCameraUpdate2");
local v7 = l_FlagUtil_0.getUserFlag("UserPlayerConnectionMemoryLeak");
local v8 = if v6 then l_CameraWrapper_0.new() else nil;
local v9 = if v6 then nil else game.Workspace.CurrentCamera;
if v6 then
    v8:Enable();
end;
local l_min_0 = math.min;
local l_tan_0 = math.tan;
local l_rad_0 = math.rad;
local l_new_0 = Ray.new;
local v14 = RaycastParams.new();
v14.IgnoreWater = true;
v14.FilterType = Enum.RaycastFilterType.Exclude;
local v15 = RaycastParams.new();
v15.IgnoreWater = true;
v15.FilterType = Enum.RaycastFilterType.Include;
local v16 = if v7 then l_ConnectionUtil_0.new() else nil;
local function _(v17) --[[ Line: 42 ]] --[[ Name: getTotalTransparency ]]
    return 1 - (1 - v17.Transparency) * (1 - v17.LocalTransparencyModifier);
end;
local function _(v19, v20) --[[ Line: 46 ]] --[[ Name: eraseFromEnd ]]
    for v21 = #v19, v20 + 1, -1 do
        v19[v21] = nil;
    end;
end;
local v23 = nil;
local v24 = nil;
local v25 = nil;
if v6 then
    local function v30() --[[ Line: 56 ]] --[[ Name: updateProjection ]]
        -- upvalues: v8 (copy), l_rad_0 (copy), v25 (ref), l_tan_0 (copy), v24 (ref)
        local v26 = v8:getCamera();
        local v27 = l_rad_0(v26.FieldOfView);
        local l_ViewportSize_0 = v26.ViewportSize;
        local v29 = l_ViewportSize_0.X / l_ViewportSize_0.Y;
        v25 = l_tan_0(v27 / 2) * 2;
        v24 = v29 * v25;
    end;
    v8:Connect("FieldOfView", v30);
    v8:Connect("ViewportSize", v30);
    local v31 = v8:getCamera();
    local v32 = l_rad_0(v31.FieldOfView);
    local l_ViewportSize_1 = v31.ViewportSize;
    local v34 = l_ViewportSize_1.X / l_ViewportSize_1.Y;
    v25 = l_tan_0(v32 / 2) * 2;
    v24 = v34 * v25;
    v23 = v8:getCamera().NearPlaneZ;
    v8:Connect("NearPlaneZ", function() --[[ Line: 72 ]]
        -- upvalues: v23 (ref), v8 (copy)
        v23 = v8:getCamera().NearPlaneZ;
    end);
else
    local function v38() --[[ Line: 78 ]] --[[ Name: updateProjection ]]
        -- upvalues: v9 (ref), l_rad_0 (copy), v25 (ref), l_tan_0 (copy), v24 (ref)
        local v35 = l_rad_0(v9.FieldOfView);
        local l_ViewportSize_2 = v9.ViewportSize;
        local v37 = l_ViewportSize_2.X / l_ViewportSize_2.Y;
        v25 = l_tan_0(v35 / 2) * 2;
        v24 = v37 * v25;
    end;
    v9:GetPropertyChangedSignal("FieldOfView"):Connect(v38);
    v9:GetPropertyChangedSignal("ViewportSize"):Connect(v38);
    local v39 = l_rad_0(v9.FieldOfView);
    local l_ViewportSize_3 = v9.ViewportSize;
    local v41 = l_ViewportSize_3.X / l_ViewportSize_3.Y;
    v25 = l_tan_0(v39 / 2) * 2;
    v24 = v41 * v25;
    v23 = v9.NearPlaneZ;
    v9:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 92 ]]
        -- upvalues: v23 (ref), v9 (ref)
        v23 = v9.NearPlaneZ;
    end);
end;
local v42 = {};
local v43 = {};
local l_v43_0 = v43 --[[ copy: 23 -> 33 ]];
local function v48() --[[ Line: 101 ]] --[[ Name: refreshIgnoreList ]]
    -- upvalues: v42 (ref), l_v43_0 (copy)
    local v45 = 1;
    v42 = {};
    for _, v47 in pairs(l_v43_0) do
        v42[v45] = v47;
        v45 = v45 + 1;
    end;
end;
local function v62(v49) --[[ Line: 110 ]] --[[ Name: playerAdded ]]
    -- upvalues: l_v43_0 (copy), v42 (ref), v7 (copy), v16 (copy)
    local function v54(v50) --[[ Line: 111 ]] --[[ Name: characterAdded ]]
        -- upvalues: l_v43_0 (ref), v49 (copy), v42 (ref)
        l_v43_0[v49] = v50;
        local v51 = 1;
        v42 = {};
        for _, v53 in pairs(l_v43_0) do
            v42[v51] = v53;
            v51 = v51 + 1;
        end;
    end;
    local function v58() --[[ Line: 115 ]] --[[ Name: characterRemoving ]]
        -- upvalues: l_v43_0 (ref), v49 (copy), v42 (ref)
        l_v43_0[v49] = nil;
        local v55 = 1;
        v42 = {};
        for _, v57 in pairs(l_v43_0) do
            v42[v55] = v57;
            v55 = v55 + 1;
        end;
    end;
    if v7 then
        v16:trackConnection(("%*CharacterAdded"):format(v49.UserId), v49.CharacterAdded:Connect(v54));
        v16:trackConnection(("%*CharacterRemoving"):format(v49.UserId), v49.CharacterRemoving:Connect(v58));
    else
        v49.CharacterAdded:Connect(v54);
        v49.CharacterRemoving:Connect(v58);
    end;
    if v49.Character then
        l_v43_0[v49] = v49.Character;
        local v59 = 1;
        v42 = {};
        for _, v61 in pairs(l_v43_0) do
            v42[v59] = v61;
            v59 = v59 + 1;
        end;
    end;
end;
local function v67(v63) --[[ Line: 133 ]] --[[ Name: playerRemoving ]]
    -- upvalues: l_v43_0 (copy), v42 (ref), v7 (copy), v16 (copy)
    l_v43_0[v63] = nil;
    local v64 = 1;
    v42 = {};
    for _, v66 in pairs(l_v43_0) do
        v42[v64] = v66;
        v64 = v64 + 1;
    end;
    if v7 then
        v16:disconnect((("%*CharacterAdded"):format(v63.UserId)));
        v16:disconnect((("%*CharacterRemoving"):format(v63.UserId)));
    end;
end;
l_Players_0.PlayerAdded:Connect(v62);
l_Players_0.PlayerRemoving:Connect(v67);
for _, v69 in ipairs(l_Players_0:GetPlayers()) do
    v62(v69);
end;
local v70 = 1;
v42 = {};
for _, v72 in pairs(v43) do
    v42[v70] = v72;
    v70 = v70 + 1;
end;
v43 = nil;
v48 = nil;
if v6 then
    v8:Connect("CameraSubject", function() --[[ Line: 173 ]]
        -- upvalues: v8 (copy), v48 (ref)
        local l_CameraSubject_0 = v8:getCamera().CameraSubject;
        if l_CameraSubject_0 and l_CameraSubject_0:IsA("Humanoid") then
            v48 = l_CameraSubject_0.RootPart;
            return;
        elseif l_CameraSubject_0 and l_CameraSubject_0:IsA("BasePart") then
            v48 = l_CameraSubject_0;
            return;
        else
            v48 = nil;
            return;
        end;
    end);
else
    v9:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 184 ]]
        -- upvalues: v9 (ref), v48 (ref)
        local l_CameraSubject_1 = v9.CameraSubject;
        if l_CameraSubject_1:IsA("Humanoid") then
            v48 = l_CameraSubject_1.RootPart;
            return;
        elseif l_CameraSubject_1:IsA("BasePart") then
            v48 = l_CameraSubject_1;
            return;
        else
            v48 = nil;
            return;
        end;
    end);
end;
v62 = function(v75) --[[ Line: 196 ]] --[[ Name: canOcclude ]]
    -- upvalues: v43 (ref)
    local v76 = v75.Name == "structure base home" and 0.65 or 0.25;
    local v77 = false;
    if 1 - (1 - v75.Transparency) * (1 - v75.LocalTransparencyModifier) < v76 then
        v77 = v75.CanCollide and v43 ~= (v75:GetRootPart() or v75) and not v75:IsA("TrussPart");
    end;
    return v77;
end;
v67 = {
    Vector2.new(0.4, 0), 
    Vector2.new(-0.4, 0), 
    Vector2.new(0, -0.4), 
    Vector2.new(0, 0.4), 
    Vector2.new(0, 0.2)
};
v70 = function(v78, v79) --[[ Line: 225 ]] --[[ Name: getCollisionPoint ]]
    -- upvalues: v5 (copy), v14 (copy), v42 (ref), l_new_0 (copy)
    if v5 then
        v14.FilterDescendantsInstances = v42;
        repeat
            local v80 = workspace:Raycast(v78, v79, v14);
            if v80 then
                if v80.Instance.CanCollide then
                    return v80.Position, true;
                else
                    v14:AddToFilter(v80.Instance);
                end;
            end;
        until not v80;
    else
        local v81 = #v42;
        while true do
            local l_workspace_PartOnRayWithIgnoreList_0, v83 = workspace:FindPartOnRayWithIgnoreList(l_new_0(v78, v79), v42, false, true);
            if l_workspace_PartOnRayWithIgnoreList_0 then
                if l_workspace_PartOnRayWithIgnoreList_0.CanCollide then
                    local l_v42_0 = v42;
                    for v85 = #l_v42_0, v81 + 1, -1 do
                        l_v42_0[v85] = nil;
                    end;
                    return v83, true;
                else
                    v42[#v42 + 1] = l_workspace_PartOnRayWithIgnoreList_0;
                end;
            end;
            if not l_workspace_PartOnRayWithIgnoreList_0 then
                l_workspace_PartOnRayWithIgnoreList_0 = v42;
                for v86 = #l_workspace_PartOnRayWithIgnoreList_0, v81 + 1, -1 do
                    l_workspace_PartOnRayWithIgnoreList_0[v86] = nil;
                end;
                break;
            end;
        end;
    end;
    return v78 + v79, false;
end;
local function v112(v87, v88, v89, v90) --[[ Line: 263 ]] --[[ Name: queryPoint ]]
    -- upvalues: v42 (ref), v23 (ref), v5 (copy), v14 (copy), v43 (ref), v15 (copy), l_new_0 (copy)
    debug.profilebegin("queryPoint");
    local v91 = #v42;
    v89 = v89 + v23;
    local v92 = v87 + v88 * v89;
    local v93 = 1e999;
    local v94 = 1e999;
    local l_v87_0 = v87;
    local v96 = 0;
    if v5 then
        v14.FilterDescendantsInstances = v42;
        while true do
            local v97 = workspace:Raycast(l_v87_0, v92 - l_v87_0, v14);
            if v97 then
                v96 = v96 + 1;
                local l_Instance_0 = v97.Instance;
                local l_Position_0 = v97.Position;
                local l_Magnitude_0 = (l_Position_0 - v87).Magnitude;
                if v96 >= 64 then
                    v94 = l_Magnitude_0;
                else
                    local v101 = l_Instance_0.Name == "structure base home" and 0.65 or 0.25;
                    local v102 = false;
                    if 1 - (1 - l_Instance_0.Transparency) * (1 - l_Instance_0.LocalTransparencyModifier) < v101 then
                        v102 = l_Instance_0.CanCollide and v43 ~= (l_Instance_0:GetRootPart() or l_Instance_0) and not l_Instance_0:IsA("TrussPart");
                    end;
                    if v102 then
                        v15.FilterDescendantsInstances = {
                            l_Instance_0
                        };
                        if workspace:Raycast(v92, l_Position_0 - v92, v15) then
                            if if v90 then workspace:Raycast(v90, v92 - v90, v15) or workspace:Raycast(v92, v90 - v92, v15) else false then
                                v94 = l_Magnitude_0;
                            elseif v89 < v93 then
                                v93 = l_Magnitude_0;
                            end;
                        else
                            v94 = l_Magnitude_0;
                        end;
                    end;
                end;
                v14:AddToFilter(l_Instance_0);
                l_v87_0 = l_Position_0 - v88 * 0.001;
                if v94 < 1e999 or not l_Instance_0 then
                    break;
                end;
            else
                break;
            end;
        end;
    else
        repeat
            local l_workspace_PartOnRayWithIgnoreList_1, v104 = workspace:FindPartOnRayWithIgnoreList(l_new_0(l_v87_0, v92 - l_v87_0), v42, false, true);
            v96 = v96 + 1;
            if l_workspace_PartOnRayWithIgnoreList_1 then
                local v105 = v96 >= 64;
                local v106 = l_workspace_PartOnRayWithIgnoreList_1.Name == "structure base home" and 0.65 or 0.25;
                local v107 = false;
                if 1 - (1 - l_workspace_PartOnRayWithIgnoreList_1.Transparency) * (1 - l_workspace_PartOnRayWithIgnoreList_1.LocalTransparencyModifier) < v106 then
                    v107 = l_workspace_PartOnRayWithIgnoreList_1.CanCollide and v43 ~= (l_workspace_PartOnRayWithIgnoreList_1:GetRootPart() or l_workspace_PartOnRayWithIgnoreList_1) and not l_workspace_PartOnRayWithIgnoreList_1:IsA("TrussPart");
                end;
                if v107 or v105 then
                    v107 = {
                        l_workspace_PartOnRayWithIgnoreList_1
                    };
                    v106 = workspace:FindPartOnRayWithWhitelist(l_new_0(v92, v104 - v92), v107, true);
                    local l_Magnitude_1 = (v104 - v87).Magnitude;
                    if v106 and not v105 then
                        local v109 = false;
                        if v90 then
                            v109 = workspace:FindPartOnRayWithWhitelist(l_new_0(v90, v92 - v90), v107, true) or workspace:FindPartOnRayWithWhitelist(l_new_0(v92, v90 - v92), v107, true);
                        end;
                        if v109 then
                            v94 = l_Magnitude_1;
                        elseif v89 < v93 then
                            v93 = l_Magnitude_1;
                        end;
                    else
                        v94 = l_Magnitude_1;
                    end;
                end;
                v42[#v42 + 1] = l_workspace_PartOnRayWithIgnoreList_1;
                l_v87_0 = v104 - v88 * 0.001;
            end;
        until v94 < 1e999 or not l_workspace_PartOnRayWithIgnoreList_1;
        local l_v42_1 = v42;
        for v111 = #l_v42_1, v91 + 1, -1 do
            l_v42_1[v111] = nil;
        end;
    end;
    debug.profileend();
    return v93 - v23, v94 - v23;
end;
local function v130(v113, v114) --[[ Line: 366 ]] --[[ Name: queryViewport ]]
    -- upvalues: v9 (ref), v6 (copy), v8 (copy), v24 (ref), v25 (ref), v23 (ref), v112 (copy)
    debug.profilebegin("queryViewport");
    local l_p_0 = v113.p;
    local l_rightVector_0 = v113.rightVector;
    local l_upVector_0 = v113.upVector;
    local v118 = -v113.lookVector;
    v9 = if v6 then v8:getCamera() else v9;
    local l_ViewportSize_4 = v9.ViewportSize;
    local v120 = 1e999;
    local v121 = 1e999;
    for v122 = 0, 1 do
        local v123 = l_rightVector_0 * ((v122 - 0.5) * v24);
        for v124 = 0, 1 do
            local v125 = l_upVector_0 * ((v124 - 0.5) * v25);
            local v126 = l_p_0 + v23 * (v123 + v125);
            local l_Origin_0 = v9:ViewportPointToRay(l_ViewportSize_4.x * v122, l_ViewportSize_4.y * v124).Origin;
            local v128, v129 = v112(v126, v118, v114, l_Origin_0);
            if v129 < v120 then
                v120 = v129;
            end;
            if v128 < v121 then
                v121 = v128;
            end;
        end;
    end;
    debug.profileend();
    return v121, v120;
end;
local function v145(v131, v132, v133) --[[ Line: 409 ]] --[[ Name: testPromotion ]]
    -- upvalues: v70 (copy), l_min_0 (copy), v112 (copy), v67 (copy)
    debug.profilebegin("testPromotion");
    local l_p_1 = v131.p;
    local l_rightVector_1 = v131.rightVector;
    local l_upVector_1 = v131.upVector;
    local v137 = -v131.lookVector;
    debug.profilebegin("extrapolate");
    local l_Magnitude_2 = (v70(l_p_1, v133.posVelocity * 1.25) - l_p_1).Magnitude;
    local l_magnitude_0 = v133.posVelocity.magnitude;
    for v140 = 0, l_min_0(1.25, v133.rotVelocity.magnitude + l_Magnitude_2 / l_magnitude_0), 0.0625 do
        local v141 = v133.extrapolate(v140);
        if v132 <= v112(v141.p, -v141.lookVector, v132) then
            return false;
        end;
    end;
    debug.profileend();
    debug.profilebegin("testOffsets");
    for _, v143 in ipairs(v67) do
        local v144 = v70(l_p_1, l_rightVector_1 * v143.x + l_upVector_1 * v143.y);
        if v112(v144, (l_p_1 + v137 * v132 - v144).Unit, v132) == 1e999 then
            return false;
        end;
    end;
    debug.profileend();
    debug.profileend();
    return true;
end;
return function(v146, v147, v148) --[[ Line: 458 ]] --[[ Name: Popper ]]
    -- upvalues: v43 (ref), v48 (ref), v130 (copy), v145 (copy)
    debug.profilebegin("popper");
    v43 = v48 and v48:GetRootPart() or v48;
    local l_v147_0 = v147;
    local v150, v151 = v130(v146, v147);
    if v151 < l_v147_0 then
        l_v147_0 = v151;
    end;
    if v150 < l_v147_0 and v145(v146, v147, v148) then
        l_v147_0 = v150;
    end;
    v43 = nil;
    debug.profileend();
    return l_v147_0;
end;