local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local _ = game:GetService("TweenService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Trove);
local v6 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v7 = require(l_ReplicatedStorage_0.Packages.Observers);
local v8 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v9 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v10 = require(l_ReplicatedStorage_0.Controllers.FastOverheadController);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v12 = require(l_Datas_0.Animals);
local _ = require(l_Datas_0.Game);
local v14 = require(l_Datas_0.Rarities);
local v15 = require(l_Datas_0.Mutations);
local v16 = require(l_Datas_0.Traits);
local _ = l_ReplicatedStorage_0:WaitForChild("Others").AnimalTemplate;
local l_Shared_0 = l_ReplicatedStorage_0:WaitForChild("Shared");
local v19 = require(l_Shared_0.Animals);
local _ = l_ReplicatedStorage_0:WaitForChild("Overheads").AnimalOverhead;
local l_Animals_0 = l_ReplicatedStorage_0:WaitForChild("Models").Animals;
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v23 = require(l_Utils_0.NumberUtils);
local v24 = require(l_Utils_0.TimeUtils);
local l_Animals_1 = l_ReplicatedStorage_0:WaitForChild("Animations").Animals;
local l_RenderedMovingAnimals_0 = workspace:WaitForChild("RenderedMovingAnimals");
local v27 = {};
v27.__index = v27;
local function _(v28, v29) --[[ Line: 71 ]] --[[ Name: PlayAnimation ]]
    for v30, v31 in v28.AnimationTracks do
        if v29 == v30 then
            if not v31.IsPlaying then
                v31:Play();
            end;
        elseif v31.IsPlaying then
            v31:Stop();
        end;
    end;
end;
v27.GetUID = function(v33) --[[ Line: 89 ]] --[[ Name: GetUID ]]
    return v33.UID;
end;
v27.new = function(v34) --[[ Line: 93 ]] --[[ Name: new ]]
    -- upvalues: v27 (copy), v5 (copy), v12 (copy), v14 (copy), l_Animals_0 (copy), l_RenderedMovingAnimals_0 (copy), v19 (copy), v24 (copy), v23 (copy), l_HttpService_0 (copy), v16 (copy), v9 (copy), v8 (copy), l_Animals_1 (copy), v10 (copy), v15 (copy), v6 (copy), v7 (copy)
    local v35 = setmetatable({}, v27);
    v35.UID = v34.Name;
    v35.Collector = v5.new();
    v35.Instance = v34;
    v35.Index = v35.Instance:GetAttribute("Index");
    v35.Mutation = v35.Instance:GetAttribute("Mutation");
    local v36 = v12[v35.Index];
    if not v36 then
        warn("Failed to find animal data: " .. v35.Index);
    end;
    local v37 = v14[v36.Rarity];
    v35.AnimalModel = l_Animals_0:FindFirstChild(v35.Index):Clone();
    local l_ExtentsSize_0 = v35.AnimalModel:GetExtentsSize();
    for _, v40 in v35.AnimalModel:GetDescendants() do
        if v40:IsA("BasePart") then
            v40.CanCollide = false;
            v40.CanQuery = false;
            v40.CanTouch = false;
            v40.Massless = true;
            v40.Anchored = false;
        end;
    end;
    v35.Collector:Add(v35.AnimalModel);
    if v35.AnimalModel.PrimaryPart then
        v35.AnimalModel.PrimaryPart.Anchored = true;
    end;
    v35.AnimalModel:AddTag("RenderedMovingAnimal");
    v35.AnimalModel.Parent = l_RenderedMovingAnimals_0;
    if v35.Mutation then
        v35.Collector:Add(v19:ApplyMutation(v35.AnimalModel, v35.Index, v35.Mutation));
    end;
    local function v42() --[[ Line: 136 ]] --[[ Name: updateOverhead ]]
        -- upvalues: v35 (copy), v36 (copy), v24 (ref), v23 (ref), v19 (ref)
        if not v35.Overhead then
            return;
        else
            local v41 = nil;
            v41 = if v36.LuckyBlock then v36.LuckyBlock.Timer <= 0 and "READY!" or v24:E(v36.LuckyBlock.Timer) else v35.Index == "Coffin Tung Tung Tung Sahur" and "" or ("$%*/s"):format((v23:ToString(v19:GetGeneration(v35.Index, v35.Mutation, v35.Traits))));
            v35.Overhead.Generation.Text = v41;
            v35.Overhead.Generation.Visible = v41 ~= "";
            return;
        end;
    end;
    local v43 = v35.Collector:Extend();
    local function v50() --[[ Line: 156 ]] --[[ Name: updateTraits ]]
        -- upvalues: v43 (copy), v35 (copy), l_HttpService_0 (ref), v19 (ref), v16 (ref), v42 (copy)
        v43:Clean();
        local l_Attribute_0 = v35.Instance:GetAttribute("Traits");
        v35.Traits = if l_Attribute_0 then l_HttpService_0:JSONDecode(l_Attribute_0) else nil;
        if v35.Traits then
            local v45 = v19:ApplyTraits(v35.AnimalModel, v35.Index, v35.Traits);
            if v45 then
                v43:Add(v45);
            end;
            if v35.Overhead then
                for _, v47 in v35.Traits do
                    local v48 = v16[v47];
                    if v48 then
                        local v49 = v43:Clone(v35.Overhead.Traits.Template);
                        v49.Image = v48.Icon;
                        v49.Visible = true;
                        v49.Parent = v35.Overhead.Traits;
                    end;
                end;
                v35.Overhead.Traits.Visible = true;
            end;
        elseif v35.Overhead then
            v35.Overhead.Traits.Visible = false;
        end;
        v42();
    end;
    if v9:GetInstant("Optimisation.HumanoidBrainrotModels", v8.IsNewPlayersServer()) then
        local l_AnimationController_0 = v35.AnimalModel:FindFirstChild("AnimationController");
        if l_AnimationController_0 then
            l_AnimationController_0:Destroy();
        end;
        local v52 = Instance.new("Humanoid", v35.AnimalModel);
        local _ = Instance.new("Animator", v52);
        v52.Name = "AnimationController";
        v52.EvaluateStateMachine = false;
        v52.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
        v52.PlatformStand = true;
        v52.Parent = v35.AnimalModel;
    end;
    local l_Animator_0 = v35.AnimalModel.AnimationController.Animator;
    local l_l_Animals_1_FirstChild_0 = l_Animals_1:FindFirstChild(v35.Index);
    local v56 = l_l_Animals_1_FirstChild_0 and l_l_Animals_1_FirstChild_0:FindFirstChild("Walk");
    if v56 then
        v35.WalkTrack = l_Animator_0:LoadAnimation(v56);
        v35.WalkTrack.Looped = true;
        v35.WalkTrack:Play();
        v35.WalkTrack:AdjustSpeed(v56:GetAttribute("Speed") or 1);
    end;
    local v57 = l_l_Animals_1_FirstChild_0 and (l_l_Animals_1_FirstChild_0:FindFirstChild("RoadBrainrotIdle") or l_l_Animals_1_FirstChild_0:FindFirstChild("Idle"));
    if v57 then
        v35.IdleTrack = l_Animator_0:LoadAnimation(v57);
        v35.IdleTrack.Looped = true;
        v35.IdleTrack:AdjustSpeed(v57:GetAttribute("Speed") or 1);
    end;
    local function v58() --[[ Line: 228 ]] --[[ Name: updateForceIdle ]]
        -- upvalues: v35 (copy)
        if v35.Instance:GetAttribute("ForceIdle") then
            v35.WalkTrack:Stop();
            v35.IdleTrack:Play();
            v35.AnimalModel:SetAttribute("Walking", false);
            return;
        else
            v35.WalkTrack:Play();
            v35.IdleTrack:Stop();
            v35.AnimalModel:SetAttribute("Walking", true);
            return;
        end;
    end;
    v35.Collector:Add(v35.Instance:GetAttributeChangedSignal("ForceIdle"):Connect(v58));
    v35.Collector:Add(task.spawn(v58));
    local l_FirstChild_0 = v35.AnimalModel:FindFirstChild("OVERHEAD_ATTACHMENT", true);
    if not l_FirstChild_0 then
        local l_Attachment_0 = Instance.new("Attachment");
        l_Attachment_0.Name = "Info";
        l_Attachment_0.CFrame = CFrame.new(0, l_ExtentsSize_0.Y * 0.75 * (v36.OverheadYOffsetModifier or 1), 0);
        l_Attachment_0.Parent = v35.Instance.PrimaryPart;
        l_FirstChild_0 = l_Attachment_0;
    end;
    if not v36.HideOverhead then
        local v61, v62 = v10.createFastOverhead({
            adornee = l_FirstChild_0, 
            guiTemplate = v10.GuiTemplates.AnimalOverhead
        });
        v35.Overhead = v61;
        v35.Overhead.DisplayName.Text = v36.DisplayName;
        v35.Overhead.Price.Text = ("$%*"):format((v23:ToString(v19:GetPrice(v35.Index))));
        v35.Overhead.Rarity.Text = v36.Rarity;
        v35.Overhead.Rarity.TextColor3 = v14[v36.Rarity].Color;
        v35.Collector:Add(v62);
        v42();
        v35.Overhead.Mutation.Visible = v35.Mutation ~= nil;
        if v35.Mutation then
            local v63 = v15[v35.Mutation];
            v35.Overhead.Mutation.Text = if v63.UseRichText then v63.DisplayWithRichText else v63.DisplayText;
            v35.Overhead.Mutation.RichText = v63.UseRichText;
            if v63.GradientPreset then
                v35.Overhead.Mutation.TextColor3 = Color3.fromRGB(255, 255, 255);
                v35.Collector:Add(v6.apply(v35.Overhead.Mutation, v63.GradientPreset));
            else
                v35.Overhead.Mutation.TextColor3 = v63.MainColor;
            end;
        end;
        if v14[v36.Rarity].StrokeColor then
            v35.Overhead.Rarity.UIStroke.Color = v14[v36.Rarity].StrokeColor;
        end;
        if v37.GradientPreset then
            v35.Collector:Add(v6.apply(v35.Overhead.Rarity, v37.GradientPreset));
        end;
    end;
    v35.AnimalModel:PivotTo(v35.Instance:GetPivot());
    local l_PrimaryPart_0 = v35.AnimalModel.PrimaryPart;
    if l_PrimaryPart_0 then
        l_PrimaryPart_0.RootPriority = 100;
        local v65 = v35.Collector:Add(Instance.new("WeldConstraint"));
        v65.Part0 = l_PrimaryPart_0;
        v65.Part1 = v35.Instance.PrimaryPart;
        v65.Parent = l_PrimaryPart_0;
        l_PrimaryPart_0.Anchored = false;
        local function v77(v66) --[[ Line: 304 ]] --[[ Name: updateClientWeld ]]
            -- upvalues: l_PrimaryPart_0 (copy), v7 (ref), v65 (copy), v35 (copy)
            if v66.Name ~= "CreateClientWeld" then
                return;
            else
                local l_Weld_0 = Instance.new("Weld");
                l_Weld_0.Name = "Weld";
                l_Weld_0.Part0 = l_PrimaryPart_0;
                local v71 = {
                    v7.observeProperty(v66, "Value", function(v68) --[[ Line: 315 ]]
                        -- upvalues: l_Weld_0 (copy)
                        l_Weld_0.Part1 = v68;
                        return nil;
                    end), 
                    v7.observeAttribute(v66, "C0", function(v69) --[[ Line: 319 ]]
                        -- upvalues: l_Weld_0 (copy)
                        l_Weld_0.C0 = v69;
                        return nil;
                    end), 
                    v7.observeAttribute(v66, "C1", function(v70) --[[ Line: 323 ]]
                        -- upvalues: l_Weld_0 (copy)
                        l_Weld_0.C1 = v70;
                        return nil;
                    end)
                };
                l_Weld_0.Parent = l_PrimaryPart_0;
                v65.Enabled = false;
                v66.Destroying:Once(function() --[[ Line: 333 ]]
                    -- upvalues: l_Weld_0 (copy), v35 (ref), v66 (copy), v65 (ref), v71 (copy)
                    l_Weld_0:Destroy();
                    local v72 = false;
                    for _, v74 in v35.Instance:GetChildren() do
                        if v74.Name == "CreateClientWeld" and v74 ~= v66 then
                            v72 = true;
                            break;
                        end;
                    end;
                    if not v72 then
                        v35.AnimalModel:PivotTo(v35.Instance:GetPivot());
                        v65.Enabled = true;
                    end;
                    for _, v76 in v71 do
                        v76();
                    end;
                end);
                return;
            end;
        end;
        v35.Collector:Add(v35.Instance.ChildAdded:Connect(function(v78) --[[ Line: 355 ]]
            -- upvalues: v77 (copy)
            v77(v78);
        end));
        for _, v80 in v35.Instance:GetChildren() do
            v35.Collector:Add(task.spawn(v77, v80));
        end;
    end;
    v35.Collector:Add(v35.Instance:GetAttributeChangedSignal("Traits"):Connect(v50));
    task.spawn(v50);
    return v35;
end;
v27.Destroy = function(v81) --[[ Line: 378 ]] --[[ Name: Destroy ]]
    v81.Collector:Destroy();
end;
return v27;