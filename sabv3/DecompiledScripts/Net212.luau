local l_RunService_0 = game:GetService("RunService");
return {
    UnreliableRemoteEvent = function(_, v2) --[[ Line: 19 ]] --[[ Name: UnreliableRemoteEvent ]]
        -- upvalues: l_RunService_0 (copy)
        v2 = "URE/" .. v2;
        if l_RunService_0:IsServer() then
            local l_script_FirstChild_0 = script:FindFirstChild(v2);
            if not l_script_FirstChild_0 then
                l_script_FirstChild_0 = Instance.new("UnreliableRemoteEvent");
                l_script_FirstChild_0.Name = v2;
                l_script_FirstChild_0.Parent = script;
            end;
            return l_script_FirstChild_0;
        else
            local v4 = script:WaitForChild(v2, 10);
            if not v4 then
                error("Failed to find UnreliableRemoteEvent: " .. v2, 2);
            end;
            return v4;
        end;
    end, 
    RemoteEvent = function(_, v6) --[[ Line: 54 ]] --[[ Name: RemoteEvent ]]
        -- upvalues: l_RunService_0 (copy)
        v6 = "RE/" .. v6;
        if l_RunService_0:IsServer() then
            local l_script_FirstChild_1 = script:FindFirstChild(v6);
            if not l_script_FirstChild_1 then
                l_script_FirstChild_1 = Instance.new("RemoteEvent");
                l_script_FirstChild_1.Name = v6;
                l_script_FirstChild_1.Parent = script;
            end;
            return l_script_FirstChild_1;
        else
            local v8 = script:WaitForChild(v6, 10);
            if not v8 then
                error("Failed to find RemoteEvent: " .. v6, 2);
            end;
            return v8;
        end;
    end, 
    ConnectUnreliable = function(v9, v10, v11) --[[ Line: 80 ]] --[[ Name: ConnectUnreliable ]]
        -- upvalues: l_RunService_0 (copy)
        if l_RunService_0:IsServer() then
            return v9:UnreliableRemoteEvent(v10).OnServerEvent:Connect(v11);
        else
            return v9:UnreliableRemoteEvent(v10).OnClientEvent:Connect(v11);
        end;
    end, 
    Connect = function(v12, v13, v14) --[[ Line: 101 ]] --[[ Name: Connect ]]
        -- upvalues: l_RunService_0 (copy)
        if l_RunService_0:IsServer() then
            return v12:RemoteEvent(v13).OnServerEvent:Connect(v14);
        else
            return v12:RemoteEvent(v13).OnClientEvent:Connect(v14);
        end;
    end, 
    RemoteFunction = function(_, v16) --[[ Line: 124 ]] --[[ Name: RemoteFunction ]]
        -- upvalues: l_RunService_0 (copy)
        v16 = "RF/" .. v16;
        if l_RunService_0:IsServer() then
            local l_script_FirstChild_2 = script:FindFirstChild(v16);
            if not l_script_FirstChild_2 then
                l_script_FirstChild_2 = Instance.new("RemoteFunction");
                l_script_FirstChild_2.Name = v16;
                l_script_FirstChild_2.Parent = script;
            end;
            return l_script_FirstChild_2;
        else
            local v18 = script:WaitForChild(v16, 10);
            if not v18 then
                error("Failed to find RemoteFunction: " .. v16, 2);
            end;
            return v18;
        end;
    end, 
    Handle = function(v19, v20, v21) --[[ Line: 153 ]] --[[ Name: Handle ]]
        v19:RemoteFunction(v20).OnServerInvoke = v21;
    end, 
    Invoke = function(v22, v23, ...) --[[ Line: 165 ]] --[[ Name: Invoke ]]
        return v22:RemoteFunction(v23):InvokeServer(...);
    end, 
    Clean = function(_) --[[ Line: 175 ]] --[[ Name: Clean ]]
        script:ClearAllChildren();
    end
};