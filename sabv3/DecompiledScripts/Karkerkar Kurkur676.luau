local _ = game:GetService("ServerScriptService");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local l_SoundService_0 = game:GetService("SoundService");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v9 = {};
local v10 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v15 = require(l_ReplicatedStorage_0.Controllers.EventController);
local _ = require(l_ReplicatedStorage_0.Controllers.EventController.ClientEventUtils);
local _ = require(l_ReplicatedStorage_0.Shared.MapInformation);
local v18 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local v21 = require(l_ReplicatedStorage_0.Packages.Timer);
local v22 = require(l_ReplicatedStorage_0.Packages.Trove);
local v23 = require(l_ReplicatedStorage_0.Packages.Net);
local v24 = require(l_ReplicatedStorage_0.Shared.VFX);
local _ = require(l_ReplicatedStorage_0.Shared.Snapshot);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_Name_0 = script.Name;
local l_KarkerMusic_0 = l_SoundService_0.Cutscene.WorkspaceSounds.KarkerMusic;
local v29 = v23:RemoteEvent((("EventService/%*/Spawn"):format(l_Name_0)));
local v30 = v22.new();
local function v47() --[[ Line: 43 ]] --[[ Name: initActivationVisual ]]
    -- upvalues: v30 (copy), l_RunService_0 (copy), v19 (copy)
    local v31 = v30:Extend();
    local v32 = table.create(4);
    v31:Add(function() --[[ Line: 54 ]]
        -- upvalues: v32 (copy)
        table.clear(v32);
    end);
    local v33 = 0;
    v31:Add(l_RunService_0.PreRender:Connect(function(v34) --[[ Line: 59 ]]
        -- upvalues: v33 (ref), v32 (copy)
        debug.profilebegin("Karkerkar Kurkur Event");
        v33 = v33 + v34;
        for v35, v36 in v32 do
            if v36.target and v36.targetAttachment then
                v36.beam.First.Enabled = true;
                v36.beam.Second.Enabled = true;
                local v37 = math.clamp(v33 - v35 + 1, 0, 1);
                local l_WorldPosition_0 = v36.beam.WorldPosition;
                v36.targetAttachment.Position = l_WorldPosition_0 + (v36.target:GetPivot().Position - l_WorldPosition_0) * v37;
            end;
        end;
        debug.profileend();
    end));
    v31:Add(v19.observeTag("KarkerkarKurkurPlayerVFX", function(v39) --[[ Line: 81 ]]
        -- upvalues: v32 (copy), v19 (ref)
        local v40 = script.PlayerVFX.Beam:Clone();
        v40.Parent = v39;
        local v41 = script.PlayerVFX.Torso:Clone();
        v41.Parent = v39;
        local l_v39_Attribute_0 = v39:GetAttribute("KarkerkarKurkurIndex");
        v32[l_v39_Attribute_0] = {
            beam = v40, 
            target = nil
        };
        local v46 = v19.observeTag("KarkerkarKurkurPlayerVFX", function(v43) --[[ Line: 94 ]]
            -- upvalues: v39 (copy), v40 (copy), v32 (ref)
            if v43 == v39 then
                return nil;
            elseif v43:GetAttribute("KarkerkarKurkurIndex") ~= v39:GetAttribute("KarkerkarKurkurIndex") % 4 + 1 then
                return nil;
            else
                local l_Attachment_0 = Instance.new("Attachment");
                l_Attachment_0.Position = v40.WorldPosition;
                l_Attachment_0.Parent = workspace.Terrain;
                local v45 = v32[v39:GetAttribute("KarkerkarKurkurIndex")];
                v45.target = v43;
                v45.beam.First.Attachment0 = l_Attachment_0;
                v45.beam.Second.Attachment0 = l_Attachment_0;
                v45.targetAttachment = l_Attachment_0;
                return function() --[[ Line: 113 ]]
                    -- upvalues: l_Attachment_0 (copy)
                    l_Attachment_0:Destroy();
                end;
            end;
        end);
        return function() --[[ Line: 118 ]]
            -- upvalues: v41 (copy), v40 (copy), v46 (copy), v32 (ref), l_v39_Attribute_0 (copy)
            v41:Destroy();
            v40:Destroy();
            v46();
            v32[l_v39_Attribute_0] = nil;
        end;
    end));
