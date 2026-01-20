local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("TweenService");
local _ = game:GetService("RunService");
local _ = game:GetService("Lighting");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v6 = {};
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v8 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController);
local v10 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v11 = require(l_ReplicatedStorage_0.Packages.Observers);
local v12 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Net);
local v14 = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = script.Name;
local l_Rainbow_0 = workspace.Events.Rainbow;
local v17 = v12.new();
v6.OnStart = function(_) --[[ Line: 26 ]] --[[ Name: OnStart ]]
    -- upvalues: v10 (copy), v8 (copy), v14 (copy), l_Rainbow_0 (copy), v17 (copy), v11 (copy)
    v10:Update();
    v8:UpdateOST();
    v14.emit(l_Rainbow_0.Emit);
    v17:Add(task.spawn(function() --[[ Line: 32 ]]
        -- upvalues: v8 (ref), l_Rainbow_0 (ref)
        v8:PlaySound("Sounds.Sfx.RainbowActivatedEffect", l_Rainbow_0.SoundParts.RainbowActivatedEffect.Position);
    end));
    v17:Add(task.spawn(function() --[[ Line: 36 ]]
        -- upvalues: v8 (ref), l_Rainbow_0 (ref)
        v8:PlaySound("Sounds.Sfx.RainbowMachineEnabled", l_Rainbow_0.SoundParts.RainbowMachineEnabled.Position);
    end));
    v17:Add(v11.observeTag("RainbowEventAttachment", function(v19) --[[ Line: 40 ]]
        local v20 = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), 
            NumberSequenceKeypoint.new(1, 1)
        });
        local l_v19_Children_0 = v19:GetChildren();
        for _, v23 in l_v19_Children_0 do
            v23.Transparency = v20;
            v23.Enabled = true;
        end;
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        while v19:IsDescendantOf(workspace) do
            local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
            local v26 = (l_workspace_ServerTimeNow_1 - l_workspace_ServerTimeNow_0) % 3.5 / 3.5;
            v20 = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1), 
                NumberSequenceKeypoint.new(1 - v26, 1), 
                NumberSequenceKeypoint.new(1, 0)
            });
            if l_workspace_ServerTimeNow_1 - l_workspace_ServerTimeNow_0 >= 3.5 then
                for _, v28 in l_v19_Children_0 do
                    v28.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0), 
                        NumberSequenceKeypoint.new(1, 0)
                    });
                end;
                break;
            else
                for _, v30 in l_v19_Children_0 do
                    v30.Transparency = v20;
                end;
                task.wait();
            end;
        end;
        return nil;
    end, {
        workspace
    }));
    v17:Add(v11.observeChildren(l_Rainbow_0.Enabled, function(v31) --[[ Line: 84 ]]
        -- upvalues: v14 (ref)
        v14.enable(v31);
        return function() --[[ Line: 87 ]]
            -- upvalues: v14 (ref), v31 (copy)
            v14.disable(v31);
        end;
    end));
end;
v6.OnStop = function(_) --[[ Line: 93 ]] --[[ Name: OnStop ]]
    -- upvalues: v17 (copy)
    v17:Destroy();
end;
v6.OnLoad = function(_) --[[ Line: 97 ]] --[[ Name: OnLoad ]]

end;
return v6;