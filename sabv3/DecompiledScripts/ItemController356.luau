local l_Players_0 = game:GetService("Players");
local _ = game:GetService("StarterGui");
local _ = game:GetService("ReplicatedStorage");
local l_ReplicatedStorage_1 = game:GetService("ReplicatedStorage");
local l_Packages_0 = l_ReplicatedStorage_1:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net);
local v6 = require(l_ReplicatedStorage_1.Packages.Observers);
local v7 = require(l_ReplicatedStorage_1.Controllers.BackpackController);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v10 = nil;
local l_Highlight_0 = Instance.new("Highlight");
l_Highlight_0.Name = "MainHighlight";
l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
l_Highlight_0.FillColor = Color3.fromRGB(255, 0, 0);
l_Highlight_0.FillTransparency = 0.5;
l_Highlight_0.OutlineColor = Color3.fromRGB(155, 0, 0);
l_Highlight_0.OutlineTransparency = 0.8;
l_Highlight_0.Parent = workspace;
l_Highlight_0.Adornee = script;
local v12 = {};
local v13 = {};
local function v21(v14) --[[ Line: 30 ]] --[[ Name: CooldownFunction ]]
    -- upvalues: v10 (ref)
    local l_v14_Attribute_0 = v14:GetAttribute("CurrentSlot");
    local v16 = tonumber(v14:GetAttribute("CooldownTime") or 0) or 0;
    if not v10 or not l_v14_Attribute_0 then
        return;
    else
        local l_v10_FirstChild_0 = v10:FindFirstChild(l_v14_Attribute_0);
        if not l_v10_FirstChild_0 then
            return;
        else
            local l_Icon_0 = l_v10_FirstChild_0:FindFirstChild("Icon");
            if not l_Icon_0 then
                return;
            else
                local v19 = v16 > 0;
                local l_CooldownTextLabel_0 = l_Icon_0:FindFirstChild("CooldownTextLabel");
                if l_CooldownTextLabel_0 then
                    l_CooldownTextLabel_0.Text = string.format("%0.1f", v16);
                    l_CooldownTextLabel_0.Visible = v19;
                end;
                l_Icon_0.ImageColor3 = v19 and Color3.fromRGB(90, 90, 90) or Color3.fromRGB(255, 255, 255);
                return;
            end;
        end;
    end;
end;
local function v23(v22) --[[ Line: 58 ]] --[[ Name: SetupTool ]]
    -- upvalues: v21 (copy)
    v22:GetAttributeChangedSignal("CooldownTime"):Connect(function() --[[ Line: 59 ]]
        -- upvalues: v21 (ref), v22 (copy)
        v21(v22);
    end);
    v22:GetAttributeChangedSignal("CurrentSlot"):Connect(function() --[[ Line: 63 ]]
        -- upvalues: v21 (ref), v22 (copy)
        v21(v22);
    end);
    task.spawn(v21, v22);
end;
v13.Load = function(_) --[[ Line: 70 ]] --[[ Name: Load ]]
    for _, v26 in script:GetChildren() do
        if v26:IsA("ModuleScript") then
            local l_status_0, l_result_0 = pcall(require, v26);
            if l_status_0 and l_result_0 and l_result_0.Start then
                l_result_0:Start();
            end;
        end;
    end;
end;
v13.Start = function(_) --[[ Line: 83 ]] --[[ Name: Start ]]
    -- upvalues: l_LocalPlayer_0 (copy), l_ReplicatedStorage_1 (copy), v7 (copy), l_PlayerGui_0 (copy), v10 (ref), v6 (copy), v23 (copy), v5 (copy), v12 (copy)
    local function v31() --[[ Line: 84 ]] --[[ Name: updateBlockTools ]]
        -- upvalues: l_LocalPlayer_0 (ref), l_ReplicatedStorage_1 (ref), v7 (ref)
        local v30 = not l_LocalPlayer_0:GetAttribute("BlockTools") and not l_LocalPlayer_0:GetAttribute("Stealing") and not l_LocalPlayer_0:GetAttribute("CartSeated") and not l_LocalPlayer_0:GetAttribute("TrainSeated") and not l_LocalPlayer_0:GetAttribute("SleighSeated") and not l_ReplicatedStorage_1:GetAttribute("InTrainTravelCutscene");
        v7:SetEnabled("BlockTools", v30);
    end;
    l_ReplicatedStorage_1:GetAttributeChangedSignal("InTrainTravelCutscene"):Connect(v31);
    l_LocalPlayer_0:GetAttributeChangedSignal("SleighSeated"):Connect(v31);
    l_LocalPlayer_0:GetAttributeChangedSignal("TrainSeated"):Connect(v31);
    l_LocalPlayer_0:GetAttributeChangedSignal("CartSeated"):Connect(v31);
    l_LocalPlayer_0:GetAttributeChangedSignal("BlockTools"):Connect(v31);
    l_LocalPlayer_0:GetAttributeChangedSignal("Stealing"):Connect(v31);
    task.spawn(v31);
    v10 = l_PlayerGui_0:WaitForChild("BackpackGui"):WaitForChild("Backpack"):WaitForChild("Hotbar");
    v6.observeCharacter(l_LocalPlayer_0, function(v32, _) --[[ Line: 107 ]]
        -- upvalues: v23 (ref)
        local l_Backpack_0 = v32:WaitForChild("Backpack");
        if not l_Backpack_0 then
            return nil;
        else
            for _, v36 in l_Backpack_0:GetChildren() do
                if v36:IsA("Tool") then
                    task.spawn(v23, v36);
                end;
            end;
            local v38 = l_Backpack_0.ChildAdded:Connect(function(v37) --[[ Line: 119 ]]
                -- upvalues: v23 (ref)
                if v37:IsA("Tool") then
                    v23(v37);
                end;
            end);
            return function() --[[ Line: 125 ]]
                -- upvalues: v38 (copy)
                v38:Disconnect();
            end;
        end;
    end);
    v5:RemoteEvent("Tools/Cooldown").OnClientEvent:Connect(function(v39, v40) --[[ Line: 130 ]]
        -- upvalues: v12 (ref)
        local v41 = os.clock();
        local v42 = v12[v39.Name];
        if v42 and coroutine.status(v42) ~= "suspended" then
            task.cancel(v42);
            v39:SetAttribute("CooldownTime", nil);
            v12[v39.Name] = nil;
        end;
        local v45 = task.spawn(function() --[[ Line: 144 ]]
            -- upvalues: v41 (copy), v40 (copy), v39 (copy), v12 (ref)
            while true do
                local v43 = os.clock() - v41;
                local v44 = v40 - v43;
                if v44 > 0 then
                    v39:SetAttribute("CooldownTime", v44);
                    task.wait(0.05);
                else
                    break;
                end;
            end;
            v39:SetAttribute("CooldownTime", nil);
            v12[v39.Name] = nil;
        end);
        v12[v39.Name] = v45;
    end);
end;
return v13;