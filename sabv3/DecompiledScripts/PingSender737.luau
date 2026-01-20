--!native
local l_RunService_0 = game:GetService("RunService");
local l_Ping_0 = script.Parent:WaitForChild("Ping");
local v2 = 0;
local v3 = 0;
local function v4() --[[ Line: 27 ]] --[[ Name: SendPing ]]
    -- upvalues: v3 (ref), l_Ping_0 (copy)
    v3 = v3 + 1;
    l_Ping_0:FireServer(v3, workspace:GetServerTimeNow());
end;
l_RunService_0.Heartbeat:Connect(function(v5) --[[ Line: 34 ]]
    -- upvalues: v2 (ref), v3 (ref), l_Ping_0 (copy)
    v2 = v2 + v5;
    if v2 >= 1 then
        v2 = v2 % 1;
        v3 = v3 + 1;
        l_Ping_0:FireServer(v3, workspace:GetServerTimeNow());
    end;
end);
task.spawn(v4);