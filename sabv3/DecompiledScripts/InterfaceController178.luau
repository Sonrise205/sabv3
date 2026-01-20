local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v2 = require(l_Controllers_0.InteractController);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v4 = require(l_Classes_0.Interface);
local _ = require(l_Classes_0.Interface.Styles);
local l_Toggle_0 = script.Toggle;
local v7 = {};
local v8 = {};
v8.SetState = function(_, v10, v11, v12) --[[ Line: 23 ]] --[[ Name: SetState ]]
    -- upvalues: v7 (copy), v8 (copy)
    local v13 = v7[v10];
    if not v13 then
        return;
    elseif v13:IsOpened() == v11 then
        return;
    else
        v8:Toggle(v10, v11, v12);
        return;
    end;
end;
v8.Toggle = function(_, v15, v16, v17) --[[ Line: 34 ]] --[[ Name: Toggle ]]
    -- upvalues: v7 (copy)
    local v18 = v7[v15];
    if not v18 then
        return;
    else
        local v19 = v16 ~= nil and v16 or not v18:IsOpened();
        local v20 = true;
        for v21, v22 in v7 do
            if v21 == v15 then
                v22:Toggle(v19);
                if v22:IsOpened() == false then
                    v20 = false;
                end;
            elseif v22:IsOpened() then
                if v17 then
                    if not table.find(v17, v21) then
                        v22:Close();
                    end;
                else
                    v22:Close();
                end;
            end;
        end;
        if v20 == false and v7.Hud then
            v7.Hud:Toggle(true);
        end;
        return;
    end;
end;
v8.GetInterfaces = function(_) --[[ Line: 80 ]] --[[ Name: GetInterfaces ]]
    -- upvalues: v7 (copy)
    return v7;
end;
v8.Get = function(_, v25) --[[ Line: 84 ]] --[[ Name: Get ]]
    -- upvalues: v7 (copy)
    return v7[v25];
end;
v8.Register = function(_, v27, v28, v29) --[[ Line: 90 ]] --[[ Name: Register ]]
    -- upvalues: v7 (copy), v4 (copy)
    if v7[v27] then
        return warn((("Failed to create interface: %*, already exist!"):format(v27)));
    else
        v7[v27] = v4.new(v27, v28, v29);
        return v7[v27];
    end;
end;
v8.Start = function(_) --[[ Line: 103 ]] --[[ Name: Start ]]
    -- upvalues: l_Toggle_0 (copy), v8 (copy), v2 (copy), v7 (copy)
    l_Toggle_0.Event:Connect(function(...) --[[ Line: 105 ]]
        -- upvalues: v8 (ref)
        v8:Toggle(...);
    end);
    v2.OnInteractEnter:Connect(function(v31) --[[ Line: 109 ]]
        -- upvalues: v7 (ref), v8 (ref)
        if v31:GetAttribute("Interface") ~= true then
            return;
        else
            if v7[v31.Name] and not v7[v31.Name]:IsOpened() then
                v8:Toggle(v31.Name, true);
            end;
            return;
        end;
    end);
    v2.OnInteractLeave:Connect(function(v32) --[[ Line: 116 ]]
        -- upvalues: v7 (ref), v8 (ref)
        if v32:GetAttribute("Interface") ~= true then
            return;
        else
            if v7[v32.Name] and v7[v32.Name]:IsOpened() then
                v8:Toggle(v32.Name, false);
            end;
            return;
        end;
    end);
end;
return v8;