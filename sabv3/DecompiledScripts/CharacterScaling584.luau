local l_TweenService_0 = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local function _(v2, v3) --[[ Line: 6 ]] --[[ Name: GetHumanoidScalar ]]
    local l_v2_FirstChild_0 = v2:FindFirstChild(v3);
    if l_v2_FirstChild_0 then
        assert(l_v2_FirstChild_0:IsA("NumberValue"));
        return l_v2_FirstChild_0;
    else
        local l_NumberValue_0 = Instance.new("NumberValue");
        l_NumberValue_0.Name = v3;
        l_NumberValue_0.Value = 1;
        return l_NumberValue_0;
    end;
end;
local function _(v7, v8, v9) --[[ Line: 21 ]] --[[ Name: ScaleHumanoidScalar ]]
    local l_v7_FirstChild_0 = v7:FindFirstChild(v8);
    local v11;
    if l_v7_FirstChild_0 then
        assert(l_v7_FirstChild_0:IsA("NumberValue"));
        v11 = l_v7_FirstChild_0;
    else
        local l_NumberValue_1 = Instance.new("NumberValue");
        l_NumberValue_1.Name = v8;
        l_NumberValue_1.Value = 1;
        v11 = l_NumberValue_1;
    end;
    l_v7_FirstChild_0 = v11:GetAttribute("OriginalValue");
    if type(l_v7_FirstChild_0) ~= "number" then
        l_v7_FirstChild_0 = v11.Value;
        v11:SetAttribute("OriginalValue", l_v7_FirstChild_0);
    end;
    v11.Value = l_v7_FirstChild_0 * v9;
end;
local function v17(v14, v15) --[[ Line: 35 ]] --[[ Name: SetToolScale ]]
    local l_v14_Attribute_0 = v14:GetAttribute("OriginalScale");
    if type(l_v14_Attribute_0) ~= "number" then
        l_v14_Attribute_0 = v14:GetScale();
        v14:SetAttribute("OriginalScale", l_v14_Attribute_0);
    end;
    v14:ScaleTo(l_v14_Attribute_0 * v15);
