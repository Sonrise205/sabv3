local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v4 = require(l_Datas_0.CursedSpinWheel);
local v5 = require(l_Datas_0.Shop);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v7 = require(l_Utils_0.TimeUtils);
local v8 = require(l_Utils_0.NumberUtils);
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local _ = require(l_Controllers_0.ShopController);
local v11 = require(l_Controllers_0.InterfaceController);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v13 = require(l_Shared_0.Marketplace);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v15 = require(l_Packages_0.Trove);
local v16 = require(l_Packages_0.Timer);
local v17 = require(l_Packages_0.Synchronizer);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v19 = {};
v19.__index = v19;
local function _() --[[ Line: 52 ]] --[[ Name: IsEnabled ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    return l_ReplicatedStorage_0:GetAttribute("CursedEvent");
end;
v19.new = function(v21) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v17 (copy), l_LocalPlayer_0 (copy), v19 (copy), v15 (copy), v4 (copy), v5 (copy), v8 (copy), v13 (copy), l_RunService_0 (copy), v11 (copy), v16 (copy), l_ReplicatedStorage_0 (copy), v7 (copy)
    local v22 = v17:Wait(l_LocalPlayer_0);
    local v23 = setmetatable({}, v19);
    v23.Instance = v21;
    v23.Collector = v15.new();
    local function v40() --[[ Line: 67 ]] --[[ Name: setup ]]
        -- upvalues: v21 (copy), v4 (ref), v22 (copy), v5 (ref), v8 (ref), v13 (ref)
        local l_Wheel_0 = v21:WaitForChild("Main"):WaitForChild("SurfaceGui").Wheel;
        local l_Items_0 = l_Wheel_0.Items;
        local l_Names_0 = l_Wheel_0.Names;
        local l_Odds_0 = l_Wheel_0.Odds;
        for v28 = 1, #v4.Rewards do
            local v29 = v4.Rewards[v28];
            if v29 then
                if v29.Type == "Item" and v22:Get((("Items.%*"):format(v29.Index))) then
                    v29 = v4.AltRewards[v28];
                end;
                local l_l_Items_0_FirstChild_0 = l_Items_0:FindFirstChild(v28);
                local l_l_Names_0_FirstChild_0 = l_Names_0:FindFirstChild(v28);
                local l_l_Odds_0_FirstChild_0 = l_Odds_0:FindFirstChild(v28);
                local v33 = "";
                local v34 = "";
                local v35 = "";
                if v29.Type == "Cash-Pack" then
                    local l_Value_0 = v5[v29.Index].Value;
                    local v37 = v22:Get("Rebirth") or 0;
                    if v37 > 0 then
                        l_Value_0 = l_Value_0 * (v37 <= 1 and 1.5 or v37);
                    end;
                    v34 = ("$%*"):format((v8:ToString(l_Value_0, 2)));
                    local l_Index_0 = v29.Index;
                    v33 = v13:GetProductInfo(l_Index_0, "Product").Icon;
                else
                    v33 = v29.Icon;
                end;
                local l_Display_0 = v29.Display;
                v34 = v34 == "" and l_Display_0 or v34;
                v35 = ("%*%%"):format(v29.Weight);
                l_l_Items_0_FirstChild_0.Image = v33 or "";
                l_l_Names_0_FirstChild_0.Text = v34;
                l_l_Odds_0_FirstChild_0.Text = v35;
            end;
        end;
    end;
    v40();
    v23.Collector:Add(v22:OnDictionaryInserted("Items", function(_, v42) --[[ Line: 125 ]]
        -- upvalues: v4 (ref), v40 (copy)
        local v43 = false;
        for v44 = 1, #v4.Rewards do
            local v45 = v4.Rewards[v44];
            if v45.Type == "Item" and v42 == v45.Index then
                v43 = true;
                break;
            end;
        end;
        if v43 then
            v40();
        end;
    end));
    v23.Collector:Add(l_RunService_0.RenderStepped:Connect(function(v46) --[[ Line: 139 ]]
        -- upvalues: v23 (copy)
        debug.profilebegin("CursedSpinWheel:Rotate3D");
        local l_Main_0 = v23.Instance.Main;
        l_Main_0.CFrame = l_Main_0.CFrame * CFrame.Angles(0, 0, (math.rad(v46 * 45)));
        debug.profileend();
    end));
    v23.Collector:Add(v23.Instance.Root.ProximityPrompt.Triggered:Connect(function() --[[ Line: 147 ]]
        -- upvalues: v11 (ref)
        v11:Toggle("CursedWheel", true);
    end));
    local v48 = v16.new(1);
    v23.Collector:Add(v48, "Destroy");
    v23.Collector:Add(v48.Tick:Connect(function() --[[ Line: 153 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v22 (copy), v23 (copy), v7 (ref)
        if l_ReplicatedStorage_0:GetAttribute("CursedEvent") then
            if v22:Get("CursedSpinWheel.LastFreeClaimed") ~= l_ReplicatedStorage_0:GetAttribute("CursedEventLastTime") then
                v23.Instance.Overhead.BillboardGui.Countdown.Text = "SPIN NOW";
                return;
            else
                v23.Instance.Overhead.BillboardGui.Countdown.Text = ("Free Spin in %*"):format((v7:D((l_ReplicatedStorage_0:GetAttribute("NextCursedEvent") or 0) - workspace:GetServerTimeNow())));
                return;
            end;
        else
            v23.Instance.Overhead.BillboardGui.Countdown.Text = ("Free Spin in %*"):format((v7:D((l_ReplicatedStorage_0:GetAttribute("NextCursedEvent") or 0) - workspace:GetServerTimeNow())));
            return;
        end;
    end));
    v48:StartNow();
    return v23;
end;
v19.Destroy = function(v49) --[[ Line: 171 ]] --[[ Name: Destroy ]]
    v49.Collector:Destroy();
end;
return v19;