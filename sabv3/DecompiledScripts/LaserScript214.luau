local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local l_Parent_0 = script.Parent;
local _ = l_Parent_0.Parent.Parent;
local v4 = require(l_ReplicatedStorage_0.Shared.LaserGunsShared);
local v5 = -1e999;
l_Parent_0.Activated:Connect(function() --[[ Line: 12 ]]
    -- upvalues: v5 (ref), v4 (copy)
    local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
    if l_workspace_ServerTimeNow_0 - v5 < v4.Settings.Cooldown:Get() then
        return;
    else
        v5 = l_workspace_ServerTimeNow_0;
        v4.ShootLocal();
        return;
    end;
end);