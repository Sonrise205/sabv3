local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Net);
if l_RunService_0:IsServer() then
    local v3 = {};
    local l_ServerStorage_0 = game:GetService("ServerStorage");
    local l_ServerScriptService_0 = game:GetService("ServerScriptService");
    local v6 = require(l_ServerStorage_0.Modules.CraftingData);
    local v7 = require(l_ServerScriptService_0.Services.CommandsService);
    for _, v9 in v6.Rarities do
        for _, v11 in v9.Brainrots do
            table.insert(v3, v11.Name);
        end;
    end;
    v2:Handle("BrainrotToCraft/RequestList", function(v12) --[[ Line: 19 ]]
        -- upvalues: v7 (copy), v3 (copy)
        local l_v7_RoleAsync_0 = v7:GetRoleAsync(v12);
        if l_v7_RoleAsync_0 == "Dev" or l_v7_RoleAsync_0 == "Lead" then
            return v3;
        else
            return {};
        end;
    end);
    return v3;
else
    return v2:Invoke("BrainrotToCraft/RequestList");
end;