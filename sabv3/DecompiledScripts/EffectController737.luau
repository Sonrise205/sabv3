local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local _ = require(script.Types);
local v3 = {
    Effects = {}, 
    ActiveEffects = {}
};
v3.Activate = function(_, v5) --[[ Line: 12 ]] --[[ Name: Activate ]]
    -- upvalues: v3 (copy)
    local v6 = v3.Effects[v5];
    if not v6 then
        return false;
    else
        if type(v6.Activate) == "function" then
            v6:Activate();
        end;
        return true;
    end;
end;
v3.Run = function(_, v8, v9) --[[ Line: 25 ]] --[[ Name: Run ]]
    -- upvalues: v3 (copy)
    local v10 = v3.Effects[v9];
    if not v10 then
        return false, false;
    else
        if not v3.ActiveEffects[v9] then
            v3.ActiveEffects[v9] = {};
        end;
        local v11 = table.clone(v3.ActiveEffects[v9]);
        v3.ActiveEffects[v9][v8] = true;
        if next(v11) then
            if type(v10.OnUpdate) == "function" then
                v10:OnUpdate();
            end;
            return false, true;
        else
            if type(v10.OnStart) == "function" then
                v10:OnStart();
            end;
            return true, true;
        end;
    end;
end;
v3.Stop = function(_, v13, v14) --[[ Line: 52 ]] --[[ Name: Stop ]]
    -- upvalues: v3 (copy)
    local v15 = v3.Effects[v14];
    if not v15 then
        return false;
    elseif not v3.ActiveEffects[v14] then
        return false;
    elseif not next(v3.ActiveEffects[v14]) then
        return false;
    else
        v3.ActiveEffects[v14][v13] = nil;
        if type(v15.OnUpdate) == "function" then
            v15:OnUpdate();
        end;
        if next(v3.ActiveEffects[v14]) then
            return false;
        else
            v3.ActiveEffects[v14] = nil;
            if type(v15.OnStop) == "function" then
                v15:OnStop();
            end;
            return true;
        end;
    end;
end;
v3.Load = function(_) --[[ Line: 85 ]] --[[ Name: Load ]]
    -- upvalues: v3 (copy)
    for _, v18 in script.Effects:GetChildren() do
        if v18:IsA("ModuleScript") then
            local v19, v20 = coroutine.resume(coroutine.create(require), v18);
            if not v19 or type(v20) ~= "table" then
                warn((("Effect %* failed to load:\n%*"):format(v18:GetFullName(), v20 == nil and "yielded (possibly)" or v20)));
            else
                if type(v20.OnLoad) == "function" then
                    local v21, v22 = coroutine.resume(coroutine.create(v20.OnLoad), v20);
                    if not v21 then
                        warn((("Effect %* failed to call Load function:\n%*"):format(v18:GetFullName(), v22 == nil and "yielded (possibly)" or v22)));
                        continue;
                    end;
                end;
                v3.Effects[v18.Name] = v20;
            end;
        end;
    end;
end;
v3.Start = function(_) --[[ Line: 109 ]] --[[ Name: Start ]]

end;
return v3;