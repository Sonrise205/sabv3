local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Trove);
local v4 = 0;
local v5 = {};
local v6 = {};
local v7 = CFrame.new(-410.752, -9.782, 59.406):Inverse();
local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("3RoadsEvent");
l_ReplicatedStorage_0:GetAttributeChangedSignal("3RoadsEvent"):Connect(function() --[[ Line: 19 ]]
    -- upvalues: l_l_ReplicatedStorage_0_Attribute_0 (ref), l_ReplicatedStorage_0 (copy)
    l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("3RoadsEvent");
end);
@native
local function v11(v9, v10) --[[ Line: 23 ]] --[[ Name: pushPartCFrame ]]
    -- upvalues: v4 (ref), v5 (copy), v6 (copy)
    v4 = v4 + 1;
    v5[v4] = v9;
    v6[v4] = v10;
end;
@native
local function v13(v12) --[[ Line: 29 ]] --[[ Name: isPointInCarpet ]]
    -- upvalues: l_l_ReplicatedStorage_0_Attribute_0 (ref), v2 (copy), v7 (copy)
    if l_l_ReplicatedStorage_0_Attribute_0 then
        return v2.isPointInVolume_direct(v12, v7, (Vector3.new(68, 661.5, 401, 0)));
    else
        return v2.isPointInVolume_direct(v12, v7, (Vector3.new(20, 661.5, 401, 0)));
    end;
end;
@native
local function v15(v14) --[[ Line: 37 ]] --[[ Name: isPointInCarpetHalf ]]
    -- upvalues: l_l_ReplicatedStorage_0_Attribute_0 (ref), v2 (copy), v7 (copy)
    if l_l_ReplicatedStorage_0_Attribute_0 then
        return v2.isPointInVolume_direct(v14, v7, (Vector3.new(34, 661.5, 200.5, 0)));
    else
        return v2.isPointInVolume_direct(v14, v7, (Vector3.new(10, 661.5, 200.5, 0)));
    end;
end;
@native
local function v16() --[[ Line: 45 ]] --[[ Name: stepParts ]]
    -- upvalues: v5 (copy), v6 (copy), v4 (ref)
    debug.profilebegin("SharedEventUtils:StepParts");
    workspace:BulkMoveTo(v5, v6, Enum.BulkMoveMode.FireCFrameChanged);
    v4 = 0;
    table.clear(v5);
    table.clear(v6);
    debug.profileend();
end;
local function v22(v17, v18, v19) --[[ Line: 54 ]] --[[ Name: loadAnimation ]]
    local v20 = v18:LoadAnimation(v19);
    local function v21() --[[ Line: 57 ]] --[[ Name: cleanup ]]
        -- upvalues: v20 (copy)
        v20:Stop(0);
        v20:Destroy();
    end;
    v17:Add(v21);
    return v20, function() --[[ Line: 63 ]]
        -- upvalues: v17 (copy), v21 (copy)
        v17:Remove(v21);
    end;
end;
if l_RunService_0:IsServer() then
    l_RunService_0.PostSimulation:Connect(v16);
else
    l_RunService_0.PreRender:Connect(v16);
end;
return {
    pushPartCFrame = v11, 
    isPointInCarpet = v13, 
    isPointInCarpetHalf = v15, 
    loadAnimation = v22
};