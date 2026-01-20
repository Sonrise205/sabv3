local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v3 = require(l_Packages_0.Synchronizer);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v5 = require(l_Datas_0.Rebirth);
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v7 = require(l_Shared_0.Friends);
local v8 = require(l_Shared_0.Index);
local _ = require(l_Shared_0.Updates);
return {
    GetPlayerCashMultiplayer = function(_, v11) --[[ Line: 21 ]] --[[ Name: GetPlayerCashMultiplayer ]]
        -- upvalues: l_Players_0 (copy), v3 (copy), v5 (copy), v7 (copy), v8 (copy)
        local v12 = v11 or l_Players_0.LocalPlayer;
        local v13 = 1;
        local v14 = v3:Get(v12);
        if v14 then
            local v15 = v14:Get("Rebirth");
            if v15 > 0 then
                local v16 = v5[v15];
                if v16 then
                    v13 = v13 + v16.Rewards.Multiplier;
                end;
            end;
            if v14:Get("Gamepass.VIP") == true then
                v13 = v13 + 0.5;
            end;
            if v14:Get("Gamepass.2x Money") == true then
                v13 = v13 + 2;
            end;
            v13 = v13 + v7:GetFriendBoostModifier(v12) + v8:GetMultipliers(v12);
        end;
        return v13;
    end
};