--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Logging);
local v3 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v10 = {
    Disconnect = function(v4) --[[ Line: 53 ]] --[[ Name: Disconnect ]]
        v4.Connection:Disconnect();
        v4:OnDisconnected();
    end, 
    OnDisconnected = function(v5) --[[ Line: 58 ]] --[[ Name: OnDisconnected ]]
        if v5.Vars.Disconnected then
            return;
        else
            v5.Vars.Disconnected = true;
            for _, v7 in ipairs(v5.Callbacks) do
                task.spawn(v7);
            end;
            table.clear(v5.Callbacks);
            return;
        end;
    end, 
    Then = function(v8, v9) --[[ Line: 69 ]] --[[ Name: Then ]]
        -- upvalues: v3 (copy)
        v3.Function(v9);
        if v8.Vars.Disconnected then
            task.spawn(v9);
            return;
        else
            table.insert(v8.Callbacks, v9);
            return;
        end;
    end
};
local v11 = table.freeze({
    __index = table.freeze(v10)
});
new = function(v12, v13) --[[ Line: 81 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v11 (copy), l_RunService_0 (copy), v2 (copy)
    v3.FiniteNonNegative(v12);
    v3.Function(v13);
    local v14 = setmetatable({
        Callbacks = {}, 
        Connection = nil, 
        Vars = {
            Disconnected = false
        }
    }, v11);
    local v15 = 0;
    local v16 = nil;
    v16 = l_RunService_0.RenderStepped:Connect(function(v17) --[[ Line: 99 ]]
        -- upvalues: v15 (ref), v12 (copy), v16 (ref), v13 (copy), v2 (ref), v14 (copy)
        local v18 = false;
        local l_v15_0 = v15;
        v15 = v15 + v17;
        if v12 <= v15 then
            v15 = v12;
            v16:Disconnect();
            v18 = true;
        end;
        local v20 = v12 <= v15 and 1 or v15 / v12;
        local l_v15_1 = v15;
        local v22 = v15 - l_v15_0;
        local l_status_0, l_result_0 = pcall(v13, v20, l_v15_1, v22);
        if not l_status_0 then
            v2.Warn("RenderError", l_result_0);
        end;
        if not l_status_0 or l_result_0 ~= nil then
            v16:Disconnect();
            v18 = true;
        end;
        if v18 then
            v14:OnDisconnected();
        end;
    end);
    v14.Connection = v16;
    table.freeze(v14);
    return v14;
end;
return new;