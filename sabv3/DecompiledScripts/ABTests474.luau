--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local _ = require(l_ReplicatedStorage_0.UserGenerated.ABTests.SharedABTests);
local _ = nil;
if l_RunService_0:IsServer() then
    return (require(l_ServerScriptService_0.UserGenerated.Server.ServerABTests));
else
    return (require(l_ReplicatedStorage_0.UserGenerated.Client.ClientABTests));
end;