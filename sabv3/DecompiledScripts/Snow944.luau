local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v10 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v12 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Shared.ShakePresets);
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local v15 = require(l_ReplicatedStorage_0.Packages.Trove);
local v16 = require(l_ReplicatedStorage_0.Packages.Net);
local v17 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v19 = v16:RemoteEvent("EventService/Snow/Hit");
local v20 = v15.new();
v7.OnStart = function(_) --[[ Line: 29 ]] --[[ Name: OnStart ]]
    -- upvalues: v11 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v20 (copy), v17 (copy), l_Lighting_0 (copy), v9 (copy), v12 (copy), v10 (copy)
    local l_v11_ActiveEventData_0 = v11:GetActiveEventData(l_Name_0);
    assert(l_v11_ActiveEventData_0);
    l_ReplicatedStorage_0:SetAttribute("Snow", true);
    v20:Add(function() --[[ Line: 38 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("Snow", nil);
    end);
    local function _(v23, v24) --[[ Line: 42 ]] --[[ Name: getTimeLeftForSync ]]
        -- upvalues: l_v11_ActiveEventData_0 (copy)
        return l_v11_ActiveEventData_0.startedAt + v23 - (v24 or workspace:GetServerTimeNow());
    end;
    local v26 = l_v11_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow();
    local v27 = v20:Clone(script.SnowWeather);
    v17.disable(v27);
    v27.Parent = workspace;
    v20:Add(task.delay(v26, function() --[[ Line: 52 ]]
        -- upvalues: l_Lighting_0 (ref), v20 (ref), v17 (ref), v27 (copy)
        local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
        if l_Atmosphere_0 then
            l_Atmosphere_0.Parent = script;
            v20:Add(function() --[[ Line: 56 ]]
                -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
                l_Atmosphere_0.Parent = l_Lighting_0;
            end);
        end;
        v20:Clone(script.AtmosphereSnow).Parent = l_Lighting_0;
        local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
        if l_Cartoon_0 then
            l_Cartoon_0.Parent = script;
            v20:Add(function() --[[ Line: 66 ]]
                -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
                l_Cartoon_0.Parent = l_Lighting_0;
            end);
        end;
        v20:Clone(script.SkySnow).Parent = l_Lighting_0;
        v17.enable(v27);
    end));
    v9:Run("Snow", "GrassRecolor");
    v20:Add(function() --[[ Line: 77 ]]
        -- upvalues: v9 (ref)
        v9:Stop("Snow", "GrassRecolor");
    end);
    v12:Update();
    v10:UpdateOST();
    v10:UpdateAmbience();
end;
v7.OnStop = function(_) --[[ Line: 86 ]] --[[ Name: OnStop ]]
    -- upvalues: v20 (copy)
    v20:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 90 ]] --[[ Name: OnLoad ]]
    -- upvalues: v19 (copy), v8 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v17 (copy), l_TweenService_0 (copy), v20 (copy), l_CollectionService_0 (copy)
    v19.OnClientEvent:Connect(function(v32) --[[ Line: 91 ]]
        -- upvalues: v8 (ref), v10 (ref), l_ReplicatedStorage_0 (ref), v17 (ref)
        local v33 = nil;
        local v34 = nil;
        if type(v32) == "string" then
            local v35 = v8:GetAnimals()[v32];
            if not v35 then
                return;
            else
                local l_v35_0 = v35 --[[ copy: 3 -> 7 ]];
                local _ = function() --[[ Line: 100 ]] --[[ Name: getTargetPosition ]]
                    -- upvalues: l_v35_0 (copy)
                    local _ = nil;
                    local l_AnimalModel_0 = l_v35_0.AnimalModel;
                    return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position + Vector3.new(0, l_v35_0.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                end;
                local _ = nil;
                local l_AnimalModel_1 = v35.AnimalModel;
                v33 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position + Vector3.new(0, v35.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                v34 = v35.AnimalModel.PrimaryPart;
            end;
        else
            v33 = v32:GetPivot().Position;
            v34 = v32;
        end;
        v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Snow.Burst, v33);
        local v42 = script.StruckVFX:Clone();
        v42:PivotTo(CFrame.new(v33));
        v42.Anchored = false;
        local l_WeldConstraint_0 = Instance.new("WeldConstraint");
        l_WeldConstraint_0.Part0 = v42;
        l_WeldConstraint_0.Part1 = v34;
        l_WeldConstraint_0.Parent = v42;
        v42.Parent = workspace;
        v17.emit(v42);
        task.delay(3, function() --[[ Line: 135 ]]
            -- upvalues: v42 (copy)
            v42:Destroy();
        end);
    end);
    local function v51(v44) --[[ Line: 140 ]] --[[ Name: tweenPile ]]
        -- upvalues: l_TweenService_0 (ref)
        task.wait(math.random() * 0.8);
        local v45 = v44:GetPivot() * CFrame.new(0, 10, 0);
        local l_CFrameValue_0 = Instance.new("CFrameValue");
        l_CFrameValue_0.Value = v44:GetPivot();
        local v48 = l_CFrameValue_0.Changed:Connect(function(v47) --[[ Line: 148 ]]
            -- upvalues: v44 (copy)
            v44:PivotTo(v47);
        end);
        local v49 = TweenInfo.new(1.2);
        local v50 = l_TweenService_0:Create(l_CFrameValue_0, v49, {
            Value = v45
        });
        v50:Play();
        v50.Completed:Connect(function() --[[ Line: 157 ]]
            -- upvalues: v48 (copy), l_CFrameValue_0 (copy), v44 (copy), v45 (copy)
            v48:Disconnect();
            l_CFrameValue_0:Destroy();
            v44:PivotTo(v45);
        end);
    end;
    local _ = function(v52) --[[ Line: 164 ]] --[[ Name: onPilesAdded ]]
        -- upvalues: v51 (copy)
        for _, v54 in v52:GetChildren() do
            if v54:IsA("BasePart") then
                task.spawn(v51, v54);
            end;
        end;
    end;
    v20:Add(l_CollectionService_0:GetInstanceAddedSignal("SnowPile"):Connect(function(v56) --[[ Line: 172 ]]
        -- upvalues: v51 (copy)
        if v56:IsA("Model") then
            task.spawn(v51, v56);
        end;
    end));
    for _, v58 in l_CollectionService_0:GetTagged("SnowPile") do
        if v58:IsA("Model") then
            task.spawn(v51, v58);
        end;
    end;
end;
return v7;