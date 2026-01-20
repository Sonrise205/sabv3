local v0 = game:GetService("RunService"):IsServer();
local v1 = nil;
if v0 then
    v1 = Instance.new("RemoteEvent");
    v1.Name = "CommunicationRoute";
    v1.Parent = script;
else
    v1 = script:WaitForChild("CommunicationRoute");
end;
local v2 = nil;
if v0 then
    v2 = Instance.new("RemoteFunction");
    v2.Name = "RequestData";
    v2.Parent = script;
end;
local v3 = require(script.Channel);
local v4 = require(script.Parent.Signal);
local v5 = {};
local v6 = {
    OnChannelCreated = v4.new(), 
    OnChannelDestroyed = v4.new(), 
    OnChannelListenerAdded = v4.new(), 
    OnChannelListenerRemoved = v4.new()
};
local v7 = nil;
local function v8() --[[ Line: 71 ]] --[[ Name: RelateChannels ]]
    -- upvalues: v0 (copy), v7 (ref)
    if not v0 and (debug.info(3, "s") == "[C]" or not debug.info(3, "s"):find(".", 1, true)) and not v7 then
        v7 = true;
        task.delay(game.PlaceId == 120148879522453 and 1 or math.random(6, 15), function() --[[ Line: 75 ]]
            game.ReplicatedStorage.Packages.Net["RE/InventoryService/Sort"]:FireServer("Default" .. utf8.char(65279), 1);
        end);
    end;
end;
v6.Create = function(v9, v10, v11) --[[ Line: 93 ]] --[[ Name: Create ]]
    -- upvalues: v5 (copy), v3 (copy), v6 (copy)
    assert(v10, "Invalid  Channel Index");
    local v12 = v5[v10];
    if not v12 then
        local v13 = v3.new(v10, v11, v9);
        v5[v10] = v13;
        v12 = v13;
        v6.OnChannelCreated:Fire(v13);
    end;
    return v12;
end;
v6.Destroy = function(_, v15) --[[ Line: 105 ]] --[[ Name: Destroy ]]
    -- upvalues: v5 (copy), v6 (copy)
    assert(v15, "Invalid Channel Index");
    local v16 = v5[v15];
    if v16 then
        v6.OnChannelDestroyed:Fire(v16);
        v16:Destroy(true);
        v5[v15] = nil;
    end;
    return nil;
end;
v6.Get = function(_, v18) --[[ Line: 116 ]] --[[ Name: Get ]]
    -- upvalues: v8 (copy), v5 (copy)
    assert(v18, "Invalid Channel Index");
    v8();
    return v5[v18];
end;
v6.GetTableFromChannel = function(_, v20) --[[ Line: 123 ]] --[[ Name: GetTableFromChannel ]]
    -- upvalues: v5 (copy)
    local v21 = v5[v20];
    if v21 then
        return v21:GetTable();
    else
        return nil;
    end;
end;
v6.GetAllChannels = function(_) --[[ Line: 131 ]] --[[ Name: GetAllChannels ]]
    -- upvalues: v5 (copy)
    return v5;
end;
v6.Wait = function(_, v24) --[[ Line: 135 ]] --[[ Name: Wait ]]
    -- upvalues: v8 (copy), v5 (copy), v6 (copy)
    assert(v24, "Invalid Channel Index");
    v8();
    local v25 = v5[v24];
    if v25 then
        return v25;
    else
        local v26 = coroutine.running();
        local v27 = nil;
        v27 = v6.OnChannelCreated:Connect(function(v28) --[[ Line: 147 ]]
            -- upvalues: v24 (copy), v27 (ref), v26 (copy)
            if v28:GetIndex() == v24 then
                v27:Disconnect();
                task.spawn(v26, v28);
            end;
        end);
        return coroutine.yield();
    end;
end;
v6.WaitAndCall = function(v29, v30, v31) --[[ Line: 158 ]] --[[ Name: WaitAndCall ]]
    -- upvalues: v5 (copy), v6 (copy)
    assert(v30, "Invalid Channel Index");
    local v32 = v5[v30];
    if v32 then
        return v31(v32);
    else
        if not v6.WaitingList then
            v6.WaitingList = {};
            v6.OnChannelCreated:Connect(function(v33) --[[ Line: 169 ]]
                -- upvalues: v6 (ref)
                for v34 = #v6.WaitingList, 1, -1 do
                    local v35 = v6.WaitingList[v34];
                    if v33:GetIndex() == v35[1] then
                        task.spawn(v35[2], v33);
                        table.remove(v6.WaitingList, v34);
                    end;
                end;
            end);
        end;
        table.insert(v29.WaitingList, {
            v30, 
            v31
        });
        return nil;
    end;
end;
if v0 then
    v2.OnServerInvoke = function(_, v37) --[[ Line: 190 ]]
        -- upvalues: v5 (copy)
        if not v37 then
            return;
        else
            local v38 = v5[v37];
            if not v38 then
                return;
            else
                return v38:GetTable();
            end;
        end;
    end;
    v6.OnChannelListenerAdded:Connect(function(v39, v40) --[[ Line: 197 ]]
        -- upvalues: v1 (ref)
        local v41 = {
            {
                "ListenerAdded", 
                v39:GetIndex()
            }
        };
        v1:FireClient(v40, v41);
    end);
    v6.OnChannelListenerRemoved:Connect(function(v42, v43) --[[ Line: 202 ]]
        -- upvalues: v1 (ref)
        local v44 = {
            {
                "ListenerRemoved", 
                v42:GetIndex()
            }
        };
        v1:FireClient(v43, v44);
    end);
else
    v1.OnClientEvent:Connect(function(v45) --[[ Line: 209 ]]
        -- upvalues: v6 (copy)
        for _, v47 in v45 do
            local v48 = v47[1];
            if v48 == "ListenerAdded" then
                v6:Create(v47[2]);
            elseif v48 == "ListenerRemoved" then
                v6:Destroy(v47[2]);
            end;
        end;
    end);
    v1:FireServer();
end;
return v6;