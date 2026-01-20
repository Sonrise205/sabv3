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
l_Parent_0.Activated:Connect(function() --[[ Line: 24 ]]
    -- upvalues: l_Parent_1 (copy), l_ReplicatedStorage_0 (copy), v6 (copy), v5 (copy), l_Beam_0 (copy), l_Players_0 (copy)
    if l_Parent_1:GetAttribute("Stealing") then
        return;
    else
        local v12 = require(l_ReplicatedStorage_0.Packages.PlayerMouse);
        local l_Hit_0 = v12.Hit;
        local l_Target_0 = v12.Target;
        if not l_Target_0 then
            return;
        else
            local l_Position_0 = l_Hit_0.Position;
            local l_Character_0 = l_Parent_1.Character;
            if not l_Character_0 then
                return;
            else
                local l_l_Character_0_FirstChildWhichIsA_0 = l_Character_0:FindFirstChildWhichIsA("Tool", true);
                if not l_l_Character_0_FirstChildWhichIsA_0 then
                    return;
                elseif l_l_Character_0_FirstChildWhichIsA_0.Name ~= "Sabuk Bepak" then
                    return;
                else
                    local l_HumanoidRootPart_0 = l_Character_0:FindFirstChild("HumanoidRootPart");
                    if not l_HumanoidRootPart_0 then
                        return;
                    else
                        local _ = (l_Position_0 - l_HumanoidRootPart_0.Position).Unit;
                        local l_Magnitude_0 = (l_Position_0 - l_HumanoidRootPart_0.Position).Magnitude;
                        if l_Magnitude_0 >= 10 and l_Magnitude_0 <= 50 then
                            if v6(("ItemUse/SabukBepak/Client/%*"):format(l_Parent_1.Name), 15) then
                                return;
                            else
                                v5:RemoteEvent("UseItem"):FireServer(l_Magnitude_0 / 120, l_Hit_0.Position, l_Target_0);
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
                                local v23 = l_Target_0 and l_Target_0:FindFirstAncestorOfClass("Model");
                                local v24 = v23 and l_Players_0:GetPlayerFromCharacter(v23);
                                if v23 and v24 then
                                    local l_HumanoidRootPart_1 = v23:FindFirstChild("HumanoidRootPart");
                                    if l_HumanoidRootPart_1 then
                                        l_Attachment_0.Parent = l_HumanoidRootPart_1;
                                    end;
                                else
                                    l_Part_0:Destroy();
                                end;
                                local v26 = nil;
                                do
                                    local l_v26_0 = v26;
                                    local function v28() --[[ Line: 92 ]] --[[ Name: finish ]]
                                        -- upvalues: l_v26_0 (ref), l_Part_0 (copy), l_Attachment_0 (copy), l_Beam_0 (ref)
                                        if l_v26_0 then
                                            if coroutine.status(l_v26_0) == "suspended" then
                                                pcall(task.cancel, l_v26_0);
                                            end;
                                            l_v26_0 = nil;
                                        end;
                                        l_Part_0:Destroy();
                                        l_Attachment_0:Destroy();
                                        l_Beam_0.Attachment0 = nil;
                                    end;
                                    l_v26_0 = task.delay(l_Magnitude_0 / 120, function() --[[ Line: 105 ]]
                                        -- upvalues: v28 (copy)
                                        task.defer(v28);
                                    end);
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