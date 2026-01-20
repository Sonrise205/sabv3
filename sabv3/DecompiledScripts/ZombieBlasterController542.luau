local l_Debris_0 = game:GetService("Debris");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local _ = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
local _ = workspace.CurrentCamera;
local _ = l_PlayerGui_0:WaitForChild("ToolsScreen");
local _ = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v13 = require(l_Packages_0.Net);
local v14 = {};
local v15 = {};
v13:RemoteEvent("UseItem").OnClientEvent:Connect(function(v16, v17) --[[ Line: 29 ]]
    -- upvalues: l_Debris_0 (copy), v14 (copy)
    if v16 ~= "FireZombieBlaster" then
        return;
    else
        local l_MousePosition_0 = v17.MousePosition;
        local l_LifeTime_0 = v17.LifeTime;
        local l_Origin_0 = v17.Origin;
        local l_Speed_0 = v17.Speed;
        local l_UUID_0 = v17.UUID;
        local l_Attachment1_0 = l_Origin_0:FindFirstChild("Attachment1");
        if not l_Attachment1_0 then
            return;
        else
            local l_WorldPosition_0 = l_Attachment1_0.WorldPosition;
            local l_Unit_0 = (l_MousePosition_0 - l_WorldPosition_0).Unit;
            local v26 = script.Shoot:Clone();
            local v27 = Instance.new("Attachment", v26);
            local l_LinearVelocity_0 = Instance.new("LinearVelocity");
            v26.CanQuery = false;
            v26.Position = l_WorldPosition_0;
            v26.CanCollide = false;
            l_LinearVelocity_0.VectorVelocity = l_Unit_0 * l_Speed_0;
            l_LinearVelocity_0.Attachment0 = v27;
            l_LinearVelocity_0.Parent = v26;
            l_Debris_0:AddItem(v26, l_LifeTime_0);
            v26.Parent = workspace;
            v26.Destroying:Once(function() --[[ Line: 59 ]]
                -- upvalues: v14 (ref), l_UUID_0 (copy)
                v14[l_UUID_0] = nil;
            end);
            v14[l_UUID_0] = v26;
            return;
        end;
    end;
end);
v13:RemoteEvent("UseItem").OnClientEvent:Connect(function(v29, v30) --[[ Line: 66 ]]
    -- upvalues: v14 (copy)
    if v29 ~= "DestroyZombieBlaster" then
        return;
    else
        if v14[v30] then
            v14[v30]:Destroy();
            v14[v30] = nil;
        end;
        return;
    end;
end);
return v15;