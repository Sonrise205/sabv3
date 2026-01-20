local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_ToolsScreen_0 = l_PlayerGui_0:WaitForChild("ToolsScreen");
local l_Controls_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local v9 = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v11 = require(l_Packages_0.Net):RemoteEvent("UseItem");
local l_originalMoveFunction_0 = v9.originalMoveFunction;
local v13 = {};
v11.OnClientEvent:Connect(function(v14) --[[ Line: 26 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_ToolsScreen_0 (copy), l_Controls_0 (copy), v9 (copy), l_originalMoveFunction_0 (copy)
    if v14 ~= "Fire Extinguisher" then
        return;
    else
        local v15 = math.sqrt(l_CurrentCamera_0.ViewportSize.X * l_CurrentCamera_0.ViewportSize.X + l_CurrentCamera_0.ViewportSize.Y * l_CurrentCamera_0.ViewportSize.Y);
        for _ = 1, math.random(3, 6) do
            local l_Frame_0 = Instance.new("Frame");
            l_Frame_0.Size = UDim2.new();
            l_Frame_0.BorderSizePixel = 0;
            l_Frame_0.BackgroundTransparency = 1;
            l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
            l_Frame_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
            l_Frame_0.Position = UDim2.new(math.random(), 0, math.random(), 0);
            l_Frame_0.Parent = l_ToolsScreen_0;
            local l_UICorner_0 = Instance.new("UICorner");
            l_UICorner_0.CornerRadius = UDim.new(1, 0);
            l_UICorner_0.Parent = l_Frame_0;
            local l_UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint");
            l_UIAspectRatioConstraint_0.AspectRatio = 1;
            l_UIAspectRatioConstraint_0.Parent = l_Frame_0;
            local v20 = math.random(math.floor(v15 * 0.3), (math.floor(v15 * 0.6)));
            game:GetService("TweenService"):Create(l_Frame_0, TweenInfo.new(0.5), {
                Size = UDim2.new(0, v20, 0, v20), 
                BackgroundTransparency = 0.1
            }):Play();
            task.delay(8, function() --[[ Line: 61 ]]
                -- upvalues: l_Frame_0 (copy)
                local v21 = game:GetService("TweenService"):Create(l_Frame_0, TweenInfo.new(0.5), {
                    Size = UDim2.new()
                });
                v21:Play();
                v21.Completed:Wait();
                l_Frame_0:Destroy();
            end);
        end;
        l_Controls_0.moveFunction = function(v22, v23, v24) --[[ Line: 71 ]]
            -- upvalues: v9 (ref)
            v9:RequestMove(v22, -v23, v24);
        end;
        task.delay(8, function() --[[ Line: 75 ]]
            -- upvalues: l_Controls_0 (ref), l_originalMoveFunction_0 (ref)
            l_Controls_0.moveFunction = l_originalMoveFunction_0;
        end);
        return;
    end;
end);
return v13;