local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local _ = require(l_ReplicatedStorage_0.Datas.ServerData);
local v3 = require(l_Packages_0.FFlags);
local v4 = require(l_Packages_0.Signal);
local v5 = require(l_Packages_0.Timer);
local v6 = {
    List = {}, 
    Methods = {}, 
    OnUpdateEnabled = v4.new(), 
    OnUpdateDisabled = v4.new()
};
v6.Methods.IsEnabled = function(v7) --[[ Line: 20 ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v8 = v6.List[v7];
    if not v8 then
        return false;
    else
        return workspace:GetServerTimeNow() >= v3:GetInstant(v8.FFlag, v8.UnixTimeStamp);
    end;
end;
v6.Methods.GetUpdateTime = function(v9) --[[ Line: 29 ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v10 = v6.List[v9];
    if not v10 then
        return;
    else
        return v3:GetInstant(v10.FFlag, v10.UnixTimeStamp);
    end;
end;
v6.Methods.GetTimeLeft = function(v11) --[[ Line: 38 ]]
    -- upvalues: v6 (copy), v3 (copy)
    local v12 = v6.List[v11];
    if not v12 then
        return;
    else
        return v3:GetInstant(v12.FFlag, v12.UnixTimeStamp) - workspace:GetServerTimeNow();
    end;
end;
v6.List["Update-01/17/2026"] = {
    UnixTimeStamp = 1768680000, 
    FFlag = "Update-01/17/2026"
};
(function() --[[ Line: 54 ]] --[[ Name: Setup ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy)
    local v13 = v5.new(1);
    local v14 = {};
    v13.Tick:Connect(function() --[[ Line: 57 ]]
        -- upvalues: v6 (ref), v14 (copy), v3 (ref)
        for v15, v16 in v6.List do
            if v14[v15] then
                if v14[v15] ~= v3:GetInstant(v15, v16.UnixTimeStamp) and not v6.Methods.IsEnabled(v15) then
                    v14[v15] = nil;
                    v6.OnUpdateDisabled:Fire(v15);
                end;
            elseif v6.Methods.IsEnabled(v15) then
                v14[v15] = v3:GetInstant(v15, v16.UnixTimeStamp);
                v6.OnUpdateEnabled:Fire(v15);
            end;
        end;
    end);
    v13:Start();
    for v17, v18 in v6.List do
        if v6.Methods.IsEnabled(v17) then
            v6.OnUpdateEnabled:Fire(v17);
        else
            task.spawn(function() --[[ Line: 87 ]]
                -- upvalues: v6 (ref), v17 (copy), v3 (ref), v18 (copy)
                while not v6.Methods.IsEnabled(v17) do
                    local v19 = v3:GetInstant(v18.FFlag, v18.UnixTimeStamp) - workspace:GetServerTimeNow();
                    task.wait((math.clamp(v19, 0.01, 1e999)));
                end;
                v6.OnUpdateEnabled:Fire(v17);
            end);
        end;
    end;
end)();
return v6;