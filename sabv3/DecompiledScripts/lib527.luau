local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require("./arguments");
local v3 = require("../roblox_packages/ast");
local v4 = require("./bootstrap");
local v5 = require("./client");
local v6 = require("./console");
local v7 = require("./context");
local v8 = require("./net");
local v9 = require("./state");
local _ = require("./types");
local v11 = require("./user");
local v12 = l_RunService_0:IsServer();
local v13 = l_RunService_0:IsClient();
local l_create_user_0 = v11.create_user;
local l_disconnect_user_0 = v11.disconnect_user;
local l_has_permissions_0 = v11.has_permissions;
local l_create_command_context_0 = v7.create_command_context;
local l_get_command_context_0 = v7.get_command_context;
local function _(v19, v20) --[[ Line: 27 ]] --[[ Name: FOREACH ]]
    for v21, v22 in v19 do
        v20(v22, v21);
    end;
end;
local function v25(v24, ...) --[[ Line: 33 ]] --[[ Name: set_role ]]
    -- upvalues: v9 (copy), v12 (copy), v8 (copy)
    v9.roles[v24] = {
        ...
    };
    if v12 then
        v8.server.fire_update_role_perms(v24, {
            ...
        });
    end;
end;
local function v29(v26) --[[ Line: 39 ]] --[[ Name: initiate_user_replication ]]
    -- upvalues: v6 (copy), l_has_permissions_0 (copy), v8 (copy)
    for _, v28 in v6.console.commands do
        if l_has_permissions_0(v26, unpack(v28.permissions)) then
            v8.server.fire_register_command(v26.player, {
                name = v28.name, 
                permissions = v28.permissions
            });
        end;
    end;
end;
local function v36(v30) --[[ Line: 52 ]] --[[ Name: get_user ]]
    -- upvalues: v11 (copy), v9 (copy), l_create_user_0 (copy), v29 (copy)
    if typeof(v30) == "string" then
        local v31 = v11.obtain_user_key(false, v30);
        local v32 = v9.users[v31];
        if not v32 then
            return (l_create_user_0({
                name = v31, 
                player = false
            }));
        else
            return v32;
        end;
    else
        local v33 = v11.obtain_user_key(v30, v30.DisplayName);
        local v34 = v9.users[v33];
        if not v34 then
            local v35 = l_create_user_0({
                name = v30.DisplayName, 
                player = v30
            });
            v29(v35);
            return v35;
        else
            return v34;
        end;
    end;
end;
local function v40(v37) --[[ Line: 74 ]] --[[ Name: disconnect_user_for_player ]]
    -- upvalues: v11 (copy), v9 (copy), l_disconnect_user_0 (copy)
    local v38 = v11.obtain_user_key(v37, v37.DisplayName);
    local v39 = v9.users[v38];
    if not v39 then
        return;
    else
        l_disconnect_user_0(v39);
        return;
    end;
end;
local function v48(v41, v42) --[[ Line: 83 ]] --[[ Name: invoke_server_command ]]
    -- upvalues: v36 (copy), v6 (copy), v8 (copy), l_has_permissions_0 (copy), l_create_command_context_0 (copy)
    local v43 = v36(v41);
    local v44 = v6.console.commands[v42.name];
    local function v45() --[[ Line: 90 ]] --[[ Name: fail ]]
        -- upvalues: v8 (ref), v41 (copy), v42 (copy)
        v8.server.fire_failed_invoke_reply(v41, v42.invoke_id);
    end;
    if not v44 or not v43 then
        return v45();
    elseif not l_has_permissions_0(v43, unpack(v44.permissions)) then
        return v45();
    else
        local v46 = l_create_command_context_0(v43, v42.invoke_id);
        return (function(v47, ...) --[[ Line: 101 ]] --[[ Name: handle ]]
            -- upvalues: v6 (ref), v43 (copy), v42 (copy), v46 (copy), v45 (copy), v8 (ref), v41 (copy)
            v6.after_command_run:fire({
                ok = v47, 
                who = v43, 
                command = v42.name, 
                arguments = v42.args, 
                result = {
                    ...
                }
            });
            v46();
            if not v47 then
                warn(...);
                return v45();
            else
                return v8.server.fire_successful_invoke_reply(v41, v42.invoke_id, {
                    ...
                });
            end;
        end)(pcall(v44.callback, unpack(v42.args)));
    end;
end;
local _ = function(v49) --[[ Line: 125 ]] --[[ Name: resend_new_commands ]]
    -- upvalues: v6 (copy)
    if not v49.dirty then
        return;
    else
        for _, v51 in v6.console.commands do
            v6.replicate_to_player(v49.player, v51);
        end;
        v49.dirty = false;
        return;
    end;
