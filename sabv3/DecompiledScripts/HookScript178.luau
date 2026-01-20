local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Net);
local v5 = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Handle_0 = l_Parent_0.Handle;
local l_Beam_0 = l_Handle_0:WaitForChild("Beam");
local _ = l_Handle_0.RopeAttachment;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Hit_0 = script.Hit;
local l_Fire_0 = script.Fire;
local function _(v13) --[[ Line: 23 ]] --[[ Name: PlayerChecker ]]
    if v13.Parent:FindFirstChild("Humanoid") then
        return true;
    elseif v13.Parent.Parent:FindFirstChild("Humanoid") then
        return true;
    else
        return false;
    end;
end;
l_Parent_0.Activated:Connect(function() --[[ Line: 33 ]]
    -- upvalues: l_Parent_1 (copy), l_ReplicatedStorage_0 (copy), v5 (copy), l_Fire_0 (copy), v4 (copy), l_Beam_0 (copy), l_Hit_0 (copy)
    if l_Parent_1:GetAttribute("Stealing") then
        return;
    else
        local v15 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
        local l_Hit_1 = v15.Hit;
        local l_Target_0 = v15.Target;
        if not l_Target_0 or l_Target_0.Parent:FindFirstChild("Humanoid") and true or l_Target_0.Parent.Parent:FindFirstChild("Humanoid") and true or false then
            return;
        else
            local l_Position_0 = l_Hit_1.Position;
            local l_Character_0 = l_Parent_1.Character;
            if not l_Character_0 then
                return;
            else
                local l_l_Character_0_FirstChildWhichIsA_0 = l_Character_0:FindFirstChildWhichIsA("Tool", true);
                if not l_l_Character_0_FirstChildWhichIsA_0 then
                    return;
                elseif l_l_Character_0_FirstChildWhichIsA_0.Name ~= "Grapple Hook" then
                    return;
                else
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    if not l_HumanoidRootPart_0 then
                        return;
                    else
                        local l_Unit_0 = (l_Position_0 - l_HumanoidRootPart_0.Position).Unit;
                        local l_Magnitude_0 = (l_Position_0 - l_HumanoidRootPart_0.Position).Magnitude;
                        if l_Magnitude_0 >= 10 and l_Magnitude_0 <= 100 then
                            if v5(("ItemUse/GrappleHook/Client/%*"):format(l_Parent_1.Name), 3) then
                                return;
                            else
                                l_Fire_0:Play();
                                v4:RemoteEvent("UseItem"):FireServer(l_Magnitude_0 / 120);
                                local l_Part_0 = Instance.new("Part");
                                l_Part_0.Anchored = true;
                                l_Part_0.CanCollide = false;
                                l_Part_0.Transparency = 1;
                                l_Part_0.Position = l_Position_0;
                                l_Part_0.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
                                l_Part_0.Parent = workspace;
                                local l_Attachment_0 = Instance.new("Attachment");
                                l_Attachment_0.Position = Vector3.new(0, 0, 0, 0);
                                l_Attachment_0.Parent = l_Part_0;
                                l_Beam_0.Attachment0 = l_Attachment_0;
                                local l_BodyVelocity_0 = Instance.new("BodyVelocity");
                                l_BodyVelocity_0.Name = "FlightPower";
                                l_BodyVelocity_0.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                                l_BodyVelocity_0.Velocity = l_Unit_0 * 100;
                                l_BodyVelocity_0.P = 2000;
                                l_BodyVelocity_0.Parent = l_HumanoidRootPart_0;
                                l_Hit_0:Play();
                                local v27 = nil;
                                local v28 = nil;
                                do
                                    local l_v27_0, l_v28_0 = v27, v28;
                                    local function v31() --[[ Line: 100 ]] --[[ Name: finish ]]
                                        -- upvalues: l_v27_0 (ref), l_v28_0 (ref), l_BodyVelocity_0 (copy), l_Attachment_0 (copy), l_Part_0 (copy), l_Beam_0 (ref)
                                        if l_v27_0 then
                                            l_v27_0:Disconnect();
                                            l_v27_0 = nil;
                                        end;
                                        if l_v28_0 then
                                            if coroutine.status(l_v28_0) == "suspended" then
                                                pcall(task.cancel, l_v28_0);
                                            end;
                                            l_v28_0 = nil;
                                        end;
                                        l_BodyVelocity_0:Destroy();
                                        l_Attachment_0:Destroy();
                                        l_Part_0:Destroy();
                                        l_Beam_0.Attachment0 = nil;
                                    end;
                                    l_v27_0 = l_Parent_1:GetAttributeChangedSignal("Stealing"):Connect(function() --[[ Line: 120 ]]
                                        -- upvalues: l_Parent_1 (ref), v31 (copy)
                                        if l_Parent_1:GetAttribute("Stealing") then
                                            task.defer(v31);
                                        end;
                                    end);
                                    l_v28_0 = task.delay(l_Magnitude_0 / 120, function() --[[ Line: 126 ]]
                                        -- upvalues: v31 (copy)
                                        task.defer(v31);
                                    end);
                                    if l_Parent_1:GetAttribute("Stealing") then
                                        task.defer(v31);
                                    end;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
        end;
    end;
end);