local l_Players_0 = game:GetService("Players");
local v1 = require("./console");
local v2 = require("./net");
local v3 = require("./state");
local _ = require("./types");
local v5 = require("./user");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v7 = 0;
local function v9(v8) --[[ Line: 14 ]] --[[ Name: create_local_user ]]
    -- upvalues: v5 (copy), l_LocalPlayer_0 (copy), v3 (copy)
    v3.local_user = v5.create_user({
        name = v8.name, 
        player = l_LocalPlayer_0
    });
end;
local function v12(v10) --[[ Line: 23 ]] --[[ Name: update_user_roles ]]
    -- upvalues: v3 (copy)
    local v11 = v3.users[v10.id];
    assert(v11, "local user does not exist");
    v11.roles = v10.roles;
end;
local function v14(v13) --[[ Line: 31 ]] --[[ Name: update_role_permissions ]]
    -- upvalues: v3 (copy)
    v3.roles[v13.name] = v13.permissions;
end;
local function v18(v15) --[[ Line: 36 ]] --[[ Name: register_command ]]
    -- upvalues: v1 (copy), v7 (ref), v3 (copy), v2 (copy)
    v1.register_command(v15.name, {
        description = v15.description, 
        permissions = v15.permissions, 
        arguments = function() --[[ Line: 41 ]]
            -- upvalues: v15 (copy)
            return unpack(v15.arguments);
        end, 
        callback = function(...) --[[ Line: 43 ]] --[[ Name: callback ]]
            -- upvalues: v7 (ref), v3 (ref), v2 (ref), v15 (copy)
            local v16 = coroutine.running();
            v7 = v7 + 1;
            v3.continuations[v7] = v16;
            v2.client.invoke_command(v7, v15.name, {
                ...
            });
            local v17 = coroutine.yield();
            if v17.status == "ok" then
                return unpack(v17.results);
            else
                error("something went wrong on the server");
                return;
            end;
        end
    });
end;
return {
    create_local_user = v9, 
    update_user_roles = v12, 
    update_role_permissions = v14, 
    register_command = v18, 
    receive_server_results = function(v19) --[[ Line: 64 ]] --[[ Name: receive_server_results ]]
        -- upvalues: v3 (copy)
        local v20 = v3.continuations[v19.invoke_id];
        if not v20 then
            return;
        else
            v3.continuations[v19.invoke_id] = nil;
            task.spawn(v20, v19);
            return;
        end;
    end, 
    log = function(v21) --[[ Line: 72 ]] --[[ Name: log ]]
        -- upvalues: v1 (copy)
        v1.console.output(v21);
    end
};