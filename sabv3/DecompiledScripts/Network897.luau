local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(script.Parent.Utils);
local v3 = l_RunService_0:IsServer();
local v4 = l_RunService_0:IsClient();
local v5 = nil;
if not v2.ShouldMock then
    if v3 then
        v5 = Instance.new("Folder");
        v5.Name = "Remotes";
        v5.Parent = script.Parent.Parent;
    else
        v5 = assert(script.Parent.Parent:WaitForChild("Remotes", 5), "Did you forget to require the Replion module on the server?");
    end;
end;
local function v9(v6) --[[ Line: 34 ]] --[[ Name: get ]]
    -- upvalues: v5 (ref), v4 (copy)
    local l_v5_FirstChild_0 = v5:FindFirstChild(v6);
    if l_v5_FirstChild_0 then
        return l_v5_FirstChild_0;
    else
        if v4 then
            error("Did you forget to require the Replion module on the server?");
        end;
        local l_RemoteEvent_0 = Instance.new("RemoteEvent");
        l_RemoteEvent_0.Name = v6;
        l_RemoteEvent_0.Parent = v5;
        return l_RemoteEvent_0;
    end;
end;
local function v14(v10) --[[ Line: 49 ]] --[[ Name: create ]]
    -- upvalues: v5 (ref), v4 (copy)
    for _, v12 in v10 do
        if not v5:FindFirstChild(v12) then
            if v4 then
                error("Did you forget to require the Replion module on the server?");
            end;
            local l_RemoteEvent_1 = Instance.new("RemoteEvent");
            l_RemoteEvent_1.Name = v12;
            l_RemoteEvent_1.Parent = v5;
        end;
    end;
end;
local function v22(v15, v16, ...) --[[ Line: 55 ]] --[[ Name: sendTo ]]
    -- upvalues: v2 (copy), v5 (ref), v4 (copy), l_Players_0 (copy)
    if v2.ShouldMock then
        return;
    else
        local l_v5_FirstChild_1 = v5:FindFirstChild(v16);
        local v18;
        if l_v5_FirstChild_1 then
            v18 = l_v5_FirstChild_1;
        else
            if v4 then
                error("Did you forget to require the Replion module on the server?");
            end;
            local l_RemoteEvent_2 = Instance.new("RemoteEvent");
            l_RemoteEvent_2.Name = v16;
            l_RemoteEvent_2.Parent = v5;
            v18 = l_RemoteEvent_2;
        end;
        if v15 == "All" then
            v18:FireAllClients(...);
            return;
        elseif type(v15) == "table" then
            for _, v21 in v15 do
                if v21:IsDescendantOf(l_Players_0) then
                    v18:FireClient(v21, ...);
                end;
            end;
            return;
        elseif typeof(v15) == "Instance" and v15:IsA("Player") then
            v18:FireClient(v15, ...);
            return;
        else
            error("Invalid replicateTo!");
            return;
        end;
    end;
end;
return (table.freeze({
    get = v9, 
    create = v14, 
    sendTo = v22
}));