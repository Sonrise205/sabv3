--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local function v4(v2) --[[ Line: 60 ]] --[[ Name: DestroyThing ]]
    if typeof(v2) == "RBXScriptConnection" then
        task.spawn(v2.Disconnect, v2);
        return;
    elseif typeof(v2) == "Instance" then
        if v2:IsA("AnimationTrack") and v2.IsPlaying then
            task.spawn(function() --[[ Line: 66 ]]
                -- upvalues: v2 (copy)
                v2:Stop(0.05);
                task.delay(0.11666666666666667, function() --[[ Line: 68 ]]
                    -- upvalues: v2 (ref)
                    v2:Destroy();
                end);
            end);
            return;
        else
            task.spawn(v2.Destroy, v2);
            return;
        end;
    elseif type(v2) == "thread" then
        pcall(task.cancel, v2);
        return;
    elseif type(v2) == "function" then
        task.spawn(v2);
        return;
    else
        if type(v2) == "table" then
            task.spawn(function(v3) --[[ Line: 80 ]]
                if v3.Destroy then
                    v3:Destroy();
                    return;
                else
                    if v3.Disconnect then
                        v3:Disconnect();
                    end;
                    return;
                end;
            end, v2);
        end;
        return;
    end;
end;
local function v8(v5) --[[ Line: 90 ]] --[[ Name: Destroy ]]
    -- upvalues: v4 (copy)
    if v5.Destroyed then
        return false;
    else
        v5.Destroyed = true;
        for _, v7 in ipairs(v5.Things) do
            v4(v7);
        end;
        v5.Destroying:Fire();
        return true;
    end;
end;
local function v10(v9) --[[ Line: 102 ]] --[[ Name: IsDestroyed ]]
    return v9.Destroyed;
end;
local function v13(v11, v12) --[[ Line: 106 ]] --[[ Name: Add ]]
    -- upvalues: v4 (copy)
    if v12 ~= nil then
        if typeof(v12) ~= "RBXScriptConnection" and typeof(v12) ~= "Instance" and type(v12) ~= "thread" and type(v12) ~= "function" then
            if type(v12) == "table" then
                if type(v12.Destroy) ~= "function" and type(v12.Disconnect) ~= "function" then
                    error("Unknown thing: table (missing Destroy/Disconnect)");
                end;
            else
                error((("Unknown thing: %*"):format((typeof(v12)))));
            end;
        end;
        if not v11.Destroyed then
            table.insert(v11.Things, v12);
            return v12;
        else
            v4(v12);
        end;
    end;
    return v12;
end;
local v14 = {
    Destroy = v8, 
    IsDestroyed = v10, 
    Add = v13
};
local v15 = table.freeze({
    __index = v14, 
    __call = v13
});
table.freeze(v14);
local v16 = {
    new = function() --[[ Line: 147 ]] --[[ Name: new ]]
        -- upvalues: v1 (copy), v15 (copy)
        return (setmetatable({
            Destroyed = false, 
            Destroying = v1.new(), 
            Things = {}
        }, v15));
    end
};
return table.freeze(v16);