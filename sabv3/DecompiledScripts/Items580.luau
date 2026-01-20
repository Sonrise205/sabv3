--!native
local l_Debris_0 = game:GetService("Debris");
local l_RunService_0 = game:GetService("RunService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ServerScriptService_0 = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net);
local v6 = require(l_Packages_0.Debounce);
local v7 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v8 = nil;
if l_RunService_0:IsServer() then
    v8 = require(l_ServerScriptService_0.Services.CombatService);
end;
local v9 = {};
local v10 = 0;
l_RunService_0.Heartbeat:Connect(function(v11) --[[ Line: 23 ]]
    -- upvalues: v10 (ref), v9 (copy)
    debug.profilebegin("Items:UpdateHUE");
    v10 = v10 + v11 * 0.2;
    if v10 > 1 then
        v10 = v10 - 1;
    end;
    local v12 = Color3.fromHSV(v10, 1, 1);
    for _, v14 in v9 do
        if v14 and v14.Parent then
            v14.FillColor = v12;
        end;
    end;
    debug.profileend();
end);
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
if l_RunService_0:IsServer() then
    local l_Services_0 = l_ServerScriptService_0.Services;
    v18 = require(l_Services_0.StealService);
    local l_ToolsCode_0 = l_ServerScriptService_0.ToolsCode;
    v15 = l_ToolsCode_0.AdditionalItems;
    v16 = l_ToolsCode_0.AdditionalScripts;
    v17 = l_ToolsCode_0.AdditionalSounds;
end;
return {
    Slap = {
        Name = "Slap", 
        Icon = "rbxassetid://111744314864127", 
        Cooldown = 0.7, 
        Force = 550, 
        RagdollDuration = 3
    }, 
    ["Iron Slap"] = {
        Name = "Iron Slap", 
        Icon = "rbxassetid://126416331206871", 
        Cooldown = 0.7, 
        Force = 600, 
        RagdollDuration = 3
    }, 
    ["Gold Slap"] = {
        Name = "Gold Slap", 
        Icon = "rbxassetid://73587459668895", 
        Cooldown = 0.7, 
        Force = 650, 
        RagdollDuration = 3
    }, 
    ["Diamond Slap"] = {
        Name = "Diamond Slap", 
        Icon = "rbxassetid://103400414014905", 
        Cooldown = 0.7, 
        Force = 700, 
        RagdollDuration = 3
    }, 
    ["Emerald Slap"] = {
        Name = "Emerald Slap", 
        Icon = "rbxassetid://125486072175077", 
        Cooldown = 0.7, 
        Force = 750, 
        RagdollDuration = 3
    }, 
    ["Ruby Slap"] = {
        Name = "Ruby Slap", 
        Icon = "rbxassetid://135484448648993", 
        Cooldown = 0.7, 
        Force = 800, 
        RagdollDuration = 3
    }, 
    ["Blackhole Slap"] = {
        Name = "Blackhole Slap", 
        Icon = "rbxassetid://78729379185611", 
        Cooldown = 0.7, 
        Force = 850, 
        RagdollDuration = 3, 
        HasHighlight = false, 
        HighlightConfig = {
            FillColor = Color3.fromRGB(255, 0, 0), 
            FillTransparency = 0.5
        }
    }, 
    ["Flame Slap"] = {
        Name = "Flame Slap", 
        Icon = "rbxassetid://107751993012682", 
        Cooldown = 0.7, 
        Force = 850, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        HighlightConfig = {
            OutlineColor = Color3.fromRGB(), 
            OutlineTransparency = 0
        }
    }, 
    ["Dark Matter Slap"] = {
        Name = "Dark Matter Slap", 
        Icon = "rbxassetid://116359699709899", 
        Cooldown = 0.7, 
        Force = 900, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        HighlightConfig = {
            FillTransparency = 0.9, 
            OutlineTransparency = 0
        }
    }, 
    ["Nuclear Slap"] = {
        Name = "Nuclear Slap", 
        Icon = "rbxassetid://94800671695541", 
        Cooldown = 0.7, 
        Force = 950, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        HighlightConfig = {
            OutlineColor = Color3.fromRGB(234, 255, 0), 
            OutilineTransparency = 0
        }
    }, 
    ["Galaxy Slap"] = {
        Name = "Galaxy Slap", 
        Icon = "rbxassetid://79582982176990", 
        Cooldown = 0.7, 
        Force = 1050, 
        RagdollDuration = 3, 
        HasHighlight = true
    }, 
    ["Bloodmoon Slap"] = {
        Name = "Bloodmoon Slap", 
        Icon = "rbxassetid://105241258528205", 
        Cooldown = 0.7, 
        Force = 1050, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        HighlightConfig = {
            FillTransparency = 0.9, 
            OutlineTransparency = 0
        }
    }, 
    ["Glitched Slap"] = {
        Name = "Glitched Slap", 
        Icon = "rbxassetid://87821905406599", 
        Cooldown = 0.7, 
        Force = 1150, 
        RagdollDuration = 3, 
        HasHighlight = true
    }, 
    ["Rainbow Slap"] = {
        Name = "Rainbow Slap", 
        Icon = "rbxassetid://76888105480836", 
        Cooldown = 0.7, 
        Force = 1150, 
        RagdollDuration = 3, 
        HasHighlight = true
    }, 
    ["Candy Slap"] = {
        Name = "Candy Slap", 
        Icon = "rbxassetid://116411677446062", 
        Cooldown = 0.7, 
        Force = 1200, 
        RagdollDuration = 3, 
        HasHighlight = true
    }, 
    ["Lava Slap"] = {
        Name = "Lava Slap", 
        Icon = "rbxassetid://80560167115825", 
        Cooldown = 0.7, 
        Force = 1200, 
        RagdollDuration = 3, 
        HasHighlight = true
    }, 
    ["Splatter Slap"] = {
        Name = "Splatter Slap", 
        Icon = "rbxassetid://88294870214352", 
        Cooldown = 0.7, 
        Force = 1200, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        OnHit = function(v21) --[[ Line: 246 ]] --[[ Name: OnHit ]]
            -- upvalues: l_RunService_0 (copy), v5 (copy)
            if l_RunService_0:IsServer() then
                v5:RemoteEvent("UseItem"):FireClient(v21, "PaintballHitted", 9);
            end;
        end
    }, 
    ["Alien Slap"] = {
        Name = "Alien Slap", 
        Icon = "rbxassetid://89070555394271", 
        Cooldown = 0.7, 
        Force = 1250, 
        RagdollDuration = 5, 
        HasHighlight = true, 
        OnHit = function(v22, v23) --[[ Line: 260 ]] --[[ Name: OnHit ]]
            -- upvalues: v17 (ref)
            local l_AlienSlap_0 = script:FindFirstChild("AlienSlap");
            if not l_AlienSlap_0 then
                return;
            else
                local l_HumanoidRootPart_0 = v23:FindFirstChild("HumanoidRootPart");
                local v26 = l_HumanoidRootPart_0 and l_HumanoidRootPart_0:FindFirstChild("RootAttachment");
                local l_Humanoid_0 = v23:FindFirstChildOfClass("Humanoid");
                if not l_HumanoidRootPart_0 or not l_Humanoid_0 or not v26 then
                    return;
                else
                    task.wait(1);
                    local function v32(v28) --[[ Line: 282 ]] --[[ Name: GetGround ]]
                        -- upvalues: v23 (copy)
                        local v29 = RaycastParams.new();
                        v29.FilterType = Enum.RaycastFilterType.Exclude;
                        v29.FilterDescendantsInstances = {
                            v23
                        };
                        local v30 = v28 + Vector3.new(0, 3, 0, 0);
                        local v31 = workspace:Raycast(v30, Vector3.new(0, -20, 0, 0), v29);
                        if v31 then
                            return v31.Position;
                        else
                            return v28 - Vector3.new(0, 3, 0, 0);
                        end;
                    end;
                    local function _() --[[ Line: 298 ]] --[[ Name: IsOnGround ]]
                        -- upvalues: l_HumanoidRootPart_0 (copy)
                        return math.abs(l_HumanoidRootPart_0.AssemblyLinearVelocity.Y) < 1.5;
                    end;
                    local function _() --[[ Line: 302 ]] --[[ Name: IsStandingStill ]]
                        -- upvalues: l_HumanoidRootPart_0 (copy)
                        local l_AssemblyLinearVelocity_0 = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                        local l_Magnitude_0 = Vector3.new(l_AssemblyLinearVelocity_0.X, 0, l_AssemblyLinearVelocity_0.Z).Magnitude;
                        local v36 = false;
                        if l_Magnitude_0 < 1 then
                            v36 = math.abs(l_HumanoidRootPart_0.AssemblyLinearVelocity.Y) < 1.5;
                        end;
                        return v36;
                    end;
                    local v38 = 0;
                    local v39 = os.clock();
                    while os.clock() - v39 < 5 do
                        if math.abs(l_HumanoidRootPart_0.AssemblyLinearVelocity.Y) < 1.5 then
                            local l_AssemblyLinearVelocity_1 = l_HumanoidRootPart_0.AssemblyLinearVelocity;
                            local l_Magnitude_1 = Vector3.new(l_AssemblyLinearVelocity_1.X, 0, l_AssemblyLinearVelocity_1.Z).Magnitude;
                            local v42 = false;
                            if l_Magnitude_1 < 1 then
                                v42 = math.abs(l_HumanoidRootPart_0.AssemblyLinearVelocity.Y) < 1.5;
                            end;
                            if v42 then
                                v38 = v38 + task.wait(0.05);
                                if v38 < 0.3 then
                                    continue;
                                else
                                    break;
                                end;
                            end;
                        end;
                        v38 = 0;
                        task.wait(0.05);
                    end;
                    if v38 < 0.3 then
                        return;
                    else
                        local v43 = {};
                        for v44 = 1, 4 do
                            local v45 = v44 / 4 * 3.141592653589793 * 2;
                            local v46 = Vector3.new(math.cos(v45), 0, (math.sin(v45))) * 5;
                            local v47 = v32(l_HumanoidRootPart_0.Position + v46);
                            local l_florPart_0 = l_AlienSlap_0:FindFirstChild("florPart");
                            if l_florPart_0 then
                                local v49 = l_florPart_0:Clone();
                                v49.Anchored = true;
                                v49.CFrame = CFrame.new(v47);
                                v49.Parent = workspace;
                                table.insert(v43, v49);
                            end;
                        end;
                        local _ = v32(l_HumanoidRootPart_0.Position);
                        local l_Part_0 = l_AlienSlap_0:FindFirstChild("Part");
                        local v52 = nil;
                        if l_Part_0 then
                            v52 = l_Part_0["002"]:Clone();
                            v52.WorldCFrame = v26.WorldCFrame;
                            v52.CFrame = v26.CFrame;
                            v52.Parent = v26;
                            for _, v54 in v43 do
                                for _, v56 in v54["001"]:GetChildren() do
                                    if v56:IsA("Beam") then
                                        v56.Attachment0 = v54["001"];
                                        v56.Attachment1 = v52;
                                    end;
                                end;
                            end;
                        end;
                        local v57 = v17["Alien slap"]:Clone();
                        v57.Parent = l_HumanoidRootPart_0;
                        v57:Play();
                        v22:SetAttribute("Freeze", true);
                        task.delay(3, function() --[[ Line: 369 ]]
                            -- upvalues: v52 (ref), v43 (copy), v22 (copy)
                            if v52 and v52.Parent then
                                v52:Destroy();
                            end;
                            for _, v59 in v43 do
                                if v59 and v59.Parent then
                                    v59:Destroy();
                                end;
                            end;
                            v22:SetAttribute("Freeze", false);
                        end);
                        return;
                    end;
                end;
            end;
        end
    }, 
    ["Yin Yang Slap"] = {
        Name = "Yin Yang Slap", 
        Icon = "rbxassetid://72523518394942", 
        Cooldown = 0.7, 
        Force = 1260, 
        RagdollDuration = 6, 
        HasHighlight = true, 
        HighlightConfig = {
            FillTransparency = 1, 
            OutlineTransparency = 0, 
            OutlineColor = Color3.fromRGB(255, 0, 0)
        }, 
        OnHit = function(_, v61) --[[ Line: 395 ]] --[[ Name: OnHit ]]
            -- upvalues: l_Debris_0 (copy)
            local l_YinYangSlap_0 = script.YinYangSlap;
            local l_HumanoidRootPart_1 = v61:FindFirstChild("HumanoidRootPart");
            local v64 = l_HumanoidRootPart_1 and l_HumanoidRootPart_1:FindFirstChild("RootAttachment");
            local l_Humanoid_1 = v61:FindFirstChildOfClass("Humanoid");
            if not l_HumanoidRootPart_1 or not l_Humanoid_1 or not v64 then
                return;
            else
                local function _(v66) --[[ Line: 409 ]] --[[ Name: isColorable ]]
                    if v66:IsA("Accessory") or v66:IsA("Tool") then
                        return false;
                    elseif v66:IsA("BasePart") and v66.Name ~= "HumanoidRootPart" then
                        return true;
                    else
                        return false;
                    end;
                end;
                local function v72(v68) --[[ Line: 419 ]] --[[ Name: GetGround ]]
                    -- upvalues: v61 (copy)
                    local v69 = RaycastParams.new();
                    v69.FilterType = Enum.RaycastFilterType.Exclude;
                    v69.FilterDescendantsInstances = {
                        v61
                    };
                    local v70 = v68 + Vector3.new(0, 3, 0, 0);
                    local v71 = workspace:Raycast(v70, Vector3.new(0, -20, 0, 0), v69);
                    if v71 then
                        return v71.Position;
                    else
                        return v68 - Vector3.new(0, 3, 0, 0);
                    end;
                end;
                local function _() --[[ Line: 435 ]] --[[ Name: IsOnGround ]]
                    -- upvalues: l_HumanoidRootPart_1 (copy)
                    return math.abs(l_HumanoidRootPart_1.AssemblyLinearVelocity.Y) < 1.5;
                end;
                local function _() --[[ Line: 439 ]] --[[ Name: IsStandingStill ]]
                    -- upvalues: l_HumanoidRootPart_1 (copy)
                    local l_AssemblyLinearVelocity_2 = l_HumanoidRootPart_1.AssemblyLinearVelocity;
                    local l_Magnitude_2 = Vector3.new(l_AssemblyLinearVelocity_2.X, 0, l_AssemblyLinearVelocity_2.Z).Magnitude;
                    local v76 = false;
                    if l_Magnitude_2 < 1 then
                        v76 = math.abs(l_HumanoidRootPart_1.AssemblyLinearVelocity.Y) < 1.5;
                    end;
                    return v76;
                end;
                task.wait(1);
                local l_Shirt_0 = v61:FindFirstChildOfClass("Shirt");
                if l_Shirt_0 then
                    l_Shirt_0.Parent = nil;
                end;
                local l_Pants_0 = v61:FindFirstChildOfClass("Pants");
                if l_Pants_0 then
                    l_Pants_0.Parent = nil;
                end;
                local v80 = {};
                local v81 = {};
                for _, v83 in v61:GetChildren() do
                    if not v83:IsA("Accessory") and not v83:IsA("Tool") and if v83:IsA("BasePart") then v83.Name ~= "HumanoidRootPart" else false then
                        table.insert(v80, v83);
                        table.insert(v81, {
                            part = v83, 
                            color = v83.Color
                        });
                    end;
                end;
                for _, v85 in v80 do
                    v85.Color = math.random(1, 2) == 1 and Color3.fromRGB() or Color3.fromRGB(255, 255, 255);
                end;
                local l_Head_0 = v61:FindFirstChild("Head");
                if l_Head_0 then
                    local v87 = l_YinYangSlap_0.SleepVFX.SLEEPY_VFX_ATTACHMENT:Clone();
                    v87.Parent = l_Head_0;
                    l_Debris_0:AddItem(v87, 6);
                end;
                local v88 = 0;
                local v89 = os.clock();
                while os.clock() - v89 < 5 do
                    if math.abs(l_HumanoidRootPart_1.AssemblyLinearVelocity.Y) < 1.5 then
                        local l_AssemblyLinearVelocity_3 = l_HumanoidRootPart_1.AssemblyLinearVelocity;
                        local l_Magnitude_3 = Vector3.new(l_AssemblyLinearVelocity_3.X, 0, l_AssemblyLinearVelocity_3.Z).Magnitude;
                        local v92 = false;
                        if l_Magnitude_3 < 1 then
                            v92 = math.abs(l_HumanoidRootPart_1.AssemblyLinearVelocity.Y) < 1.5;
                        end;
                        if v92 then
                            v88 = v88 + task.wait(0.05);
                            if v88 < 0.3 then
                                continue;
                            else
                                break;
                            end;
                        end;
                    end;
                    v88 = 0;
                    task.wait(0.05);
                end;
                if v88 < 0.3 then
                    return;
                else
                    local v93 = v72(l_HumanoidRootPart_1.Position);
                    local l_yinyang_0 = l_YinYangSlap_0:FindFirstChild("yinyang");
                    if l_yinyang_0 then
                        local v95 = l_yinyang_0:Clone();
                        v95.CFrame = CFrame.new(v93);
                        v95.Parent = workspace;
                        l_Debris_0:AddItem(v95, 4);
                    end;
                    task.delay(4, function() --[[ Line: 504 ]]
                        -- upvalues: v81 (copy), l_Shirt_0 (copy), v61 (copy), l_Pants_0 (copy)
                        for _, v97 in v81 do
                            if v97.part and v97.part.Parent then
                                v97.part.Color = v97.color;
                            end;
                        end;
                        if l_Shirt_0 then
                            l_Shirt_0.Parent = v61;
                        end;
                        if l_Pants_0 then
                            l_Pants_0.Parent = v61;
                        end;
                    end);
                    return;
                end;
            end;
        end
    }, 
    ["Radioactive Slap"] = {
        Name = "Radioactive Slap", 
        Icon = "rbxassetid://134911999156077", 
        Cooldown = 0.7, 
        Force = 1200, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        HighlightConfig = {
            FillTransparency = 1, 
            OutlineTransparency = 0, 
            OutlineColor = Color3.fromRGB(0, 255, 0)
        }, 
        OnHit = function(v98, v99, v100) --[[ Line: 534 ]] --[[ Name: OnHit ]]
            -- upvalues: l_RunService_0 (copy), v8 (ref)
            local l_Humanoid_2 = v99:FindFirstChildOfClass("Humanoid");
            local l_HumanoidRootPart_2 = v99:FindFirstChild("HumanoidRootPart");
            if not l_Humanoid_2 or not l_HumanoidRootPart_2 then
                return;
            else
                local l_Highlight_0 = Instance.new("Highlight");
                l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
                l_Highlight_0.FillColor = Color3.fromRGB(0, 255, 0);
                l_Highlight_0.FillTransparency = 0.5;
                l_Highlight_0.OutlineColor = Color3.fromRGB(75, 155, 0);
                l_Highlight_0.OutlineTransparency = 0;
                l_Highlight_0.Adornee = v99;
                l_Highlight_0.Parent = v99;
                task.delay(5, function() --[[ Line: 548 ]]
                    -- upvalues: l_RunService_0 (ref), v8 (ref), v98 (copy), v100 (copy)
                    if l_RunService_0:IsServer() then
                        v8:ApplyImpulse(v98, 500, Vector3.new(), true, 3, true, {
                            Tag = "Radioactive Slap", 
                            Player = v100
                        });
                    end;
                end);
                task.delay(8, function() --[[ Line: 557 ]]
                    -- upvalues: l_Highlight_0 (copy)
                    l_Highlight_0:Destroy();
                end);
                return;
            end;
        end
    }, 
    ["Cursed Slap"] = {
        Name = "Cursed Slap", 
        Icon = "rbxassetid://101392764194646", 
        Cooldown = 0.7, 
        Force = 1300, 
        RagdollDuration = 3, 
        HasHighlight = true, 
        HighlightConfig = {
            FillTransparency = 1, 
            OutlineTransparency = 0, 
            OutlineColor = Color3.fromRGB(255, 23, 23)
        }, 
        OnHit = function(v104, v105, v106) --[[ Line: 575 ]] --[[ Name: OnHit ]]
            -- upvalues: l_ServerScriptService_0 (copy)
            local l_Humanoid_3 = v105:FindFirstChildOfClass("Humanoid");
            local l_HumanoidRootPart_3 = v105:FindFirstChild("HumanoidRootPart");
            if not l_Humanoid_3 or not l_HumanoidRootPart_3 then
                return;
            else
                local l_Highlight_1 = Instance.new("Highlight");
                l_Highlight_1.DepthMode = Enum.HighlightDepthMode.Occluded;
                l_Highlight_1.FillColor = Color3.fromRGB(255, 23, 23);
                l_Highlight_1.FillTransparency = 0.5;
                l_Highlight_1.OutlineColor = Color3.fromRGB(155, 0, 0);
                l_Highlight_1.OutlineTransparency = 0;
                l_Highlight_1.Adornee = v105;
                l_Highlight_1.Parent = v105;
                local v110 = require(l_ServerScriptService_0.Services.ItemService.Demon);
                task.delay(1, function() --[[ Line: 590 ]]
                    -- upvalues: v104 (copy), v110 (copy), l_HumanoidRootPart_3 (copy), v106 (copy), l_Highlight_1 (copy)
                    local v111 = os.clock();
                    while os.clock() - v111 < 5 do
                        local l_v104_Attribute_0 = v104:GetAttribute("RagdollEndTime");
                        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                        if l_v104_Attribute_0 and l_v104_Attribute_0 >= l_workspace_ServerTimeNow_0 then
                            task.wait(0.5);
                        else
                            break;
                        end;
                    end;
                    task.wait(0.3);
                    v110.FreezePlayer(v104, l_HumanoidRootPart_3, v106, 4);
                    l_Highlight_1:Destroy();
                end);
                return;
            end;
        end
    }, 
    ["Overseer Mace"] = {
        Icon = "rbxassetid://900731150", 
        Range = Vector3.new(12, 12, 12, 0), 
        Name = "Overseer Mace", 
        RagdollDuration = 3, 
        Cooldown = 0.8, 
        Force = 1000, 
        OnHit = function(v114, v115, v116) --[[ Line: 618 ]] --[[ Name: OnHit ]]
            -- upvalues: l_RunService_0 (copy), v8 (ref)
            local l_Humanoid_4 = v115:FindFirstChildOfClass("Humanoid");
            local l_HumanoidRootPart_4 = v115:FindFirstChild("HumanoidRootPart");
            if not l_Humanoid_4 or not l_HumanoidRootPart_4 then
                return;
            else
                task.wait(3);
                local v119 = 1;
                for _ = 1, 10 do
                    v119 = v119 - 0.1;
                    v114:SetAttribute("DivideSpeedBy", v119);
                    task.wait(0.6);
                end;
                v114:SetAttribute("DivideSpeedBy", nil);
                if l_RunService_0:IsServer() then
                    v8:ApplyImpulse(v114, 500, Vector3.new(), true, 3, true, {
                        Tag = "Item.Overseer Mace", 
                        Player = v116
                    });
                    v114:SetAttribute("DivideSpeedBy", nil);
                end;
                return;
            end;
        end
    }, 
    ["Bambu Runcing"] = {
        Name = "Bambu Runcing", 
        Icon = "rbxassetid://0", 
        Cooldown = 0.8, 
        Force = 1250, 
        RagdollDuration = 3, 
        Range = Vector3.new(25, 25, 25, 0)
    }, 
    ["Sapu Lidi"] = {
        Name = "Bambu Runcing", 
        Icon = "rbxassetid://0", 
        Cooldown = 0.8, 
        Force = 1200, 
        RagdollDuration = 3, 
        Range = Vector3.new(30, 9, 9, 0)
    }, 
    ["Fire Hand"] = {
        Name = "Fire Hand", 
        Icon = "http://www.roblox.com/asset/?id=37241858", 
        Cooldown = 0.5, 
        Force = 1000, 
        RagdollDuration = 4, 
        OnHit = function(_, v122) --[[ Line: 668 ]] --[[ Name: OnHit ]]
            -- upvalues: l_RunService_0 (copy)
            if l_RunService_0:IsServer() then
                local l_HumanoidRootPart_5 = v122:FindFirstChild("HumanoidRootPart");
                if l_HumanoidRootPart_5 then
                    local v124 = script.Fire.fireOnStep:Clone();
                    v124.Parent = l_HumanoidRootPart_5;
                    task.delay(4, function() --[[ Line: 674 ]]
                        -- upvalues: v124 (copy)
                        v124:Destroy();
                    end);
                end;
            end;
        end
    }, 
    ["Steampunk Glove"] = {
        Name = "Steampunk Glove", 
        Icon = "rbxassetid://243184138", 
        Cooldown = 0.7, 
        Force = 1500, 
        RagdollDuration = 3
    }, 
    ["Ban Hammer"] = {
        Name = "Ban Hammer", 
        Icon = "rbxassetid://102903994473061", 
        Cooldown = 0.7, 
        Force = 900, 
        RagdollDuration = 3, 
        HasParticles = function(v125, v126) --[[ Line: 698 ]] --[[ Name: HasParticles ]]
            local l_Part_1 = Instance.new("Part");
            l_Part_1.CanCollide = false;
            l_Part_1.Size = Vector3.new(1, 1, 1, 0);
            l_Part_1.Anchored = false;
            l_Part_1.Transparency = 1;
            l_Part_1.CFrame = v125.CFrame * CFrame.new(0, 0.4, -3);
            l_Part_1.Parent = workspace;
            local l_WeldConstraint_0 = Instance.new("WeldConstraint");
            l_WeldConstraint_0.Part0 = v125;
            l_WeldConstraint_0.Part1 = l_Part_1;
            l_WeldConstraint_0.Parent = l_Part_1;
            local v129 = v126.Handle.Attachment:Clone();
            v129.Parent = l_Part_1;
            v129.ParticleEmitter:Emit(2);
            task.delay(1, function() --[[ Line: 716 ]]
                -- upvalues: l_Part_1 (copy), l_WeldConstraint_0 (copy), v129 (copy)
                if l_Part_1 then
                    l_Part_1:Destroy();
                end;
                if l_WeldConstraint_0 then
                    l_WeldConstraint_0:Destroy();
                end;
                if v129 then
                    v129:Destroy();
                end;
            end);
        end
    }, 
    ["Bloodmoon Hammer"] = {
        Name = "Bloodmoon Hammer", 
        Icon = "rbxassetid://96284196754755", 
        Cooldown = 0.7, 
        Force = 900, 
        RagdollDuration = 6, 
        HasParticles = function(v130, v131) --[[ Line: 737 ]] --[[ Name: HasParticles ]]
            local l_Part_2 = Instance.new("Part");
            l_Part_2.CanCollide = false;
            l_Part_2.Size = Vector3.new(1, 1, 1, 0);
            l_Part_2.Anchored = false;
            l_Part_2.Transparency = 1;
            l_Part_2.CFrame = v130.CFrame * CFrame.new(0, 0.4, -3);
            l_Part_2.Parent = workspace;
            local l_WeldConstraint_1 = Instance.new("WeldConstraint");
            l_WeldConstraint_1.Part0 = v130;
            l_WeldConstraint_1.Part1 = l_Part_2;
            l_WeldConstraint_1.Parent = l_Part_2;
            local v134 = v131.Handle.Attachment:Clone();
            v134.Parent = l_Part_2;
            v134.ParticleEmitter:Emit(2);
            task.delay(1, function() --[[ Line: 755 ]]
                -- upvalues: l_Part_2 (copy), l_WeldConstraint_1 (copy), v134 (copy)
                if l_Part_2 then
                    l_Part_2:Destroy();
                end;
                if l_WeldConstraint_1 then
                    l_WeldConstraint_1:Destroy();
                end;
                if v134 then
                    v134:Destroy();
                end;
            end);
        end, 
        OnHit = function(_, v136) --[[ Line: 768 ]] --[[ Name: OnHit ]]
            local l_Highlight_2 = Instance.new("Highlight");
            l_Highlight_2.DepthMode = Enum.HighlightDepthMode.Occluded;
            l_Highlight_2.FillColor = Color3.fromRGB(255, 0, 0);
            l_Highlight_2.FillTransparency = 0.5;
            l_Highlight_2.OutlineTransparency = 1;
            l_Highlight_2.Adornee = v136;
            l_Highlight_2.Parent = v136;
            task.delay(2.5, function() --[[ Line: 777 ]]
                -- upvalues: l_Highlight_2 (copy)
                l_Highlight_2:Destroy();
            end);
        end
    }, 
    ["Rainbow Hammer"] = {
        Name = "Rainbow Hammer", 
        Icon = "rbxassetid://139876541578910", 
        Cooldown = 0.7, 
        Force = 1000, 
        RagdollDuration = 6, 
        HasParticles = function(v138, v139) --[[ Line: 790 ]] --[[ Name: HasParticles ]]
            local l_Part_3 = Instance.new("Part");
            l_Part_3.CanCollide = false;
            l_Part_3.Size = Vector3.new(1, 1, 1, 0);
            l_Part_3.Anchored = false;
            l_Part_3.Transparency = 1;
            l_Part_3.CFrame = v138.CFrame * CFrame.new(0, 0.4, -3);
            l_Part_3.Parent = workspace;
            local l_WeldConstraint_2 = Instance.new("WeldConstraint");
            l_WeldConstraint_2.Part0 = v138;
            l_WeldConstraint_2.Part1 = l_Part_3;
            l_WeldConstraint_2.Parent = l_Part_3;
            local v142 = v139.Handle.Attachment:Clone();
            v142.Parent = l_Part_3;
            v142.ParticleEmitter:Emit(2);
            task.delay(1, function() --[[ Line: 808 ]]
                -- upvalues: l_Part_3 (copy), l_WeldConstraint_2 (copy), v142 (copy)
                if l_Part_3 then
                    l_Part_3:Destroy();
                end;
                if l_WeldConstraint_2 then
                    l_WeldConstraint_2:Destroy();
                end;
                if v142 then
                    v142:Destroy();
                end;
            end);
        end, 
        OnHit = function(_, v144) --[[ Line: 821 ]] --[[ Name: OnHit ]]
            -- upvalues: v9 (copy)
            local l_Highlight_3 = Instance.new("Highlight");
            l_Highlight_3.DepthMode = Enum.HighlightDepthMode.Occluded;
            l_Highlight_3.OutlineTransparency = 0;
            l_Highlight_3.FillTransparency = 0.5;
            l_Highlight_3.Adornee = v144;
            l_Highlight_3.Parent = v144;
            table.insert(v9, l_Highlight_3);
            task.delay(2.5, function() --[[ Line: 831 ]]
                -- upvalues: v9 (ref), l_Highlight_3 (copy)
                table.remove(v9, table.find(v9, l_Highlight_3));
                l_Highlight_3:Destroy();
            end);
        end
    }, 
    ["Delete Hammer"] = {
        Name = "Delete Hammer", 
        Icon = "rbxassetid://102903994473061", 
        Cooldown = 0, 
        Force = 3000, 
        RagdollDuration = 5, 
        HasParticles = function(v146, v147) --[[ Line: 845 ]] --[[ Name: HasParticles ]]
            local l_Part_4 = Instance.new("Part");
            l_Part_4.CanCollide = false;
            l_Part_4.Size = Vector3.new(1, 1, 1, 0);
            l_Part_4.Anchored = false;
            l_Part_4.Transparency = 1;
            l_Part_4.CFrame = v146.CFrame * CFrame.new(0, 0.4, -3);
            l_Part_4.Parent = workspace;
            local l_WeldConstraint_3 = Instance.new("WeldConstraint");
            l_WeldConstraint_3.Part0 = v146;
            l_WeldConstraint_3.Part1 = l_Part_4;
            l_WeldConstraint_3.Parent = l_Part_4;
            local v150 = v147.Handle.Attachment:Clone();
            v150.Parent = l_Part_4;
            v150.ParticleEmitter:Emit(2);
            task.delay(1, function() --[[ Line: 863 ]]
                -- upvalues: l_Part_4 (copy), l_WeldConstraint_3 (copy), v150 (copy)
                if l_Part_4 then
                    l_Part_4:Destroy();
                end;
                if l_WeldConstraint_3 then
                    l_WeldConstraint_3:Destroy();
                end;
                if v150 then
                    v150:Destroy();
                end;
            end);
        end
    }, 
    ["Small Tree"] = {
        Name = "Small Tree", 
        Icon = "rbxassetid://70956898840223", 
        Cooldown = 0.7, 
        Force = 1000, 
        Range = Vector3.new(12, 12, 12, 0), 
        RagdollDuration = 3
    }, 
    ["Medium Tree"] = {
        Name = "Medium Tree", 
        Icon = "rbxassetid://117374249944925", 
        Cooldown = 0.7, 
        Force = 1100, 
        Range = Vector3.new(14, 14, 14, 0), 
        RagdollDuration = 3
    }, 
    ["Huge Tree"] = {
        Name = "Huge Tree", 
        Icon = "rbxassetid://114915257709192", 
        Cooldown = 0.7, 
        Force = 1200, 
        Range = Vector3.new(16, 16, 16, 0), 
        RagdollDuration = 3
    }, 
    ["Rainbow Small Tree"] = {
        Name = "Rainbow Small Tree", 
        Icon = "rbxassetid://136011850681459", 
        Cooldown = 0.7, 
        Force = 1200, 
        Range = Vector3.new(12, 12, 12, 0), 
        RagdollDuration = 3
    }, 
    ["Rainbow Medium Tree"] = {
        Name = "Rainbow Medium Tree", 
        Icon = "rbxassetid://83546641619026", 
        Cooldown = 0.7, 
        Force = 1300, 
        Range = Vector3.new(14, 14, 14, 0), 
        RagdollDuration = 3
    }, 
    ["Rainbow Huge Tree"] = {
        Name = "Rainbow Huge Tree", 
        Icon = "rbxassetid://119257172353286", 
        Cooldown = 0.7, 
        Force = 1400, 
        Range = Vector3.new(16, 16, 16, 0), 
        RagdollDuration = 3
    }, 
    Bat = {
        Name = "Bat", 
        Icon = "rbxassetid://86735158693802", 
        Cooldown = 0.7, 
        Force = 500, 
        RagdollDuration = 3
    }, 
    Lollipop = {
        Name = "Lollipop", 
        Icon = "rbxassetid://95336128645462", 
        Cooldown = 0.7, 
        Force = 800, 
        RagdollDuration = 3, 
        OnHit = function(v151, v152) --[[ Line: 948 ]] --[[ Name: OnHit ]]
            -- upvalues: v5 (copy)
            local function v159(v153) --[[ Line: 949 ]] --[[ Name: ApplyCandyEffect ]]
                for _, v155 in v153:GetChildren() do
                    if v155:IsA("BasePart") then
                        for _, v157 in script.Effect:GetChildren() do
                            local v158 = v157:Clone();
                            v158.Parent = v155;
                            task.delay(5, function() --[[ Line: 958 ]]
                                -- upvalues: v158 (copy)
                                v158:Destroy();
                            end);
                        end;
                    end;
                end;
            end;
            local l_Humanoid_5 = v152:FindFirstChildOfClass("Humanoid");
            local l_HumanoidRootPart_6 = v152:FindFirstChild("HumanoidRootPart");
            if not l_Humanoid_5 or not l_HumanoidRootPart_6 then
                return;
            else
                local v162 = script.BillboardPart.BillboardGui:Clone();
                v162.Parent = l_HumanoidRootPart_6;
                v159(v152);
                v151:SetAttribute("DivideSpeed", true);
                task.delay(5, function() --[[ Line: 977 ]]
                    -- upvalues: v151 (copy), v162 (copy)
                    v151:SetAttribute("DivideSpeed", nil);
                    v162:Destroy();
                end);
                v5:RemoteEvent("UseItem"):FireClient(v151, "CandyEffect", 5);
                return;
            end;
        end
    }, 
    ["Candy Cane"] = {
        Name = "Candy Cane", 
        Icon = "rbxassetid://19250774", 
        Cooldown = 0.4, 
        Force = 500, 
        RagdollDuration = 3
    }, 
    ["Gummy Bear"] = {
        Name = "Gummy Bear", 
        Icon = "rbxassetid://81350787786383", 
        Cooldown = 0.7, 
        Force = 750, 
        RagdollDuration = 3, 
        OnHit = function(v163, v164) --[[ Line: 1003 ]] --[[ Name: OnHit ]]
            -- upvalues: v6 (copy), v7 (copy), v15 (ref), v16 (ref), v17 (ref), v18 (ref)
            if v6(("TurnedToGummy/%*/Server"):format(v163.Name), v7:GetInstant("GummyBearStickCooldown", 6.5)) then
                return;
            else
                local l_GummyBear_0 = v15:FindFirstChild("GummyBear");
                if not l_GummyBear_0 then
                    return;
                elseif not v16:FindFirstChild("GummyController") then
                    return;
                elseif v163:GetAttribute("Web") then
                    return;
                else
                    local l_HumanoidRootPart_7 = v164:FindFirstChild("HumanoidRootPart");
                    if not l_HumanoidRootPart_7 then
                        return;
                    else
                        local l_Humanoid_6 = v164:FindFirstChildWhichIsA("Humanoid");
                        if not l_Humanoid_6 then
                            return;
                        else
                            v164:PivotTo(CFrame.new(v164:GetPivot().Position + Vector3.new(0, 2, 0, 0)));
                            v164:SetAttribute("SpeedAllowance", v7:GetInstant("GummyBearSpeedAllowance", 120));
                            task.wait(v7:GetInstant("GummyBearHitWaitTime", 0.65));
                            v163:SetAttribute("RagdollEndTime", 0);
                            local v168 = v17.GummyBear:Clone();
                            v168.Parent = l_HumanoidRootPart_7;
                            v168:Play();
                            local l_Tool_0 = v164:FindFirstChildOfClass("Tool");
                            v163:SetAttribute("Web", true);
                            v163:SetAttribute("BlockTools", true);
                            v18:CancelSteal(v163);
                            l_Humanoid_6.PlatformStand = true;
                            l_Humanoid_6:UnequipTools();
                            local l_WeldConstraint_4 = Instance.new("WeldConstraint");
                            l_WeldConstraint_4.Part0 = l_HumanoidRootPart_7;
                            local v171 = l_GummyBear_0:Clone();
                            v171:PivotTo(v164:GetPivot());
                            v171.Color = BrickColor.random().Color;
                            v171.Parent = workspace;
                            for _, v173 in v171:GetDescendants() do
                                if v173:IsA("BasePart") then
                                    v173:SetNetworkOwner(v163);
                                end;
                            end;
                            l_WeldConstraint_4.Part1 = v171;
                            l_WeldConstraint_4.Parent = v171;
                            v164:SetAttribute("InGummy", true);
                            v163:SetAttribute("NoMouseLockOffset", true);
                            task.delay(v7:GetInstant("GummyBearDuration", 3), function() --[[ Line: 1076 ]]
                                -- upvalues: v168 (copy), v171 (copy), l_Humanoid_6 (copy), v163 (copy), v164 (copy), l_Tool_0 (copy), v18 (ref)
                                v168:Destroy();
                                v171:Destroy();
                                l_Humanoid_6.PlatformStand = false;
                                v163:SetAttribute("Web", nil);
                                v163:SetAttribute("BlockTools", nil);
                                v164:SetAttribute("SpeedAllowance", nil);
                                v164:SetAttribute("InGummy", nil);
                                v163:SetAttribute("NoMouseLockOffset", nil);
                                if l_Tool_0 and l_Tool_0.Parent == v163.Backpack and not v18:IsStealing(v163) and l_Humanoid_6.Health > 0 then
                                    l_Humanoid_6:EquipTool(l_Tool_0);
                                end;
                            end);
                            return;
                        end;
                    end;
                end;
            end;
        end
    }, 
    ["Dev Slap"] = {
        Name = "Dev Slap", 
        Icon = "", 
        Cooldown = 0.7, 
        Force = 5000, 
        Range = Vector3.new(25, 25, 25, 0), 
        RagdollDuration = 5, 
        HasHighlight = true
    }
};