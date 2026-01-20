local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_TweenService_0 = game:GetService("TweenService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v9 = {};
local v10 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v11 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v12 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v13 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v14 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v16 = require(l_ReplicatedStorage_0.Shared.VFX);
local v17 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v18 = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v19 = require(l_ReplicatedStorage_0.Shared.Animals);
local v20 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v21 = require(l_ReplicatedStorage_0.Packages.Observers);
local v22 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v23 = require(l_ReplicatedStorage_0.Packages.Trove);
local v24 = require(l_ReplicatedStorage_0.Packages.Net);
local v25 = require(l_ReplicatedStorage_0.Packages.Spr);
local l_Name_0 = script.Name;
local v27 = v24:RemoteEvent((("EventService/%*/StartTransition"):format(l_Name_0)));
local v28 = v24:RemoteEvent((("EventService/%*/StopTransition"):format(l_Name_0)));
local v29 = v24:RemoteEvent((("EventService/%*/PointArrow"):format(l_Name_0)));
local v30 = v24:RemoteEvent((("EventService/%*/Delivery"):format(l_Name_0)));
local v31 = v24:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v32 = v24:RemoteEvent((("EventService/%*/Grab"):format(l_Name_0)));
local v33 = v24:RemoteEvent((("EventService/%*/CandyCaneAnimation"):format(l_Name_0)));
local v34 = v24:RemoteEvent((("EventService/%*/SpawnBrainrot"):format(l_Name_0)));
local v35 = v24:RemoteEvent((("EventService/%*/DestroyGift"):format(l_Name_0)));
local v36 = v24:RemoteEvent((("EventService/%*/GiftBurst"):format(l_Name_0)));
local v37 = v24:RemoteEvent((("EventService/%*/SpawnGift"):format(l_Name_0)));
local v38 = v24:RemoteEvent((("EventService/%*/OpenGift"):format(l_Name_0)));
local v39 = v23.new();
local v40 = false;
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v43 = CFrame.new(0, 1000, 100000);
local v44 = RaycastParams.new();
v44.FilterType = Enum.RaycastFilterType.Include;
v44.FilterDescendantsInstances = {
    workspace.Map
};
local v45 = v23.new();
local function _(v46, v47, v48) --[[ Line: 68 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v45 (copy)
    local v49 = v46:LoadAnimation(v47);
    (v48 or v45):Add(function() --[[ Line: 70 ]]
        -- upvalues: v49 (copy)
        v49:Stop(0);
        v49:Destroy();
    end);
    return v49;
end;
local function v80(v51) --[[ Line: 78 ]] --[[ Name: startTrainTravel ]]
    -- upvalues: v40 (ref), l_ReplicatedStorage_0 (copy), v23 (copy), l_CurrentCamera_0 (copy), l_ProximityPromptService_0 (copy), v39 (copy), l_TweenService_0 (copy), l_Players_0 (copy), v43 (copy), l_Lighting_0 (copy), l_RunService_0 (copy)
    if v40 then
        return;
    else
        v40 = true;
        l_ReplicatedStorage_0:SetAttribute("InTrainTravelCutscene", true);
        local v52 = false;
        local v53 = v23.new();
        local l_ColorCorrectionEffect_0 = Instance.new("ColorCorrectionEffect");
        l_ColorCorrectionEffect_0.Parent = l_CurrentCamera_0;
        l_ProximityPromptService_0.Enabled = false;
        v39:Add(function() --[[ Line: 94 ]]
            -- upvalues: l_ProximityPromptService_0 (ref)
            l_ProximityPromptService_0.Enabled = true;
        end);
        local v55 = v53:Clone(script.SnowyAtmosphere);
        local function v61(v56, v57) --[[ Line: 100 ]] --[[ Name: fade ]]
            -- upvalues: l_TweenService_0 (ref), l_ColorCorrectionEffect_0 (copy), v52 (ref), v39 (ref)
            local v58 = l_TweenService_0:Create(l_ColorCorrectionEffect_0, TweenInfo.new(1), {
                TintColor = if v56 == "Out" then Color3.new(0, 0, 0) else Color3.new(1, 1, 1)
            });
            v58:Play();
            if v57 ~= nil then
                local v60 = v58.Completed:Connect(function(v59) --[[ Line: 108 ]]
                    -- upvalues: v57 (copy)
                    if v59 ~= Enum.PlaybackState.Cancelled then
                        v57(v59);
                    end;
                end);
                if not v52 then
                    v39:Add(v60);
                end;
            end;
            if not v52 then
                v39:Add(function() --[[ Line: 120 ]]
                    -- upvalues: v58 (copy)
                    v58:Cancel();
                    v58:Destroy();
                end);
            end;
        end;
        local v62 = false;
        local v63 = false;
        local function v66() --[[ Line: 129 ]] --[[ Name: resetCamera ]]
            -- upvalues: v62 (ref), v63 (ref), l_CurrentCamera_0 (ref), l_Players_0 (ref)
            if v62 or not v63 then
                return;
            else
                v62 = true;
                l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                local l_Character_0 = l_Players_0.LocalPlayer.Character;
                local v65 = l_Character_0 and l_Character_0:FindFirstChildOfClass("Humanoid");
                if v65 ~= nil then
                    l_CurrentCamera_0.CameraSubject = v65;
                end;
                return;
            end;
        end;
        v39:Add(function() --[[ Line: 145 ]]
            -- upvalues: v40 (ref), v52 (ref), v61 (copy), v53 (copy), v62 (ref), v63 (ref), l_CurrentCamera_0 (ref), l_Players_0 (ref), l_ReplicatedStorage_0 (ref), l_ColorCorrectionEffect_0 (copy)
            v40 = false;
            v52 = true;
            v61("Out", function() --[[ Line: 149 ]]
                -- upvalues: v53 (ref), v62 (ref), v63 (ref), l_CurrentCamera_0 (ref), l_Players_0 (ref), l_ReplicatedStorage_0 (ref), v61 (ref), l_ColorCorrectionEffect_0 (ref)
                v53:Clean();
                if not v62 and v63 then
                    v62 = true;
                    l_CurrentCamera_0.CameraType = Enum.CameraType.Custom;
                    local l_Character_1 = l_Players_0.LocalPlayer.Character;
                    local v68 = l_Character_1 and l_Character_1:FindFirstChildOfClass("Humanoid");
                    if v68 ~= nil then
                        l_CurrentCamera_0.CameraSubject = v68;
                    end;
                end;
                l_ReplicatedStorage_0:SetAttribute("InTrainTravelCutscene", nil);
                v61("In", function() --[[ Line: 155 ]]
                    -- upvalues: l_ColorCorrectionEffect_0 (ref)
                    l_ColorCorrectionEffect_0:Destroy();
                end);
            end);
        end);
        local l_Road_0 = script.Road;
        local v70 = v53:Clone(script.BrainrotExpress);
        v70.Parent = l_CurrentCamera_0;
        local v71 = l_Road_0.End.Position.Z - l_Road_0.Start.Position.Z;
        local v72 = v51 * 260;
        for v73 = 1, math.max(math.ceil(v72 / (v71 - 100)), 1) + 2 do
            local v74 = v53:Clone(l_Road_0);
            v74:PivotTo(v43 * CFrame.new(0, 0, -(v71 * (v73 - 1))));
            v74.Parent = l_CurrentCamera_0;
        end;
        v61("Out", function() --[[ Line: 177 ]]
            -- upvalues: v63 (ref), v55 (copy), l_Lighting_0 (ref), l_CurrentCamera_0 (ref), v53 (copy), v66 (copy), v51 (copy), l_RunService_0 (ref), v43 (ref), v72 (copy), v70 (copy), v39 (ref), l_ReplicatedStorage_0 (ref), v61 (copy)
            v63 = true;
            v55.Parent = l_Lighting_0;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Scriptable;
            v53:Add(v66);
            local v75 = os.clock();
            local v76 = v75 + v51;
            local _ = v53:Add(l_RunService_0.PreRender:Connect(function() --[[ Line: 188 ]]
                -- upvalues: v75 (copy), v76 (copy), v43 (ref), v72 (ref), v70 (ref), l_CurrentCamera_0 (ref)
                local v77 = math.clamp((os.clock() - v75) / (v76 - v75), 0, 1);
                local v78 = v43 * CFrame.new(0, 0, -50) * CFrame.new(0, 0, -((v72 - 50) * v77));
                v70:PivotTo(v78);
                l_CurrentCamera_0.CFrame = v70.Camera.CFrame;
            end));
            v53:Add(task.delay(v51 - 1, function() --[[ Line: 200 ]]
                -- upvalues: v39 (ref)
                v39:Clean();
            end));
            l_ReplicatedStorage_0.Sounds.Events["North Pole"].TrainLoop:Play();
            v53:Add(function() --[[ Line: 205 ]]
                -- upvalues: l_ReplicatedStorage_0 (ref)
                l_ReplicatedStorage_0.Sounds.Events["North Pole"].TrainLoop:Stop();
            end);
            v61("In");
        end);
        return;
    end;
end;
local function v81() --[[ Line: 213 ]] --[[ Name: stopTrainTravel ]]
    -- upvalues: v40 (ref), v39 (copy)
    if not v40 then
        return;
    else
        v39:Clean();
        return;
    end;
end;
local function v87(v82, v83) --[[ Line: 221 ]] --[[ Name: playCharacterAnimation ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_Character_2 = v82.Character;
    if not l_Character_2 then
        return;
    else
        local l_HumanoidRootPart_0 = l_Character_2:FindFirstChild("HumanoidRootPart");
        if not l_HumanoidRootPart_0 then
            return;
        else
            local v86 = script.Reward:Clone();
            v86.CurrencyCandyCane.Text = ("+%*"):format(v83);
            v86.Parent = l_HumanoidRootPart_0;
            l_TweenService_0:Create(v86, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                StudsOffset = Vector3.new(0, 2.5, 2.200000047683716, 0)
            }):Play();
            l_TweenService_0:Create(v86.ImageLabel.ImageLabel, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                ImageTransparency = 1
            }):Play();
            l_TweenService_0:Create(v86.CurrencyCandyCane, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                TextTransparency = 1
            }):Play();
            l_TweenService_0:Create(v86.CurrencyCandyCane.UIStroke, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 1.5), {
                Transparency = 1
            }):Play();
            task.delay(5, function() --[[ Line: 252 ]]
                -- upvalues: v86 (copy)
                v86:Destroy();
            end);
            return;
        end;
    end;
end;
local function v92() --[[ Line: 257 ]] --[[ Name: playScreenCandyCaneAnimation ]]
    -- upvalues: l_LocalPlayer_0 (copy), v20 (copy)
    local v88 = Random.new();
    for _ = 1, 10 do
        local v90 = script.Image:Clone();
        v90.Position = UDim2.fromScale(v88:NextNumber(-0.25, 1.25), -0.25);
        v90.Rotation = v88:NextNumber(-120, 120);
        local v91 = v88:NextNumber(0.15, 0.2);
        v90.Size = UDim2.fromScale(v91, v91);
        v90.Parent = l_LocalPlayer_0.PlayerGui:FindFirstChild("Effects");
        v20(v90, TweenInfo.new(v88:NextNumber(0.75, 1.3), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Position = v90.Position + UDim2.fromScale(0, 1.5), 
            Rotation = v90.Rotation + v88:NextInteger(-3, 3) * 10
        }, true).Completed:Once(function() --[[ Line: 277 ]]
            -- upvalues: v90 (copy)
            task.wait(1);
            v90:Destroy();
        end);
    end;
end;
v9.OnStart = function(_) --[[ Line: 284 ]] --[[ Name: OnStart ]]
    -- upvalues: v12 (copy), l_Name_0 (copy), v45 (copy), v27 (copy), v80 (copy), v28 (copy), v81 (copy), l_ReplicatedStorage_0 (copy), v29 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy), v21 (copy), v32 (copy), v25 (copy), v14 (copy), v22 (copy), v17 (copy), l_HttpService_0 (copy), v30 (copy), v23 (copy), v19 (copy), v34 (copy), v13 (copy), v10 (copy)
    local l_v12_ActiveEventData_0 = v12:GetActiveEventData(l_Name_0);
    assert(l_v12_ActiveEventData_0);
    local function _(v95) --[[ Line: 288 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v12_ActiveEventData_0 (copy)
        return (math.max(l_v12_ActiveEventData_0.startedAt + v95 - workspace:GetServerTimeNow(), 0));
    end;
    v45:Add(v27.OnClientEvent:Connect(v80));
    v45:Add(v28.OnClientEvent:Connect(v81));
    local v97 = v45:Clone(script.EntranceSign);
    v97.Parent = workspace;
    v45:Add(l_ReplicatedStorage_0:GetAttributeChangedSignal("NorthPoleEventInMap"):Connect(function() --[[ Line: 297 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v97 (ref), v45 (ref)
        if l_ReplicatedStorage_0:GetAttribute("NorthPoleEventInMap") and v97 then
            v45:Remove(v97);
            v97 = nil;
        end;
    end));
    local v98 = v45:Extend();
    local v99 = nil;
    local v100 = nil;
    v45:Add(v29.OnClientEvent:Connect(function(v101, v102) --[[ Line: 307 ]]
        -- upvalues: v98 (copy), v99 (ref), v100 (ref), l_RunService_0 (ref), l_LocalPlayer_0 (ref)
        if v101 == nil then
            v98:Clean();
            return;
        else
            v99 = v101;
            v100 = v102;
            v98:Add(function() --[[ Line: 316 ]]
                -- upvalues: v99 (ref), v100 (ref)
                v99 = nil;
                v100 = nil;
            end);
            local v103 = v98:Clone(script.PointingArrow);
            local l_Start_0 = v103.Start;
            local l_End_0 = v103.End;
            v103.Parent = workspace;
            v98:Add(l_RunService_0.PreRender:Connect(function() --[[ Line: 326 ]]
                -- upvalues: v101 (copy), l_LocalPlayer_0 (ref), l_Start_0 (copy), v100 (ref), v98 (ref), l_End_0 (copy)
                local v106 = if typeof(v101) == "Instance" then v101:GetPivot().Position else if typeof(v101) == "CFrame" then v101.Position else v101;
                local l_Character_3 = l_LocalPlayer_0.Character;
                if l_Character_3 then
                    local l_l_Character_3_Pivot_0 = l_Character_3:GetPivot();
                    l_Start_0:PivotTo(l_l_Character_3_Pivot_0);
                    if v100 and (v106 - l_l_Character_3_Pivot_0.Position).Magnitude <= 10 then
                        v98:Clean();
                    end;
                end;
                l_End_0:PivotTo(CFrame.new(v106));
            end));
            return;
        end;
    end));
    v45:Add(v21.observeTag("NorthPoleEventGrabItem", function(v109) --[[ Line: 346 ]]
        -- upvalues: v21 (ref), v32 (ref)
        return v21.observeAttribute(v109, "GrabPrompt", function(v110) --[[ Line: 347 ]]
            -- upvalues: v109 (copy), v32 (ref)
            if v110 == false then
                return;
            else
                local l_Name_1 = v109.Name;
                local l_ProximityPrompt_0 = Instance.new("ProximityPrompt");
                l_ProximityPrompt_0.Name = "ProximityPrompt";
                l_ProximityPrompt_0.ActionText = "Grab";
                l_ProximityPrompt_0.HoldDuration = 0.5;
                l_ProximityPrompt_0.RequiresLineOfSight = false;
                l_ProximityPrompt_0.Enabled = true;
                l_ProximityPrompt_0.Parent = v109;
                local v113 = l_ProximityPrompt_0.Triggered:Connect(function() --[[ Line: 362 ]]
                    -- upvalues: v32 (ref), l_Name_1 (copy)
                    v32:FireServer(l_Name_1);
                end);
                return function() --[[ Line: 366 ]]
                    -- upvalues: l_ProximityPrompt_0 (copy), v113 (copy)
                    l_ProximityPrompt_0:Destroy();
                    v113:Disconnect();
                end;
            end;
        end);
    end, {
        workspace
    }));
    v45:Add(v21.observeTag("NorthPolePlayerCollision", function(v114) --[[ Line: 373 ]]
        v114.CanCollide = true;
        return nil;
    end, {
        workspace
    }));
    v45:Add(v21.observeTag("NorthPoleDoor", function(v115) --[[ Line: 378 ]]
        -- upvalues: v21 (ref), v25 (ref), v14 (ref)
        local l_v115_Pivot_0 = v115:GetPivot();
        return v21.observeAttribute(v115, "Open", function(v117) --[[ Line: 380 ]]
            -- upvalues: v25 (ref), v115 (copy), l_v115_Pivot_0 (copy), v14 (ref)
            if not v117 then
                v25.target(v115, 0.75, 3.5, {
                    Pivot = l_v115_Pivot_0
                });
                v14:PlaySound(script.DoorClose, l_v115_Pivot_0.Position, false);
            else
                v25.target(v115, 0.75, 3.5, {
                    Pivot = l_v115_Pivot_0 * CFrame.Angles(0, -1.5707963267948966, 0)
                });
                v14:PlaySound(script.DoorOpen, l_v115_Pivot_0.Position, false);
            end;
            return function() --[[ Line: 389 ]]
                -- upvalues: v115 (ref), v25 (ref), l_v115_Pivot_0 (ref), v14 (ref)
                if v115:IsDescendantOf(workspace) then
                    v25.target(v115, 0.75, 3.5, {
                        Pivot = l_v115_Pivot_0
                    });
                    v14:PlaySound(script.DoorClose, l_v115_Pivot_0.Position, false);
                end;
            end;
        end);
    end, {
        workspace
    }));
    local v118 = {};
    local v119 = {};
    v45:Add(v21.observeTag("NorthPoleSantaSleign", function(v120) --[[ Line: 400 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v22 (ref), v17 (ref), l_HttpService_0 (ref), v118 (copy), v119 (copy)
        local l_Name_2 = v120.Name;
        local v122 = l_ReplicatedStorage_0.Models.Events["North Pole"].Sleigh:Clone();
        v122.PrimaryPart.Anchored = true;
        if v22:GetInstant("Optimisation.HumanoidBrainrotModels", v17.IsNewPlayersServer()) then
            local l_AnimationController_0 = v122:FindFirstChild("AnimationController");
            if l_AnimationController_0 then
                l_AnimationController_0:Destroy();
            end;
            local v124 = Instance.new("Humanoid", v122);
            local _ = Instance.new("Animator", v124);
            v124.Name = "AnimationController";
            v124.EvaluateStateMachine = false;
            v124.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
            v124.PlatformStand = true;
            v124.Parent = v122;
        end;
        v122.Parent = v120;
        local v126 = v122.AnimationController.Animator:LoadAnimation(l_ReplicatedStorage_0.Models.Events["North Pole"].SleighFly);
        v126.Looped = true;
        v126:Play();
        local function v132() --[[ Line: 429 ]] --[[ Name: updateGifts ]]
            -- upvalues: l_HttpService_0 (ref), v120 (copy), v122 (copy)
            local v127 = l_HttpService_0:JSONDecode(v120:GetAttribute("Gifts") or "[]");
            for v128 = 1, 10 do
                local l_FirstChild_0 = v122.Gifts:FindFirstChild((tostring(v128)));
                if l_FirstChild_0 then
                    l_FirstChild_0:SetAttribute("GiftTexture", v127[v128] or "");
                    l_FirstChild_0:AddTag("NorthPoleEventGiftTexture");
                    for _, v131 in l_FirstChild_0:GetChildren() do
                        if v131:IsA("BasePart") then
                            v131.Transparency = v128 <= #v127 and 0 or 1;
                        end;
                    end;
                end;
            end;
        end;
        local v133 = v120:GetAttributeChangedSignal("Gifts"):Connect(v132);
        v132();
        table.insert(v118, v120);
        v119[l_Name_2] = v122;
        return function() --[[ Line: 451 ]]
            -- upvalues: v119 (ref), l_Name_2 (copy), v118 (ref), v120 (copy), v133 (copy), v126 (copy), v122 (copy)
            v119[l_Name_2] = nil;
            local v134 = table.find(v118, v120);
            if v134 then
                table.remove(v118, v134);
            end;
            v133:Disconnect();
            v126:Stop(0);
            v126:Destroy();
            v122:Destroy();
        end;
    end));
    v45:Add(l_RunService_0.PreRender:Connect(function(_) --[[ Line: 468 ]]
        -- upvalues: v118 (copy), v119 (copy)
        debug.profilebegin("North Pole:BulkMoveTo");
        local v136 = {};
        local v137 = {};
        for _, v139 in v118 do
            local v140 = v119[v139.Name];
            if v140 then
                table.insert(v136, v140.PrimaryPart);
                table.insert(v137, v139.CFrame);
            end;
        end;
        workspace:BulkMoveTo(v136, v137, Enum.BulkMoveMode.FireCFrameChanged);
        debug.profileend();
    end));
    local v141 = {};
    local v142 = OverlapParams.new();
    v45:Add(v21.observeTag("NorthPoleDeliveryHitboxes", function(v143) --[[ Line: 487 ]]
        -- upvalues: v141 (copy), v142 (copy)
        table.insert(v141, v143);
        v142.FilterDescendantsInstances = v141;
        return function() --[[ Line: 490 ]]
            -- upvalues: v141 (ref), v143 (copy), v142 (ref)
            local v144 = table.find(v141, v143);
            if v144 then
                table.remove(v141, v144);
                v142.FilterDescendantsInstances = v141;
            end;
        end;
    end));
    v142.FilterDescendantsInstances = v141;
    v142.FilterType = Enum.RaycastFilterType.Include;
    v142.MaxParts = 1;
    local v145 = 0;
    v45:Add(l_RunService_0.PostSimulation:Connect(function(v146) --[[ Line: 504 ]]
        -- upvalues: v145 (ref), l_LocalPlayer_0 (ref), v142 (copy), v30 (ref)
        v145 = v145 + v146;
        if v145 < 0.05 then
            return;
        else
            debug.profilebegin("NorthPole:Hitboxes");
            v145 = 0;
            if not l_LocalPlayer_0:GetAttribute("Stealing") then
                return;
            else
                local l_Character_4 = l_LocalPlayer_0.Character;
                if not l_Character_4 then
                    debug.profileend();
                    return;
                else
                    local l_Position_0 = l_Character_4:GetPivot().Position;
                    if #workspace:GetPartBoundsInBox(CFrame.new(l_Position_0), Vector3.new(4, 4, 2, 0), v142) <= 0 then
                        return;
                    else
                        v30:FireServer();
                        debug.profileend();
                        return;
                    end;
                end;
            end;
        end;
    end));
    v45:Add(v21.observeTag("NorthPoleSantaSpawner", function(v149) --[[ Line: 534 ]]
        -- upvalues: l_LocalPlayer_0 (ref), v21 (ref), v23 (ref), l_HttpService_0 (ref), v19 (ref), v25 (ref), v34 (ref)
        local v150 = script.SpawnerUI:Clone();
        v150.Adornee = v149;
        v150.Parent = l_LocalPlayer_0.PlayerGui;
        local v162 = v21.observeAttribute(v149, "Brainrots", function(v151) --[[ Line: 539 ]]
            -- upvalues: v23 (ref), l_HttpService_0 (ref), v150 (copy), v19 (ref), v149 (copy), v25 (ref), v34 (ref)
            if v151 == nil then
                return nil;
            else
                local v152 = v23.new();
                for _, v154 in l_HttpService_0:JSONDecode(v151) do
                    local l_Index_0 = v154.Index;
                    local l_Brainrot_0 = v154.Brainrot;
                    local l_Price_0 = v154.Price;
                    local v158 = v152:Clone(v150.ScrollingFrame.UIListLayout.Template);
                    v158.Spacer.Title.Text = l_Brainrot_0;
                    local v159 = v19:AttachOnViewport(l_Brainrot_0, v158.Spacer.ViewportFrame, true);
                    if v159 then
                        v152:Add(v159);
                    end;
                    v158.Spacer.Buy.Txt.Size = UDim2.fromScale(0.35, 0.8);
                    v158.Spacer.Buy.Txt.Text = l_Price_0;
                    v158.Parent = v150.ScrollingFrame;
                    local function v161() --[[ Line: 562 ]] --[[ Name: updateBuyButton ]]
                        -- upvalues: l_HttpService_0 (ref), v149 (ref), l_Index_0 (copy), v25 (ref), v158 (copy)
                        local v160 = l_HttpService_0:JSONDecode(v149:GetAttribute("Stocks") or "[]");
                        if not l_Index_0 or (v160[l_Index_0] or 0) <= 0 then
                            v25.target(v158.Spacer.Buy, 1, 5, {
                                BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                            });
                            v158.Spacer.Amount.Text = "SOLD OUT";
                            v158.Spacer.Amount.TextColor3 = Color3.fromRGB(255, 61, 61);
                            return;
                        else
                            v25.target(v158.Spacer.Buy, 1, 5, {
                                BackgroundColor3 = Color3.fromRGB(81, 158, 86)
                            });
                            v158.Spacer.Amount.Text = ("%* LEFT"):format(v160[l_Index_0] or 0);
                            v158.Spacer.Amount.TextColor3 = Color3.fromRGB(255, 213, 0);
                            return;
                        end;
                    end;
                    v152:Add(v149:GetAttributeChangedSignal("Stocks"):Connect(v161));
                    v161();
                    v152:Add(v158.Spacer.Buy.Activated:Connect(function() --[[ Line: 578 ]]
                        -- upvalues: v34 (ref), l_Brainrot_0 (copy)
                        v34:FireServer(l_Brainrot_0);
                    end));
                end;
                return v152:WrapClean();
            end;
        end);
        return function() --[[ Line: 585 ]]
            -- upvalues: v162 (copy), v150 (copy)
            v162();
            v150:Destroy();
        end;
    end));
    v45:Add(v21.observeTag("Elf", function(v163) --[[ Line: 591 ]]
        -- upvalues: v23 (ref), v45 (ref), v21 (ref)
        local v164 = v23.new();
        local l_HumanoidRootPart_1 = v163:WaitForChild("HumanoidRootPart");
        local v166 = v164:Clone(script.Elf);
        local v167 = v164:Add(Instance.new("Weld"));
        v167.Part0 = v166.PrimaryPart;
        v167.Part1 = l_HumanoidRootPart_1;
        v167.Parent = v166.PrimaryPart;
        v166.Parent = v163;
        local l_AnimationController_1 = v166:FindFirstChild("AnimationController");
        if l_AnimationController_1 then
            l_AnimationController_1:Destroy();
        end;
        local v169 = Instance.new("Humanoid", v166);
        local _ = Instance.new("Animator", v169);
        v169.Name = "AnimationController";
        v169.EvaluateStateMachine = false;
        v169.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
        v169.PlatformStand = true;
        v169.Parent = v166;
        local l_Animator_0 = v166.AnimationController.Animator;
        local v172 = l_Animator_0:LoadAnimation(script.Idle);
        local l_v172_0 = v172 --[[ copy: 11 -> 14 ]];
        (v164 or v45):Add(function() --[[ Line: 70 ]]
            -- upvalues: l_v172_0 (copy)
            l_v172_0:Stop(0);
            l_v172_0:Destroy();
        end);
        local l_v172_1 = v172;
        l_v172_1.Looped = true;
        l_v172_1.Priority = Enum.AnimationPriority.Idle;
        l_v172_1:Play();
        local v175 = l_Animator_0:LoadAnimation(script.Attack);
        (v164 or v45):Add(function() --[[ Line: 70 ]]
            -- upvalues: v175 (copy)
            v175:Stop(0);
            v175:Destroy();
        end);
        local l_v175_0 = v175;
        l_v175_0.Looped = false;
        l_v175_0.Priority = Enum.AnimationPriority.Action;
        v164:Add(l_v175_0:GetMarkerReachedSignal("CandyDisappear"):Once(function() --[[ Line: 631 ]]
            -- upvalues: v166 (copy)
            v166.Candy.Transparency = 1;
        end));
        v164:Add(v163:GetAttributeChangedSignal("AttackAnimation"):Connect(function() --[[ Line: 635 ]]
            -- upvalues: l_v175_0 (copy)
            l_v175_0:Play();
        end));
        local v177 = l_Animator_0:LoadAnimation(script.Walk);
        (v164 or v45):Add(function() --[[ Line: 70 ]]
            -- upvalues: v177 (copy)
            v177:Stop(0);
            v177:Destroy();
        end);
        v172 = v177;
        v172.Priority = Enum.AnimationPriority.Action2;
        v164:Add(v21.observeAttribute(v163, "IsRunning", function(v178) --[[ Line: 642 ]]
            -- upvalues: v172 (copy)
            if v178 then
                v172:Play();
                v172:AdjustSpeed(1.5);
            else
                v172:Stop();
            end;
            return nil;
        end));
        return v164:WrapClean();
    end));
    v45:Add(l_ReplicatedStorage_0:GetAttributeChangedSignal("NorthPoleEventActive"):Connect(function() --[[ Line: 656 ]]
        -- upvalues: v13 (ref), v14 (ref)
        v13:Update();
        v14:UpdateOST();
    end));
    v45:Add(function() --[[ Line: 661 ]]
        -- upvalues: v81 (ref), v10 (ref), v13 (ref), v14 (ref)
        task.spawn(v81);
        v10:Activate("Blink");
        v13:Update();
        v14:UpdateOST();
    end);
end;
v9.OnStop = function(_) --[[ Line: 669 ]] --[[ Name: OnStop ]]
    -- upvalues: v45 (copy)
    v45:Destroy();
end;
v9.OnLoad = function(_) --[[ Line: 673 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), l_ReplicatedStorage_0 (copy), v36 (copy), v45 (copy), v16 (copy), v14 (copy), v11 (copy), v21 (copy), v37 (copy), v44 (copy), l_RunService_0 (copy), l_TweenService_0 (copy), v18 (copy), v38 (copy), v35 (copy), v33 (copy), l_LocalPlayer_0 (copy), v92 (copy), v87 (copy), v31 (copy)
    task.spawn(pcall, function() --[[ Line: 674 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(pcall, function() --[[ Line: 678 ]]
        -- upvalues: l_ContentProvider_0 (ref), l_ReplicatedStorage_0 (ref)
        l_ContentProvider_0:PreloadAsync(l_ReplicatedStorage_0.Models.Events["North Pole"]:GetChildren());
    end);
    task.spawn(pcall, function() --[[ Line: 682 ]]
        -- upvalues: l_ContentProvider_0 (ref), l_ReplicatedStorage_0 (ref)
        l_ContentProvider_0:PreloadAsync(l_ReplicatedStorage_0.Sounds.Events["North Pole"]:GetChildren());
    end);
    v36.OnClientEvent:Connect(function(v181) --[[ Line: 686 ]]
        -- upvalues: v45 (ref), v16 (ref), v14 (ref), l_ReplicatedStorage_0 (ref), v11 (ref)
        if typeof(v181) == "Instance" then
            local v182 = v45:Clone(script.GiftBurst);
            v182.Anchored = false;
            v182:PivotTo(v181:GetPivot());
            v182.Parent = workspace;
            local l_Weld_0 = Instance.new("Weld");
            l_Weld_0.Part0 = v182;
            l_Weld_0.Part1 = v181;
            l_Weld_0.Parent = v182;
            v16.emit(v182);
            task.delay(5, function() --[[ Line: 699 ]]
                -- upvalues: v182 (copy)
                v182:Destroy();
            end);
            task.spawn(function() --[[ Line: 703 ]]
                -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), v182 (copy)
                v14:PlaySound(l_ReplicatedStorage_0.Sounds.Events["North Pole"].PresentOpen, v182:GetPivot().Position);
            end);
            return;
        elseif typeof(v181) == "Vector3" then
            local v184 = v45:Clone(script.GiftBurst);
            v184.Anchored = true;
            v184:PivotTo(CFrame.new(v181));
            v184.Parent = workspace;
            v16.emit(v184);
            task.delay(5, function() --[[ Line: 715 ]]
                -- upvalues: v184 (copy)
                v184:Destroy();
            end);
            task.spawn(function() --[[ Line: 719 ]]
                -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), v184 (copy)
                v14:PlaySound(l_ReplicatedStorage_0.Sounds.Events["North Pole"].PresentOpen, v184:GetPivot().Position);
            end);
            return;
        else
            local v185 = v11:GetAnimals()[v181];
            if not v185 then
                return;
            else
                local l_AnimalModel_0 = v185.AnimalModel;
                local v187 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
                local l_Instance_0 = v185.Instance;
                local v189 = l_Instance_0 and l_Instance_0.PrimaryPart;
                if not v189 or not v187 then
                    return;
                else
                    local v190 = v45:Clone(script.GiftBurst);
                    v190:PivotTo(v189.CFrame * CFrame.new(0, (v190.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                    v190.Parent = l_Instance_0;
                    local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                    l_WeldConstraint_0.Part0 = v190;
                    l_WeldConstraint_0.Part1 = v185.AnimalModel.PrimaryPart;
                    l_WeldConstraint_0.Parent = v190;
                    v16.emit(v190);
                    task.delay(5, function() --[[ Line: 753 ]]
                        -- upvalues: v190 (copy)
                        v190:Destroy();
                    end);
                    task.spawn(function() --[[ Line: 757 ]]
                        -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), v190 (copy)
                        v14:PlaySound(l_ReplicatedStorage_0.Sounds.Events["North Pole"].PresentOpen, v190:GetPivot().Position);
                    end);
                    return;
                end;
            end;
        end;
    end);
    local v192 = {
        "rbxassetid://106128825959360", 
        "rbxassetid://84670396546354", 
        "rbxassetid://131357512835082", 
        "rbxassetid://94526507693712"
    };
    v21.observeTag("NorthPoleEventGiftTexture", function(v193) --[[ Line: 769 ]]
        -- upvalues: v192 (copy), v21 (ref)
        local v194 = v193:GetAttribute("GiftTexture") or "";
        local v195 = 0;
        for v196 = 1, #v194 do
            local v197 = string.byte(v194, v196);
            v195 = (v195 * 31 + v197) % 4294967296;
        end;
        local v198 = v192[v195 % #v192 + 1] or v192[1];
        return v21.observeDescendants(v193, function(v199) --[[ Line: 781 ]]
            -- upvalues: v198 (copy)
            if not v199:IsA("MeshPart") then
                return nil;
            else
                local l_TextureID_0 = v199.TextureID;
                if l_TextureID_0 == "" then
                    return nil;
                else
                    v199.TextureID = v198;
                    return function() --[[ Line: 792 ]]
                        -- upvalues: v199 (copy), l_TextureID_0 (copy)
                        v199.TextureID = l_TextureID_0;
                    end;
                end;
            end;
        end);
    end);
    local v201 = {};
    v37.OnClientEvent:Connect(function(v202, _, v204, v205, v206, v207) --[[ Line: 800 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v201 (copy), v14 (ref), v44 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v18 (ref), v16 (ref), v38 (ref)
        local v208 = l_ReplicatedStorage_0.Models.Events["North Pole"].WrappedGift:Clone();
        v208.Name = v202;
        v208:SetAttribute("GiftTexture", v202);
        v208:AddTag("NorthPoleEventGiftTexture");
        v201[v202] = v208;
        local v209 = v208.PrimaryPart or v208:FindFirstChild("Handle");
        if v209 then
            v209.Anchored = true;
            local l_Attachment_0 = Instance.new("Attachment");
            l_Attachment_0.Name = "Attachment0";
            l_Attachment_0.Position = Vector3.new(0, 1, 0, 0);
            l_Attachment_0.Parent = v209;
            local l_Attachment_1 = Instance.new("Attachment");
            l_Attachment_1.Name = "Attachment1";
            l_Attachment_1.Position = Vector3.new(0, -1, 0, 0);
            l_Attachment_1.Parent = v209;
            local l_Trail_0 = Instance.new("Trail");
            l_Trail_0.Name = "Trail";
            l_Trail_0.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 69, 69)), 
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 69, 69))
            });
            l_Trail_0.Attachment0 = l_Attachment_0;
            l_Trail_0.Attachment1 = l_Attachment_1;
            l_Trail_0.Lifetime = 0.35;
            l_Trail_0.LightInfluence = 1;
            l_Trail_0.Parent = v208;
        end;
        v208.Parent = workspace;
        local l_ProximityPrompt_1 = Instance.new("ProximityPrompt");
        l_ProximityPrompt_1.Name = "ProximityPrompt";
        l_ProximityPrompt_1.ActionText = "Open";
        l_ProximityPrompt_1.RequiresLineOfSight = false;
        l_ProximityPrompt_1.Enabled = false;
        l_ProximityPrompt_1.HoldDuration = 0.5;
        l_ProximityPrompt_1.Parent = v209;
        local l_v208_Scale_0 = v208:GetScale();
        task.spawn(function() --[[ Line: 848 ]]
            -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), v204 (copy), v208 (copy)
            v14:PlaySound(l_ReplicatedStorage_0.Sounds.Events["North Pole"].SantaHoHoHo, v204, false);
            local v215 = l_ReplicatedStorage_0.Sounds.Events["North Pole"].PresentDrop:Clone();
            v215.Parent = v208.PrimaryPart;
            v215:Play();
            v215.Ended:Once(function() --[[ Line: 855 ]]
                -- upvalues: v215 (copy)
                v215:Destroy();
            end);
        end);
        local v216 = workspace:Raycast(v205 + Vector3.new(0, 10, 0, 0), Vector3.new(-0, -30, -0, -0), v44);
        v205 = v216 and v216.Position or v205;
        local v217 = v204 + (v205 - v204) * 0.5;
        local l_v205_0 = v205;
        local _ = math.random(0, 10000);
        local v220 = false;
        local v227 = l_RunService_0.PostSimulation:Connect(function(_) --[[ Line: 871 ]]
            -- upvalues: v206 (copy), v207 (copy), l_TweenService_0 (ref), v18 (ref), v204 (copy), v217 (copy), l_v205_0 (copy), v208 (copy), l_v208_Scale_0 (copy), v220 (ref), v16 (ref), l_ProximityPrompt_1 (copy)
            local v222 = workspace:GetServerTimeNow() - v206;
            local v223 = v207 == 0 and 1 or math.clamp(v222 / v207, 0, 1);
            local l_l_TweenService_0_Value_0 = l_TweenService_0:GetValue(v223, Enum.EasingStyle.Quint, Enum.EasingDirection.Out);
            local v225 = v18.quadBezier(l_l_TweenService_0_Value_0, v204, v217, l_v205_0);
            v208:ScaleTo((math.lerp(l_v208_Scale_0 * 2, l_v208_Scale_0, l_l_TweenService_0_Value_0)));
            v208:PivotTo(CFrame.new(v225) * CFrame.Angles(0, math.lerp(12.566370614359172, 0, l_l_TweenService_0_Value_0), 0));
            if l_l_TweenService_0_Value_0 >= 0.8 and not v220 then
                v220 = true;
                local v226 = script.GiftLanding:Clone();
                v226:PivotTo(CFrame.new(l_v205_0));
                v226.Parent = workspace;
                v16.emit(v226);
                task.delay(5, function() --[[ Line: 890 ]]
                    -- upvalues: v226 (copy)
                    v226:Destroy();
                end);
            end;
            if l_l_TweenService_0_Value_0 >= 1 then
                l_ProximityPrompt_1.Enabled = true;
            end;
        end);
        v208.Destroying:Connect(function() --[[ Line: 900 ]]
            -- upvalues: v227 (copy)
            v227:Disconnect();
        end);
        l_ProximityPrompt_1.Triggered:Connect(function() --[[ Line: 904 ]]
            -- upvalues: v38 (ref), v202 (copy)
            v38:FireServer(v202);
        end);
    end);
    v35.OnClientEvent:Connect(function(v228) --[[ Line: 909 ]]
        -- upvalues: v201 (copy)
        local v229 = v201[v228];
        if not v229 then
            return;
        else
            v229:Destroy();
            v201[v228] = nil;
            return;
        end;
    end);
    v33.OnClientEvent:Connect(function(v230, v231, v232, v233) --[[ Line: 919 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), l_RunService_0 (ref), l_TweenService_0 (ref), v18 (ref), l_LocalPlayer_0 (ref), v92 (ref), v87 (ref)
        local v234 = 0;
        local l_Model_0 = Instance.new("Model");
        local v236 = l_ReplicatedStorage_0.Models.Events["North Pole"]["Candy Cane Tiers"][v232]:Clone();
        v236.Parent = l_Model_0;
        if v236:IsA("Model") then
            l_Model_0.PrimaryPart = v236.PrimaryPart;
        else
            l_Model_0.PrimaryPart = v236;
        end;
        l_Model_0.Parent = workspace;
        local l_l_Model_0_Scale_0 = l_Model_0:GetScale();
        local v238 = nil;
        v238 = l_RunService_0.PostSimulation:Connect(function(v239) --[[ Line: 941 ]]
            -- upvalues: v234 (ref), v231 (copy), v230 (copy), l_TweenService_0 (ref), l_Model_0 (copy), v18 (ref), l_l_Model_0_Scale_0 (copy), v238 (ref), l_LocalPlayer_0 (ref), v92 (ref), v87 (ref), v233 (copy)
            debug.profilebegin("North Pole:UpdateCandyAnimation");
            v234 = v234 + v239;
            local v240 = v231.Character and v231.Character:GetPivot().Position or Vector3.new(0, 0, 0, 0);
            local v241 = v230 + (v240 - v230) * 0.25 + Vector3.new(0, 20, 0, 0);
            local l_l_TweenService_0_Value_1 = l_TweenService_0:GetValue(v234 / 0.55, Enum.EasingStyle.Sine, Enum.EasingDirection.In);
            l_Model_0:PivotTo(CFrame.new(v18.quadBezier(l_l_TweenService_0_Value_1, v230, v241, v240)));
            l_Model_0:ScaleTo((math.lerp(l_l_Model_0_Scale_0, 0.05, l_l_TweenService_0_Value_1)));
            if l_l_TweenService_0_Value_1 >= 1 and v238 then
                v238:Disconnect();
                v238 = nil;
                for _, v244 in l_Model_0:GetDescendants() do
                    if v244:IsA("BasePart") then
                        v244.Transparency = 1;
                    end;
                end;
                task.delay(3, function() --[[ Line: 962 ]]
                    -- upvalues: l_Model_0 (ref)
                    l_Model_0:Destroy();
                end);
                if v231 == l_LocalPlayer_0 then
                    v92();
                end;
                v87(v231, v233);
            end;
            debug.profileend();
        end);
    end);
    v31.OnClientEvent:Connect(function(v245, v246, v247) --[[ Line: 976 ]]
        -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), v16 (ref), v87 (ref)
        local l_Position_1 = v245:GetPivot().Position;
        task.spawn(function() --[[ Line: 979 ]]
            -- upvalues: v14 (ref), l_ReplicatedStorage_0 (ref), l_Position_1 (copy)
            v14:PlaySound(l_ReplicatedStorage_0.Sounds.Events["North Pole"].CandyCane, l_Position_1);
        end);
        local v249 = script.Burst:Clone();
        v249:PivotTo(CFrame.new(l_Position_1));
        v249.Anchored = false;
        local l_WeldConstraint_1 = Instance.new("WeldConstraint");
        l_WeldConstraint_1.Part0 = v249;
        l_WeldConstraint_1.Part1 = v245;
        l_WeldConstraint_1.Parent = v249;
        v249.Parent = workspace;
        v16.emit(v249);
        task.delay(5, function() --[[ Line: 996 ]]
            -- upvalues: v249 (copy)
            v249:Destroy();
        end);
        if v246 and v247 then
            v87(v246, v247);
        end;
    end);
end;
return v9;