local l_CollectionService_0 = game:GetService("CollectionService");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Settings);
local v3 = require(script.VectorMap);
local v4 = {
    WindDirection = Vector3.new(0.5, 0, 0.5, 0), 
    WindPower = 0.5, 
    WindSpeed = 20
};
local l_BindableEvent_0 = Instance.new("BindableEvent");
local l_BindableEvent_1 = Instance.new("BindableEvent");
local l_BindableEvent_2 = Instance.new("BindableEvent");
local l_BindableEvent_3 = Instance.new("BindableEvent");
local l_BindableEvent_4 = Instance.new("BindableEvent");
local v10 = {
    RenderDistance = 150, 
    MaxRefreshRate = 0.016666666666666666, 
    SharedSettings = v2.new(script), 
    ObjectMetadata = {}, 
    VectorMap = v3.new(), 
    Handled = 0, 
    Active = 0, 
    _partList = table.create(500), 
    _cframeList = table.create(500), 
    ObjectShakeAdded = l_BindableEvent_2.Event, 
    ObjectShakeRemoved = l_BindableEvent_3.Event, 
    ObjectShakeUpdated = l_BindableEvent_4.Event, 
    Paused = l_BindableEvent_0.Event, 
    Resumed = l_BindableEvent_1.Event, 
    Initialized = nil, 
    AddedConnection = nil, 
    UpdateConnection = nil, 
    RemovedConnection = nil, 
    WorkspaceWindConnection = nil
};
local function _(v11, v12, v13) --[[ Line: 83 ]] --[[ Name: Connect ]]
    return v12:Connect(function(...) --[[ Line: 84 ]]
        -- upvalues: v13 (copy), v11 (copy)
        return v13(v11, ...);
    end);
end;
v10.AddObjectShake = function(v15, v16, v17) --[[ Line: 89 ]] --[[ Name: AddObjectShake ]]
    -- upvalues: v2 (copy), l_BindableEvent_2 (copy)
    if typeof(v16) ~= "Instance" then
        return;
    elseif not v16:IsA("BasePart") and not v16:IsA("Bone") then
        return;
    else
        local l_ObjectMetadata_0 = v15.ObjectMetadata;
        if l_ObjectMetadata_0[v16] then
            return;
        else
            l_ObjectMetadata_0[v16] = {
                ChunkKey = v15.VectorMap:AddObject(if v16:IsA("Bone") then v16.WorldPosition else v16.Position, v16), 
                Settings = v2.new(v16), 
                Seed = math.random(5000) * 0.32, 
                Origin = if v16:IsA("Bone") then v16.WorldCFrame else v16.CFrame, 
                LastUpdate = os.clock()
            };
            if v17 then
                v15:UpdateObjectSettings(v16, v17);
            end;
            l_BindableEvent_2:Fire(v16);
            v15.Handled = v15.Handled + 1;
            return;
        end;
    end;
end;
v10.RemoveObjectShake = function(v19, v20) --[[ Line: 130 ]] --[[ Name: RemoveObjectShake ]]
    -- upvalues: l_BindableEvent_3 (copy)
    if typeof(v20) ~= "Instance" then
        return;
    elseif not v20:IsA("BasePart") and not v20:IsA("Bone") then
        return;
    else
        local l_ObjectMetadata_1 = v19.ObjectMetadata;
        local v22 = l_ObjectMetadata_1[v20];
        if v22 then
            v19.Handled = v19.Handled - 1;
            l_ObjectMetadata_1[v20] = nil;
            v22.Settings:Destroy();
            v19.VectorMap:RemoveObject(v22.ChunkKey, v20);
            if v20:IsA("BasePart") then
                v20.CFrame = v22.Origin;
            elseif v20:IsA("Bone") then
                v20.WorldCFrame = v22.Origin;
            end;
        end;
        l_BindableEvent_3:Fire(v20);
        return;
    end;
