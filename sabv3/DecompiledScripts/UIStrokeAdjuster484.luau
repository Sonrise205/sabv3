local v0 = Vector2.new(1920, 1080);
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local _ = l_Players_0.LocalPlayer:WaitForChild("PlayerGui", 100);
local l_CurrentCamera_0 = workspace.CurrentCamera;
local function _(v6) --[[ Line: 61 ]] --[[ Name: getBox ]]
    return (math.min(v6.X, v6.Y));
end;
local function _() --[[ Line: 69 ]] --[[ Name: getScreenRatio ]]
    -- upvalues: l_CurrentCamera_0 (copy), v0 (copy)
    local l_ViewportSize_0 = l_CurrentCamera_0.ViewportSize;
    local v9 = math.min(l_ViewportSize_0.X, l_ViewportSize_0.Y);
    local l_v0_0 = v0;
    return v9 / math.min(l_v0_0.X, l_v0_0.Y);
end;
local function v18(v12, v13, v14) --[[ Line: 80 ]] --[[ Name: tagRecursive ]]
    if v12:IsA(v13) then
        v12:AddTag(v14);
    end;
    v12.DescendantAdded:Connect(function(v15) --[[ Line: 85 ]]
        -- upvalues: v13 (copy), v14 (copy)
        if v15:IsA(v13) then
            v15:AddTag(v14);
        end;
    end);
    for _, v17 in v12:GetDescendants() do
        if v17:IsA(v13) then
            v17:AddTag(v14);
        end;
    end;
end;
local function _(v19) --[[ Line: 103 ]] --[[ Name: getInstancePosition ]]
    if v19:IsA("Part") then
        return v19.Position;
    elseif v19:IsA("Model") then
        return v19:GetPivot().Position;
    else
        return (Vector3.new(0, 0, 0, 0));
    end;
end;
local function v26(v21) --[[ Line: 119 ]] --[[ Name: initTaggedUIStroke ]]
    -- upvalues: l_CurrentCamera_0 (copy), v0 (copy)
    if not v21:IsA("UIStroke") then
        v21:RemoveTag("ScreenStroke");
        v21:RemoveTag("UIStroke");
        return;
    else
        local l_v21_Attribute_0 = v21:GetAttribute("OriginalThickness");
        if not l_v21_Attribute_0 then
            l_v21_Attribute_0 = v21.Thickness;
            v21:SetAttribute("OriginalThickness", l_v21_Attribute_0);
        end;
        if v21:HasTag("ScreenStroke") then
            local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
            local v24 = math.min(l_ViewportSize_1.X, l_ViewportSize_1.Y);
            local l_v0_1 = v0;
            v21.Thickness = l_v21_Attribute_0 * (v24 / math.min(l_v0_1.X, l_v0_1.Y));
        end;
        return;
    end;
end;
for _, v28 in l_CollectionService_0:GetTagged("UIStroke") do
    v26(v28);
end;
l_CollectionService_0:GetInstanceAddedSignal("UIStroke"):Connect(v26);
for _, v30 in l_CollectionService_0:GetTagged("ScreenStroke") do
    v30:AddTag("UIStroke");
end;
l_CollectionService_0:GetInstanceAddedSignal("ScreenStroke"):Connect(function(v31) --[[ Line: 155 ]]
    v31:AddTag("UIStroke");
end);
for _, v33 in l_CollectionService_0:GetTagged("ScreenGui") do
    if not v33:IsA("ScreenGui") then
        v33:RemoveTag("ScreenGui");
    else
        v18(v33, "UIStroke", "ScreenStroke");
    end;
end;
l_CollectionService_0:GetInstanceAddedSignal("ScreenGui"):Connect(function(v34) --[[ Line: 170 ]]
    -- upvalues: v18 (copy)
    if not v34:IsA("ScreenGui") then
        return;
    else
        v18(v34, "UIStroke", "ScreenStroke");
        return;
    end;
end);
l_CurrentCamera_0:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 179 ]] --[[ Name: updateScreenGuiStrokes ]]
    -- upvalues: l_CollectionService_0 (copy), l_CurrentCamera_0 (copy), v0 (copy)
    for _, v36 in l_CollectionService_0:GetTagged("ScreenStroke") do
        local l_v36_Attribute_0 = v36:GetAttribute("OriginalThickness");
        if l_v36_Attribute_0 then
            local l_ViewportSize_2 = l_CurrentCamera_0.ViewportSize;
            local v39 = math.min(l_ViewportSize_2.X, l_ViewportSize_2.Y);
            local l_v0_2 = v0;
            v36.Thickness = l_v36_Attribute_0 * (v39 / math.min(l_v0_2.X, l_v0_2.Y));
        end;
    end;
