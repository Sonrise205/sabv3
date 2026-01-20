local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v9 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v10 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v11 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local v14 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v16 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v18 = require(l_ReplicatedStorage_0.Packages.Trove);
local v19 = require(l_ReplicatedStorage_0.Packages.Net);
local v20 = require(l_ReplicatedStorage_0.Shared.VFX);
local v21 = require(l_ReplicatedStorage_0.Shared.MapInformation);
local _ = require(l_ReplicatedStorage_0.Shared.Snapshot);
local l_Name_0 = script.Name;
local v24 = v19:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v25 = v18.new();
local v26 = RaycastParams.new();
v26.FilterType = Enum.RaycastFilterType.Include;
v26.FilterDescendantsInstances = {
    workspace.Map, 
    workspace.Plots
};
local function v32(v27, v28) --[[ Line: 40 ]] --[[ Name: createHole ]]
    -- upvalues: v26 (copy), v14 (copy)
    local l_v27_0 = v27;
    local v30 = workspace:Raycast(v27, Vector3.new(-0, -25, -0, -0), v26);
    if v30 then
        l_v27_0 = v30.Position;
    end;
    local v31 = script.Hole:Clone();
    v31.CFrame = CFrame.new(l_v27_0 + Vector3.new(0, 0.009999999776482582, 0, 0)) * CFrame.Angles(0, 0, 1.5707963267948966);
    v31.Size = Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582, 0);
    v31.Parent = workspace;
    v14(v31, TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Size = Vector3.new(0.009999999776482582, 8, 8, 0)
    });
    task.delay(v28, function() --[[ Line: 58 ]]
        -- upvalues: v14 (ref), v31 (copy)
        v14(v31, TweenInfo.new(0.75, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Size = Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582, 0)
        }).Completed:Wait();
        v31:Destroy();
    end);
