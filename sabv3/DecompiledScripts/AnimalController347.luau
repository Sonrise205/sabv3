local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v3 = require(l_Packages_0.Observers);
local v4 = require(l_Packages_0.Synchronizer);
local v5 = require(l_Packages_0.Signal);
local v6 = require(l_ReplicatedStorage_0.Packages.Net);
local v7 = require(l_ReplicatedStorage_0.Packages.Trove);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v9 = require(l_Classes_0.AnimalClient);
local v10 = {};
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_FireServer_0 = Instance.new("RemoteEvent").FireServer;
local v13 = v6:RemoteEvent("6411a778-07a5-4513-b1c7-60b65ae05ac8");
local v32 = {
    OnAnimalSpawn = v5.new(), 
    OnAnimalDestroyed = v5.new(), 
    OnFollowingChanged = v5.new(), 
    HasAnimalMovingToBase = function(_, _) --[[ Line: 35 ]] --[[ Name: HasAnimalMovingToBase ]]
        -- upvalues: v10 (copy), l_LocalPlayer_0 (copy)
        for _, v17 in pairs(v10) do
            local l_Instance_0 = v17.Instance;
            local v19 = l_Instance_0 and l_Instance_0.PrimaryPart;
            local v20 = v19 and v19:FindFirstChild("PromptAttachment");
            local v21 = v20 and v20:FindFirstChild("ProximityPrompt");
            if v21 and v21:GetAttribute("TargetPlayer") == l_LocalPlayer_0.UserId then
                return v17;
            end;
        end;
    end, 
    HasAnimal = function(_, v23, v24) --[[ Line: 52 ]] --[[ Name: HasAnimal ]]
        -- upvalues: v4 (copy), l_LocalPlayer_0 (copy)
        local v25 = v24 or 1;
        local v26 = v4:Get(l_LocalPlayer_0);
        if not v26 then
            return false;
        else
            local v27 = 0;
            local v28 = {};
            for v29, v30 in v26:Get("AnimalPodiums") do
                if v30 ~= "Empty" and v30.Index == v23 then
                    v27 = v27 + 1;
                    table.insert(v28, v29);
                end;
            end;
            return v25 <= v27, v28;
        end;
    end, 
    GetAnimals = function(_) --[[ Line: 75 ]] --[[ Name: GetAnimals ]]
        -- upvalues: v10 (copy)
        return v10;
    end
};
v32.Start = function(_) --[[ Line: 79 ]] --[[ Name: Start ]]
    -- upvalues: v3 (copy), v9 (copy), v10 (copy), v32 (copy), v7 (copy), l_LocalPlayer_0 (copy), l_FireServer_0 (copy), v13 (copy)
    v3.observeTag("Animal", function(v34) --[[ Line: 81 ]]
        -- upvalues: v9 (ref), v10 (ref), v3 (ref), v32 (ref)
        local v35 = v9.new(v34);
        v10[v35:GetUID()] = v35;
        v35.Collector:Add(v3.observeTag("AnimalPurchasePrompt", function(v36) --[[ Line: 87 ]]
            -- upvalues: v3 (ref), v32 (ref), v35 (copy)
            return v3.observeAttribute(v36, "TargetPlayer", function(v37) --[[ Line: 88 ]]
                -- upvalues: v32 (ref), v35 (ref)
                v32.OnFollowingChanged:Fire(v35.Index, v35.UID, v37);
                return nil;
            end);
        end, {
            v35.Instance
        }));
        v32.OnAnimalSpawn:Fire(v35);
        return function() --[[ Line: 96 ]]
            -- upvalues: v35 (copy), v10 (ref), v32 (ref)
            local l_UID_0 = v35.UID;
            v35:Destroy();
            v10[l_UID_0] = nil;
            v32.OnAnimalDestroyed:Fire(l_UID_0);
        end;
    end);
    v3.observeTag("AnimalPurchasePrompt", function(v39) --[[ Line: 106 ]]
        -- upvalues: v7 (ref), l_LocalPlayer_0 (ref), l_FireServer_0 (ref), v13 (ref)
        local v40 = v7.new();
        local function v43() --[[ Line: 108 ]] --[[ Name: updateVisibility ]]
            -- upvalues: v39 (copy), l_LocalPlayer_0 (ref)
            local l_v39_0 = v39;
            local v42 = false;
            if v39:GetAttribute("TargetPlayer") ~= l_LocalPlayer_0.UserId then
                v42 = not v39:GetAttribute("Disabled");
            end;
            l_v39_0.Enabled = v42;
        end;
        v40:Add(v39:GetAttributeChangedSignal("TargetPlayer"):Connect(v43));
        v40:Add(v39:GetAttributeChangedSignal("Disabled"):Connect(v43));
        local v44 = false;
        if v39:GetAttribute("TargetPlayer") ~= l_LocalPlayer_0.UserId then
            v44 = not v39:GetAttribute("Disabled");
        end;
        v39.Enabled = v44;
        v44 = v39:GetAttribute("UID");
        v40:Add(v39.Triggered:Connect(function() --[[ Line: 139 ]]
            -- upvalues: l_FireServer_0 (ref), v13 (ref), v44 (copy)
            l_FireServer_0(v13, workspace:GetServerTimeNow() + 176, "ee0d0a2f-e1e9-464f-bba1-790a08ad9bab", v44);
            v13:FireServer(workspace:GetServerTimeNow() + 176, "27cd13e7-563e-4f5a-a390-bdc257822571", v44);
        end));
        return function() --[[ Line: 163 ]]
            -- upvalues: v40 (copy)
            v40:Destroy();
        end;
    end);
end;
return v32;