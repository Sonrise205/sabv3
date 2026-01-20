local v0 = {};
local function _(v1) --[[ Line: 13 ]] --[[ Name: Normalize ]]
    return v1.Magnitude > 0 and v1.Unit or Vector3.new(0, 0, 0, 0);
end;
v0.new = function(v3) --[[ Line: 17 ]] --[[ Name: new ]]
    local v4 = {};
    local l_v3_Attribute_0 = v3:GetAttribute("WindPower");
    local l_v3_Attribute_1 = v3:GetAttribute("WindSpeed");
    local l_v3_Attribute_2 = v3:GetAttribute("WindDirection");
    v4.WindPower = if type(l_v3_Attribute_0) == "number" then l_v3_Attribute_0 else nil;
    v4.WindSpeed = if type(l_v3_Attribute_1) == "number" then l_v3_Attribute_1 else nil;
    local v8;
    if typeof(l_v3_Attribute_2) == "Vector3" then
        local l_l_v3_Attribute_2_0 = l_v3_Attribute_2;
        v8 = l_l_v3_Attribute_2_0.Magnitude > 0 and l_l_v3_Attribute_2_0.Unit or Vector3.new(0, 0, 0, 0);
    else
        v8 = nil;
    end;
    v4.WindDirection = v8;
    v4.PivotOffset = if v3:IsA("BasePart") then v3.PivotOffset else nil;
    v4.PivotOffsetInverse = if v4.PivotOffset then v4.PivotOffset:Inverse() else nil;
    v8 = {
        PowerConnection = v3:GetAttributeChangedSignal("WindPower"):Connect(function() --[[ Line: 50 ]]
            -- upvalues: l_v3_Attribute_0 (ref), v3 (copy), v4 (copy)
            l_v3_Attribute_0 = v3:GetAttribute("WindPower");
            v4.WindPower = if type(l_v3_Attribute_0) == "number" then l_v3_Attribute_0 else nil;
        end), 
        SpeedConnection = v3:GetAttributeChangedSignal("WindSpeed"):Connect(function() --[[ Line: 55 ]]
            -- upvalues: l_v3_Attribute_1 (ref), v3 (copy), v4 (copy)
            l_v3_Attribute_1 = v3:GetAttribute("WindSpeed");
            v4.WindSpeed = if type(l_v3_Attribute_1) == "number" then l_v3_Attribute_1 else nil;
        end), 
        DirectionConnection = v3:GetAttributeChangedSignal("WindDirection"):Connect(function() --[[ Line: 60 ]]
            -- upvalues: l_v3_Attribute_2 (ref), v3 (copy), v4 (copy)
            l_v3_Attribute_2 = v3:GetAttribute("WindDirection");
            local l_v4_0 = v4;
            local v11;
            if typeof(l_v3_Attribute_2) == "Vector3" then
                local l_l_v3_Attribute_2_1 = l_v3_Attribute_2;
                v11 = l_l_v3_Attribute_2_1.Magnitude > 0 and l_l_v3_Attribute_2_1.Unit or Vector3.new(0, 0, 0, 0);
            else
                v11 = nil;
            end;
            l_v4_0.WindDirection = v11;
        end)
    };
    if v3:IsA("BasePart") then
        v8.PivotConnection = v3:GetPropertyChangedSignal("PivotOffset"):Connect(function() --[[ Line: 66 ]]
            -- upvalues: v3 (copy), v4 (copy)
            local l_PivotOffset_0 = v3.PivotOffset;
            v4.PivotOffset = l_PivotOffset_0;
            v4.PivotOffsetInverse = l_PivotOffset_0:Inverse();
        end);
    end;
    v4.Destroy = function(_) --[[ Line: 74 ]] --[[ Name: Destroy ]]
        -- upvalues: v8 (copy)
        for _, v16 in pairs(v8) do
            v16:Disconnect();
        end;
    end;
    return v4;
end;
return v0;