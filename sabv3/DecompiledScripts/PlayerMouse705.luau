local l_CollectionService_0 = game:GetService("CollectionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
if not l_RunService_0:IsClient() then
    return table.freeze({
        Hit = CFrame.identity, 
        Target = nil
    });
else
    local function _() --[[ Line: 19 ]] --[[ Name: getFilter ]]
        -- upvalues: l_CollectionService_0 (copy), l_Players_0 (copy)
        local v4 = table.clone(l_CollectionService_0:GetTagged("ExcludeFromRaycast") or {});
        local l_Character_0 = l_Players_0.LocalPlayer.Character;
        if l_Character_0 then
            table.insert(v4, l_Character_0);
        end;
        return v4;
    end;
    local v7 = RaycastParams.new();
    local v8 = table.clone(l_CollectionService_0:GetTagged("ExcludeFromRaycast") or {});
    local l_Character_1 = l_Players_0.LocalPlayer.Character;
    if l_Character_1 then
        table.insert(v8, l_Character_1);
    end;
    v7.FilterDescendantsInstances = v8;
    v7.FilterType = Enum.RaycastFilterType.Exclude;
    l_Players_0.LocalPlayer.CharacterAdded:Connect(function(_) --[[ Line: 32 ]]
        -- upvalues: v7 (copy), l_CollectionService_0 (copy), l_Players_0 (copy)
        local l_v7_0 = v7;
        local v12 = table.clone(l_CollectionService_0:GetTagged("ExcludeFromRaycast") or {});
        local l_Character_2 = l_Players_0.LocalPlayer.Character;
        if l_Character_2 then
            table.insert(v12, l_Character_2);
        end;
        l_v7_0.FilterDescendantsInstances = v12;
    end);
    local v14 = {
        Hit = CFrame.identity, 
        Target = nil
    };
    v8 = function() --[[ Line: 41 ]] --[[ Name: performRaycast ]]
        -- upvalues: l_UserInputService_0 (copy), v7 (copy), v14 (copy)
        debug.profilebegin("PlayerMouse:performRaycast");
        local l_l_UserInputService_0_MouseLocation_0 = l_UserInputService_0:GetMouseLocation();
        local v16 = workspace.CurrentCamera:ViewportPointToRay(l_l_UserInputService_0_MouseLocation_0.X, l_l_UserInputService_0_MouseLocation_0.Y);
        local l_Origin_0 = v16.Origin;
        local l_Direction_0 = v16.Direction;
        local v19 = l_Direction_0 * 1000;
        local v20 = workspace:Raycast(l_Origin_0, v19, v7);
        local v21 = if v20 then v20.Position else l_Origin_0 + v19;
        v14.Hit = CFrame.lookAt(v21, v21 + l_Direction_0);
        v14.Target = if v20 then v20.Instance else nil;
        debug.profileend();
    end;
    l_RunService_0.PreRender:Connect(v8);
    task.spawn(v8);
    l_CollectionService_0:GetInstanceAddedSignal("ExcludeFromRaycast"):Connect(function() --[[ Line: 61 ]]
        -- upvalues: v7 (copy), l_CollectionService_0 (copy), l_Players_0 (copy)
        local l_v7_1 = v7;
        local v23 = table.clone(l_CollectionService_0:GetTagged("ExcludeFromRaycast") or {});
        local l_Character_3 = l_Players_0.LocalPlayer.Character;
        if l_Character_3 then
            table.insert(v23, l_Character_3);
        end;
        l_v7_1.FilterDescendantsInstances = v23;
    end);
    l_CollectionService_0:GetInstanceRemovedSignal("ExcludeFromRaycast"):Connect(function() --[[ Line: 65 ]]
        -- upvalues: v7 (copy), l_CollectionService_0 (copy), l_Players_0 (copy)
        local l_v7_2 = v7;
        local v26 = table.clone(l_CollectionService_0:GetTagged("ExcludeFromRaycast") or {});
        local l_Character_4 = l_Players_0.LocalPlayer.Character;
        if l_Character_4 then
            table.insert(v26, l_Character_4);
        end;
        l_v7_2.FilterDescendantsInstances = v26;
    end);
    return v14;
end;