local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_StockEventController_0 = l_ReplicatedStorage_0.Controllers.StockEventController;
local v4 = require(l_StockEventController_0.ClientAPI);
local v5 = require(l_StockEventController_0);
local v6 = require(l_StockEventController_0.Interfaces.Single);
local v7 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v8 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v9 = require(l_ReplicatedStorage_0.Packages.Observers);
local v10 = require(l_ReplicatedStorage_0.Packages.Timer);
local v11 = require(l_ReplicatedStorage_0.Packages.Trove);
local v12 = require(l_ReplicatedStorage_0.Packages.Net);
local v13 = v4.create("NewYears2026");
return {
    Start = function(_) --[[ Line: 24 ]] --[[ Name: Start ]]
        -- upvalues: v9 (copy), l_ReplicatedStorage_0 (copy), v13 (copy), v6 (copy), v11 (copy), v8 (copy), l_LocalPlayer_0 (copy), v5 (copy), v10 (copy), l_Players_0 (copy), v12 (copy), v7 (copy)
        v9.observeAttribute(l_ReplicatedStorage_0, "StockEvent", function(v15) --[[ Line: 25 ]]
            -- upvalues: v13 (ref), v6 (ref), v9 (ref), v11 (ref), v8 (ref), l_LocalPlayer_0 (ref), v5 (ref), v10 (ref), l_Players_0 (ref), v12 (ref), v7 (ref), l_ReplicatedStorage_0 (ref)
            if not v15 then
                return nil;
            else
                local v16, v17 = v13:ListItems();
                if not v16 or typeof(v17) ~= "table" then
                    return nil;
                else
                    local v18 = v6:Setup(v13, v17);
                    local v22 = v9.observeTag("StockMachinePrompt", function(v19) --[[ Line: 38 ]]
                        -- upvalues: v11 (ref), v8 (ref), l_LocalPlayer_0 (ref), v5 (ref), v10 (ref), v18 (copy)
                        local v20 = v11.new();
                        local function v21() --[[ Line: 41 ]] --[[ Name: updatePrompt ]]
                            -- upvalues: v8 (ref), l_LocalPlayer_0 (ref), v19 (copy), v5 (ref)
                            if not v8:Wait(l_LocalPlayer_0) then
                                return;
                            else
                                v19.Enabled = v5:IsEnabled();
                                return;
                            end;
                        end;
                        v20:Add(task.spawn(function() --[[ Line: 50 ]]
                            -- upvalues: v8 (ref), l_LocalPlayer_0 (ref), v20 (copy), v10 (ref), v21 (copy)
                            if not v8:Wait(l_LocalPlayer_0) then
                                return;
                            else
                                v20:Add(v10.Simple(1, v21));
                                task.spawn(v21);
                                return;
                            end;
                        end));
                        v20:Add(v19.Triggered:Connect(function() --[[ Line: 60 ]]
                            -- upvalues: v8 (ref), l_LocalPlayer_0 (ref), v18 (ref)
                            if not v8:Get(l_LocalPlayer_0) then
                                return;
                            else
                                v18:Toggle();
                                return;
                            end;
                        end));
                        return function() --[[ Line: 69 ]]
                            -- upvalues: v20 (copy)
                            v20:Destroy();
                        end;
                    end);
                    local v30 = v9.observeTag("StockMachine", function(v23) --[[ Line: 74 ]]
                        -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v5 (ref), v12 (ref), v13 (ref), v7 (ref), l_ReplicatedStorage_0 (ref)
                        local v29 = v23.DeliveryHitbox.Touched:Connect(function(v24) --[[ Line: 75 ]]
                            -- upvalues: l_Players_0 (ref), l_LocalPlayer_0 (ref), v5 (ref), v12 (ref), v13 (ref), v23 (copy), v7 (ref), l_ReplicatedStorage_0 (ref)
                            if v24.Name ~= "HumanoidRootPart" then
                                return;
                            else
                                local l_l_Players_0_PlayerFromCharacter_0 = l_Players_0:GetPlayerFromCharacter(v24.Parent);
                                if not l_l_Players_0_PlayerFromCharacter_0 or l_l_Players_0_PlayerFromCharacter_0 ~= l_LocalPlayer_0 then
                                    return;
                                elseif not l_l_Players_0_PlayerFromCharacter_0:GetAttribute("StealingIndex") then
                                    return;
                                elseif not v5:IsEnabled() then
                                    return;
                                else
                                    local v26, _, _ = v12:RemoteFunction("StockEventService/Delivery"):InvokeServer(v13.MachineName, v23.DeliveryHitbox);
                                    if not v26 then
                                        return;
                                    else
                                        task.spawn(function() --[[ Line: 99 ]]
                                            -- upvalues: v7 (ref), l_ReplicatedStorage_0 (ref)
                                            v7:PlaySound(l_ReplicatedStorage_0.Sounds.Sfx["Fuse Machine"].Deposit);
                                        end);
                                        return;
                                    end;
                                end;
                            end;
                        end);
                        return function() --[[ Line: 105 ]]
                            -- upvalues: v29 (copy)
                            v29:Disconnect();
                        end;
                    end);
                    return function() --[[ Line: 110 ]]
                        -- upvalues: v18 (copy), v22 (copy), v30 (copy)
                        v18:Close();
                        v18:Destroy();
                        v22();
                        v30();
                    end;
                end;
            end;
        end);
    end
};