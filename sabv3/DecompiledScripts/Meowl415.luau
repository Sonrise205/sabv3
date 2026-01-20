local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Debris_0 = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local v7 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local v8 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v12 = require(l_ReplicatedStorage_0.Packages.Observers);
local v13 = require(l_ReplicatedStorage_0.Packages.Trove);
local v14 = require(l_ReplicatedStorage_0.Packages.Net);
local v15 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Name_0 = script.Name;
local v17 = v14:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local v18 = v13.new();
local function _(v19, v20, v21) --[[ Line: 27 ]] --[[ Name: loadAnimation ]]
    -- upvalues: v18 (copy)
    local v22 = v19:LoadAnimation(v20);
    (v21 or v18):Add(function() --[[ Line: 29 ]]
        -- upvalues: v22 (copy)
        v22:Stop(0);
        v22:Destroy();
    end);
    return v22;
end;
v6.OnStart = function(_) --[[ Line: 37 ]] --[[ Name: OnStart ]]
    -- upvalues: v9 (copy), l_Name_0 (copy), l_ReplicatedStorage_0 (copy), v18 (copy), l_Lighting_0 (copy), v12 (copy), v13 (copy), v7 (copy)
    assert((v9:GetActiveEventData(l_Name_0)));
    l_ReplicatedStorage_0:SetAttribute("MeowlEvent", true);
    v18:Add(function() --[[ Line: 42 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref)
        l_ReplicatedStorage_0:SetAttribute("MeowlEvent", nil);
    end);
    v18:Clone(script.Map).Parent = workspace;
    local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
    if l_Atmosphere_0 then
        l_Atmosphere_0.Parent = script;
        v18:Add(function() --[[ Line: 51 ]]
            -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
            l_Atmosphere_0.Parent = l_Lighting_0;
        end);
    end;
    v18:Clone(script.AtmosphereMeowl).Parent = l_Lighting_0;
    v18:Add(task.spawn(function() --[[ Line: 57 ]]
        -- upvalues: v18 (ref)
        local v26 = false;
        local v27 = Random.new(912341342);
        local v28 = {};
        local _ = @native function(v29) --[[ Line: 65 ]] --[[ Name: isPositionValid ]]
            -- upvalues: v28 (copy)
            for _, v31 in v28 do
                if (v29 - v31).Magnitude < 20 then
                    return false;
                end;
            end;
            return true;
        end;
        local v33 = {
            script.Trees["1"], 
            script.Trees["2"], 
            script.Trees["3"]
        };
        local l_Children_0 = workspace.Events.Matteo:GetChildren();
        table.sort(l_Children_0, function(v35, v36) --[[ Line: 77 ]]
            local l_Position_0 = v35.Position;
            local v38 = l_Position_0.X + l_Position_0.Y + l_Position_0.Z;
            local l_Position_1 = v36.Position;
            return l_Position_1.X + l_Position_1.Y + l_Position_1.Z < v38;
        end);
        for _, v41 in l_Children_0 do
            local l_Position_2 = v41.Position;
            local l_Size_0 = v41.Size;
            for _ = 1, math.floor(l_Size_0.X * l_Size_0.Z * 7.0E-4) do
                local v45 = 0;
                while v45 < 10 do
                    v45 = v45 + 1;
                    local v46 = Vector3.new(l_Position_2.X + v27:NextNumber(-l_Size_0.X * 0.5, l_Size_0.X * 0.5), l_Position_2.Y + l_Size_0.Y * 0.5, l_Position_2.Z + v27:NextNumber(-l_Size_0.Z * 0.5, l_Size_0.Z * 0.5));
                    local v47;
                    for _, v49 in v28 do
                        if (v46 - v49).Magnitude < 20 then
                            v47 = false;
                            v26 = true;
                        end;
                        if v26 then
                            break;
                        end;
                    end;
                    if not v26 then
                        v47 = true;
                    end;
                    v26 = false;
                    if v47 then
                        v47 = v18:Clone(v33[v27:NextInteger(1, #v33)]);
                        v47:PivotTo(CFrame.new(v46 + Vector3.new(0, v47:GetExtentsSize().Y * 0.5, 0)) * CFrame.Angles(0, v27:NextNumber(0, 6.283185307179586), 0));
                        v47.Parent = workspace;
                        table.insert(v28, v46);
                        break;
                    end;
                end;
            end;
        end;
    end));
    v18:Add(v12.observeTag("MeowlEventMeowl", function(v50) --[[ Line: 120 ]]
        -- upvalues: v13 (ref), v18 (ref), v12 (ref)
        local v51 = v13.new();
        local v52 = v51:Clone(script.Meowl);
        v52.Parent = workspace;
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v52.PrimaryPart;
        l_Weld_0.Part1 = v50;
        l_Weld_0.C0 = v52.PrimaryPart.PivotOffset;
        l_Weld_0.Parent = v52.PrimaryPart;
        local v54 = v52.AnimationController.Animator:LoadAnimation(script.Idle);
        v18:Add(function() --[[ Line: 29 ]]
            -- upvalues: v54 (copy)
            v54:Stop(0);
            v54:Destroy();
        end);
        local l_v54_0 = v54;
        l_v54_0.Priority = Enum.AnimationPriority.Idle;
        l_v54_0.Looped = true;
        l_v54_0:Play();
        local v56 = v52.AnimationController.Animator:LoadAnimation(script.Fly);
        v18:Add(function() --[[ Line: 29 ]]
            -- upvalues: v56 (copy)
            v56:Stop(0);
            v56:Destroy();
        end);
        local l_v56_0 = v56;
        l_v56_0.Priority = Enum.AnimationPriority.Action;
        l_v56_0.Looped = true;
        local v58 = v52.AnimationController.Animator:LoadAnimation(script.Attack);
        v18:Add(function() --[[ Line: 29 ]]
            -- upvalues: v58 (copy)
            v58:Stop(0);
            v58:Destroy();
        end);
        local l_v58_0 = v58;
        l_v58_0.Priority = Enum.AnimationPriority.Action2;
        l_v58_0.Looped = false;
        v51:Add(v12.observeAttribute(v50, "Flying", function(v60) --[[ Line: 145 ]]
            -- upvalues: l_v56_0 (copy)
            if v60 then
                l_v56_0:Play();
            else
                l_v56_0:Stop();
            end;
            return nil;
        end));
        v51:Add(v50:GetAttributeChangedSignal("Attack"):Connect(function() --[[ Line: 155 ]]
            -- upvalues: l_v58_0 (copy)
            l_v58_0:Play();
        end));
        return v51:WrapClean();
    end, {
        workspace
    }));
    v7:Activate("Blink");
    v7:Run("MeowlEvent", "GrassRecolor");
    v7:Run("MeowlEvent", "WallRecolor");
    v7:Run("MeowlEvent", "WallBottomRecolor");
    v18:Add(function() --[[ Line: 166 ]]
        -- upvalues: v7 (ref)
        v7:Stop("MeowlEvent", "GrassRecolor");
        v7:Stop("MeowlEvent", "WallRecolor");
        v7:Stop("MeowlEvent", "WallBottomRecolor");
        v7:Activate("Blink");
    end);
end;
v6.OnStop = function(_) --[[ Line: 174 ]] --[[ Name: OnStop ]]
    -- upvalues: v18 (copy)
    v18:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 178 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v17 (copy), v8 (copy), v18 (copy), v15 (copy), l_Debris_0 (copy), v10 (copy), l_ReplicatedStorage_0 (copy)
    task.spawn(pcall, function() --[[ Line: 179 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    v17.OnClientEvent:Connect(function(v63) --[[ Line: 183 ]]
        -- upvalues: v8 (ref), v18 (ref), v15 (ref), l_Debris_0 (ref), v10 (ref), l_ReplicatedStorage_0 (ref)
        local v64 = v8:GetAnimals()[v63];
        if not v64 then
            return;
        else
            local l_AnimalModel_0 = v64.AnimalModel;
            local v66 = l_AnimalModel_0 and l_AnimalModel_0.PrimaryPart;
            local l_Instance_0 = v64.Instance;
            local v68 = l_Instance_0 and l_Instance_0.PrimaryPart;
            if not v68 or not v66 then
                return;
            else
                local v69 = v18:Clone(script.Burst);
                v69:PivotTo(v68.CFrame * CFrame.new(0, (v69.Size.Y + l_AnimalModel_0:GetExtentsSize().Y) / 2, 0));
                v69.Parent = l_Instance_0;
                local l_WeldConstraint_0 = Instance.new("WeldConstraint");
                l_WeldConstraint_0.Part0 = v69;
                l_WeldConstraint_0.Part1 = v64.AnimalModel.PrimaryPart;
                l_WeldConstraint_0.Parent = v69;
                v15.emit(v69);
                l_Debris_0:AddItem(v69, 5);
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Meowl.BrainrotHit, v68.CFrame.Position, false);
                v10:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Meowl.Flap, v68.CFrame.Position, false);
                return;
            end;
        end;
    end);
end;
return v6;