end;
return {
    args = v2, 
    parse = v3, 
    execute = function(v53) --[[ Line: 176 ]] --[[ Name: execute ]]
        -- upvalues: v9 (copy), v13 (copy), v8 (copy), l_create_command_context_0 (copy), v6 (copy)
        local l_local_user_0 = v9.local_user;
        assert(v13, "cannot run commands outside of the client");
        assert(l_local_user_0, "unable to run commands without a local user");
        if v13 then
            v8.client.fire_log_command(v53);
        end;
        local v55 = l_create_command_context_0(l_local_user_0, false);
        local l_status_0, l_result_0 = pcall(v6.execute, v53);
        if not l_status_0 then
            v6.console.output({
                kind = "error", 
                text = l_result_0
            });
        end;
        v55();
    end, 
    register_quick = v6.register_quick, 
    register = v6.register_command, 
    on_execution = function(v58) --[[ Line: 192 ]] --[[ Name: on_execution ]]
        -- upvalues: v8 (copy)
        local v61 = v8.server.on_log_command(function(v59, v60) --[[ Line: 193 ]]
            -- upvalues: v58 (copy)
            if typeof(v60) ~= "string" then
                v59:Kick();
            end;
            v58(v59, v60);
        end);
        return function() --[[ Line: 198 ]]
            -- upvalues: v61 (copy)
            v61:Disconnect();
        end;
    end, 
    on_command_run = function(v62) --[[ Line: 200 ]] --[[ Name: on_command_run ]]
        -- upvalues: v6 (copy)
        local v63 = v6.after_command_run:connect(v62);
        return function() --[[ Line: 203 ]]
            -- upvalues: v63 (copy)
            v63:disconnect();
        end;
    end, 
    initiate_default_lifecycle = function() --[[ Line: 135 ]] --[[ Name: initiate_default_lifecycle ]]
        -- upvalues: v13 (copy), v8 (copy), v5 (copy), v12 (copy), l_Players_0 (copy), v36 (copy), v40 (copy), v6 (copy), v48 (copy), l_RunService_0 (copy), v9 (copy)
        if v13 then
            v8.client.init();
            v8.client.on_command_registered(v5.register_command);
            v8.client.on_invoke_reply(v5.receive_server_results);
            v8.client.on_log_received(v5.log);
            v8.client.on_user_info_received(v5.create_local_user);
            v8.client.on_role_info_received(v5.update_role_permissions);
            v8.client.on_user_roles_update(v5.update_user_roles);
            return;
        else
            if v12 then
                v8.server.init();
                l_Players_0.PlayerAdded:Connect(v36);
                l_Players_0.PlayerRemoving:Connect(v40);
                local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
                local l_v36_0 = v36;
                for v66, v67 in l_l_Players_0_Players_0 do
                    l_v36_0(v67, v66);
                end;
                l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
                l_v36_0 = function(v68) --[[ Line: 157 ]]
                    -- upvalues: v36 (ref), v6 (ref)
                    local v69 = v36(v68);
                    if not v69.dirty then
                        return;
                    else
                        for _, v71 in v6.console.commands do
                            v6.replicate_to_player(v69.player, v71);
                        end;
                        v69.dirty = false;
                        return;
                    end;
                end;
                for v72, v73 in l_l_Players_0_Players_0 do
                    l_v36_0(v73, v72);
                end;
                v8.server.on_command_invoke(v48);
                l_RunService_0.Heartbeat:Connect(function() --[[ Line: 163 ]]
                    -- upvalues: v9 (ref), v6 (ref)
                    for _, v75 in v9.users do
                        if v75.dirty then
                            for _, v77 in v6.console.commands do
                                v6.replicate_to_player(v75.player, v77);
                            end;
                            v75.dirty = false;
                        end;
                    end;
                end);
            end;
            return;
        end;
    end, 
    has_permissions = v11.has_permissions, 
    set_role_permissions = v25, 
    give_roles = v11.give_roles, 
    remove_roles = v11.remove_roles, 
    get_user = v36, 
    set_var = v6.write_global, 
    get_command_context = l_get_command_context_0, 
    register_type = v6.register_type, 
    log = function(v78, v79) --[[ Line: 220 ]] --[[ Name: log ]]
        -- upvalues: v12 (copy), v9 (copy), v8 (copy), v6 (copy)
        if v12 then
            local v80 = v9.command_context[coroutine.running()];
            if not v80 then
                return;
            else
                local l_player_0 = v80.executor.player;
                if not l_player_0 then
                    return;
                else
                    v8.server.fire_log(l_player_0, {
                        kind = v78, 
                        text = v79
                    });
                    return;
                end;
            end;
        else
            v6.console.output({
                kind = v78, 
                text = v79
            });
            return;
        end;
    end, 
    register_default_commands = v4, 
    console = v6.console, 
    analyze = v6.analyze, 
    _ = {
        create_user = v11.create_user, 
        disconnect_user = v11.disconnect_user, 
        create_local_user = function() --[[ Line: 241 ]] --[[ Name: create_local_user ]]
            -- upvalues: v11 (copy), v9 (copy), l_create_user_0 (copy)
            local v82 = v11.obtain_user_key(false, "local");
            local v83 = v9.users[v82] or l_create_user_0({
                name = v82, 
                player = false
            });
            v9.local_user = v83;
            return v83;
        end
    }
};