local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_ReplicatedStorage_0.Packages.ReplicatorClient);
local v5 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v6 = require(l_ReplicatedStorage_0.Packages.Observers);
local v7 = require(l_ReplicatedStorage_0.Packages.Spr);
local v8 = require(l_ReplicatedStorage_0.Packages.Net);
local v9 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v10 = require(l_ReplicatedStorage_0.Shared.TsunamiEventData);
local v11 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v12 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local v13 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
if not v11.IsTsunamiServer() then
    return {};
else
    local v14 = v8:RemoteEvent("TsunamiEventService/BuySpeedUpgrade");
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    local l_TsunamiSpeedUpgrade_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("TsunamiSpeedUpgrade").TsunamiSpeedUpgrade;
    return {
        Start = function(_) --[[ Line: 36 ]] --[[ Name: Start ]]
            -- upvalues: v11 (copy), v9 (copy), l_TsunamiSpeedUpgrade_0 (copy), v5 (copy), l_LocalPlayer_0 (copy), v10 (copy), v12 (copy), v14 (copy), v13 (copy), v7 (copy), v6 (copy), v4 (copy), l_ReplicatedStorage_0 (copy), l_RunService_0 (copy)
            if not v11.IsTsunamiServer() then
                return;
            else
                local v18 = v9:Register("TsunamiSpeedUpgrade", l_TsunamiSpeedUpgrade_0, "TopQuint");
                v18:AttachCloseButton(l_TsunamiSpeedUpgrade_0.Header.Close);
                v18:Close();
                local v19 = v5:Wait(l_LocalPlayer_0);
                if not v19 then
                    return;
                else
                    local v20 = {};
                    for v21, v22 in v10.upgrades do
                        local v23 = l_TsunamiSpeedUpgrade_0.Content.List.Template:Clone();
                        v23.Name = tostring(v21);
                        v23.LayoutOrder = v21;
                        v23.Frame.Label.Text = ("+%* Speed"):format(v22);
                        v23.Frame.Tip.Text = ("+%*"):format(v22);
                        v23.Visible = true;
                        v23.Parent = l_TsunamiSpeedUpgrade_0.Content.List;
                        v20[v21] = v23;
                        local v24 = v12.new(v23.Frame.Buy);
                        v24:Animate();
                        v24.OnActivated:Connect(function() --[[ Line: 64 ]]
                            -- upvalues: v14 (ref), v21 (copy)
                            v14:FireServer(v21);
                        end);
                    end;
                    local function v30() --[[ Line: 69 ]] --[[ Name: updateSpeedUpgrades ]]
                        -- upvalues: v19 (copy), v10 (ref), v20 (copy), v13 (ref), v7 (ref)
                        local v25 = v19:Get({
                            "TsunamiEvent", 
                            "SpeedUpgrades"
                        });
                        for v26, v27 in v10.upgrades do
                            local v28 = v20[v26];
                            local v29 = v10.getUpgradeCost(v25, v27);
                            v28.Frame.Buy.Price.Text = ("Buy ($%*)"):format((v13:ToString(v29)));
                            v28.Frame.PreviousAmount.Text = v10.getTotalSpeed(v25);
                            v28.Frame.TargetAmount.Text = v10.getTotalSpeed(v25 + v27);
                            v7.target(v28.Frame.Buy, 1, 5, {
                                BackgroundColor3 = if v29 <= v19:Get("Coins") then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(158, 158, 158)
                            });
                        end;
                    end;
                    v19:OnChanged({
                        "TsunamiEvent", 
                        "SpeedUpgrades"
                    }, v30);
                    v19:OnChanged("Coins", v30);
                    task.spawn(v30);
                    local v31 = nil;
                    local function v34() --[[ Line: 87 ]] --[[ Name: updateVIPAreas ]]
                        -- upvalues: v31 (ref), v19 (copy), v6 (ref)
                        if typeof(v31) == "function" then
                            v31();
                            v31 = nil;
                        end;
                        local v32 = v19:Get("Gamepass.VIP") == true;
                        v31 = v6.observeTag("VIPAreas", function(v33) --[[ Line: 95 ]]
                            -- upvalues: v32 (copy)
                            v33.CanCollide = not v32;
                            return nil;
                        end);
                    end;
                    v19:OnChanged("Gamepass.VIP", v34);
                    task.spawn(v34);
                    local v35 = v4.get("TsunamiEvent/Tsunamis");
                    if not _G.__REPLICATOR_INIT then
                        _G.__REPLICATOR_INIT = true;
                        task.spawn(v4.init);
                    end;
                    local l_Folder_0 = Instance.new("Folder");
                    l_Folder_0.Name = "Tsunamis";
                    l_Folder_0.Parent = workspace;
                    local v37 = {};
                    local v38 = {};
                    local function _(v39) --[[ Line: 118 ]] --[[ Name: removeTsunami ]]
                        -- upvalues: v37 (copy), v38 (copy)
                        local v40 = v37[v39];
                        if v40 then
                            v40:Destroy();
                            v37[v39] = nil;
                        end;
                        v38[v39] = nil;
                    end;
                    local function v52() --[[ Line: 127 ]] --[[ Name: reconcileTsunamis ]]
                        -- upvalues: v35 (copy), l_Folder_0 (copy), l_ReplicatedStorage_0 (ref), v10 (ref), v37 (copy), v38 (copy)
                        local v42 = v35:TryIndex({
                            "tsunamis"
                        });
                        if not v42 then
                            return;
                        else
                            local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                            local v44 = {};
                            for _, v46 in v42 do
                                if v46.despawnsAt >= l_workspace_ServerTimeNow_0 then
                                    local l_id_0 = v46.id;
                                    v44[l_id_0] = true;
                                    if not l_Folder_0:FindFirstChild(l_id_0) then
                                        local v48 = l_ReplicatedStorage_0.Models.Tsunamis[v46.name]:Clone();
                                        v48.Name = l_id_0;
                                        v48:PivotTo(v10.getTsunamiPositionAtTime(v46, l_workspace_ServerTimeNow_0));
                                        v48.Parent = l_Folder_0;
                                        local _ = v48;
                                        v37[l_id_0] = v48;
                                        v38[l_id_0] = v46;
                                    end;
                                end;
                            end;
                            for v50 in v37 do
                                if not v44[v50] then
                                    local v51 = v37[v50];
                                    if v51 then
                                        v51:Destroy();
                                        v37[v50] = nil;
                                    end;
                                    v38[v50] = nil;
                                end;
                            end;
                            return;
                        end;
                    end;
                    l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 164 ]]
                        -- upvalues: v37 (copy), v38 (copy), v10 (ref)
                        debug.profilebegin("updateTsunamis");
                        local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
                        for v55, v56 in v37 do
                            local v57 = v38[v55];
                            if v57 then
                                if v57.despawnsAt <= l_workspace_ServerTimeNow_1 then
                                    local v58 = v37[v55];
                                    if v58 then
                                        v58:Destroy();
                                        v37[v55] = nil;
                                    end;
                                    v38[v55] = nil;
                                else
                                    v56:PivotTo(v10.getTsunamiPositionAtTime(v57, l_workspace_ServerTimeNow_1));
                                end;
                            end;
                        end;
                        debug.profileend();
                    end);
                    v35:Observe({
                        "tsunamis"
                    }, v52);
                    task.spawn(v52);
                    return;
                end;
            end;
        end
    };
end;