end;
local function v29(v18, v19) --[[ Line: 47 ]] --[[ Name: SetCharacterScale ]]
    local l_Humanoid_0 = v18:FindFirstChildOfClass("Humanoid");
    if not l_Humanoid_0 then
        return;
    else
        l_Humanoid_0.AutomaticScalingEnabled = true;
        local l_BodyDepthScale_0 = l_Humanoid_0:FindFirstChild("BodyDepthScale");
        local v22;
        if l_BodyDepthScale_0 then
            assert(l_BodyDepthScale_0:IsA("NumberValue"));
            v22 = l_BodyDepthScale_0;
        else
            local l_NumberValue_2 = Instance.new("NumberValue");
            l_NumberValue_2.Name = "BodyDepthScale";
            l_NumberValue_2.Value = 1;
            v22 = l_NumberValue_2;
        end;
        l_BodyDepthScale_0 = v22:GetAttribute("OriginalValue");
        if type(l_BodyDepthScale_0) ~= "number" then
            l_BodyDepthScale_0 = v22.Value;
            v22:SetAttribute("OriginalValue", l_BodyDepthScale_0);
        end;
        v22.Value = l_BodyDepthScale_0 * v19;
        l_BodyDepthScale_0 = l_Humanoid_0:FindFirstChild("BodyHeightScale");
        if l_BodyDepthScale_0 then
            assert(l_BodyDepthScale_0:IsA("NumberValue"));
            v22 = l_BodyDepthScale_0;
        else
            local l_NumberValue_3 = Instance.new("NumberValue");
            l_NumberValue_3.Name = "BodyHeightScale";
            l_NumberValue_3.Value = 1;
            v22 = l_NumberValue_3;
        end;
        l_BodyDepthScale_0 = v22:GetAttribute("OriginalValue");
        if type(l_BodyDepthScale_0) ~= "number" then
            l_BodyDepthScale_0 = v22.Value;
            v22:SetAttribute("OriginalValue", l_BodyDepthScale_0);
        end;
        v22.Value = l_BodyDepthScale_0 * v19;
        l_BodyDepthScale_0 = l_Humanoid_0:FindFirstChild("BodyProportionScale");
        if l_BodyDepthScale_0 then
            assert(l_BodyDepthScale_0:IsA("NumberValue"));
            v22 = l_BodyDepthScale_0;
        else
            local l_NumberValue_4 = Instance.new("NumberValue");
            l_NumberValue_4.Name = "BodyProportionScale";
            l_NumberValue_4.Value = 1;
            v22 = l_NumberValue_4;
        end;
        l_BodyDepthScale_0 = v22:GetAttribute("OriginalValue");
        if type(l_BodyDepthScale_0) ~= "number" then
            l_BodyDepthScale_0 = v22.Value;
            v22:SetAttribute("OriginalValue", l_BodyDepthScale_0);
        end;
        v22.Value = l_BodyDepthScale_0 * v19;
        l_BodyDepthScale_0 = l_Humanoid_0:FindFirstChild("BodyTypeScale");
        if l_BodyDepthScale_0 then
            assert(l_BodyDepthScale_0:IsA("NumberValue"));
            v22 = l_BodyDepthScale_0;
        else
            local l_NumberValue_5 = Instance.new("NumberValue");
            l_NumberValue_5.Name = "BodyTypeScale";
            l_NumberValue_5.Value = 1;
            v22 = l_NumberValue_5;
        end;
        l_BodyDepthScale_0 = v22:GetAttribute("OriginalValue");
        if type(l_BodyDepthScale_0) ~= "number" then
            l_BodyDepthScale_0 = v22.Value;
            v22:SetAttribute("OriginalValue", l_BodyDepthScale_0);
        end;
        v22.Value = l_BodyDepthScale_0 * v19;
        l_BodyDepthScale_0 = l_Humanoid_0:FindFirstChild("BodyWidthScale");
        if l_BodyDepthScale_0 then
            assert(l_BodyDepthScale_0:IsA("NumberValue"));
            v22 = l_BodyDepthScale_0;
        else
            local l_NumberValue_6 = Instance.new("NumberValue");
            l_NumberValue_6.Name = "BodyWidthScale";
            l_NumberValue_6.Value = 1;
            v22 = l_NumberValue_6;
        end;
        l_BodyDepthScale_0 = v22:GetAttribute("OriginalValue");
        if type(l_BodyDepthScale_0) ~= "number" then
            l_BodyDepthScale_0 = v22.Value;
            v22:SetAttribute("OriginalValue", l_BodyDepthScale_0);
        end;
        v22.Value = l_BodyDepthScale_0 * v19;
        l_BodyDepthScale_0 = l_Humanoid_0:FindFirstChild("HeadScale");
        if l_BodyDepthScale_0 then
            assert(l_BodyDepthScale_0:IsA("NumberValue"));
            v22 = l_BodyDepthScale_0;
        else
            local l_NumberValue_7 = Instance.new("NumberValue");
            l_NumberValue_7.Name = "HeadScale";
            l_NumberValue_7.Value = 1;
            v22 = l_NumberValue_7;
        end;
        l_BodyDepthScale_0 = v22:GetAttribute("OriginalValue");
        if type(l_BodyDepthScale_0) ~= "number" then
            l_BodyDepthScale_0 = v22.Value;
            v22:SetAttribute("OriginalValue", l_BodyDepthScale_0);
        end;
        v22.Value = l_BodyDepthScale_0 * v19;
        v18:SetAttribute("NewHipHeight", l_Humanoid_0.HipHeight);
        v22 = v18:FindFirstChildOfClass("Tool");
        if v22 then
            l_BodyDepthScale_0 = v22:GetAttribute("OriginalScale");
            if type(l_BodyDepthScale_0) ~= "number" then
                l_BodyDepthScale_0 = v22:GetScale();
                v22:SetAttribute("OriginalScale", l_BodyDepthScale_0);
            end;
            v22:ScaleTo(l_BodyDepthScale_0 * v19);
        end;
        v18:SetAttribute("__HumanoidScale", v19);
        return;
    end;
end;
return {
    TweenCharacterScale = function(v30, v31, v32, v33, v34, v35, v36, v37) --[[ Line: 91 ]] --[[ Name: TweenCharacterScale ]]
        -- upvalues: l_RunService_0 (copy), l_TweenService_0 (copy), v29 (copy)
        local v38 = 0;
        local v39 = 0;
        local v40 = nil;
        v40 = l_RunService_0.PreSimulation:Connect(function(v41) --[[ Line: 104 ]]
            -- upvalues: v39 (ref), v34 (copy), v38 (ref), v33 (copy), l_TweenService_0 (ref), v35 (copy), v36 (copy), v31 (copy), v32 (copy), v29 (ref), v30 (copy), v40 (ref), v37 (copy)
            v39 = v39 + v41;
            if v39 < v34 then
                return;
            else
                v38 = v38 + v34;
                v39 = v39 - v34;
                local v42 = math.clamp(v38 / v33, 0, 1);
                local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v42, v35, v36);
                local v44 = math.lerp(v31, v32, l_l_TweenService_0_Value_0);
                v29(v30, v44);
                if v33 <= v38 then
                    v40:Disconnect();
                    if v37 then
                        v37();
                    end;
                end;
                return;
            end;
        end);
        return v40;
    end, 
    GetCharacterScale = function(v45) --[[ Line: 85 ]] --[[ Name: GetCharacterScale ]]
        return v45:GetAttribute("__HumanoidScale") or 1;
    end, 
    SetToolScale = v17
};