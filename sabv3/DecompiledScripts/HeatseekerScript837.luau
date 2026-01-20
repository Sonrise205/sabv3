local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras;
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Handle_0 = l_Parent_0.Handle;
local l_Equip_0 = l_Handle_0:FindFirstChild("Equip");
local l_lockon_0 = l_Handle_0:FindFirstChild("lockon");
local l_holdlock_0 = l_Handle_0:FindFirstChild("holdlock");
local v12 = l_Parent_0:FindFirstAncestorOfClass("Player") or l_Players_0:GetPlayerFromCharacter(l_Parent_0:FindFirstAncestorOfClass("Model"));
local l_AimUI_0 = script.Parent:WaitForChild("AimUI");
local l_lockon_1 = l_AimUI_0.lockon;
local v15 = nil;
local function _() --[[ Line: 28 ]] --[[ Name: CleanUp ]]
    -- upvalues: l_AimUI_0 (copy), l_lockon_1 (copy), v15 (ref)
    l_AimUI_0.Adornee = script;
    l_lockon_1.Visible = false;
    v15 = nil;
end;
local function v26() --[[ Line: 34 ]] --[[ Name: GetNearestPlayer ]]
    -- upvalues: v12 (copy), l_Players_0 (copy)
    local l_Character_0 = v12.Character;
    if not l_Character_0 then
        return;
    else
        local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            return;
        else
            local v19 = nil;
            local v20 = 1e999;
            for _, v22 in l_Players_0:GetPlayers() do
                if v22 ~= v12 then
                    local l_Character_1 = v22.Character;
                    local v24 = l_Character_1 and l_Character_1:FindFirstChild("HumanoidRootPart");
                    if v24 then
                        local l_Magnitude_0 = (l_HumanoidRootPart_0.Position - v24.Position).Magnitude;
                        if l_Magnitude_0 <= 40 and l_Magnitude_0 < v20 then
                            v20 = l_Magnitude_0;
                            v19 = l_Character_1;
                        end;
                    end;
                end;
            end;
            return v19, l_Players_0:GetPlayerFromCharacter(v19);
        end;
    end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 64 ]]
    -- upvalues: v5 (copy), v15 (ref)
    v5:RemoteEvent("UseItem"):FireServer(v15);
end);
l_Parent_0.Equipped:Connect(function() --[[ Line: 68 ]]
    -- upvalues: l_Equip_0 (copy), l_holdlock_0 (copy), l_RunService_0 (copy), l_AimUI_0 (copy), l_lockon_1 (copy), v15 (ref), l_Parent_0 (copy), v26 (copy), l_lockon_0 (copy)
    if l_Equip_0 and not l_holdlock_0.IsPlaying then
        l_Equip_0:Play();
    end;
    l_RunService_0:UnbindFromRenderStep("Heatseeker");
    l_AimUI_0.Adornee = script;
    l_lockon_1.Visible = false;
    v15 = nil;
    l_RunService_0:BindToRenderStep("Heatseeker", Enum.RenderPriority.Character.Value + 1, function() --[[ Line: 75 ]]
        -- upvalues: l_Parent_0 (ref), l_AimUI_0 (ref), l_lockon_1 (ref), v15 (ref), v26 (ref), l_holdlock_0 (ref), l_lockon_0 (ref)
        if l_Parent_0:GetAttribute("CooldownTime") then
            l_AimUI_0.Adornee = script;
            l_lockon_1.Visible = false;
            v15 = nil;
            return;
        else
            local v27, v28 = v26();
            if v27 and v27 ~= v15 then
                l_AimUI_0.Adornee = v27;
                l_lockon_1.Visible = true;
                v15 = v28;
                if l_holdlock_0 and not l_holdlock_0.IsPlaying then
                    l_holdlock_0:Play();
                    return;
                end;
            else
                l_AimUI_0.Adornee = script;
                l_lockon_1.Visible = false;
                v15 = nil;
                if l_lockon_0 and not l_lockon_0.IsPlaying then
                    l_lockon_0:Play();
                end;
            end;
            return;
        end;
    end);
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 97 ]]
    -- upvalues: l_RunService_0 (copy), l_AimUI_0 (copy), l_lockon_1 (copy), v15 (ref), l_lockon_0 (copy), l_holdlock_0 (copy), l_Equip_0 (copy)
    l_RunService_0:UnbindFromRenderStep("Heatseeker");
    l_AimUI_0.Adornee = script;
    l_lockon_1.Visible = false;
    v15 = nil;
    if l_lockon_0 then
        l_lockon_0:Stop();
    end;
    if l_holdlock_0 then
        l_holdlock_0:Stop();
    end;
    if l_Equip_0 then
        l_Equip_0:Stop();
    end;
end);