end);
local v41 = {};
local function v42(v43, v44) --[[ Line: 202 ]] --[[ Name: recurseGetUIStrokes ]]
    -- upvalues: v41 (copy), v42 (copy)
    if v43:IsA("UIStroke") then
        v43:AddTag("UIStroke");
        table.insert(v41[v44], v43);
    end;
    for _, v46 in v43:GetChildren() do
        v42(v46, v44);
    end;
    v43.ChildAdded:Connect(function(v47) --[[ Line: 210 ]]
        -- upvalues: v42 (ref), v44 (copy)
        v42(v47, v44);
    end);
end;
local function v49(v48) --[[ Line: 216 ]] --[[ Name: initBillboard ]]
    -- upvalues: v41 (copy), v42 (copy)
    if not v48:IsA("BillboardGui") then
        v48:RemoveTag("Billboard");
        return;
    else
        v41[v48] = {};
        v48.Destroying:Once(function() --[[ Line: 226 ]]
            -- upvalues: v41 (ref), v48 (copy)
            v41[v48] = nil;
        end);
        v42(v48, v48);
        return;
    end;
end;
for _, v51 in l_CollectionService_0:GetTagged("Billboard") do
    v49(v51);
end;
l_CollectionService_0:GetInstanceAddedSignal("Billboard"):Connect(v49);
local v52 = tick();
local v53 = nil;
v53 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 246 ]]
    -- upvalues: v52 (ref), v41 (copy), l_CurrentCamera_0 (copy), v0 (copy)
    if tick() - v52 < 1 then
        return;
    else
        v52 = tick();
        debug.profilebegin("Update UIStrokes");
        for v54, v55 in v41 do
            local l_Adornee_0 = v54.Adornee;
            local v57 = nil;
            if l_Adornee_0 then
                v57 = if l_Adornee_0:IsA("Part") then l_Adornee_0.Position else if l_Adornee_0:IsA("Model") then l_Adornee_0:GetPivot().Position else Vector3.new(0, 0, 0, 0);
            elseif v54.Parent then
                local l_Parent_0 = v54.Parent;
                v57 = if l_Parent_0:IsA("Part") then l_Parent_0.Position else if l_Parent_0:IsA("Model") then l_Parent_0:GetPivot().Position else Vector3.new(0, 0, 0, 0);
            end;
            if v57 then
                local l_Magnitude_0 = (l_CurrentCamera_0.CFrame.Position - v57).Magnitude;
                if v54.MaxDistance >= l_Magnitude_0 then
                    local v60 = (v54:GetAttribute("Distance") or 10) / l_Magnitude_0;
                    for _, v62 in v55 do
                        if not v62:IsDescendantOf(v54) then
                            table.remove(v55, table.find(v55, v62));
                        end;
                        local l_v62_Attribute_0 = v62:GetAttribute("OriginalThickness");
                        if l_v62_Attribute_0 then
                            local v64 = l_v62_Attribute_0 * v60;
                            local l_ViewportSize_3 = l_CurrentCamera_0.ViewportSize;
                            local v66 = math.min(l_ViewportSize_3.X, l_ViewportSize_3.Y);
                            local l_v0_3 = v0;
                            v62.Thickness = v64 * (v66 / math.min(l_v0_3.X, l_v0_3.Y));
                        end;
                    end;
                end;
            end;
        end;
        debug.profileend();
        return;
    end;
end);
return {
    TagScreenGui = function(_, v69) --[[ Line: 326 ]] --[[ Name: TagScreenGui ]]
        -- upvalues: l_CollectionService_0 (copy)
        if v69:IsA("ScreenGui") then
            l_CollectionService_0:AddTag(v69, "ScreenGui");
        end;
    end, 
    TagBillboardGui = function(_, v71) --[[ Line: 336 ]] --[[ Name: TagBillboardGui ]]
        -- upvalues: l_CollectionService_0 (copy)
        if v71:IsA("BillboardGui") then
            l_CollectionService_0:AddTag(v71, "Billboard");
        end;
    end
};