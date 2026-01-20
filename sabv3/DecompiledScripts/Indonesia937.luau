local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local v9 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v10 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v15 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v17 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v18 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v23 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v25 = require(l_ReplicatedStorage_0.Packages.Net);
local v26 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_IndonesiaEvent_0 = workspace.Sounds.IndonesiaEvent;
local _ = l_Players_0.LocalPlayer;
local _ = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local v31 = v25:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local _ = workspace.RenderedMovingAnimals;
local v33 = v23.new();
local function _(v34, v35, v36) --[[ Line: 47 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v33 (copy)
    local v37 = v34:LoadAnimation(v35);
    (v36 or v33):Add(function() --[[ Line: 49 ]]
        -- upvalues: v37 (copy)
        v37:Stop(0);
        v37:Destroy();
    end);
    return v37;
end;
v8.OnStart = function(_) --[[ Line: 57 ]] --[[ Name: OnStart ]]
    -- upvalues: v14 (copy), l_Name_0 (copy), v33 (copy), v11 (copy), v15 (copy), v13 (copy), v19 (copy), v26 (copy), l_ReplicatedStorage_0 (copy), v18 (copy), l_IndonesiaEvent_0 (copy), v17 (copy), v9 (copy)
    local l_v14_ActiveEventData_0 = v14:GetActiveEventData(l_Name_0);
    assert(l_v14_ActiveEventData_0);
    local function _(v41) --[[ Line: 61 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        return (math.max(l_v14_ActiveEventData_0.startedAt + v41 - workspace:GetServerTimeNow(), 0));
    end;
    v33:Add(function() --[[ Line: 65 ]]
        -- upvalues: v11 (ref), v15 (ref), v13 (ref)
        v11:Activate("Blink");
        v15:Update();
        v13:UpdateOST();
    end);
    local v43 = v33:Clone(script.Map);
    v43.Parent = workspace;
    v33:Add(v19.observeTag("HideInIndonesia", function(v44) --[[ Line: 73 ]]
        local l_Parent_0 = v44.Parent;
        v44.Parent = script;
        return function() --[[ Line: 76 ]]
            -- upvalues: v44 (copy), l_Parent_0 (copy)
            pcall(function() --[[ Line: 77 ]]
                -- upvalues: v44 (ref), l_Parent_0 (ref)
                v44.Parent = l_Parent_0;
            end);
        end;
    end, {
        workspace, 
        script
    }));
    v11:Activate("Blink");
    v15:Update();
    v13:UpdateOST();
    v11:Run("IndonesiaEvent", "GrassRecolor");
    v11:Run("IndonesiaEvent", "WallRecolor");
    v11:Run("IndonesiaEvent", "WallBottomRecolor");
    v33:Add(function() --[[ Line: 90 ]]
        -- upvalues: v11 (ref)
        v11:Stop("IndonesiaEvent", "GrassRecolor");
        v11:Stop("IndonesiaEvent", "WallRecolor");
        v11:Stop("IndonesiaEvent", "WallBottomRecolor");
    end);
    v26.enable(v43.MapVFX.Waterfall);
    local v46 = l_v14_ActiveEventData_0.startedAt + 13 - workspace:GetServerTimeNow();
    task.spawn(function() --[[ Line: 104 ]]
        -- upvalues: v46 (copy), v13 (ref), l_ReplicatedStorage_0 (ref), v43 (copy)
        if v46 > 10 then
            v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Indonesia.Activating, v43.MapVFX.Waterfall.indonesiawaterfall.Position, false);
        end;
    end);
    local l_Pivot_0 = v43.Flood:GetPivot();
    v43.Flood:PivotTo(l_Pivot_0 - Vector3.new(0, 3, 0, 0));
    v33:Add(v18(v43.Flood, TweenInfo.new(v46, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), l_Pivot_0)):Play();
    v33:Add(task.delay(l_v14_ActiveEventData_0.startedAt + 87.78999999999999 - workspace:GetServerTimeNow(), function() --[[ Line: 114 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v15 (ref), v13 (ref), v33 (ref)
        l_ReplicatedStorage_0:SetAttribute("IndonesiaEventPart2", true);
        v15:Update();
        v13:UpdateOST();
        v33:Add(function() --[[ Line: 118 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v15 (ref), v13 (ref)
            l_ReplicatedStorage_0:SetAttribute("IndonesiaEventPart2", nil);
            v15:Update();
            v13:UpdateOST();
        end);
    end));
    v33:Add(task.delay(v46, function() --[[ Line: 125 ]]
        -- upvalues: v26 (ref), v43 (copy), l_ReplicatedStorage_0 (ref), v33 (ref)
        v26.disable(v43.MapVFX.Waterfall);
        l_ReplicatedStorage_0:SetAttribute("IndonesiaEventAmbience", true);
        v33:Add(function() --[[ Line: 129 ]]
            -- upvalues: l_ReplicatedStorage_0 (ref)
            l_ReplicatedStorage_0:SetAttribute("IndonesiaEventAmbience", nil);
        end);
    end));
    v33:Add(task.spawn(function() --[[ Line: 134 ]]
        -- upvalues: l_IndonesiaEvent_0 (ref), v17 (ref), v9 (ref), l_v14_ActiveEventData_0 (copy), v33 (ref)
        l_IndonesiaEvent_0.Volume = 0;
        v17(l_IndonesiaEvent_0, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            Volume = 0.35
        });
        v9:WaitForAssetId("rbxassetid://123847828745026");
        l_IndonesiaEvent_0.SoundId = "";
        l_IndonesiaEvent_0.SoundId = "rbxassetid://123847828745026";
        while not l_IndonesiaEvent_0.IsLoaded do
            task.wait();
        end;
        l_IndonesiaEvent_0.TimePosition = 62 + (workspace:GetServerTimeNow() - l_v14_ActiveEventData_0.startedAt);
        l_IndonesiaEvent_0:Play();
        v33:Add(function() --[[ Line: 148 ]]
            -- upvalues: l_IndonesiaEvent_0 (ref)
            l_IndonesiaEvent_0:Stop();
        end);
    end));
end;
v8.OnStop = function(_) --[[ Line: 154 ]] --[[ Name: OnStop ]]
    -- upvalues: v33 (copy)
    v33:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 158 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v9 (copy), l_IndonesiaEvent_0 (copy), v19 (copy), v23 (copy), v33 (copy), l_RunService_0 (copy), v31 (copy), v10 (copy), v26 (copy), l_Debris_0 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
    task.spawn(pcall, function() --[[ Line: 159 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(function() --[[ Line: 163 ]]
        -- upvalues: v9 (ref), l_IndonesiaEvent_0 (ref), l_ContentProvider_0 (ref)
        v9:WaitForAssetId("rbxassetid://123847828745026");
        l_IndonesiaEvent_0.SoundId = "rbxassetid://123847828745026";
        l_ContentProvider_0:PreloadAsync({
            l_IndonesiaEvent_0
        });
    end);
    v19.observeTag("IndonesiaCanoe", function(v50) --[[ Line: 169 ]]
        -- upvalues: v23 (ref), v33 (ref), l_RunService_0 (ref), l_IndonesiaEvent_0 (ref)
        local v51 = v23.new();
        local v52 = v51:Clone(script.Canoe);
        local l_PrimaryPart_0 = v52.PrimaryPart;
        v52.Parent = v50;
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = l_PrimaryPart_0;
        l_Weld_0.Part1 = v50;
        l_Weld_0.C0 = CFrame.Angles(0, 3.141592653589793, 0);
        l_Weld_0.Parent = l_PrimaryPart_0;
        local v55 = v52["Bambu Bambu Sahur"].AnimationController.Animator:LoadAnimation(script.BambuDance);
        (v51 or v33):Add(function() --[[ Line: 49 ]]
            -- upvalues: v55 (copy)
            v55:Stop(0);
            v55:Destroy();
        end);
        local l_v55_0 = v55;
        l_v55_0.Looped = true;
        l_v55_0:Play();
        v51:Add(l_RunService_0.PreRender:Connect(function() --[[ Line: 186 ]]
            -- upvalues: l_IndonesiaEvent_0 (ref), l_v55_0 (copy)
            local v57 = math.clamp(l_IndonesiaEvent_0.PlaybackLoudness / 1000, 0, 1);
            l_v55_0:AdjustSpeed((math.lerp(1.3, 2, v57)));
        end));
        return v51:WrapClean();
    end, {
        workspace
    });
    v31.OnClientEvent:Connect(function(v58) --[[ Line: 195 ]]
        -- upvalues: v10 (ref), v33 (ref), v26 (ref), l_Debris_0 (ref), v13 (ref), l_ReplicatedStorage_0 (ref)
        local v59 = v10:GetAnimals()[v58];
        if not v59 then
            return;
        else
            local l_AnimalModel_0 = v59.AnimalModel;
            local v61 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v59.Instance;
            local v63 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v63 or not v61 then
                return;
            else
                local v64 = v33:Clone(script.Burst);
                v64:PivotTo(v63.CFrame * CFrame.new(0, (v64.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v64.Parent = l_Instance_0;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v64;
                l_WeldConstraint_0.Part1 = v59.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v64;
                v26.emit(v64);
                l_Debris_0:AddItem(v64, 5);
                v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Indonesia.BrainrotHit, v63.CFrame.Position, false);
                return;
            end;
        end;
    end);
end;
return v8;