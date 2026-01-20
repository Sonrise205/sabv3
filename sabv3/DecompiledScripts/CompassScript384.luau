local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local _ = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Debounce);
local v7 = require(l_Packages_0.Synchronizer);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v9 = require(l_Datas_0.Animals);
local l_Compass_0 = l_ReplicatedStorage_0:WaitForChild("Models").ToolsExtras.Compass.Compass;
local l_Parent_0 = script.Parent;
local l_Handle_0 = l_Parent_0.Handle;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v14 = nil;
local v15 = nil;
l_Parent_0.Equipped:Connect(function() --[[ Line: 25 ]]
    -- upvalues: v15 (ref), v14 (ref), v7 (copy), l_Parent_1 (copy), v9 (copy), l_Compass_0 (copy), l_Parent_0 (copy), l_RunService_0 (copy), l_Handle_0 (copy)
    local v16 = {};
    local l_Plots_0 = workspace.Plots;
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v14 then
        v14:Destroy();
        v14 = nil;
    end;
    for _, v19 in l_Plots_0:GetChildren() do
        if v19:IsA("Model") then
            local l_Name_0 = v19.Name;
            local v21 = v7:GetAllChannels()[l_Name_0];
            if v21 and v21.CacheTable then
                local l_CacheTable_0 = v21.CacheTable;
                if (not l_CacheTable_0.Owner or l_CacheTable_0.Owner ~= l_Parent_1) and l_CacheTable_0.AnimalList then
                    for _, v24 in l_CacheTable_0.AnimalList do
                        if typeof(v24) == "table" then
                            table.insert(v16, {
                                Plot = l_Name_0, 
                                AnimalIndex = v24.Index
                            });
                        end;
                    end;
                end;
            end;
        end;
    end;
    table.sort(v16, function(v25, v26) --[[ Line: 75 ]]
        -- upvalues: v9 (ref)
        return v9[v25.AnimalIndex].Generation > v9[v26.AnimalIndex].Generation;
    end);
    local v27 = 0;
    if next(v16) then
        local l_Spawn_0 = l_Plots_0[v16[1].Plot]:FindFirstChild("Spawn");
        if not l_Spawn_0 then
            return;
        else
            local v29 = l_Compass_0:Clone();
            v29.CFrame = CFrame.new();
            v29.Parent = l_Parent_0.Handle;
            v14 = v29;
            v15 = l_RunService_0.RenderStepped:Connect(function(v30) --[[ Line: 96 ]]
                -- upvalues: v14 (ref), l_Parent_1 (ref), l_Spawn_0 (copy), v27 (ref), l_Handle_0 (ref)
                if not v14 then
                    return;
                elseif not l_Parent_1.Character or not l_Spawn_0 then
                    return;
                else
                    v27 = v27 + v30;
                    local v31 = CFrame.lookAt(l_Handle_0.CFrame.Position, l_Spawn_0.Position);
                    local v32 = math.sin(v27 * 2 * 3.141592653589793 * 1.2) * 0.35;
                    v31 = v31 * CFrame.new(0, 0, v32);
                    v14.CFrame = l_Handle_0.CFrame:ToObjectSpace(v31);
                    return;
                end;
            end);
        end;
    end;
end);
l_Parent_0.Unequipped:Connect(function() --[[ Line: 117 ]]
    -- upvalues: v15 (ref), v14 (ref)
    if v15 then
        v15:Disconnect();
        v15 = nil;
    end;
    if v14 then
        v14:Destroy();
        v14 = nil;
    end;
end);