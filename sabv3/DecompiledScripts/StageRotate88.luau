local l_TweenService_0 = game:GetService("TweenService");
local v1 = {};
local function _(v2) --[[ Line: 12 ]] --[[ Name: GetPivotCFrame ]]
    if v2:IsA("Model") then
        return v2:GetPivot();
    elseif v2:IsA("BasePart") then
        return v2.CFrame;
    else
        return;
    end;
end;
local function _(v4, v5) --[[ Line: 22 ]] --[[ Name: ApplyPivotCFrame ]]
    if v4:IsA("Model") then
        v4:PivotTo(v5);
        return;
    elseif v4:IsA("BasePart") then
        v4.CFrame = v5;
        return;
    else
        return;
    end;
end;
local function v16(v7, v8, v9) --[[ Line: 34 ]] --[[ Name: TweenPivotTo ]]
    -- upvalues: l_TweenService_0 (copy)
    local v10 = if v7:IsA("Model") then v7:GetPivot() else if v7:IsA("BasePart") then v7.CFrame else nil;
    local l_CFrameValue_0 = Instance.new("CFrameValue");
    l_CFrameValue_0.Value = v10;
    local v14 = l_CFrameValue_0:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 40 ]]
        -- upvalues: v7 (copy), l_CFrameValue_0 (copy)
        local l_v7_0 = v7;
        local l_Value_0 = l_CFrameValue_0.Value;
        if l_v7_0:IsA("Model") then
            l_v7_0:PivotTo(l_Value_0);
            return;
        elseif l_v7_0:IsA("BasePart") then
            l_v7_0.CFrame = l_Value_0;
            return;
        else
            return;
        end;
    end);
    local v15 = l_TweenService_0:Create(l_CFrameValue_0, v9, {
        Value = v8
    });
    v15:Play();
    v15.Completed:Wait();
    v14:Disconnect();
    l_CFrameValue_0:Destroy();
end;
local function v20(v17, v18) --[[ Line: 52 ]] --[[ Name: PlayStepSound ]]
    local l_Sound_0 = Instance.new("Sound");
    l_Sound_0.SoundId = v18;
    l_Sound_0.SoundGroup = game:GetService("SoundService")["Sound Effects"];
    l_Sound_0.Volume = 3;
    l_Sound_0.Parent = v17;
    l_Sound_0:Play();
    task.delay(5, function() --[[ Line: 61 ]]
        -- upvalues: l_Sound_0 (copy)
        if l_Sound_0 then
            l_Sound_0:Destroy();
        end;
    end);
end;
v1.Play = function(v21) --[[ Line: 68 ]] --[[ Name: Play ]]
    -- upvalues: v20 (copy), v16 (copy)
    local l_Parent_0 = script.Parent;
    local l_HeavenBackwalls_0 = l_Parent_0:WaitForChild("HeavenBackwalls");
    local l_Rotate_0 = l_Parent_0:WaitForChild("Rotate");
    local l_TheRomanticBackwalls_0 = l_Parent_0:WaitForChild("TheRomanticBackwalls");
    v20(l_TheRomanticBackwalls_0.Light, "rbxassetid://76605544954786");
    local v26 = (if l_TheRomanticBackwalls_0:IsA("Model") then l_TheRomanticBackwalls_0:GetPivot() else if l_TheRomanticBackwalls_0:IsA("BasePart") then l_TheRomanticBackwalls_0.CFrame else nil) * CFrame.new(0, -100, 0);
    v16(l_TheRomanticBackwalls_0, v26, v21(1));
    v20(l_Rotate_0.FloorConnector, "rbxassetid://123048816246101");
    v26 = (if l_Rotate_0:IsA("Model") then l_Rotate_0:GetPivot() else if l_Rotate_0:IsA("BasePart") then l_Rotate_0.CFrame else nil).Position;
    local v27 = CFrame.new(v26) * CFrame.Angles(0, 3.141592653589793, 0);
    local v28 = CFrame.new(v26) * CFrame.Angles(0, 0, 0);
    if l_Rotate_0:IsA("Model") then
        l_Rotate_0:PivotTo(v27);
    elseif l_Rotate_0:IsA("BasePart") then
        l_Rotate_0.CFrame = v27;
    end;
    v16(l_Rotate_0, v28, v21(2));
    v20(l_HeavenBackwalls_0.Light, "rbxassetid://117766421193420");
    v26 = (if l_HeavenBackwalls_0:IsA("Model") then l_HeavenBackwalls_0:GetPivot() else if l_HeavenBackwalls_0:IsA("BasePart") then l_HeavenBackwalls_0.CFrame else nil) * CFrame.new(0, 100, -100);
    v16(l_HeavenBackwalls_0, v26, v21(3));
end;
return v1;