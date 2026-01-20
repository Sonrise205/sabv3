local _ = game:GetService("ProximityPromptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local _ = game:GetService("HttpService");
local _ = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.Serialization);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local _ = require(l_ReplicatedStorage_0.Packages.Gradients);
local v14 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Packages.Moonlite);
local _ = require(l_ReplicatedStorage_0.Packages.Squash);
local v17 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v18 = require(l_ReplicatedStorage_0.Packages.Timer);
local v19 = require(l_ReplicatedStorage_0.Packages.Trove);
local v20 = require(l_ReplicatedStorage_0.Packages.Spr);
local v21 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v23 = require(l_ReplicatedStorage_0.Controllers.ConfirmationController);
local _ = require(l_ReplicatedStorage_0.Controllers.NewPlayersController);
local _ = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local v27 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.PlotController);
local _ = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local v31 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local _ = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local _ = require(l_ReplicatedStorage_0.Datas.Mutations);
local _ = require(l_ReplicatedStorage_0.Datas.Rarities);
local v40 = require(l_ReplicatedStorage_0.Datas.Animals);
local v41 = v21:RemoteFunction("NewYearsMachine/Delivery");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local _ = l_LocalPlayer_0.PlayerGui;
local v46 = {
    IsEnabled = function(_) --[[ Line: 68 ]] --[[ Name: IsEnabled ]]
        -- upvalues: v17 (copy)
        local l_v17_Instant_0 = v17:GetInstant("NewYearsMachine/EndTime", nil);
        return v17:GetInstant("NewYearsMachine/Enabled", true) and l_v17_Instant_0 ~= nil and DateTime.now().UnixTimestamp < l_v17_Instant_0 and false;
    end
};
v46.Start = function(_) --[[ Line: 75 ]] --[[ Name: Start ]]
    -- upvalues: v14 (copy), v19 (copy), l_Players_0 (copy), l_LocalPlayer_0 (copy), v46 (copy), v23 (copy), v40 (copy), v41 (copy), v20 (copy), v27 (copy), v31 (copy), v18 (copy)
    v14.observeTag("NewYearsMachine", function(v48) --[[ Line: 76 ]]
        -- upvalues: v19 (ref), l_Players_0 (ref), l_LocalPlayer_0 (ref), v46 (ref), v23 (ref), v40 (ref), v41 (ref), v14 (ref), v20 (ref), v27 (ref), v31 (ref), v18 (ref)
        local v49 = v19.new();
        local v50 = false;
        v49:Add(v48.DeliveryHitbox.Touched:Connect(function(v51) --[[ Line: 80 ]]
            -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v46 (ref), v23 (ref), v50 (ref), v40 (ref), v41 (ref)
            if v51.Name ~= "HumanoidRootPart" then
                return;
            else
                local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v51.Parent);
                if not l_l_Players_0_PlayerFromCharacter_0 or l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                    return;
                else
                    local l_l_l_Players_0_PlayerFromCharacter_0_Attribute_0 = l_l_Players_0_PlayerFromCharacter_0:GetAttribute("StealingIndex");
                    if not l_l_l_Players_0_PlayerFromCharacter_0_Attribute_0 then
                        return;
                    elseif not v46:IsEnabled() then
                        return;
                    elseif v23:IsInPrompt() or v50 then
                        return;
                    else
                        v50 = true;
                        task.delay(0.5, function() --[[ Line: 104 ]]
                            -- upvalues: v50 (ref)
                            v50 = false;
                        end);
                        local l_Rarity_0 = v40[l_l_l_Players_0_PlayerFromCharacter_0_Attribute_0].Rarity;
                        local v55 = true;
                        if l_Rarity_0 ~= "OG" then
                            v55 = true;
                            if l_Rarity_0 ~= "Admin" then
                                v55 = true;
                                if l_Rarity_0 ~= "Spooky" then
                                    v55 = true;
                                    if l_Rarity_0 ~= "Taco" then
                                        v55 = true;
                                        if l_Rarity_0 ~= "Secret" then
                                            v55 = true;
                                            if l_Rarity_0 ~= "Brainrot God" then
                                                v55 = true;
                                                if l_Rarity_0 ~= "Mythic" then
                                                    v55 = l_Rarity_0 == "Festive";
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        if v55 and not v23:Show((("Are you sure you want to put a %* Brainrot in the machine?"):format(l_Rarity_0))) then
                            return;
                        else
                            v41:InvokeServer();
                            return;
                        end;
                    end;
                end;
            end;
        end));
        v49:Add(v14.observeTag("NewYearsMachineFill", function(v56) --[[ Line: 120 ]]
            -- upvalues: v48 (copy), v20 (ref)
            local function v58() --[[ Line: 121 ]] --[[ Name: updatePercent ]]
                -- upvalues: v48 (ref), v20 (ref), v56 (copy)
                local v57 = v48:GetAttribute("Fill") or 0;
                v20.target(v56, 1, 2, {
                    Offset = Vector2.new(0, v57)
                });
            end;
            local v59 = v48:GetAttributeChangedSignal("Fill"):Connect(v58);
            v58();
            return function() --[[ Line: 129 ]]
                -- upvalues: v59 (copy)
                v59:Disconnect();
            end;
        end, {
            v48
        }));
        v49:Add(v14.observeTag("NewYearsMachineDisplayText", function(v60) --[[ Line: 134 ]]
            -- upvalues: v27 (ref), v31 (ref), v48 (copy), v18 (ref)
            local function v63() --[[ Line: 135 ]] --[[ Name: updateLabel ]]
                -- upvalues: v27 (ref), v60 (copy), v31 (ref), v48 (ref)
                local l_v27_ActiveEventData_0 = v27:GetActiveEventData("2026");
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                if l_v27_ActiveEventData_0 and l_workspace_ServerTimeNow_0 < l_v27_ActiveEventData_0.endsAt then
                    v60.Text = ("Ends in %*"):format((v31:E(l_v27_ActiveEventData_0.endsAt - l_workspace_ServerTimeNow_0)));
                    return;
                else
                    v60.Text = ("%*%%"):format((math.floor((v48:GetAttribute("Fill") or 0) * 100)));
                    return;
                end;
            end;
            local v64 = v48:GetAttributeChangedSignal("Fill"):Connect(v63);
            local v65 = v18.Simple(1, v63);
            v63();
            return function() --[[ Line: 150 ]]
                -- upvalues: v64 (copy), v65 (copy)
                v64:Disconnect();
                v65:Disconnect();
            end;
        end, {
            v48
        }));
        return v49:WrapClean();
    end);
end;
return v46;