end;
v10.Update = function(v23, v24) --[[ Line: 159 ]] --[[ Name: Update ]]
    debug.profilebegin("WindShake");
    local v25 = 0;
    debug.profilebegin("Update");
    local v26 = os.clock();
    local v27 = v24 * 3;
    local v28 = math.min(1, v24 * 5);
    local v29 = 0;
    local l__partList_0 = v23._partList;
    local l__cframeList_0 = v23._cframeList;
    table.clear(l__partList_0);
    table.clear(l__cframeList_0);
    local l_ObjectMetadata_2 = v23.ObjectMetadata;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local l_Position_0 = l_CurrentCamera_0.CFrame.Position;
    local l_RenderDistance_0 = v23.RenderDistance;
    local l_MaxRefreshRate_0 = v23.MaxRefreshRate;
    local l_SharedSettings_0 = v23.SharedSettings;
    local v38 = assert(l_SharedSettings_0.WindPower);
    local v39 = assert(l_SharedSettings_0.WindSpeed);
    local v40 = assert(l_SharedSettings_0.WindDirection);
    v23.VectorMap:ForEachObjectInView(l_CurrentCamera_0, l_RenderDistance_0, function(v41, v42) --[[ Line: 191 ]]
        -- upvalues: l_ObjectMetadata_2 (copy), l_Position_0 (copy), l_RenderDistance_0 (copy), v27 (copy), l_MaxRefreshRate_0 (copy), v26 (copy), v25 (ref), v40 (copy), v38 (copy), v39 (copy), v28 (copy), v29 (ref), l__partList_0 (copy), l__cframeList_0 (copy)
        local v43 = l_ObjectMetadata_2[v42];
        local v44 = v43.LastUpdate or 0;
        local v45 = v41 == "Bone";
        local v46 = if v45 then v42.WorldCFrame else v42.CFrame;
        local v47 = (l_Position_0 - v46.Position).Magnitude / l_RenderDistance_0;
        local v48 = v47 * v47;
        local v49 = 1 / math.random(60, 120);
        if v27 * v48 + l_MaxRefreshRate_0 >= v26 - v44 + v49 then
            return;
        else
            v43.LastUpdate = v26;
            v25 = v25 + 1;
            local l_Settings_0 = v43.Settings;
            local v51 = l_Settings_0.WindDirection or v40;
            if v51.Magnitude < 1.0E-5 then
                return;
            else
                local v52 = (l_Settings_0.WindPower or v38) * 0.2;
                if v52 < 1.0E-5 then
                    return;
                else
                    local v53 = v26 * ((l_Settings_0.WindSpeed or v39) * 0.08);
                    if v53 < 1.0E-5 then
                        return;
                    else
                        local l_Seed_0 = v43.Seed;
                        local v55 = (math.noise(v53, 0, l_Seed_0) + 0.4) * v52;
                        local v56 = math.clamp(v28 + v48, 0.1, 0.5);
                        local v57 = v52 / 3;
                        local v58 = v43.Origin * (l_Settings_0.PivotOffset or CFrame.identity);
                        local v59 = v58:VectorToObjectSpace(v51);
                        if v45 then
                            v42.Transform = v42.Transform:Lerp(CFrame.fromAxisAngle(v59:Cross((Vector3.new(0, 1, 0, 0))), -v55) * CFrame.Angles(math.noise(l_Seed_0, 0, v53) * v57, math.noise(l_Seed_0, v53, 0) * v57, math.noise(v53, l_Seed_0, 0) * v57) + v59 * v55 * v52, v56);
                            return;
                        else
                            v29 = v29 + 1;
                            l__partList_0[v29] = v42;
                            l__cframeList_0[v29] = v46:Lerp(v58 * CFrame.fromAxisAngle(v59:Cross((Vector3.new(0, 1, 0, 0))), -v55) * CFrame.Angles(math.noise(l_Seed_0, 0, v53) * v57, math.noise(l_Seed_0, v53, 0) * v57, math.noise(v53, l_Seed_0, 0) * v57) * (l_Settings_0.PivotOffsetInverse or CFrame.identity) + v51 * v55 * (v52 * 2), v56);
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end);
    v23.Active = v25;
    debug.profileend();
    workspace:BulkMoveTo(l__partList_0, l__cframeList_0, Enum.BulkMoveMode.FireCFrameChanged);
    debug.profileend();
end;
v10.Pause = function(v60) --[[ Line: 279 ]] --[[ Name: Pause ]]
    -- upvalues: l_BindableEvent_0 (copy)
    if v60.UpdateConnection then
        v60.UpdateConnection:Disconnect();
        v60.UpdateConnection = nil;
    end;
    v60.Active = 0;
    v60.Running = false;
    l_BindableEvent_0:Fire();
end;
v10.Resume = function(v61) --[[ Line: 291 ]] --[[ Name: Resume ]]
    -- upvalues: l_RunService_0 (copy), l_BindableEvent_1 (copy)
    if v61.Running then
        return;
    else
        local l_Heartbeat_0 = l_RunService_0.Heartbeat;
        local l_Update_0 = v61.Update;
        v61.UpdateConnection = l_Heartbeat_0:Connect(function(...) --[[ Line: 84 ]]
            -- upvalues: l_Update_0 (copy), v61 (copy)
            return l_Update_0(v61, ...);
        end);
        v61.Running = true;
        l_BindableEvent_1:Fire();
        return;
    end;
