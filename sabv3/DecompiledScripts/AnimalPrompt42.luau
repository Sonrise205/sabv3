local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v3 = require(l_Packages_0.Trove);
local v4 = require(l_Packages_0.Net);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v6 = require(l_Utils_0.NumberUtils);
local v7 = require(l_ReplicatedStorage_0.Datas.Animals);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v9 = require(l_Shared_0.Animals);
local l_FireServer_0 = Instance.new("RemoteEvent").FireServer;
local v11 = v4:RemoteEvent("eb9dee81-7718-4020-b6b2-219888488d13");
local v12 = {};
v12.__index = v12;
v12.GetState = function(v13) --[[ Line: 49 ]] --[[ Name: GetState ]]
    return v13.State;
end;
v12.SetState = function(v14, v15, v16) --[[ Line: 53 ]] --[[ Name: SetState ]]
    -- upvalues: v7 (copy), v6 (copy), v9 (copy)
    v14.State = v15;
    local l_ProximityPrompt_0 = v14.ProximityPrompt;
    local l_AnimalIndex_0 = v14.AnimalIndex;
    local v19 = l_AnimalIndex_0 and v7[l_AnimalIndex_0];
    local v20 = v19 and v19.DisplayName or l_AnimalIndex_0;
    l_ProximityPrompt_0.ObjectText = if not (not l_AnimalIndex_0 or string.find(l_AnimalIndex_0, "None")) and v15 ~= "Sell" then v20 or l_AnimalIndex_0 else "";
    l_ProximityPrompt_0.Enabled = v15 ~= "None";
    l_ProximityPrompt_0:SetAttribute("State", v15);
    if v15 == "Sell" then
        l_ProximityPrompt_0.ActionText = if l_AnimalIndex_0 then ("Sell: $%*"):format((v6:ToString(v9:GetSellValue(l_AnimalIndex_0), 2))) else "";
    elseif v15 == "Open" then
        l_ProximityPrompt_0.ActionText = "Open";
    elseif v15 == "Steal" then
        l_ProximityPrompt_0.ActionText = "Steal";
    elseif v15 == "Grab" then
        l_ProximityPrompt_0.ActionText = "Grab";
    elseif v15 == "Place" then
        l_ProximityPrompt_0.ActionText = "Place";
    elseif v15 == "Return" then
        l_ProximityPrompt_0.ActionText = "Return";
    end;
    if v16 then
        v14.TargetCallback = v16;
    end;
end;
v12.SetCallback = function(v21, v22) --[[ Line: 85 ]] --[[ Name: SetCallback ]]
    v21.TargetCallback = v22;
end;
v12.new = function(v23, v24, v25, v26) --[[ Line: 89 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy), v3 (copy), l_FireServer_0 (copy), v11 (copy)
    local v27 = setmetatable({}, v12);
    v27.Index = v23;
    v27.AnimalIndex = v24;
    v27.Collector = v3.new();
    local l_ProximityPrompt_1 = Instance.new("ProximityPrompt");
    l_ProximityPrompt_1.HoldDuration = 1.5;
    l_ProximityPrompt_1.RequiresLineOfSight = true;
    l_ProximityPrompt_1.Style = Enum.ProximityPromptStyle.Custom;
    if v26 then
        for v29, v30 in v26 do
            l_ProximityPrompt_1[v29] = v30;
        end;
    end;
    v27.ProximityPrompt = l_ProximityPrompt_1;
    l_ProximityPrompt_1.Parent = v25;
    v27.Collector:Add(l_ProximityPrompt_1);
    v27.Collector:Add(l_ProximityPrompt_1.Changed:Connect(function() --[[ Line: 115 ]]
        -- upvalues: l_ProximityPrompt_1 (copy)
        l_ProximityPrompt_1.HoldDuration = 1.5;
        l_ProximityPrompt_1.RequiresLineOfSight = true;
        l_ProximityPrompt_1.MaxActivationDistance = 10;
    end));
    v27.Collector:Add(l_ProximityPrompt_1.PromptButtonHoldBegan:Connect(function() --[[ Line: 121 ]]
        -- upvalues: l_ProximityPrompt_1 (copy)
        l_ProximityPrompt_1.HoldDuration = 1.5;
        l_ProximityPrompt_1.RequiresLineOfSight = true;
        l_ProximityPrompt_1.MaxActivationDistance = 10;
    end));
    v27.Collector:Add(l_ProximityPrompt_1.Triggered:Connect(function() --[[ Line: 127 ]]
        -- upvalues: v27 (copy)
        if v27.TargetCallback then
            v27.TargetCallback();
        end;
    end));
    v27.Collector:Add(l_ProximityPrompt_1.PromptButtonHoldBegan:Connect(function() --[[ Line: 133 ]]
        -- upvalues: v27 (copy), l_FireServer_0 (ref), v11 (ref)
        if v27.State == "Steal" then
            l_FireServer_0(v11, workspace:GetServerTimeNow() + 187, "ebc6aca1-afeb-49f3-9bd8-5be09e1bc187");
            v11:FireServer(workspace:GetServerTimeNow() + 187, "9aba28d9-6365-4f5b-843c-f4830e87c058");
        end;
    end));
    return v27;
end;
v12.Destroy = function(v31) --[[ Line: 159 ]] --[[ Name: Destroy ]]
    v31.Collector:Destroy();
end;
return v12;