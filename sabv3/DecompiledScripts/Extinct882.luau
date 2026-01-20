local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v2 = {};
local v3 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v4 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v5 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v6 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v7 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local _ = require(l_ReplicatedStorage_0.Packages.FFlags);
local v9 = require(l_ReplicatedStorage_0.Packages.Trove);
local v10 = require(l_ReplicatedStorage_0.Packages.Net);
local v11 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v13 = v10:RemoteEvent("EventService/Extinct/Burst");
local v14 = v9.new();
v2.OnStart = function(_) --[[ Line: 23 ]] --[[ Name: OnStart ]]
    -- upvalues: v6 (copy), l_Name_0 (copy), v3 (copy), v14 (copy), v7 (copy), v5 (copy)
    assert((v6:GetActiveEventData(l_Name_0)));
    v3:Run("ExtinctEvent", "GrassRecolor");
    v14:Add(function() --[[ Line: 28 ]]
        -- upvalues: v3 (ref)
        v3:Stop("ExtinctEvent", "GrassRecolor");
    end);
    v3:Run("ExtinctEvent", "WallRecolor");
    v14:Add(function() --[[ Line: 33 ]]
        -- upvalues: v3 (ref)
        v3:Stop("ExtinctEvent", "WallRecolor");
    end);
    v14:Clone(script.Map).Parent = workspace;
    v14:Add(function() --[[ Line: 38 ]]
        -- upvalues: v3 (ref)
        v3:Activate("Blink");
    end);
    v7:Update();
    v5:UpdateOST();
    v3:Activate("Blink");
end;
v2.OnStop = function(_) --[[ Line: 47 ]] --[[ Name: OnStop ]]
    -- upvalues: v14 (copy)
    v14:Destroy();
end;
v2.OnLoad = function(_) --[[ Line: 51 ]] --[[ Name: OnLoad ]]
    -- upvalues: v13 (copy), v4 (copy), v5 (copy), l_ReplicatedStorage_0 (copy), v11 (copy)
    v13.OnClientEvent:Connect(function(v18) --[[ Line: 52 ]]
        -- upvalues: v4 (ref), v5 (ref), l_ReplicatedStorage_0 (ref), v11 (ref)
        local v19 = v4:GetAnimals()[v18];
        if not v19 then
            return;
        else
            local _ = function() --[[ Line: 58 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v19 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v19.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
            end;
            local v23 = nil;
            local l_AnimalModel_1 = v19.AnimalModel;
            local l_Position_0 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
            task.spawn(function() --[[ Line: 73 ]]
                -- upvalues: v5 (ref), l_ReplicatedStorage_0 (ref), l_Position_0 (copy)
                v5:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Extinct.Hit, l_Position_0);
            end);
            v23 = script.Burst:Clone();
            v23:PivotTo(CFrame.new(l_Position_0));
            v23.Anchored = false;
            l_AnimalModel_1 = Instance.new("WeldConstraint");
            l_AnimalModel_1.Part0 = v23;
            l_AnimalModel_1.Part1 = v19.AnimalModel.PrimaryPart;
            l_AnimalModel_1.Parent = v23;
            v23.Parent = workspace;
            v11.emit(v23);
            task.delay(5, function() --[[ Line: 90 ]]
                -- upvalues: v23 (copy)
                v23:Destroy();
            end);
            return;
        end;
    end);
end;
return v2;