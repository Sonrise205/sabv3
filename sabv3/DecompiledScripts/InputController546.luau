local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Input);
local v5 = require(l_Packages_0.Signal);
local v6 = require(l_Packages_0.Net);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local _ = require(l_Classes_0.ClickEffect);
local v9 = v6:RemoteEvent("TeleportService/Reconnect");
local _ = l_Players_0.LocalPlayer;
local v11 = {
    Mouse = v4.Mouse.new(), 
    Gamepad = v4.Gamepad.new(), 
    Touch = v4.Touch.new(), 
    Keyboard = v4.Keyboard.new()
};
local v12 = {
    OnMouseLeftBegan = v5.new()
};
return {
    Events = function(_, v14) --[[ Line: 38 ]] --[[ Name: Events ]]
        -- upvalues: v12 (copy)
        return v12[v14];
    end, 
    Get = function(_, v16) --[[ Line: 42 ]] --[[ Name: Get ]]
        -- upvalues: v11 (copy)
        return v11[v16];
    end, 
    Start = function(_) --[[ Line: 46 ]] --[[ Name: Start ]]
        -- upvalues: l_UserInputService_0 (copy), v12 (copy), v9 (copy)
        local v18 = os.clock();
        l_UserInputService_0.InputBegan:Connect(function(v19, v20) --[[ Line: 48 ]]
            -- upvalues: v18 (ref), v12 (ref)
            v18 = os.clock();
            if v19.UserInputType == Enum.UserInputType.MouseButton1 then
                v12.OnMouseLeftBegan:Fire(v19, v20);
            end;
        end);
        task.spawn(function() --[[ Line: 56 ]]
            -- upvalues: v18 (ref), v9 (ref)
            while task.wait(5) do
                if os.clock() - v18 >= 1140 then
                    v9:FireServer();
                end;
            end;
        end);
    end
};