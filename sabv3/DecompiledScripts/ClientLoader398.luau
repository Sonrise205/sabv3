if not workspace:FindFirstChild("Map"):FindFirstChild("__StreamCheck_DontDelete"):FindFirstChild("Part") then
    if not workspace:FindFirstChild("Map"):FindFirstChild("Collisions") then
        workspace.PersistentLoaded:Wait();
        print("[STREAMING ENABLED BUILD]: PersistentModels loaded");
    end;
else
    print("[STREAMING DISABLED BUILD]: Client starting");
end;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("StarterGui");
local _ = game:GetService("RunService");
local v3 = {};
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v5 = 0;
local v6 = 0;
local l_PlayerGui_0 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui");
for _, v9 in l_ReplicatedStorage_0:WaitForChild("ReplicatedGui"):GetChildren() do
    v9.Parent = l_PlayerGui_0;
end;
task.spawn(require, l_ReplicatedStorage_0.Packages.PlayerMouse);
task.spawn(require, script.UIStrokeAdjuster);
task.spawn(require, l_ReplicatedStorage_0.Packages.FFlags);
task.spawn(require, l_ReplicatedStorage_0.Packages.Net);
task.spawn(require, l_ReplicatedStorage_0.Packages.Debounce);
for _, v11 in l_Controllers_0:GetChildren() do
    if v11:IsA("ModuleScript") then
        local v12 = false;
        task.delay(10, function() --[[ Line: 52 ]]
            -- upvalues: v12 (ref), v11 (copy)
            if not v12 then
                print((("Module %* is taking too long to Require"):format((v11:GetFullName()))));
            end;
        end);
        local v13 = nil;
        local v14 = nil;
        task.spawn(function() --[[ Line: 59 ]]
            -- upvalues: v11 (copy), v13 (ref), v14 (ref)
            debug.setmemorycategory(v11.Name);
            local v15, v16 = xpcall(require, warn, v11);
            v13 = v15;
            v14 = v16;
        end);
        while v13 == nil do
            task.wait();
        end;
        v12 = true;
        if not v13 then
            --[[ close >= 15 ]]
        else
            v3[v11.Name] = v14;
            v5 = v5 + 1;
            --[[ close >= 15 ]]
        end;
    end;
end;
for v17, v18 in v3 do
    task.spawn(function() --[[ Line: 80 ]]
        -- upvalues: v17 (copy), v18 (copy), v6 (ref)
        debug.setmemorycategory(v17);
        local v19 = false;
        task.delay(10, function() --[[ Line: 83 ]]
            -- upvalues: v19 (ref), v17 (ref)
            if not v19 then
                print((("Module %* is taking too long to Load"):format(v17)));
            end;
        end);
        if v18.Load then
            v18:Load();
        end;
        v19 = true;
        v6 = v6 + 1;
    end);
end;
while v5 ~= v6 do
    task.wait();
end;
for v20, v21 in v3 do
    task.spawn(function() --[[ Line: 105 ]]
        -- upvalues: v20 (copy), v21 (copy)
        debug.setmemorycategory(v20);
        if v21.Start then
            v21:Start();
        end;
    end);
end;
for _, v23 in l_ReplicatedStorage_0:WaitForChild("Components"):GetChildren() do
    if v23:IsA("ModuleScript") then
        xpcall(require, warn, v23);
    end;
end;
for _, v25 in l_ReplicatedStorage_0:WaitForChild("ClientToolScripts"):GetChildren() do
    if v25:IsA("Script") then
        v25.Enabled = true;
    end;
end;