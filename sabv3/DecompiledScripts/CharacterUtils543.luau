local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = {
    "idle", 
    "walk", 
    "run", 
    "swim", 
    "swimidle", 
    "jump", 
    "fall", 
    "climb", 
    "sit", 
    "toolnone", 
    "toolslash", 
    "toollunge", 
    "wave", 
    "point", 
    "dance", 
    "dance2", 
    "dance3", 
    "laugh", 
    "cheer"
};
local v25 = {
    GetCharacter = function(_, v4) --[[ Line: 21 ]] --[[ Name: GetCharacter ]]
        -- upvalues: l_RunService_0 (copy), l_Players_0 (copy)
        local v5 = nil;
        if l_RunService_0:IsServer() then
            if not v4 then
                return nil;
            else
                v5 = v4;
            end;
        else
            v5 = v4 or l_Players_0.LocalPlayer;
        end;
        local l_Character_0 = v5.Character;
        if not l_Character_0 then
            return nil;
        else
            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return nil;
            else
                local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
                if not l_Humanoid_0 then
                    return nil;
                else
                    return l_Character_0, l_HumanoidRootPart_0, l_Humanoid_0;
                end;
            end;
        end;
    end, 
    SetAnimations = function(_, v10, v11, v12) --[[ Line: 40 ]] --[[ Name: SetAnimations ]]
        local l_Animate_0 = v10:FindFirstChild("Animate");
        if not l_Animate_0 then
            return;
        else
            local l_l_Animate_0_FirstChild_0 = l_Animate_0:FindFirstChild(v11);
            if not l_l_Animate_0_FirstChild_0 then
                return;
            else
                local l_OriginalValues_0 = l_l_Animate_0_FirstChild_0:FindFirstChild("OriginalValues");
                if l_OriginalValues_0 then
                    for _, v17 in ipairs(l_l_Animate_0_FirstChild_0:GetChildren()) do
                        if v17:IsA("Animation") then
                            v17:Destroy();
                        end;
                    end;
                    for _, v19 in ipairs(l_OriginalValues_0:GetChildren()) do
                        v19.Parent = l_l_Animate_0_FirstChild_0;
                    end;
                    l_OriginalValues_0:Destroy();
                end;
                if v12 then
                    local l_Folder_0 = Instance.new("Folder");
                    for _, v22 in ipairs(l_l_Animate_0_FirstChild_0:GetChildren()) do
                        v22.Parent = l_Folder_0;
                    end;
                    l_Folder_0.Name = "OriginalValues";
                    l_Folder_0.Parent = l_l_Animate_0_FirstChild_0;
                    for _, v24 in ipairs(v12) do
                        v24:Clone().Parent = l_l_Animate_0_FirstChild_0;
                    end;
                end;
                return;
            end;
        end;
    end
};
v25.RevertAnimations = function(_, v27, v28) --[[ Line: 76 ]] --[[ Name: RevertAnimations ]]
    -- upvalues: v25 (copy)
    v25:SetAnimations(v27, v28, nil);
end;
v25.RevertAllAnimations = function(_, v30) --[[ Line: 80 ]] --[[ Name: RevertAllAnimations ]]
    -- upvalues: v2 (copy), v25 (copy)
    for _, v32 in ipairs(v2) do
        v25:RevertAnimations(v30, v32);
    end;
end;
return v25;