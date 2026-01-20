local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Classes.PlotClient);
local v3 = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v4 = require(l_ReplicatedStorage_0.Shared.Friends);
local v5 = require(l_ReplicatedStorage_0.UserGenerated.ABTests);
local v6 = require(l_ReplicatedStorage_0.Packages.Net);
local v7 = OverlapParams.new();
v7.FilterDescendantsInstances = {};
v7.FilterType = Enum.RaycastFilterType.Include;
v7.MaxParts = 1;
local function v11(v8) --[[ Line: 18 ]] --[[ Name: PlotSearch ]]
    -- upvalues: v3 (copy), v7 (copy)
    for _, v10 in pairs(v3:GetPlots()) do
        if v10:GetOwner() then
            v7.FilterDescendantsInstances = {
                v10.PlotModel.StealHitbox
            };
            if #workspace:GetPartBoundsInBox(v8, Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582, 0), v7) > 0 then
                return v10, 1;
            end;
        end;
    end;
    return nil, 0;
end;
local function _(v12) --[[ Line: 37 ]] --[[ Name: PlotSearchPlayer ]]
    -- upvalues: v11 (copy)
    local l_Character_0 = v12.Character;
    if not l_Character_0 or not l_Character_0.PrimaryPart then
        return nil, 0;
    else
        local l_Humanoid_0 = l_Character_0:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_0 or l_Humanoid_0.Health <= 0 then
            return nil, 0;
        else
            local l_l_Character_0_Pivot_0 = l_Character_0:GetPivot();
            local v16, v17 = v11(l_l_Character_0_Pivot_0);
            return v16, v17;
        end;
    end;
end;
local v19 = {
    "BlockEndTimeFirstFloor", 
    "BlockEndTimeSecondFloor", 
    "BlockEndTimeThirdFloor"
};
local function v27(v20, v21, _) --[[ Line: 53 ]] --[[ Name: IsBlocked ]]
    -- upvalues: v19 (copy), v4 (copy)
    local l_v21_Owner_0 = v21:GetOwner();
    if not l_v21_Owner_0 then
        return false;
    elseif l_v21_Owner_0 == v20 then
        return false;
    elseif v20:GetAttribute("IgnoreLasers") then
        return false;
    else
        local v24 = false;
        for _, v26 in ipairs(v19) do
            if v21.Channel:Get(v26) ~= nil then
                v24 = true;
                break;
            end;
        end;
        if not v24 then
            return false;
        elseif v21.Channel:Get("FriendsAllowed") == true and table.find(v4:GetInGameFriends(v20), l_v21_Owner_0) then
            return false;
        else
            return true;
        end;
    end;
end;
local function v36(v28) --[[ Line: 80 ]] --[[ Name: TestEligible ]]
    -- upvalues: v5 (copy), v11 (copy), v27 (copy)
    if not v5.GetAttribute(v28, "LeaveBaseButton", false) then
        return false;
    elseif v28:GetAttribute("InNorthPole") then
        return false;
    elseif v28:GetAttribute("Web") then
        return false;
    elseif v28:GetAttribute("Freeze") then
        return false;
    elseif v28:GetAttribute("Stealing") then
        return false;
    else
        local l_Character_1 = v28.Character;
        local v30, v31;
        if not l_Character_1 or not l_Character_1.PrimaryPart then
            v30 = nil;
            v31 = 0;
        else
            local l_Humanoid_1 = l_Character_1:FindFirstChildOfClass("Humanoid");
            if not l_Humanoid_1 or l_Humanoid_1.Health <= 0 then
                v30 = nil;
                v31 = 0;
            else
                local l_l_Character_1_Pivot_0 = l_Character_1:GetPivot();
                local v34, v35 = v11(l_l_Character_1_Pivot_0);
                v30 = v34;
                v31 = v35;
            end;
        end;
        if not v30 then
            return false;
        elseif not v27(v28, v30, v31) then
            return false;
        else
            return true;
        end;
    end;
end;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_LeaveBase_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("ToolsFrames"):WaitForChild("LeaveBase");
task.spawn(function() --[[ Line: 100 ]]
    -- upvalues: l_LeaveBase_0 (copy), v36 (copy), l_LocalPlayer_0 (copy)
    while true do
        l_LeaveBase_0.Visible = v36(l_LocalPlayer_0);
        task.wait(0.1);
    end;
end);
l_LeaveBase_0.Activate.Activated:Connect(function() --[[ Line: 107 ]]
    -- upvalues: l_LeaveBase_0 (copy), v6 (copy)
    if not l_LeaveBase_0.Visible then
        return;
    else
        v6:RemoteEvent("PlotService/Leave"):FireServer();
        return;
    end;
end);