--!native
local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2, v3, v4, v5) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v6 = setmetatable({}, v0);
    v6._min = v1;
    v6._max = v2;
    v6._kp = v3;
    v6._ki = v4;
    v6._kd = v5;
    v6._lastError = 0;
    v6._integralSum = 0;
    return v6;
end;
v0.Reset = function(v7) --[[ Line: 53 ]] --[[ Name: Reset ]]
    v7._lastError = 0;
    v7._integralSum = 0;
end;
v0.Calculate = function(v8, v9, v10, v11) --[[ Line: 78 ]] --[[ Name: Calculate ]]
    local v12 = v9 - v10;
    local v13 = v8._kp * v12;
    v8._integralSum = v8._integralSum + v12 * v11;
    local v14 = v8._ki * v8._integralSum;
    local v15 = (v12 - v8._lastError) / v11;
    local v16 = v8._kd * v15;
    local v17 = math.clamp(v13 + v14 + v16, v8._min, v8._max);
    v8._lastError = v12;
    return v17;
end;
v0.Debug = function(v18, v19, v20) --[[ Line: 117 ]] --[[ Name: Debug ]]
    -- upvalues: v0 (copy)
    if not game:GetService("RunService"):IsStudio() then
        return;
    elseif v18._debug then
        return;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = v19;
        l_Folder_0:AddTag("PIDDebug");
        local function _(v22, v23) --[[ Line: 130 ]] --[[ Name: Bind ]]
            -- upvalues: l_Folder_0 (copy), v18 (copy)
            l_Folder_0:SetAttribute(v22, v18[v23]);
            l_Folder_0:GetAttributeChangedSignal(v22):Connect(function() --[[ Line: 132 ]]
                -- upvalues: v18 (ref), v23 (copy), l_Folder_0 (ref), v22 (copy)
                v18[v23] = l_Folder_0:GetAttribute(v22);
                v18:Reset();
            end);
        end;
        l_Folder_0:SetAttribute("MinMax", NumberRange.new(v18._min, v18._max));
        l_Folder_0:GetAttributeChangedSignal("MinMax"):Connect(function() --[[ Line: 139 ]]
            -- upvalues: l_Folder_0 (copy), v18 (copy)
            local l_l_Folder_0_Attribute_0 = l_Folder_0:GetAttribute("MinMax");
            v18._min = l_l_Folder_0_Attribute_0.Min;
            v18._max = l_l_Folder_0_Attribute_0.Max;
            v18:Reset();
        end);
        l_Folder_0:SetAttribute("kP", v18._kp);
        local l_l_Folder_0_AttributeChangedSignal_0 = l_Folder_0:GetAttributeChangedSignal("kP");
        local v27 = "_kp";
        local v28 = "kP";
        local l_v27_0 = v27 --[[ copy: 8 -> 10 ]];
        local l_v28_0 = v28 --[[ copy: 9 -> 11 ]];
        l_l_Folder_0_AttributeChangedSignal_0:Connect(function() --[[ Line: 132 ]]
            -- upvalues: v18 (copy), l_v27_0 (copy), l_Folder_0 (copy), l_v28_0 (copy)
            v18[l_v27_0] = l_Folder_0:GetAttribute(l_v28_0);
            v18:Reset();
        end);
        l_Folder_0:SetAttribute("kI", v18._ki);
        l_l_Folder_0_AttributeChangedSignal_0 = l_Folder_0:GetAttributeChangedSignal("kI");
        v27 = "_ki";
        v28 = "kI";
        local l_v27_1 = v27 --[[ copy: 8 -> 12 ]];
        local l_v28_1 = v28 --[[ copy: 9 -> 13 ]];
        l_l_Folder_0_AttributeChangedSignal_0:Connect(function() --[[ Line: 132 ]]
            -- upvalues: v18 (copy), l_v27_1 (copy), l_Folder_0 (copy), l_v28_1 (copy)
            v18[l_v27_1] = l_Folder_0:GetAttribute(l_v28_1);
            v18:Reset();
        end);
        l_Folder_0:SetAttribute("kD", v18._kd);
        l_l_Folder_0_AttributeChangedSignal_0 = l_Folder_0:GetAttributeChangedSignal("kD");
        v27 = "_kd";
        v28 = "kD";
        l_l_Folder_0_AttributeChangedSignal_0:Connect(function() --[[ Line: 132 ]]
            -- upvalues: v18 (copy), v27 (copy), l_Folder_0 (copy), v28 (copy)
            v18[v27] = l_Folder_0:GetAttribute(v28);
            v18:Reset();
        end);
        l_Folder_0:SetAttribute("Output", v18._min);
        l_l_Folder_0_AttributeChangedSignal_0 = 0;
        v18.Calculate = function(v33, v34, v35, ...) --[[ Line: 153 ]]
            -- upvalues: l_l_Folder_0_AttributeChangedSignal_0 (ref), v0 (ref), l_Folder_0 (copy)
            l_l_Folder_0_AttributeChangedSignal_0 = v0.Calculate(v33, v34, v35, ...);
            l_Folder_0:SetAttribute("Output", l_l_Folder_0_AttributeChangedSignal_0);
            return l_l_Folder_0_AttributeChangedSignal_0;
        end;
        local v36 = nil;
        l_Folder_0:SetAttribute("ShowDebugger", false);
        l_Folder_0:GetAttributeChangedSignal("ShowDebugger"):Connect(function() --[[ Line: 161 ]]
            -- upvalues: v36 (ref), l_Folder_0 (copy)
            if v36 then
                task.cancel(v36);
            end;
            if l_Folder_0:GetAttribute("ShowDebugger") then
                v36 = task.delay(0.1, function() --[[ Line: 169 ]]
                    -- upvalues: v36 (ref), l_Folder_0 (ref)
                    v36 = nil;
                    if l_Folder_0:GetAttribute("ShowDebugger") then
                        l_Folder_0:SetAttribute("ShowDebugger", false);
                        warn("Install the PID Debug plugin: https://create.roblox.com/store/asset/16279661108/PID-Debug");
                    end;
                end);
            end;
        end);
        l_Folder_0.Parent = v20 or workspace;
        v18._debug = l_Folder_0;
        return;
    end;
end;
v0.Destroy = function(v37) --[[ Line: 186 ]] --[[ Name: Destroy ]]
    if v37._debug then
        v37._debug:Destroy();
        v37._debug = nil;
    end;
end;
return {
    new = v0.new
};