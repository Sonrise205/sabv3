local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_Players_0 = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v4 = require(l_ReplicatedStorage_0.Packages.Observers);
local v5 = require(l_ReplicatedStorage_0.Packages.Trove);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v13 = {
    IsNewPlayer = function(_) --[[ Line: 14 ]] --[[ Name: IsNewPlayer ]]
        -- upvalues: v3 (copy), l_LocalPlayer_0 (copy)
        local v8 = v3:Get(l_LocalPlayer_0);
        if not v8 then
            return false;
        else
            local _ = v8:Get("Rebirth") or 0;
            local v10 = v8:Get("Coins") or 0;
            local v11 = v8:Get("LifetimeCoins") or 0;
            local v12 = true;
            if v10 < 1000 then
                v12 = v11 >= 1000;
            end;
            return v12;
        end;
    end
};
v13.Start = function(_) --[[ Line: 26 ]] --[[ Name: Start ]]
    -- upvalues: v3 (copy), l_LocalPlayer_0 (copy), v4 (copy), v5 (copy), v13 (copy), l_Workspace_0 (copy), l_ReplicatedStorage_0 (copy)
    if not v3:Wait(l_LocalPlayer_0) then
        return;
    else
        v4.observeTag("NewPlayersHidden", function(v15) --[[ Line: 33 ]]
            -- upvalues: v5 (ref), v13 (ref), l_Workspace_0 (ref), l_ReplicatedStorage_0 (ref)
            if not v15:IsA("Model") then
                return;
            else
                local v16 = v5.new();
                local function v18() --[[ Line: 38 ]] --[[ Name: updateModelParent ]]
                    -- upvalues: v13 (ref), l_Workspace_0 (ref), l_ReplicatedStorage_0 (ref), v15 (copy)
                    local v17 = v13:IsNewPlayer() and l_Workspace_0 or l_ReplicatedStorage_0;
                    if v15.Parent ~= v17 then
                        v15.Parent = v17;
                    end;
                end;
                task.spawn(v18);
                return function() --[[ Line: 47 ]]
                    -- upvalues: v16 (copy)
                    v16:Clean();
                end;
            end;
        end);
        return;
    end;
end;
return v13;