local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Signal);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = nil;
local v7 = nil;
if l_RunService_0:IsClient() then
    local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
    v7 = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
end;
local v9 = {
    OnCharacterAdded = v4.new(), 
    OnSetCFrame = v4.new(), 
    originalMoveFunction = v7 and v7.moveFunction
};
if v7 then
    v7.moveFunction = function(v10, v11, v12) --[[ Line: 29 ]]
        -- upvalues: v9 (copy)
        v9:RequestMove(v10, v11, v12);
    end;
    v9.originalMoveFunction = v7.moveFunction;
end;
v9.RequestMove = function(_, v14, v15, v16) --[[ Line: 37 ]] --[[ Name: RequestMove ]]
    if v14:GetAttribute("FreezeLocalMovement") then
        return;
    else
        v14:Move(v15, v16);
        return;
    end;
end;
v9.WaitForCharacter = function(_, v18) --[[ Line: 45 ]] --[[ Name: WaitForCharacter ]]
    -- upvalues: v9 (copy)
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    while not v19 do
        local l_v9_Character_0, v23, v24 = v9:GetCharacter(v18);
        v19 = l_v9_Character_0;
        v20 = v23;
        v21 = v24;
        task.wait();
    end;
    return v19, v20, v21;
end;
v9.GetCharacter = function(_, v26) --[[ Line: 57 ]] --[[ Name: GetCharacter ]]
    -- upvalues: l_LocalPlayer_0 (copy)
    local l_Character_0 = (v26 or l_LocalPlayer_0).Character;
    if not l_Character_0 then
        return;
    else
        local l_Humanoid_0 = l_Character_0:FindFirstChild("Humanoid");
        if not l_Humanoid_0 then
            return;
        else
            local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
            if not l_HumanoidRootPart_0 then
                return;
            else
                return l_Character_0, l_Humanoid_0, l_HumanoidRootPart_0;
            end;
        end;
    end;
end;
v9.SetCFrame = function(_, v31) --[[ Line: 74 ]] --[[ Name: SetCFrame ]]
    -- upvalues: v9 (copy)
    local l_v9_Character_1, _, v34 = v9:GetCharacter();
    if not l_v9_Character_1 then
        return;
    else
        v34.CFrame = v31;
        v9.OnSetCFrame:Fire(v31);
        return;
    end;
end;
v9.Start = function(_) --[[ Line: 84 ]] --[[ Name: Start ]]
    -- upvalues: v9 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
    local v36 = 2.08;
    local function v42(v37) --[[ Line: 87 ]] --[[ Name: onCharacterAdded ]]
        -- upvalues: v9 (ref), v36 (ref)
        workspace.Gravity = 196.2;
        v9.OnCharacterAdded:Fire(v37);
        local l_Humanoid_1 = v37:WaitForChild("Humanoid");
        if not l_Humanoid_1 then
            return;
        else
            v36 = l_Humanoid_1.HipHeight;
            local v39 = 0;
            l_Humanoid_1.StateChanged:Connect(function(v40, v41) --[[ Line: 100 ]]
                -- upvalues: l_Humanoid_1 (copy), v39 (ref)
                if l_Humanoid_1.Health <= 0 then
                    return;
                else
                    if v40 == Enum.HumanoidStateType.Jumping and v41 == Enum.HumanoidStateType.Jumping or v40 == Enum.HumanoidStateType.Freefall and v41 == Enum.HumanoidStateType.Jumping then
                        v39 = v39 + 1;
                        task.delay(60, function() --[[ Line: 110 ]]
                            -- upvalues: v39 (ref)
                            v39 = v39 - 1;
                        end);
                        if v39 >= 5 then
                            l_Humanoid_1.Health = 0;
                        end;
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
    l_LocalPlayer_0.CharacterAdded:Connect(v42);
    if l_LocalPlayer_0.Character then
        task.spawn(v42, l_LocalPlayer_0.Character);
    end;
    l_RunService_0.PreSimulation:Connect(function(_) --[[ Line: 126 ]]
        -- upvalues: v9 (ref), v36 (ref)
        debug.profilebegin("CharacterController");
        local l_v9_Character_2, v45, _ = v9:GetCharacter();
        if not l_v9_Character_2 or not v45 then
            debug.profileend();
            return;
        else
            v45.HipHeight = l_v9_Character_2:GetAttribute("NewHipHeight") or v36;
            debug.profileend();
            return;
        end;
    end);
end;
return v9;