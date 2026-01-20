local l_Players_0 = game:GetService("Players");
local l_Lighting_0 = game:GetService("Lighting");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_PlayerScripts_0 = l_Players_0.LocalPlayer.PlayerScripts;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Controls_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
local v6 = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v8 = require(l_Packages_0.Net);
local l_Buzzing_0 = script.Buzzing;
local v10 = v8:RemoteEvent("UseItem");
local l_originalMoveFunction_0 = v6.originalMoveFunction;
local v12 = {};
v10.OnClientEvent:Connect(function(v13) --[[ Line: 25 ]]
    -- upvalues: l_CurrentCamera_0 (copy), l_Buzzing_0 (copy), l_Controls_0 (copy), v6 (copy), l_Lighting_0 (copy), l_originalMoveFunction_0 (copy)
    if v13 ~= "Bee Attack" then
        return;
    else
        l_CurrentCamera_0.FieldOfView = 20;
        l_Buzzing_0:Play();
        l_Controls_0.moveFunction = function(v14, v15, v16) --[[ Line: 32 ]]
            -- upvalues: v6 (ref)
            v6:RequestMove(v14, -v15, v16);
        end;
        local v17 = script.ColorCorrection:Clone();
        v17.Parent = l_Lighting_0;
        local l_BlurEffect_0 = Instance.new("BlurEffect");
        l_BlurEffect_0.Size = 10;
        l_BlurEffect_0.Name = "BeeBlur";
        l_BlurEffect_0.Parent = l_Lighting_0;
        task.delay(5, function() --[[ Line: 44 ]]
            -- upvalues: l_Controls_0 (ref), l_originalMoveFunction_0 (ref), l_CurrentCamera_0 (ref), v17 (copy), l_BlurEffect_0 (copy)
            l_Controls_0.moveFunction = l_originalMoveFunction_0;
            l_CurrentCamera_0.FieldOfView = 70;
            v17:Destroy();
            l_BlurEffect_0:Destroy();
        end);
        return;
    end;
end);
return v12;