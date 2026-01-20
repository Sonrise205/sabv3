local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = game:GetService("RunService");
local _ = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v7 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v9 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v10 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v12 = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local v13 = require(l_ReplicatedStorage_0.Packages.Observers);
local v14 = require(l_ReplicatedStorage_0.Packages.Trove);
local v15 = require(l_ReplicatedStorage_0.Packages.Timer);
local v16 = require(l_ReplicatedStorage_0.Packages.Net);
local v17 = require(l_ReplicatedStorage_0.Shared.VFX);
local v18 = v16:RemoteEvent("EventService/Bubblegum/RollAnimation");
local v19 = v16:RemoteEvent("EventService/Bubblegum/EmitBurst");
local l_Name_0 = script.Name;
local v21 = v14.new();
v7.OnStart = function(_) --[[ Line: 35 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), l_Name_0 (copy), v21 (copy), v13 (copy), v14 (copy), l_CollectionService_0 (copy), v17 (copy), v9 (copy), v15 (copy), v12 (copy)
    local l_v10_ActiveEventData_0 = v10:GetActiveEventData(l_Name_0);
    assert(l_v10_ActiveEventData_0);
    v21:Add(v13.observeTag("BubblegumMachine", function(v24) --[[ Line: 39 ]]
        -- upvalues: v13 (ref), v14 (ref), l_CollectionService_0 (ref), v17 (ref), v9 (ref), v15 (ref), l_v10_ActiveEventData_0 (copy), v12 (ref)
        return v13.observeAttribute(v24, "Hidden", function(v25) --[[ Line: 40 ]]
            -- upvalues: v24 (copy), v14 (ref), l_CollectionService_0 (ref), v17 (ref), v9 (ref), v15 (ref), l_v10_ActiveEventData_0 (ref), v12 (ref)
            if v25 then
                return nil;
            else
                local l_DisplayText_0 = v24.Tank.BillboardGui.DisplayText;
                local v27 = v14.new();
                local v28 = {};
                for _, v30 in l_CollectionService_0:GetTagged("BubbleGumProgress") do
                    if v30:IsA("BasePart") and not v28[v30] then
                        v28[v30] = {
                            Position = v30.Position
                        };
                    end;
                end;
                v17.emit(v24.Vfx.Goal);
                v27:Add(task.spawn(function() --[[ Line: 57 ]]
                    -- upvalues: v9 (ref), v24 (ref)
                    v9:PlaySound("Sounds.Sfx.Bubblegum Machine.Apply", v24.Goal.Position);
                end));
                v27:Add(task.spawn(function() --[[ Line: 61 ]]
                    -- upvalues: v9 (ref), v24 (ref)
                    v9:PlaySound("Sounds.Sfx.Bubblegum Machine.Deactivation", v24.Goal.Position);
                end));
                v27:Add(v15.Simple(1, function() --[[ Line: 65 ]]
                    -- upvalues: l_v10_ActiveEventData_0 (ref), l_DisplayText_0 (copy), v12 (ref), v28 (copy)
                    local v31 = math.max(l_v10_ActiveEventData_0.endsAt - workspace:GetServerTimeNow(), 0);
                    l_DisplayText_0.Text = v12:E(v31);
                    if not v28 then
                        return;
                    else
                        local v32 = math.lerp(0, 7.3, (math.clamp(v31 / 600, 0, 1)));
                        for v33, v34 in v28 do
                            local v35 = (v32 - 7.3) / 2;
                            v33.Size = Vector3.new(v33.Size.X, v33.Size.Y, v32);
                            v33.Position = v34.Position + Vector3.new(0, 0, 1, 0) * v35;
                        end;
                        return;
                    end;
                end, true));
                return v27:WrapClean();
            end;
        end);
    end));
end;
v7.OnStop = function(_) --[[ Line: 88 ]] --[[ Name: OnStop ]]
    -- upvalues: v21 (copy)
    v21:Destroy();
end;
v7.OnLoad = function(_) --[[ Line: 92 ]] --[[ Name: OnLoad ]]
    -- upvalues: v19 (copy), v17 (copy), v18 (copy), l_TweenService_0 (copy)
    v19.OnClientEvent:Connect(function(v38) --[[ Line: 93 ]]
        -- upvalues: v17 (ref)
        if not v38:GetAttribute("Hidden") then
            v17.emit(v38.Vfx.bubblegumburst);
        end;
    end);
    v18.OnClientEvent:Connect(function(v39) --[[ Line: 99 ]]
        -- upvalues: l_TweenService_0 (ref)
        local l_NumberValue_0 = Instance.new("NumberValue");
        for _, v42 in {
            v39.Circle1, 
            v39.Circle2
        } do
            l_NumberValue_0.Changed:Connect(function(v43) --[[ Line: 103 ]]
                -- upvalues: v42 (copy)
                v42.CFrame = CFrame.new(v42.CFrame.Position) * CFrame.Angles(0, -1.5707963267948966, v43);
            end);
        end;
        local v44 = l_TweenService_0:Create(l_NumberValue_0, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Value = 6.283185307179586
        });
        v44.Completed:Once(function() --[[ Line: 112 ]]
            -- upvalues: l_NumberValue_0 (copy)
            l_NumberValue_0:Destroy();
        end);
        v44:Play();
    end);
end;
return v7;