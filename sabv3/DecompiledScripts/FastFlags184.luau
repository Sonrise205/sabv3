--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_ReplicatedStorage_0.UserGenerated.FastFlags.SharedFastFlags);
local v3 = nil;
if l_RunService_0:IsClient() then
    return (require(l_ReplicatedStorage_0.UserGenerated.Client.ClientFastFlags));
elseif l_RunService_0:IsServer() then
    local l_ServerScriptService_0 = game:GetService("ServerScriptService");
    return (require(l_ServerScriptService_0.UserGenerated.Server.ServerFastFlags));
else
    error("RunContext");
    return v3;
end;