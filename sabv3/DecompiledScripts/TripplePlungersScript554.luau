local l_Players_0 = game:GetService("Players");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net);
local v6 = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Handle_0 = l_Parent_0.Handle;
local l_Beam_0 = l_Handle_0:WaitForChild("Beam");
local _ = l_Handle_0.RopeAttachment;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Hit_0 = script.Hit;
local l_Fire_0 = script.Fire;
l_Parent_0.Activated:Connect(function() --[[ Line: 24 ]]
    -- upvalues: l_Parent_1 (copy), l_ReplicatedStorage_0 (copy), v6 (copy), l_Fire_0 (copy), v5 (copy), l_Beam_0 (copy), l_Players_0 (copy), l_Hit_0 (copy)
    if l_Parent_1:GetAttribute("Stealing") then
        return;
    else
        local v14 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
        local l_Hit_1 = v14.Hit;
        local l_Target_0 = v14.Target;
        if not l_Target_0 then
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
                elseif l_l_Character_0_FirstChildWhichIsA_0.Name ~= "Tripple Plungers" then
                    return;
                else
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    if not l_HumanoidRootPart_0 then
                        return;
                    else
                        local l_Unit_0 = (l_Position_0 - l_HumanoidRootPart_0.Position).Unit;
                        local l_Magnitude_0 = (l_Position_0 - l_HumanoidRootPart_0.Position).Magnitude;
                        if l_Magnitude_0 >= 10 and l_Magnitude_0 <= 50 then
                            if v6(("ItemUse/TripplePlungers/Client/%*"):format(l_Parent_1.Name), 15) then
                                return;
                            else
                                l_Fire_0:Play();
                                v5:RemoteEvent("UseItem"):FireServer(l_Magnitude_0 / 120, l_Hit_1.Position, l_Target_0);
                                local l_Part_0 = Instance.new("Part");
                                l_Part_0.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612, 0);
                                l_Part_0.CanCollide = false;
                                l_Part_0.Position = l_Position_0;
                                l_Part_0.Transparency = 1;
                                l_Part_0.Anchored = true;
                                l_Part_0.Parent = workspace;
                                local l_Attachment_0 = Instance.new("Attachment");
                                l_Attachment_0.Position = Vector3.new(0, 0, 0, 0);
                                l_Beam_0.Attachment0 = l_Attachment_0;
                                local v25 = nil;
                                local v26 = l_Target_0 and l_Target_0:FindFirstAncestorOfClass("Model");
                                local v27 = v26 and l_Players_0:GetPlayerFromCharacter(v26);
                                if v26 and v27 then
                                    local l_HumanoidRootPart_1 = v26:FindFirstChild("HumanoidRootPart");
                                    if l_HumanoidRootPart_1 then
                                        l_Attachment_0.Parent = l_HumanoidRootPart_1;
                                    end;
                                else
                                    l_Attachment_0.Parent = l_Part_0;
                                    v25 = Instance.new("BodyVelocity");
                                    v25.MaxForce = Vector3.new(1e999, 1e999, 1e999, 0);
                                    v25.Velocity = l_Unit_0 * 100;
                                    v25.Name = "FlightPower";
                                    v25.P = 2000;
                                    v25.Parent = l_HumanoidRootPart_0;
                                end;
                                l_Hit_0:Play();
                                local v29 = nil;
                                local v30 = nil;
                                do
                                    local l_v25_0, l_v29_0, l_v30_0 = v25, v29, v30;
                                    local function v34() --[[ Line: 102 ]] --[[ Name: finish ]]
                                        -- upvalues: l_v30_0 (ref), l_v29_0 (ref), l_v25_0 (ref), l_Part_0 (copy), l_Attachment_0 (copy), l_Beam_0 (ref)
                                        if l_v30_0 then
                                            l_v30_0:Disconnect();
                                            l_v30_0 = nil;
                                        end;
                                        if l_v29_0 then
                                            if coroutine.status(l_v29_0) == "suspended" then
                                                pcall(task.cancel, l_v29_0);
                                            end;
                                            l_v29_0 = nil;
                                        end;
                                        if l_v25_0 then
                                            l_v25_0:Destroy();
                                        end;
                                        l_Part_0:Destroy();
                                        l_Attachment_0:Destroy();
                                        l_Beam_0.Attachment0 = nil;
                                    end;
                                    l_v30_0 = l_Parent_1:GetAttributeChangedSignal("Stealing"):Connect(function() --[[ Line: 124 ]]
                                        -- upvalues: l_Parent_1 (ref), v34 (copy)
                                        if l_Parent_1:GetAttribute("Stealing") then
                                            task.defer(v34);
                                        end;
                                    end);
                                    l_v29_0 = task.delay(l_Magnitude_0 / 120, function() --[[ Line: 130 ]]
                                        -- upvalues: v34 (copy)
                                        task.defer(v34);
                                    end);
                                    if l_Parent_1:GetAttribute("Stealing") then
                                        task.defer(v34);
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