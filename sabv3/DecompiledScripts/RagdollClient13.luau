local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Character_0 = game.Players.LocalPlayer.Character;
local l_Head_0 = l_Character_0:WaitForChild("Head");
local l_Humanoid_0 = l_Character_0:WaitForChild("Humanoid");
local l_Ragdoll_0 = game.ReplicatedStorage:WaitForChild("Packages").Ragdoll.Ragdoll;
local function _(v5) --[[ Line: 13 ]] --[[ Name: focus ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_Head_0 (copy), l_Humanoid_0 (copy)
    if v5 == "Focus" then
        l_CurrentCamera_0.CameraSubject = l_Head_0;
        return;
    else
        if v5 == "Unfocus" then
            l_CurrentCamera_0.CameraSubject = l_Humanoid_0;
        end;
        return;
    end;
end;
l_Ragdoll_0.OnClientEvent:Connect(function(v7, v8) --[[ Line: 27 ]]
    -- upvalues: l_Humanoid_0 (copy), l_CurrentCamera_0 (copy), l_Head_0 (copy)
    if l_Humanoid_0 then
        if v7 == "Make" then
            l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Physics);
            l_CurrentCamera_0.CameraSubject = l_Head_0;
        elseif v7 == "Destroy" then
            l_Humanoid_0:ChangeState(Enum.HumanoidStateType.GettingUp);
            l_CurrentCamera_0.CameraSubject = l_Humanoid_0;
        end;
        if v7 == nil then
            if v8 == "manualM" then
                l_Humanoid_0:ChangeState(Enum.HumanoidStateType.Physics);
                l_CurrentCamera_0.CameraSubject = l_Head_0;
                return;
            elseif v8 == "manualD" then
                l_Humanoid_0:ChangeState(Enum.HumanoidStateType.GettingUp);
                l_CurrentCamera_0.CameraSubject = l_Humanoid_0;
            end;
        end;
    end;
end);