end;
v10.Init = function(v64, v65) --[[ Line: 303 ]] --[[ Name: Init ]]
    -- upvalues: v4 (copy), l_CollectionService_0 (copy)
    if v64.Initialized then
        return;
    else
        local l_script_Attribute_0 = script:GetAttribute("WindPower");
        local l_script_Attribute_1 = script:GetAttribute("WindSpeed");
        local l_script_Attribute_2 = script:GetAttribute("WindDirection");
        if typeof(l_script_Attribute_0) ~= "number" then
            script:SetAttribute("WindPower", v4.WindPower);
        end;
        if typeof(l_script_Attribute_1) ~= "number" then
            script:SetAttribute("WindSpeed", v4.WindSpeed);
        end;
        if typeof(l_script_Attribute_2) ~= "Vector3" then
            script:SetAttribute("WindDirection", v4.WindDirection);
        end;
        v64:Cleanup();
        v64.Initialized = true;
        local l_l_CollectionService_0_InstanceAddedSignal_0 = l_CollectionService_0:GetInstanceAddedSignal("WindShake");
        local l_AddObjectShake_0 = v64.AddObjectShake;
        v64.AddedConnection = l_l_CollectionService_0_InstanceAddedSignal_0:Connect(function(...) --[[ Line: 84 ]]
            -- upvalues: l_AddObjectShake_0 (copy), v64 (copy)
            return l_AddObjectShake_0(v64, ...);
        end);
        local l_l_CollectionService_0_InstanceRemovedSignal_0 = l_CollectionService_0:GetInstanceRemovedSignal("WindShake");
        local l_RemoveObjectShake_0 = v64.RemoveObjectShake;
        v64.RemovedConnection = l_l_CollectionService_0_InstanceRemovedSignal_0:Connect(function(...) --[[ Line: 84 ]]
            -- upvalues: l_RemoveObjectShake_0 (copy), v64 (copy)
            return l_RemoveObjectShake_0(v64, ...);
        end);
        for _, v74 in l_CollectionService_0:GetTagged("WindShake") do
            if v74:IsA("BasePart") or v74:IsA("Bone") then
                v64:AddObjectShake(v74);
            end;
        end;
        if v65 and v65.MatchWorkspaceWind then
            v64:MatchWorkspaceWind();
            v64.WorkspaceWindConnection = workspace:GetPropertyChangedSignal("GlobalWind"):Connect(function() --[[ Line: 346 ]]
                -- upvalues: v64 (copy)
                v64:MatchWorkspaceWind();
            end);
        end;
        v64:Resume();
        return;
    end;
end;
v10.Cleanup = function(v75) --[[ Line: 355 ]] --[[ Name: Cleanup ]]
    if not v75.Initialized then
        return;
    else
        v75:Pause();
        if v75.AddedConnection then
            v75.AddedConnection:Disconnect();
            v75.AddedConnection = nil;
        end;
        if v75.RemovedConnection then
            v75.RemovedConnection:Disconnect();
            v75.RemovedConnection = nil;
        end;
        if v75.WorkspaceWindConnection then
            v75.WorkspaceWindConnection:Disconnect();
            v75.WorkspaceWindConnection = nil;
        end;
        table.clear(v75.ObjectMetadata);
        v75.VectorMap:ClearAll();
        v75.Handled = 0;
        v75.Active = 0;
        v75.Initialized = false;
        return;
    end;
end;
v10.UpdateObjectSettings = function(v76, v77, v78) --[[ Line: 385 ]] --[[ Name: UpdateObjectSettings ]]
    -- upvalues: l_BindableEvent_4 (copy)
    if typeof(v77) ~= "Instance" then
        return;
    elseif typeof(v78) ~= "table" then
        return;
    elseif not v76.ObjectMetadata[v77] and v77 ~= script then
        return;
    else
        for v79, v80 in pairs(v78) do
            v77:SetAttribute(v79, v80);
        end;
        l_BindableEvent_4:Fire(v77);
        return;
    end;
end;
v10.UpdateAllObjectSettings = function(v81, v82) --[[ Line: 406 ]] --[[ Name: UpdateAllObjectSettings ]]
    -- upvalues: l_BindableEvent_4 (copy)
    if typeof(v82) ~= "table" then
        return;
    else
        for v83, _ in v81.ObjectMetadata do
            for v85, v86 in pairs(v82) do
                v83:SetAttribute(v85, v86);
            end;
            l_BindableEvent_4:Fire(v83);
        end;
        return;
    end;
end;
v10.SetDefaultSettings = function(v87, v88) --[[ Line: 420 ]] --[[ Name: SetDefaultSettings ]]
    v87:UpdateObjectSettings(script, v88);
end;
v10.MatchWorkspaceWind = function(v89) --[[ Line: 424 ]] --[[ Name: MatchWorkspaceWind ]]
    local l_GlobalWind_0 = workspace.GlobalWind;
    local l_Unit_0 = l_GlobalWind_0.Unit;
    local v92 = 0;
    local v93 = 0;
    local l_Magnitude_0 = l_GlobalWind_0.Magnitude;
    if l_Magnitude_0 > 0 then
        v93 = if l_Magnitude_0 > 1 then math.log10(l_Magnitude_0) + 0.2 else 0.3;
        v92 = if l_Magnitude_0 < 100 then l_Magnitude_0 * 1.2 + 5 else 125;
    end;
    v89:SetDefaultSettings({
        WindDirection = l_Unit_0, 
        WindSpeed = v92, 
        WindPower = v93
    });
end;
return v10;