end;
local function v49() --[[ Line: 67 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v25 (copy), l_RunService_0 (copy), v16 (copy)
    local v33 = v25:Extend();
    local v34 = table.create(4);
    v33:Add(function() --[[ Line: 79 ]]
        -- upvalues: v34 (copy)
        table.clear(v34);
    end);
    local v35 = 0;
    v33:Add(l_RunService_0.PreRender:Connect(function(v36) --[[ Line: 84 ]]
        -- upvalues: v35 (ref), v34 (copy)
        debug.profilebegin("Sammyni Spyderini Event");
        v35 = v35 + v36;
        for v37, v38 in v34 do
            if v38.target and v38.targetAttachment then
                v38.beam.First.Enabled = true;
                v38.beam.Second.Enabled = true;
                local v39 = math.clamp(v35 - v37 + 1, 0, 1);
                local l_WorldPosition_0 = v38.beam.WorldPosition;
                v38.targetAttachment.Position = l_WorldPosition_0 + (v38.target:GetPivot().Position - l_WorldPosition_0) * v39;
            end;
        end;
        debug.profileend();
    end));
    v33:Add(v16.observeTag("SammyniSpyderiniPlayerVFX", function(v41) --[[ Line: 106 ]]
        -- upvalues: v34 (copy), v16 (ref)
        local v42 = script.PlayerVFX.Beam:Clone();
        v42.Parent = v41;
        local v43 = script.PlayerVFX.Torso:Clone();
        v43.Parent = v41;
        local l_v41_Attribute_0 = v41:GetAttribute("SammyniSpyderiniIndex");
        v34[l_v41_Attribute_0] = {
            beam = v42, 
            target = nil
        };
        local v48 = v16.observeTag("SammyniSpyderiniPlayerVFX", function(v45) --[[ Line: 119 ]]
            -- upvalues: v41 (copy), v42 (copy), v34 (ref)
            if v45 == v41 then
                return nil;
            elseif v45:GetAttribute("SammyniSpyderiniIndex") ~= v41:GetAttribute("SammyniSpyderiniIndex") % 4 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v42.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v47 = v34[v41:GetAttribute("SammyniSpyderiniIndex")];
                v47.target = v45;
                v47.beam.First.Attachment0 = l_Attachment_0;
                v47.beam.Second.Attachment0 = l_Attachment_0;
                v47.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 138 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 143 ]]
            -- upvalues: v43 (copy), v42 (copy), v48 (copy), v34 (ref), l_v41_Attribute_0 (copy)
            v43:Destroy();
            v42:Destroy();
            v48();
            v34[l_v41_Attribute_0] = nil;
        end;
    end));
end;
v7.OnStart = function(_) --[[ Line: 153 ]] --[[ Name: OnStart ]]
    -- upvalues: v12 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v25 (copy), v8 (copy), v11 (copy), v10 (copy), v16 (copy), v18 (copy), v32 (copy), v21 (copy), v14 (copy), v49 (copy)
    local l_v12_ActiveEventData_0 = v12:GetActiveEventData(l_Name_0);
    assert(l_v12_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("SammyniSpyderiniEvent", true);
    v25:Add(function() --[[ Line: 158 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v8 (ref), v11 (ref), v10 (ref)
        l_ReplicatedStorage_0:SetAttribute("SammyniSpyderiniEvent", nil);
        v8:Activate("Blink");
        v11:Update();
        v10:UpdateOST();
        v10:UpdateAmbience();
    end);
    v25:Add(v16.observeTag("SammyniSpyderini", function(v52) --[[ Line: 168 ]]
        -- upvalues: v18 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v32 (ref)
        local v53 = v18.new();
        local l_HumanoidRootPart_0 = v52:WaitForChild("HumanoidRootPart");
        local v55 = v53:Clone(script["Sammyni Spyderini"]);
        local v56 = v53:Add(Instance.new("Weld"));
        v56.Part0 = v55.PrimaryPart;
        v56.Part1 = l_HumanoidRootPart_0;
        v56.C0 = CFrame.Angles(0, 3.141592653589793, 0);
        v56.Parent = v55.PrimaryPart;
        v55.Parent = v52;
        local l_Animator_0 = v55.AnimationController.Animator;
        local v58 = l_Animator_0:LoadAnimation(script.Idle);
        v58.Priority = Enum.AnimationPriority.Idle;
        local v59 = l_Animator_0:LoadAnimation(script.Walk);
        v59.Priority = Enum.AnimationPriority.Movement;
        local v60 = l_Animator_0:LoadAnimation(script.Attack);
        local v61 = l_Animator_0:LoadAnimation(script.Ground);
        v61.Looped = true;
        local v62 = l_Animator_0:LoadAnimation(script.InitialGround);
        v62.Looped = true;
        local v63 = l_Animator_0:LoadAnimation(script.Jump);
        v58:Play();
        v53:Add(v61:GetMarkerReachedSignal("Freeze"):Connect(function() --[[ Line: 203 ]]
            -- upvalues: v61 (copy)
            v61:AdjustSpeed(0);
        end));
        v53:Add(v62:GetMarkerReachedSignal("Freeze"):Connect(function() --[[ Line: 207 ]]
            -- upvalues: v62 (copy)
            v62:AdjustSpeed(0);
        end));
        local v64 = nil;
        local function v65() --[[ Line: 212 ]] --[[ Name: updateGround ]]
            -- upvalues: v52 (copy), v64 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), l_HumanoidRootPart_0 (copy), v32 (ref), v62 (copy), v61 (copy), v63 (copy)
            if v52:GetAttribute("InitialGround") then
                v64 = true;
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Sammyni Spyderini"].EnterHole, l_HumanoidRootPart_0.Position, false);
                v32(l_HumanoidRootPart_0.Position, 1.5);
                if not v62.IsPlaying then
                    v62:Play();
                    return;
                end;
            elseif v52:GetAttribute("Ground") then
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Sammyni Spyderini"].EnterHole, l_HumanoidRootPart_0.Position, false);
                v32(l_HumanoidRootPart_0.Position, 1.5);
                if not v61.IsPlaying then
                    if v64 then
                        v61.TimePosition = 0.6;
                    end;
                    v61:Play(v64 and 0 or nil);
                    if v64 then
                        v61.TimePosition = 0.6;
                    end;
                end;
                v64 = false;
                return;
            else
                v64 = false;
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Sammyni Spyderini"].LeaveHole, l_HumanoidRootPart_0.Position, false);
                v32(l_HumanoidRootPart_0.Position, 1.5);
                v63:Play();
                v61:Stop();
                v62:Stop();
            end;
        end;
        v53:Add(task.defer(function() --[[ Line: 243 ]]
            -- upvalues: v52 (copy), v59 (copy)
            if v52:GetAttribute("IsRunning") then
                v59:Play();
            end;
        end));
        v53:Add(v52:GetAttributeChangedSignal("IsRunning"):Connect(function() --[[ Line: 249 ]]
            -- upvalues: v52 (copy), v59 (copy)
            if v52:GetAttribute("IsRunning") then
                v59:Play();
                return;
            else
                v59:Stop();
                return;
            end;
        end));
        if v52:GetAttribute("Ground") and not v61.IsPlaying then
            v61.TimePosition = 0.6;
            v61:Play(0);
            v61.TimePosition = 0.6;
        end;
        v53:Add(v52:GetAttributeChangedSignal("Ground"):Connect(v65));
        v53:Add(v52:GetAttributeChangedSignal("InitialGround"):Connect(v65));
        v53:Add(v52:GetAttributeChangedSignal("AttackAnimation"):Connect(function() --[[ Line: 269 ]]
            -- upvalues: v60 (copy)
            v60:Play();
        end));
        return v53:WrapClean();
    end));
    local v66 = l_v12_ActiveEventData_0.startedAt + 5 - workspace:GetServerTimeNow();
    v25:Add(task.delay(v66, function() --[[ Line: 277 ]]
        -- upvalues: v66 (copy), v10 (ref), l_ReplicatedStorage_0 (ref), v21 (ref), v25 (ref), v14 (ref), v11 (ref)
        if v66 > 1 then
            v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Sammyni Spyderini"].Expanding, v21.MapCenter.Position, false);
        end;
        local v67 = v25:Clone(script.Web_Main);
        for _, v69 in v67.Lines:GetChildren() do
            local l_Size_0 = v69.Size;
            v69.Size = Vector3.new(0, 1, 1, 0);
            v14(v69, TweenInfo.new(l_Size_0.Magnitude / 150, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                Size = l_Size_0
            });
        end;
        for _, v72 in v67:GetDescendants() do
            if not v72:IsDescendantOf(v67.Lines) and v72:IsA("BasePart") then
                local l_Size_1 = v72.Size;
                v72.Size = Vector3.new(0, 1, 1, 0);
                local l_Transparency_0 = v72.Transparency;
                v72.Transparency = 1;
                local v75 = ((v72.Position - v21.MapCenter.Position) * Vector3.new(1, 0, 1, 0)).Magnitude * 2 / 150;
                task.delay(v75, function() --[[ Line: 317 ]]
                    -- upvalues: v72 (copy), l_Transparency_0 (copy)
                    v72.Transparency = l_Transparency_0;
                end);
                v14(v72, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, v75), {
                    Size = l_Size_1
                });
            end;
        end;
        v67.Parent = workspace;
        v11:Update();
        v10:UpdateOST();
        v10:UpdateAmbience();
    end));
    v25:Add(task.spawn(function() --[[ Line: 333 ]]
        -- upvalues: v49 (ref)
        v49();
    end));
end;
v7.OnStop = function(_) --[[ Line: 338 ]] --[[ Name: OnStop ]]
    -- upvalues: v25 (copy)
    v25:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 342 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v24 (copy), v9 (copy), v25 (copy), v20 (copy), l_Debris_0 (copy), v10 (copy), l_ReplicatedStorage_0 (copy)
    task.spawn(pcall, function() --[[ Line: 343 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v24.OnClientEvent:Connect(function(v78) --[[ Line: 347 ]]
        -- upvalues: v9 (ref), v25 (ref), v20 (ref), l_Debris_0 (ref), v10 (ref), l_ReplicatedStorage_0 (ref)
        local v79 = v9:GetAnimals()[v78];
        if not v79 then
            return;
        else
            local l_AnimalModel_0 = v79.AnimalModel;
            local v81 = v79.AnimalModel and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v79.Instance;
            local v83 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v83 or not v81 then
                return;
            else
                local v84 = v25:Clone(script.Burst);
                v84:PivotTo(v83.CFrame * CFrame.new(0, (v84.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v84.Parent = l_Instance_0;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v84;
                l_WeldConstraint_0.Part1 = v79.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v84;
                v20.emit(v84);
                l_Debris_0:AddItem(v84, 5);
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Sammyni Spyderini"].Hit, v83.CFrame.Position, false);
                return;
            end;
        end;
    end);
end;
return v7;