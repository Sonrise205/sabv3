local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v3 = require(script.Flags);
local v4 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v5 = v4.new();
local v6 = v4.new();
local v7 = false;
local v8 = nil;
local function _(v9) --[[ Line: 22 ]] --[[ Name: IsAction ]]
    local v10 = true;
    if v9.UserInputType ~= Enum.UserInputType.Touch then
        v10 = true;
        if v9.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v10 = v9.KeyCode == Enum.KeyCode.ButtonR2;
        end;
    end;
    return v10;
end;
local function _(v12, v13, v14) --[[ Line: 28 ]] --[[ Name: SetInputDown ]]
    -- upvalues: v8 (ref), v7 (ref), v5 (copy), v6 (copy)
    v8 = nil;
    if v7 == v12 then
        return;
    else
        v7 = v12;
        if v12 then
            v5:Fire(v13, v14);
            return;
        else
            v6:Fire(v13);
            return;
        end;
    end;
end;
l_UserInputService_0.InputBegan:Connect(function(v16, v17) --[[ Line: 45 ]]
    -- upvalues: v7 (ref), v8 (ref), v5 (copy)
    if v17 then
        return;
    else
        local v18 = true;
        if v16.UserInputType ~= Enum.UserInputType.Touch then
            v18 = true;
            if v16.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v18 = v16.KeyCode == Enum.KeyCode.ButtonR2;
            end;
        end;
        if v18 and not v7 then
            if v16.UserInputType == Enum.UserInputType.Touch then
                v8 = {
                    Object = v16, 
                    Origin = v16.Position, 
                    Age = 0
                };
                return;
            else
                v18 = v16.Position;
                v8 = nil;
                if v7 == true then
                    return;
                else
                    v7 = true;
                    v5:Fire(v16, v18);
                end;
            end;
        end;
        return;
    end;
end);
l_UserInputService_0.InputChanged:Connect(function(v19, v20) --[[ Line: 61 ]]
    -- upvalues: v8 (ref), v3 (copy)
    if v20 then
        return;
    else
        if v8 and v8.Object == v19 and (v8.Origin - v19.Position).Magnitude > v3.DraggingThreshold:Get() then
            v8 = nil;
        end;
        return;
    end;
end);
l_UserInputService_0.InputEnded:Connect(function(v21, v22) --[[ Line: 72 ]]
    -- upvalues: v8 (ref), v3 (copy), v7 (ref), v5 (copy), v6 (copy)
    if v22 then
        return;
    else
        if v8 and v8.Object == v21 then
            if (v8.Origin - v8.Object.Position).Magnitude > v3.DraggingThreshold:Get() then
                v8 = nil;
            else
                local l_Object_0 = v8.Object;
                local l_Origin_0 = v8.Origin;
                v8 = nil;
                if v7 ~= true then
                    v7 = true;
                    v5:Fire(l_Object_0, l_Origin_0);
                end;
            end;
        end;
        local v25 = true;
        if v21.UserInputType ~= Enum.UserInputType.Touch then
            v25 = true;
            if v21.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v25 = v21.KeyCode == Enum.KeyCode.ButtonR2;
            end;
        end;
        if v25 then
            v25 = v21.Position;
            v8 = nil;
            if v7 == false then
                return;
            else
                v7 = false;
                v6:Fire(v21);
            end;
        end;
        return;
    end;
end);
l_RunService_0:BindToRenderStep("ActionController", Enum.RenderPriority.Input.Value, function(v26) --[[ Line: 90 ]]
    -- upvalues: v8 (ref), v3 (copy), v7 (ref), v5 (copy)
    if v8 then
        local l_v8_0 = v8;
        l_v8_0.Age = l_v8_0.Age + v26;
        if v8.Age >= v3.TouchDuration:Get() then
            if (v8.Origin - v8.Object.Position).Magnitude > v3.DraggingThreshold:Get() then
                v8 = nil;
                return;
            else
                local l_Object_1 = v8.Object;
                local l_Origin_1 = v8.Origin;
                v8 = nil;
                if v7 == true then
                    return;
                else
                    v7 = true;
                    v5:Fire(l_Object_1, l_Origin_1);
                end;
            end;
        end;
    end;
end);
return table.freeze({
    Pressed = v5, 
    Released = v6, 
    IsInputDown = function() --[[ Line: 110 ]] --[[ Name: IsInputDown ]]
        -- upvalues: v7 (ref)
        return v7;
    end
});