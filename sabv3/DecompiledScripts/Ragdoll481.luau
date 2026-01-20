local v0 = {};
local l_Ragdoll_0 = script.Ragdoll;
v0.Ragdoll = function(v2) --[[ Line: 5 ]] --[[ Name: Ragdoll ]]
    -- upvalues: l_Ragdoll_0 (copy)
    local l_Humanoid_0 = v2:WaitForChild("Humanoid");
    if l_Humanoid_0:GetState() == Enum.HumanoidStateType.Physics then
        return;
    else
        l_Humanoid_0.BreakJointsOnDeath = false;
        for _, v5 in pairs(v2:GetDescendants()) do
            if v5:IsA("Motor6D") then
                if not l_Ragdoll_0 then
                    return;
                else
                    local l_BallSocketConstraint_0 = Instance.new("BallSocketConstraint");
                    local l_Attachment_0 = Instance.new("Attachment");
                    local l_Attachment_1 = Instance.new("Attachment");
                    l_Attachment_0.Parent = v5.Part0;
                    l_Attachment_1.Parent = v5.Part1;
                    l_BallSocketConstraint_0.Parent = v5.Parent;
                    local l_PlayerFromCharacter_0 = game.Players:GetPlayerFromCharacter(v2);
                    l_Ragdoll_0:FireClient(l_PlayerFromCharacter_0, nil, "manualM");
                    l_BallSocketConstraint_0.Attachment0 = l_Attachment_0;
                    l_BallSocketConstraint_0.Attachment1 = l_Attachment_1;
                    l_Attachment_0.CFrame = v5.C0;
                    l_Attachment_1.CFrame = v5.C1;
                    l_BallSocketConstraint_0.LimitsEnabled = true;
                    local l_NoCollisionConstraint_0 = Instance.new("NoCollisionConstraint");
                    l_NoCollisionConstraint_0.Part0 = v5.Part0;
                    l_NoCollisionConstraint_0.Part1 = l_Humanoid_0.RootPart;
                    l_NoCollisionConstraint_0.Parent = v5.Parent;
                    if v5.Name == "Root" then
                        l_BallSocketConstraint_0:Destroy();
                        local l_HingeConstraint_0 = Instance.new("HingeConstraint");
                        l_HingeConstraint_0.Attachment0 = l_Attachment_0;
                        l_HingeConstraint_0.Attachment1 = l_Attachment_1;
                        l_HingeConstraint_0.LimitsEnabled = true;
                        l_HingeConstraint_0.Parent = v5.Parent;
                    end;
                    if v5.Name == "Neck" then
                        l_BallSocketConstraint_0:Destroy();
                        local l_HingeConstraint_1 = Instance.new("HingeConstraint");
                        l_HingeConstraint_1.Attachment0 = l_Attachment_0;
                        l_HingeConstraint_1.Attachment1 = l_Attachment_1;
                        l_HingeConstraint_1.LimitsEnabled = true;
                        l_HingeConstraint_1.Parent = v5.Parent;
                    end;
                    l_BallSocketConstraint_0.TwistLimitsEnabled = true;
                    v5.Enabled = false;
                end;
            end;
        end;
        return;
    end;
end;
v0.Unragdoll = function(v13) --[[ Line: 55 ]] --[[ Name: Unragdoll ]]
    -- upvalues: l_Ragdoll_0 (copy)
    for _, v15 in pairs(v13:GetDescendants()) do
        if v15:IsA("Motor6D") then
            if not l_Ragdoll_0 then
                return;
            elseif v15.Part0 and v15.Part1 then
                local _ = v13:WaitForChild("Humanoid");
                local v17 = v15.Parent:FindFirstChild("BallSocketConstraint") or v15.Parent:FindFirstChild("HingeConstraint");
                local l_NoCollisionConstraint_1 = v15.Parent:FindFirstChild("NoCollisionConstraint");
                local l_Attachment_2 = v15.Part0:FindFirstChild("Attachment");
                local l_Attachment_3 = v15.Part1:FindFirstChild("Attachment");
                if v17 then
                    v17:Destroy();
                end;
                if l_NoCollisionConstraint_1 then
                    l_NoCollisionConstraint_1:Destroy();
                end;
                if l_Attachment_2 then
                    l_Attachment_2:Destroy();
                end;
                if l_Attachment_3 then
                    l_Attachment_3:Destroy();
                end;
                local l_PlayerFromCharacter_1 = game.Players:GetPlayerFromCharacter(v13);
                l_Ragdoll_0:FireClient(l_PlayerFromCharacter_1, nil, "manualD");
                v15.Enabled = true;
            end;
        end;
    end;
end;
return v0;