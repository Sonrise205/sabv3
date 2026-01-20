local l_RunService_0 = game:GetService("RunService");
local v1 = require("./constants");
local v2 = require("./net");
local v3 = require("./state");
local _ = require("./types");
local v5 = l_RunService_0:IsServer();
return {
    obtain_user_key = function(v6, v7) --[[ Line: 11 ]] --[[ Name: obtain_user_key ]]
        if v6 then
            return (("player-%*"):format(v6.UserId));
        else
            return (("server-%*"):format(v7));
        end;
    end, 
    create_user = function(v8) --[[ Line: 15 ]] --[[ Name: create_user ]]
        -- upvalues: v5 (copy), v2 (copy), v3 (copy)
        local v9 = {};
        local l_player_0 = v8.player;
        local l_name_0 = v8.name;
        v9.id = if l_player_0 then ("player-%*"):format(l_player_0.UserId) else ("server-%*"):format(l_name_0);
        v9.name = v8.name;
        v9.player = v8.player;
        v9.disconnected = false;
        v9.dirty = false;
        v9.roles = {};
        if v5 and v9.player then
            v2.server.fire_create_user(v9.player, v9.id, v9.name);
        end;
        v3.users[v9.id] = v9;
        return v9;
    end, 
    disconnect_user = function(v12) --[[ Line: 57 ]] --[[ Name: disconnect_user ]]
        -- upvalues: v3 (copy)
        if v12.disconnected == true then
            return;
        else
            v12.disconnected = true;
            v3.users[v12.id] = nil;
            return;
        end;
    end, 
    has_permissions = function(v13, ...) --[[ Line: 38 ]] --[[ Name: has_permissions ]]
        -- upvalues: v1 (copy), v3 (copy)
        local v14 = {
            ...
        };
        for _, v16 in v13.roles do
            if v1.ADMIN_ROLE == v16 then
                return true;
            elseif v3.roles[v16] then
                for _, v18 in v3.roles[v16] do
                    local v19 = table.find(v14, v18);
                    if v19 then
                        table.remove(v14, v19);
                        if #v14 == 0 then
                            return true;
                        end;
                    end;
                end;
            end;
        end;
        return false;
    end, 
    give_roles = function(v20, ...) --[[ Line: 65 ]] --[[ Name: give_roles ]]
        -- upvalues: v5 (copy), v2 (copy)
        if v20.disconnected then
            return;
        else
            local v21 = {};
            for v22 = 1, select("#", ...) do
                local v23 = select(v22, ...);
                if not table.find(v21, v23) then
                    table.insert(v21, v23);
                end;
            end;
            for _, v25 in v20.roles do
                if not table.find(v21, v25) then
                    table.insert(v21, v25);
                end;
            end;
            v20.roles = v21;
            if v5 and v20.player then
                v20.dirty = true;
                v2.server.fire_update_user_roles(v20.player, {
                    id = v20.id, 
                    roles = v21
                });
            end;
            return;
        end;
    end, 
    remove_roles = function(v26, ...) --[[ Line: 92 ]] --[[ Name: remove_roles ]]
        -- upvalues: l_RunService_0 (copy), v2 (copy)
        if v26.disconnected then
            return;
        else
            local v27 = table.clone(v26.roles);
            local v28 = {
                ...
            };
            for v29 = #v27, 1, -1 do
                if table.find(v28, v27[v29]) then
                    v27[v29] = v27[#v27];
                    v27[#v27] = nil;
                end;
            end;
            v26.roles = v27;
            if l_RunService_0:IsServer() and v26.player then
                v26.dirty = true;
                v2.server.fire_update_user_roles(v26.player, {
                    id = v26.id, 
                    roles = v27
                });
            end;
            return;
        end;
    end
};