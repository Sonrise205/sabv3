local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
local _ = workspace.CurrentCamera;
local _ = l_PlayerGui_0:WaitForChild("ToolsScreen");
local _ = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v12 = require(l_Packages_0.Net):RemoteEvent("UseItem");
local v13 = 0;
local v14 = Vector3.new(0, 0, 0, 0);
local v15 = {};
local function _() --[[ Line: 32 ]] --[[ Name: isIced ]]
    -- upvalues: l_LocalPlayer_0 (copy), v13 (ref)
    local l_Character_0 = l_LocalPlayer_0.Character;
    if not l_Character_0 then
        return;
    else
        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
        if not l_Humanoid_0 then
            return;
        else
            local l_l_Humanoid_0_Attribute_0 = l_Humanoid_0:GetAttribute("IcedUntil");
            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
            return typeof(l_l_Humanoid_0_Attribute_0) == "number" and l_workspace_ServerTimeNow_0 < l_l_Humanoid_0_Attribute_0 or l_workspace_ServerTimeNow_0 < v13;
        end;
    end;
end;
v12.OnClientEvent:Connect(function(v21, v22, _) --[[ Line: 48 ]]
    -- upvalues: v13 (ref)
    if v21 ~= "IcedWalk" then
        return;
    else
        local v24 = workspace:GetServerTimeNow() + v22;
        if v13 < v24 then
            v13 = v24;
        end;
        return;
    end;
end);
l_RunService_0.RenderStepped:Connect(function(v25) --[[ Line: 59 ]]
    -- upvalues: l_LocalPlayer_0 (copy), v13 (ref), v14 (ref)
    local l_Character_1 = l_LocalPlayer_0.Character;
    if not l_Character_1 then
        return;
    else
        local l_Humanoid_1 = l_Character_1:FindFirstChild("Humanoid");
        if not l_Humanoid_1 then
            return;
        else
            local l_HumanoidRootPart_0 = l_Character_1:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return;
            else
                local l_Character_2 = l_LocalPlayer_0.Character;
                local v30;
                if not l_Character_2 then
                    v30 = nil;
                else
                    local l_Humanoid_2 = l_Character_2:FindFirstChild("Humanoid");
                    if not l_Humanoid_2 then
                        v30 = nil;
                    else
                        local l_l_Humanoid_2_Attribute_0 = l_Humanoid_2:GetAttribute("IcedUntil");
                        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                        v30 = typeof(l_l_Humanoid_2_Attribute_0) == "number" and l_workspace_ServerTimeNow_1 < l_l_Humanoid_2_Attribute_0 or l_workspace_ServerTimeNow_1 < v13;
                    end;
                end;
                if v30 then
                    v30 = l_Humanoid_1.MoveDirection;
                    l_Character_2 = Vector3.new(v30.X, 0, v30.Z);
                    if l_Character_2.Magnitude > 0 then
                        local v34 = l_Character_2.Unit * 26;
                        local v35 = 1 - math.exp(-10 * v25);
                        v14 = v14:Lerp(v34, v35);
                    else
                        local v36 = math.exp(-1.4 * v25);
                        v14 = v14 * v36;
                    end;
                    local l_AssemblyLinearVelocity_0 = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                    l_HumanoidRootPart_0.AssemblyLinearVelocity = Vector3.new(v14.X, l_AssemblyLinearVelocity_0.Y, v14.Z);
                    return;
                else
                    if v14.Magnitude > 0 then
                        v14 = Vector3.new(0, 0, 0, 0);
                    end;
                    return;
                end;
            end;
        end;
    end;
end);
return v15;