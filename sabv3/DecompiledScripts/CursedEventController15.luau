local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SoundService_0 = game:GetService("SoundService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v6 = require(l_Controllers_0.InterfaceController);
local _ = require(l_Controllers_0.ShopController);
local v8 = require(l_Controllers_0.NotificationController);
local _ = require(l_Controllers_0.SoundController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v11 = require(l_Packages_0.Observers);
local v12 = require(l_Packages_0.Synchronizer);
local v13 = require(l_Packages_0.Timer);
local _ = require(l_Packages_0.Trove);
local v15 = require(l_Packages_0.Net);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v17 = require(l_Utils_0.TimeUtils);
local v18 = require(l_Utils_0.NumberUtils);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v20 = require(l_Datas_0.CursedSpinWheel);
local v21 = require(l_Datas_0.Shop);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v23 = require(script.CursedSpinWheel);
local v24 = require(l_Classes_0.AnimatedButton);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v26 = require(l_Shared_0.Marketplace);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CursedWheel_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("CursedWheel").CursedWheel;
local v29 = nil;
local v30 = false;
local v31 = v15:RemoteEvent("ShopService/Purchase");
local v32 = v15:RemoteEvent("CursedEventService/Spin");
local _ = v15:RemoteFunction("CursedEventService/RequestBuy");
local v34 = false;
local _ = {};
local v36 = {};
local function _() --[[ Line: 61 ]] --[[ Name: IsEnabled ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    return l_ReplicatedStorage_0:GetAttribute("CursedEvent");
end;
local function v58(v38, v39) --[[ Line: 65 ]] --[[ Name: ResultAnimation ]]
    -- upvalues: v12 (copy), l_LocalPlayer_0 (copy), v34 (ref), l_CursedWheel_0 (copy), l_SoundService_0 (copy), v30 (ref), l_RunService_0 (copy), l_TweenService_0 (copy), v20 (copy), v21 (copy), v18 (copy), v8 (copy)
    local v40 = v12:Wait(l_LocalPlayer_0);
    if v34 then
        return;
    else
        v34 = true;
        local l_Wheel_0 = l_CursedWheel_0.Wheel;
        local l_Spinning_0 = l_SoundService_0:FindFirstChild("Spinning");
        local v43 = v30 and 1 or 0.8;
        if l_Spinning_0 then
            l_Spinning_0.Looped = true;
            l_Spinning_0.Volume = v43;
            l_Spinning_0:Play();
        end;
        local v44 = (v38 - 1) * -60 - (math.random() - 0.5) * 0.7 * 60;
        local v45 = v44 + (v30 and 1 or 9) * 360;
        local v46 = v30 and 0.5 or 5;
        local v47 = nil;
        local v49 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 90 ]]
            -- upvalues: l_Wheel_0 (copy), v47 (ref), l_CursedWheel_0 (ref), l_TweenService_0 (ref)
            debug.profilebegin("CursedEventController:ResultAnimation");
            local v48 = (l_Wheel_0.Rotation + 30) / 60 // 1;
            if v47 ~= v48 then
                v47 = v48;
                l_CursedWheel_0.Tick.Rotation = -40;
                l_TweenService_0:Create(l_CursedWheel_0.Tick, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                    Rotation = 0
                }):Play();
            end;
            debug.profileend();
        end);
        local v50 = TweenInfo.new(v46, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
        local v51 = l_TweenService_0:Create(l_Wheel_0, v50, {
            Rotation = v45
        });
        local _ = nil;
        if l_Spinning_0 then
            l_TweenService_0:Create(l_Spinning_0, TweenInfo.new(v46, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Volume = 0
            }):Play();
        end;
        v51:Play();
        v51.Completed:Wait();
        v49:Disconnect();
        l_Wheel_0.Rotation = v44;
        if l_Spinning_0 then
            l_Spinning_0:Stop();
            l_Spinning_0.Volume = v43;
        end;
        local v53 = v39 == true and v20.AltRewards[v38] or v20.Rewards[v38];
        local v54 = "";
        if v53.Type == "Cash-Pack" then
            local v55 = v21[v53.Index];
            if not v21 then
                return false;
            else
                local v56 = v55.Value or 0;
                local v57 = v40:Get("Rebirth") or 0;
                if v57 > 0 then
                    v56 = v56 * (v57 <= 1 and 1.5 or v57);
                end;
                v54 = ("$%*"):format((v18:ToString(v56, 2)));
            end;
        else
            v54 = v53.Display;
        end;
        v8:Success((("You received %*!"):format(v54)));
        v34 = false;
        return;
    end;
end;
v36.SetupCursedWheel = function(_) --[[ Line: 145 ]] --[[ Name: SetupCursedWheel ]]
    -- upvalues: v29 (ref), v6 (copy), l_CursedWheel_0 (copy), v12 (copy), l_LocalPlayer_0 (copy), v20 (copy), v21 (copy), v18 (copy), v26 (copy), v34 (ref), v24 (copy), v30 (ref), v31 (copy), v32 (copy), l_ReplicatedStorage_0 (copy), v17 (copy), v58 (copy), v13 (copy), v11 (copy), v23 (copy)
    v29 = v6:Register("CursedWheel", l_CursedWheel_0, "TopQuint");
    v29:AttachCloseButton(l_CursedWheel_0.Close);
    v29:Close();
    local v60 = v12:Wait(l_LocalPlayer_0);
    local function v83() --[[ Line: 153 ]] --[[ Name: setup ]]
        -- upvalues: l_CursedWheel_0 (ref), v20 (ref), v60 (copy), v21 (ref), v18 (ref), v26 (ref)
        local l_Wheel_1 = l_CursedWheel_0.Wheel;
        local l_Items_0 = l_Wheel_1.Items;
        local l_Names_0 = l_Wheel_1.Names;
        local l_Odds_0 = l_Wheel_1.Odds;
        local v65 = {};
        for v66 = 1, #v20.Rewards do
            local v67 = v20.Rewards[v66];
            if v67 then
                if v67.Type == "Item" and v60:Get((("Items.%*"):format(v67.Index))) then
                    v67 = v20.AltRewards[v66];
                end;
                v65[v66] = v67.Weight;
            end;
        end;
        local v68 = 0;
        for _, v70 in v65 do
            v68 = v68 + v70;
        end;
        v65[5] = v65[5] + (100 - v68);
        for v71 = 1, #v20.Rewards do
            local v72 = v20.Rewards[v71];
            if v72 then
                if v72.Type == "Item" and v60:Get((("Items.%*"):format(v72.Index))) then
                    v72 = v20.AltRewards[v71];
                end;
                local l_l_Items_0_FirstChild_0 = l_Items_0:FindFirstChild(v71);
                local l_l_Names_0_FirstChild_0 = l_Names_0:FindFirstChild(v71);
                local l_l_Odds_0_FirstChild_0 = l_Odds_0:FindFirstChild(v71);
                local v76 = "";
                local v77 = "";
                local v78 = "";
                if v72.Type == "Cash-Pack" then
                    local l_Value_0 = v21[v72.Index].Value;
                    local v80 = v60:Get("Rebirth") or 0;
                    if v80 > 0 then
                        l_Value_0 = l_Value_0 * (v80 <= 1 and 1.5 or v80);
                    end;
                    v77 = ("$%*"):format((v18:ToString(l_Value_0, 2)));
                    local l_Index_0 = v72.Index;
                    v76 = v26:GetProductInfo(l_Index_0, "Product").Icon;
                else
                    v76 = v72.Icon;
                end;
                local l_Display_0 = v72.Display;
                v77 = v77 == "" and l_Display_0 or v77;
                v78 = ("%*%%"):format(math.floor(v65[v71] * 100) / 100);
                l_l_Items_0_FirstChild_0.Image = v76;
                l_l_Names_0_FirstChild_0.Text = v77;
                l_l_Odds_0_FirstChild_0.Text = v78;
            end;
        end;
    end;
    v83();
    v60:OnDictionaryInserted("Items", function(_, v85) --[[ Line: 228 ]]
        -- upvalues: v20 (ref), v34 (ref), v83 (copy)
        local v86 = false;
        for v87 = 1, #v20.Rewards do
            local v88 = v20.Rewards[v87];
            if v88.Type == "Item" and v85 == v88.Index then
                v86 = true;
                break;
            end;
        end;
        if v86 then
            while v34 do
                task.wait();
            end;
            v83();
        end;
    end);
    local l_Toggle_0 = l_CursedWheel_0.FastSpin.Toggle;
    local v90 = v24.new(l_Toggle_0);
    v90:Animate();
    local function _() --[[ Line: 250 ]] --[[ Name: updateFastSpin ]]
        -- upvalues: l_Toggle_0 (copy), v30 (ref)
        l_Toggle_0.Checkmark.Visible = v30;
    end;
    v90.OnActivated:Connect(function() --[[ Line: 254 ]]
        -- upvalues: v30 (ref), l_Toggle_0 (copy)
        v30 = not v30;
        l_Toggle_0.Checkmark.Visible = v30;
    end);
    l_Toggle_0.Checkmark.Visible = v30;
    for _, v93 in l_CursedWheel_0.Buttons:GetChildren() do
        if v93:IsA("ImageButton") and v93.Name ~= "Spin" then
            local v94 = v24.new(v93);
            v94:Animate();
            v94.OnActivated:Connect(function() --[[ Line: 266 ]]
                -- upvalues: v31 (ref), v93 (copy)
                v31:FireServer(v93:GetAttribute("ProductId"));
            end);
            local l_v26_ProductInfo_0 = v26:GetProductInfo(v93:GetAttribute("ProductId"), "Product");
            v93.RbxAmount.Text = l_v26_ProductInfo_0.PriceInRobux;
        end;
    end;
    local l_Spin_0 = l_CursedWheel_0.Buttons.Spin;
    local v97 = v24.new(l_Spin_0);
    v97:Animate();
    v97.OnActivated:Connect(function() --[[ Line: 277 ]]
        -- upvalues: v34 (ref), v32 (ref)
        if v34 == true then
            return;
        else
            v32:FireServer();
            return;
        end;
    end);
    local function v101() --[[ Line: 283 ]] --[[ Name: mainLoop ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v60 (copy), l_Spin_0 (copy), v17 (ref), l_CursedWheel_0 (ref)
        local v98 = 0;
        if l_ReplicatedStorage_0:GetAttribute("CursedEvent") then
            if v60:Get("CursedSpinWheel.LastFreeClaimed") ~= l_ReplicatedStorage_0:GetAttribute("CursedEventLastTime") then
                v98 = v98 + 1;
                l_Spin_0.Main.Timer.Text = "SPIN NOW";
            else
                l_Spin_0.Main.Timer.Text = ("Free Spin in %*"):format((v17:D((l_ReplicatedStorage_0:GetAttribute("NextCursedEvent") or 0) - workspace:GetServerTimeNow())));
            end;
        else
            l_Spin_0.Main.Timer.Text = ("Free Spin in %*"):format((v17:D((l_ReplicatedStorage_0:GetAttribute("NextCursedEvent") or 0) - workspace:GetServerTimeNow())));
        end;
        v98 = v98 + v60:Get("CursedSpinWheel.Spins");
        l_Spin_0.Main.Spins.Text = v98 > 1 and ("Spins (%*)"):format(v98) or ("Spin (%*)"):format(v98);
        l_Spin_0.Main.UIGradient.Enabled = v98 <= 0;
        local v99 = workspace:GetServerTimeNow() - v60:Get("CursedSpinWheel.LastDailyDiscount") >= 86400;
        l_CursedWheel_0.Buttons.Buy1.Visible = not v99;
        l_CursedWheel_0.Buttons.Buy1Discount.Visible = v99;
        local v100 = v60:Get("CursedSpinWheel.PaidSpins.x3") >= 5;
        l_CursedWheel_0.Buttons.Buy10.Visible = v100;
        l_CursedWheel_0.Buttons.Buy3.Visible = not v100;
    end;
    v32.OnClientEvent:Connect(function(v102, v103) --[[ Line: 319 ]]
        -- upvalues: v101 (copy), v58 (ref)
        task.spawn(v101);
        v58(v102, v103);
    end);
    v13.Simple(1, v101);
    v11.observeTag("CursedSpinWheel", function(v104) --[[ Line: 326 ]]
        -- upvalues: v23 (ref)
        local v105 = v23.new(v104);
        return function() --[[ Line: 328 ]]
            -- upvalues: v105 (copy)
            v105:Destroy();
        end;
    end);
    l_ReplicatedStorage_0:GetAttributeChangedSignal("CursedWheelActive"):Connect(function() --[[ Line: 333 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v29 (ref), v6 (ref)
        if l_ReplicatedStorage_0:GetAttribute("CursedWheelActive") == false and v29:IsOpened() then
            v6:Toggle("CursedWheel", false);
        end;
    end);
end;
v36.Start = function(v106) --[[ Line: 340 ]] --[[ Name: Start ]]
    v106:SetupCursedWheel();
end;
return v36;