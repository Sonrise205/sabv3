local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Conch);
local v3 = require(l_ReplicatedStorage_0.Packages.Net);
local v4 = {};
if l_RunService_0:IsServer() then
    local l_ServerScriptService_0 = game:GetService("ServerScriptService");
    for v6 in require(l_ServerScriptService_0.Services.EventService).Events do
        table.insert(v4, v6);
    end;
else
    v4 = v3:Invoke("EventService/ListEvents");
end;
return v2.register_type("Event", v2.args.enum_new(v4));