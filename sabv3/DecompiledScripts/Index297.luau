local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v2 = require(l_Packages_0.Synchronizer);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v4 = require(l_ReplicatedStorage_0.Datas.Index);
local v5 = require(l_ReplicatedStorage_0.Shared.Updates);
local v6 = require(l_Datas_0.Animals);
local v10 = {
    CanShowInIndex = function(_, v8) --[[ Line: 17 ]] --[[ Name: CanShowInIndex ]]
        -- upvalues: v6 (copy)
        local v9 = v6[v8];
        if not v9 then
            return false;
        elseif v9.IsEnabled and not v9.IsEnabled() then
            return false;
        elseif v9.HideFromIndex then
            return false;
        else
            return true;
        end;
    end
};
local v11 = {
    Strawberry = "Strawberry Elephant", 
    Meowl = "Meowl", 
    Skibidi = "Skibidi Toilet"
};
v10.IsComplete = function(_, v13, v14) --[[ Line: 40 ]] --[[ Name: IsComplete ]]
    -- upvalues: v2 (copy), v11 (copy), v4 (copy), v5 (copy), v6 (copy), v10 (copy)
    local v15 = v2:Get(v13);
    if not v15 then
        return false;
    else
        local v16 = v11[v14];
        if v16 ~= nil then
            for _, v18 in v15:Get("AnimalPodiums") do
                if typeof(v18) == "table" and v18.Index == v16 then
                    return true;
                end;
            end;
            return false;
        else
            local v19 = v15:Get("Index");
            local v20 = 0;
            local v21 = 0;
            local v22 = v14 and v4[v14];
            if v22 and v22.DisableIndex then
                return false;
            elseif v22 and v22.Update and not v5.Methods.IsEnabled(v22.Update) then
                return false;
            else
                local v23 = v22 and v22.Index;
                if v23 then
                    for v24, v25 in v23 do
                        if not v25.IgnoreIndexCounter then
                            v21 = v21 + 1;
                        end;
                        local v26 = v19[v24];
                        if v26 then
                            local _ = nil;
                            if if v22 and v22.CustomIndex then v26[v22.CustomIndex.Name] else if not v22 or v22.IsMutation then v26[v14] else next(v26) ~= nil then
                                v20 = v20 + 1;
                            end;
                        end;
                    end;
                    local l_v21_0 = v21;
                    local v29 = v22 and v22.CompletitionPercent or v14 == "Default" and 0.75 or 1;
                    if v29 ~= 1 then
                        l_v21_0 = math.max(math.ceil(l_v21_0 * v29), 1);
                        if v22 and v22.CompletitionForcedAmount then
                            l_v21_0 = v22.CompletitionForcedAmount;
                        end;
                    end;
                    return l_v21_0 <= v20;
                else
                    for v30 in v6 do
                        if v10:CanShowInIndex(v30) then
                            v21 = v21 + 1;
                            local v31 = v19[v30];
                            if v31 and v31[v14 and v14 or "Default"] then
                                v20 = v20 + 1;
                            end;
                        end;
                    end;
                    local l_v21_1 = v21;
                    local v33 = v22 and v22.CompletitionPercent or v14 == "Default" and 0.75 or 1;
                    if v33 ~= 1 then
                        l_v21_1 = math.max(math.ceil(l_v21_1 * v33), 1);
                        if v22 and v22.CompletitionForcedAmount then
                            l_v21_1 = v22.CompletitionForcedAmount;
                        end;
                    end;
                    return l_v21_1 <= v20;
                end;
            end;
        end;
    end;
end;
v10.GetIndexAnimals = function(_, v35, v36) --[[ Line: 142 ]] --[[ Name: GetIndexAnimals ]]
    -- upvalues: v2 (copy), v4 (copy), v6 (copy), v10 (copy)
    local v37 = v2:Get(v35);
    if not v37 then
        return nil;
    else
        local v38 = v37:Get("Index");
        local v39 = v36 and v4[v36];
        local v40 = v39 and v39.Index;
        if v40 then
            local v41 = 0;
            local v42 = 0;
            local v43 = 0;
            for v44, v45 in v40 do
                v43 = v43 + 1;
                if not v45.IgnoreIndexCounter then
                    v42 = v42 + 1;
                end;
                local v46 = v38[v44];
                if v46 then
                    local _ = nil;
                    if if v39 and v39.CustomIndex then v46[v39.CustomIndex.Name] else if not v39 or v39.IsMutation then v46[v36] else next(v46) ~= nil then
                        v41 = v41 + 1;
                    end;
                end;
            end;
            local l_v42_0 = v42;
            local v49 = v39 and v39.CompletitionPercent or v36 == "Default" and 0.75 or 1;
            if v49 ~= 1 then
                l_v42_0 = math.max(math.ceil(l_v42_0 * v49), 1);
                if v39 and v39.CompletitionForcedAmount then
                    l_v42_0 = v39.CompletitionForcedAmount;
                end;
            end;
            return v41, l_v42_0, v43;
        else
            local v50 = 0;
            local v51 = 0;
            local v52 = 0;
            for v53, _ in v6 do
                if v10:CanShowInIndex(v53) then
                    v52 = v52 + 1;
                    v51 = v51 + 1;
                    local v55 = v38[v53];
                    if v55 then
                        local v56 = v55[v36 and v36 or "Default"];
                        if v56 and v56 > 0 then
                            v50 = v50 + 1;
                        end;
                    end;
                end;
            end;
            local l_v51_0 = v51;
            local v58 = v39 and v39.CompletitionPercent or v36 == "Default" and 0.75 or 1;
            if v58 ~= 1 then
                l_v51_0 = math.max(math.ceil(l_v51_0 * v58), 1);
                if v39 and v39.CompletitionForcedAmount then
                    l_v51_0 = v39.CompletitionForcedAmount;
                end;
            end;
            return v50, l_v51_0, v52;
        end;
    end;
end;
v10.GetMultipliers = function(_, v60) --[[ Line: 229 ]] --[[ Name: GetMultipliers ]]
    -- upvalues: v2 (copy), v10 (copy), v4 (copy)
    local v61 = 0;
    if v2:Get(v60) then
        local v62 = 0 + (v10:IsComplete(v60) == true and 1 or 0);
        for v63, v64 in v4 do
            if not v64.LimitedMutation and v64.IsMutation then
                v62 = v62 + (v10:IsComplete(v60, v63) == true and 1 or 0);
            end;
        end;
        v61 = v61 + v62 * 0.5;
    end;
    return v61;
end;
return v10;