end;
v9.OnStart = function(_) --[[ Line: 128 ]] --[[ Name: OnStart ]]
    -- upvalues: v15 (copy), l_Name_0 (copy), v30 (copy), v11 (copy), v14 (copy), v13 (copy), l_KarkerMusic_0 (copy), l_ReplicatedStorage_0 (copy), l_SoundService_0 (copy), l_LocalPlayer_0 (copy), l_CollectionService_0 (copy), l_HttpService_0 (copy), v24 (copy), v18 (copy), v21 (copy), v19 (copy), v10 (copy), l_RunService_0 (copy), v47 (copy)
    local l_v15_ActiveEventData_0 = v15:GetActiveEventData(l_Name_0);
    assert(l_v15_ActiveEventData_0);
    v30:Add(function() --[[ Line: 132 ]]
        -- upvalues: v11 (ref), v14 (ref), v13 (ref)
        v11:Activate("Blink");
        v14:Update();
        v13:UpdateOST();
        v13:UpdateAmbience();
    end);
    v14:Update();
    v13:UpdateOST();
    v13:UpdateAmbience();
    local v50 = v30:Add(Instance.new("Sound"));
    v50.RollOffMode = Enum.RollOffMode.InverseTapered;
    v50.RollOffMinDistance = 35;
    v50.RollOffMaxDistance = 175;
    v50.Looped = true;
    v50.SoundId = "rbxassetid://124977112693561";
    v50.Volume = 0.15;
    v50.SoundGroup = l_KarkerMusic_0;
    local v51 = v30:Clone(l_ReplicatedStorage_0.Sounds.Events["Karkerkar Kurkur"]["Music Box"]);
    local v52 = v30:Add(Instance.new("Sound"));
    v52.SoundId = "rbxassetid://124977112693561";
    v52.Volume = 0;
    v52.SoundGroup = l_KarkerMusic_0;
    v52.Looped = true;
    v52.Parent = l_SoundService_0;
    v30:Add(v50:GetPropertyChangedSignal("TimePosition"):Connect(function() --[[ Line: 163 ]]
        -- upvalues: v52 (copy), v50 (copy)
        v52.TimePosition = v50.TimePosition;
    end));
    l_KarkerMusic_0:SetAttribute("Paused", false);
    l_KarkerMusic_0.Volume = 1;
    v30:Add(task.delay(l_v15_ActiveEventData_0.startedAt + 4 - workspace:GetServerTimeNow(), function() --[[ Line: 173 ]]
        -- upvalues: l_ReplicatedStorage_0 (ref), v30 (ref), l_LocalPlayer_0 (ref), l_CollectionService_0 (ref), l_HttpService_0 (ref), v50 (copy), l_KarkerMusic_0 (ref), v24 (ref), v18 (ref), v51 (copy), v52 (copy), v21 (ref), v19 (ref), v10 (ref), l_RunService_0 (ref)
        local v53 = l_ReplicatedStorage_0:GetAttribute("KarkerkarKurkurEventCFrame") or workspace.Events["Karkerkar Kurkur"].MapCenterGround.Position;
        local v54 = v30:Clone(script.AreaVFX);
        v54:PivotTo(CFrame.new(v53));
        v54.Parent = workspace;
        local v55 = false;
        local function v59() --[[ Line: 185 ]] --[[ Name: updatePromptsState ]]
            -- upvalues: v55 (ref), l_LocalPlayer_0 (ref), l_CollectionService_0 (ref)
            local v56 = v55 and not l_LocalPlayer_0:GetAttribute("KarkerkarKurkurEventSeated");
            for _, v58 in l_CollectionService_0:GetTagged("KarkerkarSitPrompt") do
                v58.Enabled = v56 and not v58:GetAttribute("Taken");
            end;
        end;
        local function v64() --[[ Line: 200 ]] --[[ Name: updateState ]]
            -- upvalues: l_ReplicatedStorage_0 (ref), v55 (ref), l_HttpService_0 (ref), v59 (copy), v50 (ref), l_KarkerMusic_0 (ref), v24 (ref), v54 (copy), v18 (ref), v51 (ref), v52 (ref)
            local l_l_ReplicatedStorage_0_Attribute_0 = l_ReplicatedStorage_0:GetAttribute("KarkerkarKurkurEventState");
            if not l_l_ReplicatedStorage_0_Attribute_0 then
                v55 = false;
                return;
            else
                local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
                local v62 = l_HttpService_0:JSONDecode(l_l_ReplicatedStorage_0_Attribute_0);
                if v62.StateChangeTime <= l_workspace_ServerTimeNow_0 then
                    v62.IsPaused = not v62.IsPaused;
                end;
                v55 = v62.IsPaused;
                v59();
                local v63 = (v62.ElapsedSoundTime + (l_workspace_ServerTimeNow_0 - v62.ReplicationTime)) % v50.TimeLength;
                if v62.IsPaused then
                    if not l_KarkerMusic_0:GetAttribute("Paused") then
                        l_KarkerMusic_0:SetAttribute("Paused", true);
                        v24.disable(v54.Area);
                        v18(l_KarkerMusic_0, TweenInfo.new(1), {
                            Volume = 0
                        });
                        if v51 then
                            v51:Play();
                            return;
                        end;
                    end;
                elseif l_KarkerMusic_0:GetAttribute("Paused") then
                    l_KarkerMusic_0:SetAttribute("Paused", false);
                    v24.enable(v54.Area);
                    v50.TimePosition = v63;
                    v52.TimePosition = v63;
                    v18(l_KarkerMusic_0, TweenInfo.new(1), {
                        Volume = 1
                    });
                    if v51 then
                        v51:Stop();
                    end;
                end;
                return;
            end;
        end;
        v30:Add(l_ReplicatedStorage_0:GetAttributeChangedSignal("KarkerkarKurkurEventState"):Connect(v64));
        v30:Add(l_LocalPlayer_0:GetAttributeChangedSignal("KarkerkarKurkurEventSeated"):Connect(v59));
        v30:Add(v21.Simple(0.1, v64, true));
        v30:Add(v19.observeTag("KarkerkarSitPrompt", function(v65) --[[ Line: 253 ]]
            -- upvalues: v59 (copy)
            v59();
            local v66 = v65:GetAttributeChangedSignal("Taken"):Connect(v59);
            return function() --[[ Line: 258 ]]
                -- upvalues: v66 (copy), v59 (ref)
                v66:Disconnect();
                v59();
            end;
        end, {
            workspace
        }));
        v30:Add(task.spawn(function() --[[ Line: 264 ]]
            -- upvalues: v10 (ref), v50 (ref), v52 (ref), v30 (ref), v53 (copy), v51 (ref), v64 (copy)
            v10:WaitForAssetId("rbxassetid://124977112693561");
            v50.SoundId = "rbxassetid://124977112693561";
            v52.SoundId = "rbxassetid://124977112693561";
            local v67 = v30:Add(Instance.new("Part"));
            v67.Transparency = 1;
            v67.CFrame = CFrame.new(v53) + Vector3.new(0, 5, 0, 0);
            v67.Anchored = true;
            v67.CanCollide = false;
            v67.CanQuery = false;
            v67.CanTouch = false;
            v67.Parent = workspace;
            v51.Parent = v67;
            v50.Parent = v67;
            local _ = os.clock();
            while not v50.IsLoaded do
                task.wait();
            end;
            task.spawn(v64);
            v50:Play();
            while not v52.IsLoaded do
                task.wait();
            end;
            v52:Play();
        end));
        v30:Add(task.spawn(v59));
        local v69 = {};
        local v70 = {};
        local v71 = {};
        local function _(v72, v73) --[[ Line: 304 ]] --[[ Name: addAttachment ]]
            -- upvalues: v69 (copy), v71 (copy), v70 (copy)
            if not table.find(v69, v72) then
                v71[v72] = v73;
                v70[v72] = v72.Position;
                table.insert(v69, v72);
            end;
        end;
        for v75, v76 in {
            v54.Visualizer1, 
            v54.Visualizer2
        } do
            for _, v78 in v76:GetDescendants() do
                if v78:IsA("Beam") then
                    local v79 = v75 == 1 and "Inner" or "Outer";
                    local l_Attachment0_0 = v78.Attachment0;
                    if not table.find(v69, l_Attachment0_0) then
                        v71[l_Attachment0_0] = v79;
                        v70[l_Attachment0_0] = l_Attachment0_0.Position;
                        table.insert(v69, l_Attachment0_0);
                    end;
                    l_Attachment0_0 = v78.Attachment1;
                    if not table.find(v69, l_Attachment0_0) then
                        v71[l_Attachment0_0] = v79;
                        v70[l_Attachment0_0] = l_Attachment0_0.Position;
                        table.insert(v69, l_Attachment0_0);
                    end;
                end;
            end;
        end;
        local v81 = 0;
        v30:Add(l_RunService_0.PreRender:Connect(function(v82) --[[ Line: 326 ]]
            -- upvalues: v54 (copy), l_KarkerMusic_0 (ref), v52 (ref), v81 (ref), v69 (copy), v71 (copy), v70 (copy)
            debug.profilebegin("Karkerkar Kurkur Musical Chairs Event");
            local l_Spin_0 = v54.Area.Spin;
            l_Spin_0.CFrame = l_Spin_0.CFrame * CFrame.fromOrientation(0, v82 * 0.7853981633974483, 0);
            for _, v85 in (v54.Area.Spin:GetChildren()) do
                local v86 = tonumber(v85.Name) or 0;
                v85.Position = Vector3.new(v85.Position.X, -(math.sin((os.clock() + v86) * 2) * 3 + 4.5), v85.Position.Z);
            end;
            l_Spin_0 = math.clamp(l_KarkerMusic_0.Volume / 1, 0, 1);
            local v87 = math.clamp(v52.PlaybackLoudness / 400, 0, 1) * l_Spin_0;
            v81 = v87 + (v81 - v87) * math.exp(v82 * -10);
            local v88 = math.lerp(-18, -7, l_Spin_0);
            for _, v90 in v69 do
                local v91 = v71[v90] == "Outer" and 4.353 or 3.9;
                local v92 = v70[v90];
                v90.Position = Vector3.new(v92.X, math.lerp(v88, v91, v81), v92.Z);
            end;
            debug.profileend();
        end));
    end));
    v30:Add(task.spawn(function() --[[ Line: 355 ]]
        -- upvalues: v47 (ref)
        v47();
    end));
end;
v9.OnStop = function(_) --[[ Line: 360 ]] --[[ Name: OnStop ]]
    -- upvalues: v30 (copy)
    v30:Destroy();
end;
v9.OnLoad = function(_) --[[ Line: 364 ]] --[[ Name: OnLoad ]]
    -- upvalues: v29 (copy), v24 (copy), v13 (copy), l_ReplicatedStorage_0 (copy)
    v29.OnClientEvent:Connect(function(v95) --[[ Line: 365 ]]
        -- upvalues: v24 (ref), v13 (ref), l_ReplicatedStorage_0 (ref)
        local v96 = script.SpawnVFX:Clone();
        v96:PivotTo(v95 + Vector3.new(0, 0.05000000074505806, 0, 0));
        v96.Parent = workspace;
        v24.emit(v96);
        task.delay(7, function() --[[ Line: 372 ]]
            -- upvalues: v96 (copy)
            v96:Destroy();
        end);
        task.delay(2, function() --[[ Line: 376 ]]
            -- upvalues: v13 (ref), l_ReplicatedStorage_0 (ref), v95 (copy)
            v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events["Karkerkar Kurkur"].Spawn, v95.Position, false);
        end);
    end);
end;
return v9;