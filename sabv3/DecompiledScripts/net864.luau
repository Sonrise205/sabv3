local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = game:GetService("RunService"):IsServer() and "server" or "client";
local function _(v2) --[[ Line: 69 ]] --[[ Name: assert_run_context ]]
    -- upvalues: v1 (copy)
    assert(v1 == v2, (("expected run context %* but got %*"):format(v2, v1)));
end;
local v4 = nil;
local v5 = {
    client = {
        initialized = false
    }, 
    server = {
        initialized = false
    }
};
local function v12() --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_ReplicatedStorage_0 (copy), v4 (ref), v5 (copy)
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "conch_networking";
    l_Folder_0.Parent = l_ReplicatedStorage_0;
    local function _(v7) --[[ Line: 94 ]] --[[ Name: remote ]]
        -- upvalues: l_Folder_0 (copy)
        local l_RemoteEvent_0 = Instance.new("RemoteEvent");
        l_RemoteEvent_0.Name = v7;
        l_RemoteEvent_0.Parent = l_Folder_0;
        return l_RemoteEvent_0;
    end;
    local v10 = {};
    local l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "invoke_server_command";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.invoke_server_command = l_RemoteEvent_1;
    l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "create_user";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.create_user = l_RemoteEvent_1;
    l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "update_user_roles";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.update_user_roles = l_RemoteEvent_1;
    l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "update_role_permissions";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.update_role_permissions = l_RemoteEvent_1;
    l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "register_command";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.register_command = l_RemoteEvent_1;
    l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "log";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.log = l_RemoteEvent_1;
    l_RemoteEvent_1 = Instance.new("RemoteEvent");
    l_RemoteEvent_1.Name = "log_command";
    l_RemoteEvent_1.Parent = l_Folder_0;
    v10.log_command = l_RemoteEvent_1;
    v4 = v10;
    v5.server.initialized = true;
end;
v5.server.init = v12;
v12 = function() --[[ Line: 117 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_ReplicatedStorage_0 (copy), v4 (ref), v5 (copy)
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    local l_conch_networking_0 = l_ReplicatedStorage_0:WaitForChild("conch_networking");
    local function _(v14) --[[ Line: 122 ]] --[[ Name: remote ]]
        -- upvalues: l_conch_networking_0 (copy)
        return (l_conch_networking_0:WaitForChild(v14));
    end;
    v4 = {
        invoke_server_command = l_conch_networking_0:WaitForChild("invoke_server_command"), 
        create_user = l_conch_networking_0:WaitForChild("create_user"), 
        update_user_roles = l_conch_networking_0:WaitForChild("update_user_roles"), 
        update_role_permissions = l_conch_networking_0:WaitForChild("update_role_permissions"), 
        register_command = l_conch_networking_0:WaitForChild("register_command"), 
        log = l_conch_networking_0:WaitForChild("log"), 
        log_command = l_conch_networking_0:WaitForChild("log_command")
    };
    v5.client.initialized = true;
end;
v5.client.init = v12;
v12 = function(v16) --[[ Line: 141 ]] --[[ Name: on_user_roles_update ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.update_user_roles.OnClientEvent:Connect(v16);
end;
v5.client.on_user_roles_update = v12;
v12 = function(v17) --[[ Line: 152 ]] --[[ Name: on_command_registered ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.register_command.OnClientEvent:Connect(v17);
end;
v5.client.on_command_registered = v12;
v12 = function(v18) --[[ Line: 161 ]] --[[ Name: on_role_info_received ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.update_role_permissions.OnClientEvent:Connect(v18);
end;
v5.client.on_role_info_received = v12;
v12 = function(v19) --[[ Line: 170 ]] --[[ Name: on_user_info_received ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.create_user.OnClientEvent:Connect(v19);
end;
v5.client.on_user_info_received = v12;
v12 = function(v20) --[[ Line: 177 ]] --[[ Name: on_log_received ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.log.OnClientEvent:Connect(v20);
end;
v5.client.on_log_received = v12;
v12 = function(v21, v22, v23) --[[ Line: 184 ]] --[[ Name: invoke_command ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    local v24 = {
        invoke_id = v21, 
        name = v22, 
        args = v23
    };
    v4.invoke_server_command:FireServer(v24);
end;
v5.client.invoke_command = v12;
v12 = function(v25) --[[ Line: 201 ]] --[[ Name: on_invoke_reply ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.invoke_server_command.OnClientEvent:Connect(v25);
end;
v5.client.on_invoke_reply = v12;
v12 = function(v26) --[[ Line: 208 ]] --[[ Name: fire_log_command ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.client.initialized, "client not initialized");
    assert(v1 == "client", (("expected run context client but got %*"):format(v1)));
    v4.log_command:FireServer(v26);
end;
v5.client.fire_log_command = v12;
v12 = function(v27) --[[ Line: 215 ]] --[[ Name: on_log_command ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    return v4.log_command.OnServerEvent:Connect(v27);
end;
v5.server.on_log_command = v12;
v12 = function(v28, v29) --[[ Line: 222 ]] --[[ Name: fire_log ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    v4.log:FireClient(v28, v29);
end;
v5.server.fire_log = v12;
v12 = function(v30, v31) --[[ Line: 229 ]] --[[ Name: fire_register_command ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    v4.register_command:FireClient(v30, v31);
end;
v5.server.fire_register_command = v12;
v12 = function(v32) --[[ Line: 239 ]] --[[ Name: on_command_invoke ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    v4.invoke_server_command.OnServerEvent:Connect(v32);
end;
v5.server.on_command_invoke = v12;
v12 = function(v33, v34, v35) --[[ Line: 249 ]] --[[ Name: fire_successful_invoke_reply ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    local v36 = {
        status = "ok", 
        invoke_id = v34, 
        results = v35
    };
    v4.invoke_server_command:FireClient(v33, v36);
end;
v5.server.fire_successful_invoke_reply = v12;
v12 = function(v37, v38) --[[ Line: 266 ]] --[[ Name: fire_failed_invoke_reply ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    local v39 = {
        status = "err", 
        invoke_id = v38
    };
    v4.invoke_server_command:FireClient(v37, v39);
end;
v5.server.fire_failed_invoke_reply = v12;
v12 = function(v40, v41, v42) --[[ Line: 278 ]] --[[ Name: fire_create_user ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    local v43 = {
        name = v42, 
        id = v41
    };
    v4.create_user:FireClient(v40, v43);
end;
v5.server.fire_create_user = v12;
v12 = function(v44, v45) --[[ Line: 290 ]] --[[ Name: fire_update_user_roles ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    v4.update_user_roles:FireClient(v44, v45);
end;
v5.server.fire_update_user_roles = v12;
v12 = function(v46, v47) --[[ Line: 300 ]] --[[ Name: fire_update_role_perms ]]
    -- upvalues: v5 (copy), v1 (copy), v4 (ref)
    assert(v5.server.initialized, "server not initialized");
    assert(v1 == "server", (("expected run context server but got %*"):format(v1)));
    local v48 = {
        name = v46, 
        permissions = v47
    };
    v4.update_role_permissions:FireAllClients(v48);
end;
v5.server.fire_update_role_perms = v12;
return v5;