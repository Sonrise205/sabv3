local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("TweenService");
local l_RunService_0 = game:GetService("RunService");
local l_Lighting_0 = game:GetService("Lighting");
local l_Players_0 = game:GetService("Players");
local _ = game:GetService("Debris");
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v8 = {};
local v9 = require(l_ReplicatedStorage_0.Controllers.EncryptedAssetsController);
local v10 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
local v11 = require(l_ReplicatedStorage_0.Controllers.EffectController);
local _ = require(l_ReplicatedStorage_0.Controllers.CameraController);
local v13 = require(l_ReplicatedStorage_0.Controllers.SoundController);
local v14 = require(l_ReplicatedStorage_0.Controllers.EventController);
local v15 = require(l_ReplicatedStorage_0.Controllers.CycleController);
local v16 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v17 = require(l_ReplicatedStorage_0.Packages.CreateTween);
local v18 = require(l_ReplicatedStorage_0.Shared.TweenPivot);
local v19 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Utils.MathUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Packages.Spring);
local v23 = require(l_ReplicatedStorage_0.Packages.Timer);
local v24 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Packages.Shake);
local v26 = require(l_ReplicatedStorage_0.Packages.Spr);
local v27 = require(l_ReplicatedStorage_0.Packages.Net);
local v28 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local l_Name_0 = script.Name;
local v32 = {
    [1] = workspace.Sounds.LanceEvent1, 
    [2] = workspace.Sounds.LanceEvent2
};
local v33 = v27:RemoteEvent((("EventService/%*/Burst"):format(l_Name_0)));
local _ = workspace.RenderedMovingAnimals;
local v35 = v24.new();
v8.OnStart = function(_) --[[ Line: 71 ]] --[[ Name: OnStart ]]
    -- upvalues: v14 (copy), l_Name_0 (copy), v35 (copy), v11 (copy), v15 (copy), v13 (copy), v33 (copy), v10 (copy), l_ReplicatedStorage_0 (copy), v28 (copy), l_Lighting_0 (copy), l_CurrentCamera_0 (copy), v19 (copy), v26 (copy), v23 (copy), v16 (copy), v32 (copy), v9 (copy), v18 (copy), l_RunService_0 (copy), l_LocalPlayer_0 (copy), v17 (copy)
    local l_v14_ActiveEventData_0 = v14:GetActiveEventData(l_Name_0);
    assert(l_v14_ActiveEventData_0);
    local function _(v38) --[[ Line: 75 ]] --[[ Name: calculateTimeLeft ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        return (math.max(l_v14_ActiveEventData_0.startedAt + v38 - workspace:GetServerTimeNow(), 0));
    end;
    local function v48(v40, v41, v42) --[[ Line: 79 ]] --[[ Name: createEventScheduler ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy)
        local function v44() --[[ Line: 80 ]]
            -- upvalues: v41 (copy), l_v14_ActiveEventData_0 (ref)
            local l_v41_0 = v41;
            return (math.max(l_v14_ActiveEventData_0.startedAt + l_v41_0 - workspace:GetServerTimeNow(), 0));
        end;
        local function v45() --[[ Line: 84 ]] --[[ Name: run ]]
            -- upvalues: v42 (copy), v44 (copy)
            v42(v44);
        end;
        local v46 = nil;
        local v47 = math.max(l_v14_ActiveEventData_0.startedAt + v40 - workspace:GetServerTimeNow(), 0);
        if v47 > 0 then
            v46 = task.delay(v47, v45);
        else
            v42(v44);
        end;
        return function() --[[ Line: 97 ]]
            -- upvalues: v46 (ref)
            if v46 and coroutine.status(v46) == "suspended" then
                pcall(task.cancel, v46);
            end;
        end;
    end;
    local function v52(v49, v50, ...) --[[ Line: 104 ]] --[[ Name: runAt ]]
        -- upvalues: l_v14_ActiveEventData_0 (copy), v35 (ref)
        local v51 = math.max(l_v14_ActiveEventData_0.startedAt + v49 - workspace:GetServerTimeNow(), 0);
        if v51 <= 0 then
            v35:Add(task.spawn(v50, ...));
            return;
        else
            v35:Add(task.delay(v51, v50, ...));
            return;
        end;
    end;
    v35:Add(function() --[[ Line: 113 ]]
        -- upvalues: v11 (ref), v15 (ref), v13 (ref)
        v11:Activate("Blink");
        v15:Update();
        v13:UpdateOST();
    end);
    v35:Add(v33.OnClientEvent:Connect(function(v53) --[[ Line: 119 ]]
        -- upvalues: v10 (ref), v13 (ref), l_ReplicatedStorage_0 (ref), v28 (ref)
        local v54 = v10:GetAnimals()[v53];
        if not v54 then
            return;
        else
            local _ = function() --[[ Line: 125 ]] --[[ Name: getTargetPosition ]]
                -- upvalues: v54 (copy)
                local _ = nil;
                local l_AnimalModel_0 = v54.AnimalModel;
                return (if l_AnimalModel_0.PrimaryPart then l_AnimalModel_0.PrimaryPart.CFrame else l_AnimalModel_0:GetPivot()).Position;
            end;
            local v58 = nil;
            local l_AnimalModel_1 = v54.AnimalModel;
            local l_Position_0 = (if l_AnimalModel_1.PrimaryPart then l_AnimalModel_1.PrimaryPart.CFrame else l_AnimalModel_1:GetPivot()).Position;
            task.spawn(function() --[[ Line: 140 ]]
                -- upvalues: v13 (ref), l_ReplicatedStorage_0 (ref), l_Position_0 (copy)
                v13:PlaySound(l_ReplicatedStorage_0.Sounds.Events.Lance.Hit, l_Position_0);
            end);
            v58 = script.Burst:Clone();
            v58:PivotTo(CFrame.new(l_Position_0));
            v58.Anchored = false;
            l_AnimalModel_1 = Instance.new("WeldConstraint");
            l_AnimalModel_1.Part0 = v58;
            l_AnimalModel_1.Part1 = v54.AnimalModel.PrimaryPart;
            l_AnimalModel_1.Parent = v58;
            v58.Parent = workspace;
            v28.emit(v58);
            task.delay(5, function() --[[ Line: 157 ]]
                -- upvalues: v58 (copy)
                v58:Destroy();
            end);
            return;
        end;
    end));
    local l_Cartoon_0 = l_Lighting_0:FindFirstChild("Cartoon");
    if l_Cartoon_0 then
        l_Cartoon_0.Parent = l_ReplicatedStorage_0;
        v35:Add(function() --[[ Line: 165 ]]
            -- upvalues: l_Cartoon_0 (copy), l_Lighting_0 (ref)
            l_Cartoon_0.Parent = l_Lighting_0;
        end);
    end;
    local v62 = v35:Clone(Instance.new("ColorCorrectionEffect"));
    v62.Parent = l_CurrentCamera_0;
    local v63 = v35:Clone(script.Stage);
    local v64 = require(v63.Stage.LightSequences);
    local v65 = require(v63.Stage.StageRotate);
    local v66 = Color3.fromRGB(255, 245, 192);
    local v67 = Color3.fromRGB(195, 128, 89);
    local v68 = Color3.fromRGB(90, 192, 217);
    local v69 = Color3.fromRGB(186, 0, 0);
    local v70 = Color3.fromRGB(0, 0, 0);
    local function v78(v71, v72) --[[ Line: 183 ]] --[[ Name: bindToTag ]]
        -- upvalues: v35 (ref), v19 (ref)
        local v73 = {};
        local v77 = v35:Add(v19.observeTag(v71, function(v74) --[[ Line: 185 ]]
            -- upvalues: v73 (copy), v72 (copy)
            table.insert(v73, v74);
            local v75 = v72(v74);
            return function() --[[ Line: 188 ]]
                -- upvalues: v73 (ref), v74 (copy), v75 (copy)
                local v76 = table.find(v73, v74);
                if v76 then
                    table.remove(v73, v76);
                end;
                if typeof(v75) == "function" then
                    v75();
                end;
            end;
        end));
        return v73, function() --[[ Line: 200 ]]
            -- upvalues: v35 (ref), v77 (copy)
            v35:Remove(v77);
        end;
    end;
    local l_v70_0 = v70;
    local v81 = v78("LanceStageLight", function(v80) --[[ Line: 206 ]]
        -- upvalues: l_v70_0 (ref)
        v80.Color = l_v70_0;
        return nil;
    end);
    local v82 = true;
    local v83 = {};
    local _ = function(_) --[[ Line: 214 ]] --[[ Name: isColorValidForLance ]]
        -- upvalues: l_v70_0 (ref)
        local v85 = true;
        if l_v70_0.R <= 0.0392156862745098 then
            v85 = true;
            if l_v70_0.G <= 0.0392156862745098 then
                v85 = l_v70_0.B > 0.0392156862745098;
            end;
        end;
        return v85;
    end;
    local v90 = v78("LanceTargetLight", function(v87) --[[ Line: 218 ]]
        -- upvalues: l_v70_0 (ref)
        local _ = l_v70_0;
        local v89 = true;
        if l_v70_0.R <= 0.0392156862745098 then
            v89 = true;
            if l_v70_0.G <= 0.0392156862745098 then
                v89 = l_v70_0.B > 0.0392156862745098;
            end;
        end;
        if v89 then
            v87.Color = l_v70_0;
        end;
        return nil;
    end);
    local l_Children_0 = v63.Pavillion.Lights:GetChildren();
    for _, v93 in v63.Lights:GetDescendants() do
        if v93:IsA("SpotLight") then
            table.insert(l_Children_0, v93);
        end;
    end;
    local function v104(v94) --[[ Line: 240 ]] --[[ Name: changeLightsNormal ]]
        -- upvalues: l_v70_0 (ref), v81 (copy), v26 (ref), v82 (ref), v83 (ref), v90 (copy), l_Children_0 (copy)
        l_v70_0 = v94;
        for _, v96 in v81 do
            v26.target(v96, 1, 7, {
                Color = v94
            });
        end;
        if v82 then
            for _, v98 in v83 do
                v26.target(v98, 1, 7, {
                    Color = v94
                });
            end;
        end;
        local v99 = true;
        if l_v70_0.R <= 0.0392156862745098 then
            v99 = true;
            if l_v70_0.G <= 0.0392156862745098 then
                v99 = l_v70_0.B > 0.0392156862745098;
            end;
        end;
        if v99 then
            for _, v101 in v90 do
                v26.target(v101, 1, 7, {
                    Color = v94
                });
            end;
        end;
        for _, v103 in l_Children_0 do
            v26.target(v103, 1, 7, {
                Color = v94
            });
        end;
    end;
    local v105 = Random.new();
    local function v124(v106) --[[ Line: 264 ]] --[[ Name: changeLightsRng ]]
        -- upvalues: l_v70_0 (ref), v81 (copy), v26 (ref), v90 (copy), v105 (copy), l_Children_0 (copy), v82 (ref), v83 (ref)
        l_v70_0 = v106;
        for _, v108 in v81 do
            v26.target(v108, 1, 7, {
                Color = v106
            });
        end;
        local v109 = true;
        if l_v70_0.R <= 0.0392156862745098 then
            v109 = true;
            if l_v70_0.G <= 0.0392156862745098 then
                v109 = l_v70_0.B > 0.0392156862745098;
            end;
        end;
        if v109 then
            for _, v111 in v90 do
                v26.target(v111, 1, 7, {
                    Color = v106
                });
            end;
        end;
        for v112 = 1, v105:NextInteger(1, #l_Children_0) do
            local v113 = v105:NextInteger(1, #l_Children_0);
            local l_l_Children_0_0 = l_Children_0;
            local l_l_Children_0_1 = l_Children_0;
            local v116 = l_Children_0[v113];
            local v117 = l_Children_0[v112];
            l_l_Children_0_0[v112] = v116;
            l_l_Children_0_1[v113] = v117;
            v26.target(l_Children_0[v112], 1, 7, {
                Color = v106
            });
        end;
        if v82 then
            for v118 = 1, v105:NextInteger(1, #v83) do
                local v119 = v105:NextInteger(1, #v83);
                local l_v83_0 = v83;
                local l_v83_1 = v83;
                local v122 = v83[v119];
                local v123 = v83[v118];
                l_v83_0[v118] = v122;
                l_v83_1[v119] = v123;
                v26.target(v83[v118], 1, 7, {
                    Color = v106
                });
            end;
        end;
    end;
    local v132 = {
        CRAZY_SEQUENCE = function() --[[ Line: 298 ]]
            -- upvalues: v23 (ref), v124 (copy)
            local v125 = {
                Color3.fromRGB(218, 173, 145), 
                Color3.fromRGB(255, 167, 116), 
                (Color3.fromRGB(90, 180, 90))
            };
            local v126 = Random.new();
            local v127 = v23.Simple(0.15, function() --[[ Line: 306 ]]
                -- upvalues: v124 (ref), v125 (copy), v126 (copy)
                v124(v125[v126:NextInteger(1, #v125)]);
            end, true);
            return function() --[[ Line: 310 ]]
                -- upvalues: v127 (copy)
                v127:Disconnect();
            end;
        end, 
        EXTRA_CRAZY_SEQUENCE = function() --[[ Line: 314 ]]
            -- upvalues: v23 (ref), v124 (copy)
            local v128 = Color3.fromRGB(223, 146, 101);
            local v129 = {
                Color3.fromRGB(40, 93, 180), 
                Color3.fromRGB(255, 0, 0), 
                v128
            };
            local v130 = Random.new();
            local v131 = v23.Simple(0.15, function() --[[ Line: 322 ]]
                -- upvalues: v124 (ref), v129 (copy), v130 (copy)
                v124(v129[v130:NextInteger(1, #v129)]);
            end, true);
            return function() --[[ Line: 326 ]]
                -- upvalues: v131 (copy)
                v131:Disconnect();
            end;
        end
    };
    local v133 = nil;
    local function v135(v134) --[[ Line: 333 ]] --[[ Name: setStageColor ]]
        -- upvalues: v133 (ref), v35 (ref), v132 (copy), v104 (copy)
        if v133 then
            v35:Remove(v133);
            v133 = nil;
        end;
        if v132[v134] then
            v133 = v35:Add(v132[v134]());
            return;
        else
            v104(v134);
            return;
        end;
    end;
    local v136 = 1;
    local function v155(v137, v138, v139, v140) --[[ Line: 351 ]] --[[ Name: createTrackPlayer ]]
        -- upvalues: v16 (ref), v35 (ref), v136 (ref)
        for _, v142 in v138 do
            v142.Looped = true;
            v142.Name = v142.Animation.Name;
            v142:AdjustWeight(0.01);
        end;
        local v143 = {};
        for _, v145 in v138 do
            if v145.Animation then
                local v146 = v16.loadAnimation(v35, v137, v145.Animation);
                v146.Name = v145.Animation.Name .. "Copy";
                v146.Looped = true;
                v146:AdjustWeight(0.01);
                v143[v145] = v146;
                v143[v146] = v145;
            end;
        end;
        local v147 = nil;
        local v148 = nil;
        return {
            setPlayingTrack = function(v149) --[[ Line: 375 ]] --[[ Name: setPlayingTrack ]]
                -- upvalues: v147 (ref), v148 (ref), v138 (copy), v136 (ref), v143 (copy), v139 (copy), v140 (copy)
                if v147 then
                    pcall(task.cancel, v147);
                    v147 = nil;
                end;
                if v148 then
                    v148:AdjustWeight(0.01, 0.4);
                    v148 = nil;
                end;
                v148 = v149;
                for _, v151 in v138 do
                    if v151 == v149 then
                        if not v151.IsPlaying then
                            v151:Play(0.1, 0.01, v136);
                        end;
                        v151:AdjustWeight(1, 0.25);
                        if v143[v151] then
                            v143[v151]:AdjustWeight(0.01, 0.4);
                        end;
                    elseif v151.IsPlaying then
                        v151:AdjustWeight(0.01, 0.4);
                        if v143[v151] then
                            v143[v151]:AdjustWeight(0.01, 0.4);
                        end;
                    end;
                end;
                v147 = task.spawn(function() --[[ Line: 412 ]]
                    -- upvalues: v149 (copy), v139 (ref), v140 (ref), v143 (ref), v136 (ref), v148 (ref)
                    local l_v149_0 = v149;
                    if l_v149_0 and not v139[l_v149_0] then
                        assert(v149);
                        local v153 = v140[v149] or v140[v143[v149]] or 1.1;
                        while true do
                            if not l_v149_0.IsPlaying then
                                l_v149_0:Play(0, 0.01, v136);
                            end;
                            local v154 = v143[l_v149_0];
                            if not v154.IsPlaying then
                                v154:Play(0, 0.01, v136);
                            end;
                            v148 = l_v149_0;
                            l_v149_0.TimePosition = 0;
                            l_v149_0:AdjustWeight(1, 0.3);
                            v154:AdjustWeight(0, 0.3);
                            task.wait((l_v149_0.Length or v153 + 0.5) - v153);
                            v154.TimePosition = l_v149_0.TimePosition;
                            l_v149_0:AdjustWeight(0.01, 0.4);
                            v154:AdjustWeight(1, 0.4);
                            l_v149_0 = v154;
                        end;
                    end;
                end);
            end, 
            trackPointers = v143, 
            tracks = v138
        };
    end;
    local function v480() --[[ Line: 454 ]] --[[ Name: part2 ]]
        -- upvalues: v52 (copy), v35 (ref), v32 (ref), v9 (ref), l_v14_ActiveEventData_0 (copy), v70 (copy), v133 (ref), v132 (copy), v104 (copy), v28 (ref), v63 (copy), v18 (ref), v16 (ref), v155 (copy), v78 (copy), l_v70_0 (ref), v26 (ref), v82 (ref), v83 (ref), v105 (copy), l_RunService_0 (ref), l_LocalPlayer_0 (ref), v136 (ref), v81 (copy)
        local l_v52_0 = v52;
        local function v159(v157, v158, ...) --[[ Line: 458 ]]
            -- upvalues: l_v52_0 (copy)
            return l_v52_0(v157 + 220.5, v158, ...);
        end;
        v35:Add(function() --[[ Line: 463 ]]
            -- upvalues: v32 (ref)
            v32[1]:Stop();
            v32[2]:Stop();
        end);
        v35:Add(task.spawn(function() --[[ Line: 468 ]]
            -- upvalues: v9 (ref), v32 (ref), l_v14_ActiveEventData_0 (ref)
            v9:WaitForAssetId("rbxassetid://129124740133884");
            v32[2].SoundId = "";
            v32[2].SoundId = "rbxassetid://129124740133884";
            while not v32[2].IsLoaded do
                task.wait();
            end;
            local v160 = workspace:GetServerTimeNow() - (l_v14_ActiveEventData_0.startedAt + 220.5);
            if v160 >= 228 then
                return;
            else
                v32[2].TimePosition = v160;
                v32[2].Volume = 0.25;
                v32[2]:Play();
                return;
            end;
        end));
        local l_v70_1 = v70;
        if v133 then
            v35:Remove(v133);
            v133 = nil;
        end;
        if v132[l_v70_1] then
            v133 = v35:Add(v132[l_v70_1]());
        else
            v104(l_v70_1);
        end;
        l_v70_1 = v35:Clone(script.SpotLights);
        v28.disable(l_v70_1);
        l_v70_1.Parent = v63;
        local l_l_v70_1_Children_0 = l_v70_1:GetChildren();
        local v163 = {};
        local v164 = {};
        local v165 = {};
        for _, v167 in l_l_v70_1_Children_0 do
            local v168 = nil;
            v168 = if v167:GetAttribute("Outside") then v163 else v164;
            local v169 = {
                model = v167, 
                beam = v167.Rotate.Neon["1"].LightBeam, 
                light = v167.Rotate.Neon.LightSource.SpotLight, 
                neon = v167.Rotate.Neon, 
                pivot = v167.Rotate:GetPivot(), 
                side = v167:GetAttribute("Side"), 
                beams = {}
            };
            table.insert(v168, v169);
            table.insert(v165, v169);
        end;
        v63.Pavillion.Marquee.NowPlayingSign.Gui:FindFirstChild("Text").Text = "NOW PLAYING... <br /> LOCKED OUT OF HEAVEN";
        v32[2]:Play();
        local l_MainLance_0 = v63.Stage.Rotate.Heaven.MainLance;
        l_MainLance_0.Parent = v63.Stage;
        l_MainLance_0:PivotTo(v63.Stage.HeavenMainLancePivot:GetPivot());
        v18(l_MainLance_0, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), l_MainLance_0:GetPivot() + Vector3.new(0, 22, 0, 0)):Play();
        local v171 = v16.loadAnimation(v35, l_MainLance_0.Humanoid.Animator, script.Lance2_1);
        local v172 = v16.loadAnimation(v35, l_MainLance_0.Humanoid.Animator, script.Lance2_3);
        local v173 = v16.loadAnimation(v35, l_MainLance_0.Humanoid.Animator, script.Lance2_4);
        local v174 = v16.loadAnimation(v35, l_MainLance_0.Humanoid.Animator, script.Lance2_4_Loop);
        local v175 = {
            [v171] = true, 
            [v172] = true, 
            [v173] = true, 
            [v174] = true
        };
        local v176 = v155(l_MainLance_0.Humanoid.Animator, {
            v171, 
            v172, 
            v173, 
            v174
        }, v175, {});
        local l_tracks_0 = v176.tracks;
        local function _() --[[ Line: 545 ]] --[[ Name: noop ]]

        end;
        local v179 = {
            Color3.fromRGB(255, 50, 50), 
            Color3.fromRGB(255, 139, 6)
        };
        local v180 = {
            Color3.fromRGB(255, 50, 50), 
            Color3.fromRGB(255, 158, 105)
        };
        local v181 = {
            Color3.fromRGB(255, 50, 50), 
            Color3.fromRGB(255, 255, 0)
        };
        local v182 = {
            Color3.fromRGB(255, 0, 0), 
            Color3.fromRGB(255, 255, 0)
        };
        local v183 = {
            ColorSequence.new(v182[1]), 
            ColorSequence.new(v182[2])
        };
        local l_HeavenBackwalls_0 = v63.Stage.HeavenBackwalls;
        local v185 = 7;
        local v186 = 9;
        local v187 = 1;
        local v189 = v78("LanceFogLightColor", function(v188) --[[ Line: 580 ]]
            -- upvalues: l_v70_0 (ref)
            v188.Color = l_v70_0;
            return nil;
        end);
        local v191 = v78("LanceTargetLight", function(v190) --[[ Line: 585 ]]
            -- upvalues: l_v70_0 (ref)
            v190.Color = l_v70_0;
            return nil;
        end);
        local function v193(v192) --[[ Line: 590 ]] --[[ Name: setInterval ]]
            -- upvalues: v187 (ref)
            v187 = v192;
        end;
        local v194 = 0;
        local v195 = 0;
        local l_Children_1 = v63.Pavillion.Lights:GetChildren();
        for _, v198 in v63.Lights:GetDescendants() do
            if v198:IsA("SpotLight") then
                table.insert(l_Children_1, v198);
            end;
        end;
        local v199 = false;
        local v200 = true;
        local v201 = false;
        local function v223() --[[ Line: 608 ]] --[[ Name: tickColorChange ]]
            -- upvalues: v194 (ref), v179 (copy), v26 (ref), l_HeavenBackwalls_0 (copy), v185 (ref), v180 (copy), v181 (copy), v189 (copy), v82 (ref), v83 (ref), v191 (copy), l_Children_1 (copy), v105 (ref), v199 (ref), v165 (copy), v200 (ref), v201 (ref), v182 (copy), v183 (copy), v186 (ref), v195 (ref)
            v194 = v194 % #v179 + 1;
            local l_v194_0 = v194;
            local v203 = v179[l_v194_0];
            local v204 = l_v194_0 % #v179 + 1;
            local v205 = v179[v204];
            v26.target(l_HeavenBackwalls_0.NeonDeepYellow, 1, v185, {
                Color = v203
            });
            v26.target(l_HeavenBackwalls_0.NeonRed, 1, v185, {
                Color = v205
            });
            v26.target(l_HeavenBackwalls_0.NeonYellow, 1, v185, {
                Color = v180[v194]
            });
            local v206 = v181[v194];
            for _, v208 in v189 do
                v26.target(v208, 1, v185, {
                    Color = v206
                });
            end;
            if v82 then
                for _, v210 in v83 do
                    v26.target(v210, 1, v185, {
                        Color = v206
                    });
                end;
            end;
            for _, v212 in v191 do
                v26.target(v212, 1, v185, {
                    Color = v206
                });
            end;
            for _, v214 in l_Children_1 do
                v26.target(v214, 1, v185, {
                    Color = if v105:NextInteger(1, 2) == 1 then v206 else v181[v204]
                });
            end;
            v199 = not v199;
            for _, v216 in v165 do
                local v217 = not v216.model:GetAttribute("Outside");
                if (not v200 or not v217) and (not v201 or not v217) then
                    local v218 = v105:NextInteger(1, 2);
                    local v219 = if v218 == 1 then v182[v194] else v182[v204];
                    local v220 = if v218 == 1 then v183[l_v194_0] else v183[v204];
                    v26.target(v216.neon, 1, v186, {
                        Color = v219
                    });
                    v26.target(v216.light, 1, v186, {
                        Color = v219
                    });
                    v26.target(v216.beam, 1, v186, {
                        Color = v220
                    });
                    for _, v222 in v216.beams do
                        v222.beam.Enabled = v199;
                        v26.target(v222.beam, 1, v186, {
                            Color = v220
                        });
                    end;
                end;
            end;
            v195 = 0;
        end;
        local v225 = v35:Add(l_RunService_0.PostSimulation:Connect(function(v224) --[[ Line: 670 ]]
            -- upvalues: v195 (ref), v187 (ref), v223 (copy)
            v195 = v195 + v224;
            if v187 <= v195 then
                v223();
            end;
        end));
        local function _(v226) --[[ Line: 678 ]] --[[ Name: getMinMax ]]
            if v226 == 1 then
                return v226 - 1, v226;
            else
                return math.floor(v226 / 2), (math.ceil(v226 / 2));
            end;
        end;
        local v228 = 0;
        local function v268(v229) --[[ Line: 689 ]] --[[ Name: setLaserAmount ]]
            -- upvalues: v228 (ref), v164 (copy), v26 (ref)
            if v229 == 0 then
                local l_v228_0 = v228;
                local v231, v232;
                if l_v228_0 == 1 then
                    v231 = l_v228_0 - 1;
                    v232 = l_v228_0;
                else
                    local v233 = math.floor(l_v228_0 / 2);
                    local v234 = math.ceil(l_v228_0 / 2);
                    v231 = v233;
                    v232 = v234;
                end;
                v228 = v229;
                for _, v236 in v164 do
                    for v237 = -v231, v232 do
                        local l_FirstChild_0 = v236.model.Rotate.Neon:FindFirstChild((("CustomAttachment_%*"):format(v237)));
                        if l_FirstChild_0 then
                            for _, v240 in l_FirstChild_0:GetChildren() do
                                local v241 = table.find(v236.beams, v240);
                                if v241 then
                                    table.remove(v236.beams, v241);
                                end;
                                v26.target(v240, 0.9, 5, {
                                    Width0 = 0, 
                                    Width1 = 0
                                });
                            end;
                            task.delay(1, function() --[[ Line: 713 ]]
                                -- upvalues: l_FirstChild_0 (copy)
                                l_FirstChild_0:Destroy();
                            end);
                        end;
                    end;
                end;
                return;
            else
                local v242, v243;
                if v229 == 1 then
                    v242 = v229 - 1;
                    v243 = v229;
                else
                    local v244 = math.floor(v229 / 2);
                    local v245 = math.ceil(v229 / 2);
                    v242 = v244;
                    v243 = v245;
                end;
                local l_v228_1 = v228;
                local v247, v248;
                if l_v228_1 == 1 then
                    v247 = l_v228_1 - 1;
                    v248 = l_v228_1;
                else
                    local v249 = math.floor(l_v228_1 / 2);
                    local v250 = math.ceil(l_v228_1 / 2);
                    v247 = v249;
                    v248 = v250;
                end;
                if l_v228_1 ~= 0 then
                    for v251 = -v247, v248 do
                        if -v242 > v251 or v251 > v243 then
                            for _, v253 in v164 do
                                local l_FirstChild_1 = v253.model.Rotate.Neon:FindFirstChild((("CustomAttachment_%*"):format(v251)));
                                if l_FirstChild_1 then
                                    for _, v256 in l_FirstChild_1:GetChildren() do
                                        local v257 = table.find(v253.beams, v256);
                                        if v257 then
                                            table.remove(v253.beams, v257);
                                        end;
                                        v26.target(v256, 0.9, 5, {
                                            Width0 = 0, 
                                            Width1 = 0
                                        });
                                    end;
                                    task.delay(1, function() --[[ Line: 747 ]]
                                        -- upvalues: l_FirstChild_1 (copy)
                                        l_FirstChild_1:Destroy();
                                    end);
                                end;
                            end;
                        end;
                    end;
                end;
                v228 = v229;
                for _, v259 in v164 do
                    local l_1_0 = v259.model.Rotate.Neon["1"];
                    local l_2_0 = v259.model.Rotate.Neon["2"];
                    local v262 = l_2_0.Position - Vector3.new(7.5, 0, 0, 0);
                    for v263 = -v242, v243 do
                        if not v259.model.Rotate.Neon:FindFirstChild((("CustomAttachment_%*"):format(v263))) then
                            local v264 = l_2_0:Clone();
                            v264.Name = ("CustomAttachment_%*"):format(v263);
                            if l_v228_1 ~= 0 then
                                v264.Position = v262 + Vector3.new((if v263 < 0 then -v247 else v248) * 15, 0, 0);
                            end;
                            v264.Parent = v259.model.Rotate.Neon;
                            v26.target(v264, 0.9, 5, {
                                Position = v262 + Vector3.new(v263 * 15, 0, 0)
                            });
                            local v265 = script.lightbeambig.Beams:Clone();
                            for _, v267 in v265:GetChildren() do
                                v267.Color = v259.beam.Color;
                                v267.Width0 = 0.25;
                                v267.Width1 = 0.5;
                                v267.Brightness = 13;
                                v267.Attachment0 = l_1_0;
                                v267.Attachment1 = v264;
                                v267.Parent = v259.model.Rotate.Neon;
                                table.insert(v259.beams, {
                                    beam = v267, 
                                    attachment = v264, 
                                    defaultPosition = v262, 
                                    targetPosition = v262 + Vector3.new(v263 * 15, 0, 0), 
                                    index = v263
                                });
                            end;
                            v265:Destroy();
                        end;
                    end;
                end;
                return;
            end;
        end;
        local function _(v269) --[[ Line: 813 ]] --[[ Name: getBeatFloat ]]
            return (v269 - 57) / 0.4166666666666667;
        end;
        local v271 = {
            49.9, 
            129.6, 
            163, 
            176.8
        };
        local v272 = {
            6.91, 
            13.44, 
            20.14, 
            26.92, 
            33.64, 
            40.21, 
            86.85, 
            93.55, 
            100.31, 
            106.94, 
            113.54, 
            120.23, 
            220.33, 
            226.84
        };
        local _ = function(v273) --[[ Line: 857 ]] --[[ Name: getActivePanStart ]]
            -- upvalues: v271 (copy)
            for _, v275 in v271 do
                if v275 <= v273 and v273 < v275 + 7.1 then
                    return v275;
                end;
            end;
            return nil;
        end;
        local _ = function(v277) --[[ Line: 867 ]] --[[ Name: isInRedSweep ]]
            -- upvalues: v272 (copy)
            for _, v279 in v272 do
                if v279 <= v277 and v277 <= v279 + 2.5 then
                    return true;
                end;
            end;
            return false;
        end;
        local _ = function(v281) --[[ Line: 878 ]] --[[ Name: getInsideState ]]
            -- upvalues: v271 (copy)
            local v282 = false;
            if v281 < 5 then
                return 0, 0;
            elseif v281 < 45 then
                return 1, 5;
            else
                local v283;
                for _, v285 in v271 do
                    if v285 <= v281 and v281 < v285 + 7.1 then
                        v283 = v285;
                        v282 = true;
                    end;
                    if v282 then
                        break;
                    end;
                end;
                if not v282 then
                    v283 = nil;
                end;
                v282 = false;
                if v283 then
                    return 2, v283;
                else
                    local v286 = v271[1] + 7.1;
                    if v286 <= v281 and v281 < 85 then
                        return 3, v286;
                    elseif v281 < 86 then
                        return 0, 85;
                    elseif v281 < 123 then
                        return 1, 86;
                    else
                        local v287 = v271[2] + 7.1;
                        if v287 <= v281 and v281 < 162 then
                            return 3, v287;
                        elseif v281 < 187 then
                            return 0, 162;
                        else
                            return 4, 187;
                        end;
                    end;
                end;
            end;
        end;
        local function v294(v289) --[[ Line: 924 ]] --[[ Name: setInsideEnabled ]]
            -- upvalues: v164 (copy)
            for _, v291 in v164 do
                v291.light.Enabled = v289;
                v291.beam.Enabled = v289;
                for _, v293 in v291.beams do
                    v293.beam.Enabled = v289;
                end;
            end;
        end;
        local _ = function(v295, v296) --[[ Line: 935 ]] --[[ Name: setInsideSpotLightEnabled ]]
            v295.light.Enabled = v296;
            v295.beam.Enabled = v296;
            for _, v298 in v295.beams do
                v298.beam.Enabled = v296;
            end;
        end;
        local function v306(v300) --[[ Line: 943 ]] --[[ Name: setInsideSpotLightColor ]]
            -- upvalues: v164 (copy), v26 (ref), v186 (ref)
            local v301 = ColorSequence.new(v300);
            for _, v303 in v164 do
                v26.target(v303.neon, 1, v186, {
                    Color = v300
                });
                v26.target(v303.light, 1, v186, {
                    Color = v300
                });
                v26.target(v303.beam, 1, v186, {
                    Color = v301
                });
                for _, v305 in v303.beams do
                    v26.target(v305.beam, 1, v186, {
                        Color = v301
                    });
                end;
            end;
        end;
        local v307 = false;
        local v308 = false;
        local v309 = table.create(#v164, 0);
        local v310 = table.create(#v164, 0.8796459430051422);
        local v311 = Random.new();
        local function v316() --[[ Line: 964 ]] --[[ Name: randomizeInsideRedAngles ]]
            -- upvalues: v164 (copy), v311 (copy), v309 (copy), v310 (copy)
            for v312, v313 in v164 do
                local v314 = v311:NextNumber(-0.6911503837897545, 0.6911503837897545) * v313.side;
                local v315 = v311:NextNumber(0.6911503837897545, 1.0681415022205298);
                v309[v312] = v314;
                v310[v312] = v315;
            end;
        end;
        local v317 = -1;
        local v318 = 0;
        local v319 = table.create(#v164, 0);
        local function _(v320) --[[ Line: 983 ]] --[[ Name: getPanEnabledAlpha ]]
            if v320 < 3.5 then
                return true, (math.clamp(v320 / 3.5, 0, 1));
            elseif v320 < 3.6 then
                return false, 0;
            elseif v320 < 7.1 then
                local v321 = (v320 - 3.6) / 3.5;
                if v321 >= 0.75 then
                    return false, 0;
                else
                    return true, (math.clamp(v321, 0, 1));
                end;
            else
                return false, 0;
            end;
        end;
        local v323 = 0;
        local v324 = 0;
        for _, v326 in v164 do
            v323 = v323 + v326.pivot.Position.Z;
            v324 = v324 + 1;
        end;
        if v324 > 0 then
            v323 = v323 / v324;
        end;
        for v327, v328 in v164 do
            local v329 = v323 < v328.pivot.Position.Z;
            v319[v327] = (v329 and v328.side == -1 or not v329 and v328.side == 1) and 0 or 1.5707963267948966;
        end;
        local function v340(v330, _, v332) --[[ Line: 1025 ]] --[[ Name: aimInsideFig8 ]]
            -- upvalues: v164 (copy), v319 (copy)
            for v333, v334 in v164 do
                local v335 = v330 + v319[v333];
                local v336 = math.sin(v335);
                local v337 = math.sin(v335 * 2);
                local v338 = v336 * 3.141592653589793 * 0.13 * v334.side + -v334.side * 0.15707963267948966;
                local v339 = 3.141592653589793 * (v332 * 0.05 * v337 + 0.225);
                v334.model.Rotate:PivotTo(v334.pivot * CFrame.Angles(v339, v338, 0));
            end;
        end;
        local v341 = nil;
        local v342 = nil;
        task.spawn(function() --[[ Line: 1043 ]]
            -- upvalues: l_RunService_0 (ref), l_LocalPlayer_0 (ref), v341 (ref), v342 (ref), v35 (ref)
            if not l_RunService_0:IsStudio() then
                return;
            else
                local l_PlayerGui_0 = l_LocalPlayer_0:WaitForChild("PlayerGui");
                v341 = Instance.new("ScreenGui");
                v341.ResetOnSpawn = false;
                v341.IgnoreGuiInset = true;
                v342 = Instance.new("TextLabel");
                v342.AnchorPoint = Vector2.new(0.5, 1);
                v342.Position = UDim2.new(0.5, 0, 1, 0);
                v342.Size = UDim2.new(0.25, 0, 0, 25);
                v342.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
                v342.BackgroundTransparency = 0.35;
                v342.BorderSizePixel = 0;
                v342.TextColor3 = Color3.fromRGB(255, 255, 255);
                v342.TextStrokeTransparency = 0.6;
                v342.TextSize = 16;
                v342.Font = Enum.Font.BuilderSansMedium;
                v342.TextXAlignment = Enum.TextXAlignment.Left;
                v342.TextYAlignment = Enum.TextYAlignment.Center;
                v342.Text = "";
                v342.Parent = v341;
                local l_UIPadding_0 = Instance.new("UIPadding");
                l_UIPadding_0.PaddingLeft = UDim.new(0, 10);
                l_UIPadding_0.PaddingRight = UDim.new(0, 10);
                l_UIPadding_0.Parent = v342;
                v341.Parent = l_PlayerGui_0;
                v35:Add(v341);
                return;
            end;
        end);
        local v345 = 0;
        local v346 = 0;
        local v347 = false;
        local v348 = 0;
        local v349 = 0;
        local v350 = 0;
        v35:Add(l_RunService_0.PostSimulation:Connect(function(v351) --[[ Line: 1092 ]]
            -- upvalues: v32 (ref), v271 (copy), v345 (ref), v346 (ref), v200 (ref), v306 (copy), v70 (ref), v294 (copy), v347 (ref), v307 (ref), v182 (copy), v317 (ref), v350 (ref), v342 (ref), v348 (ref), v187 (ref), v163 (copy), v26 (ref), v201 (ref), v272 (copy), v316 (copy), v164 (copy), v309 (copy), v310 (copy), v318 (ref), v340 (copy), v308 (ref), v349 (ref)
            local v352 = false;
            local v353 = false;
            local v354 = false;
            local v355 = false;
            local l_TimePosition_0 = v32[2].TimePosition;
            local v357 = math.clamp(v32[2].PlaybackLoudness / 750, 0, 1);
            local v358, v359;
            if l_TimePosition_0 < 5 then
                v358 = 0;
                v359 = 0;
            elseif l_TimePosition_0 < 45 then
                v358 = 1;
                v359 = 5;
            else
                local v360;
                for _, v362 in v271 do
                    if v362 <= l_TimePosition_0 and l_TimePosition_0 < v362 + 7.1 then
                        v360 = v362;
                        v352 = true;
                    end;
                    if v352 then
                        break;
                    end;
                end;
                if not v352 then
                    v360 = nil;
                end;
                v352 = false;
                if v360 then
                    v358 = 2;
                    v359 = v360;
                else
                    local v363 = v271[1] + 7.1;
                    if v363 <= l_TimePosition_0 and l_TimePosition_0 < 85 then
                        v358 = 3;
                        v359 = v363;
                    elseif l_TimePosition_0 < 86 then
                        v358 = 0;
                        v359 = 85;
                    elseif l_TimePosition_0 < 123 then
                        v358 = 1;
                        v359 = 86;
                    else
                        local v364 = v271[2] + 7.1;
                        if v364 <= l_TimePosition_0 and l_TimePosition_0 < 162 then
                            v358 = 3;
                            v359 = v364;
                        elseif l_TimePosition_0 < 187 then
                            v358 = 0;
                            v359 = 162;
                        else
                            v358 = 4;
                            v359 = 187;
                        end;
                    end;
                end;
            end;
            if v358 ~= v345 then
                v345 = v358;
                v346 = v359;
                v200 = v345 ~= 4;
                if v345 == 0 then
                    v306(v70);
                    v294(false);
                    v347 = false;
                    v307 = false;
                elseif v345 == 1 then
                    v306(v182[1]);
                    v294(false);
                    v307 = false;
                elseif v345 == 2 then
                    v306(v182[2]);
                    v294(true);
                    v347 = true;
                elseif v345 == 3 then
                    v306(v182[2]);
                    v294(true);
                    v317 = -1;
                elseif v345 == 4 then
                    v294(true);
                end;
            end;
            v350 = v350 + v351;
            if v342 and v350 >= 0.1 then
                v350 = v350 - 0.1;
                local v365 = "";
                if v345 == 0 then
                    v365 = "OFF";
                elseif v345 == 1 then
                    v365 = v307 and "Red sweep" or "RED - Off";
                elseif v345 == 2 then
                    v365 = "YELLOW - pan";
                elseif v345 == 3 then
                    v365 = "YELLOW - beat flash";
                elseif v345 == 4 then
                    v365 = "Figure8";
                end;
                local v366 = math.floor(l_TimePosition_0 / 60);
                local v367 = l_TimePosition_0 - v366 * 60;
                v342.Text = string.format("%s  |  %s", string.format("%d:%05.2f", v366, v367), v365);
            end;
            v348 = v348 + v351 * (1 / v187);
            local v368 = math.sin(v348);
            local v369 = math.cos(v348);
            for _, v371 in v163 do
                v371.model.Rotate:PivotTo(v371.pivot * CFrame.Angles(v368 * v371.side * 3.141592653589793 * 0.125, v369 * v371.side * 3.141592653589793 * 0.125, 0));
                v26.target(v371.beam, 1, 5, {
                    Width1 = 1 / v187 * 20 * (math.lerp(0.25, 1, v357) * 0.5)
                });
            end;
            local v372 = (1 / math.max(v187, 0.001)) ^ 0.35 * 2;
            local v373 = false;
            if v345 == 4 then
                for _, v375 in v272 do
                    if v375 <= l_TimePosition_0 and l_TimePosition_0 <= v375 + 2.5 then
                        v373 = true;
                        v353 = true;
                    end;
                    if v353 then
                        break;
                    end;
                end;
                if not v353 then
                    v373 = false;
                end;
            end;
            v353 = false;
            v201 = v373;
            if v345 == 1 then
                for _, v377 in v272 do
                    if v377 <= l_TimePosition_0 and l_TimePosition_0 <= v377 + 2.5 then
                        v373 = true;
                        v354 = true;
                    end;
                    if v354 then
                        break;
                    end;
                end;
                if not v354 then
                    v373 = false;
                end;
                v354 = false;
                if v373 and not v307 then
                    v307 = true;
                    v316();
                    v294(true);
                elseif not v373 and v307 then
                    v307 = false;
                    v294(false);
                end;
                if v307 then
                    local v378 = math.sin((l_TimePosition_0 - 57) / 0.4166666666666667 * 3.141592653589793 * 2 * 1);
                    for v379, v380 in v164 do
                        local v381 = v309[v379] + v378 * 0.5654866776461628 * v380.side;
                        local v382 = v310[v379];
                        v380.model.Rotate:PivotTo(v380.pivot * CFrame.Angles(v382, v381, 0));
                        v380.beam.Brightness = math.lerp(6, 10, v357);
                    end;
                end;
            elseif v345 == 2 then
                v373 = l_TimePosition_0 - v346;
                local v383, v384;
                if v373 < 3.5 then
                    v383 = true;
                    v384 = math.clamp(v373 / 3.5, 0, 1);
                elseif v373 < 3.6 then
                    v383 = false;
                    v384 = 0;
                elseif v373 < 7.1 then
                    local v385 = (v373 - 3.6) / 3.5;
                    if v385 >= 0.75 then
                        v383 = false;
                        v384 = 0;
                    else
                        v383 = true;
                        v384 = math.clamp(v385, 0, 1);
                    end;
                else
                    v383 = false;
                    v384 = 0;
                end;
                if v383 ~= v347 then
                    v347 = v383;
                    v294(v383);
                    v306(if v383 then v182[2] else v70);
                end;
                if v383 then
                    local v386 = math.lerp(1.5707963267948966, 0.4398229715025711, v384);
                    for _, v388 in v164 do
                        local v389 = -v388.side * 0.15707963267948966;
                        v388.model.Rotate:PivotTo(v388.pivot * CFrame.Angles(v386, v389, 0));
                        v388.beam.Brightness = math.lerp(6, 10, v357);
                    end;
                end;
            elseif v345 == 3 then
                v373 = math.floor((l_TimePosition_0 - 57) / 0.4166666666666667);
                if v373 ~= v317 then
                    v317 = v373;
                    v318 = v318 + 0.26179938779914946;
                    local v390 = v373 % 2 == 0;
                    for _, v392 in v164 do
                        local v393 = v392.side == -1;
                        local v394 = if v390 then v393 else not v393;
                        v392.light.Enabled = v394;
                        v392.beam.Enabled = v394;
                        for _, v396 in v392.beams do
                            v396.beam.Enabled = v394;
                        end;
                    end;
                    v340(v318, 0.8, 0.8);
                end;
                for _, v398 in v164 do
                    v398.beam.Brightness = 10;
                end;
            elseif v345 == 4 then
                for _, v400 in v272 do
                    if v400 <= l_TimePosition_0 and l_TimePosition_0 <= v400 + 2.5 then
                        v373 = true;
                        v355 = true;
                    end;
                    if v355 then
                        break;
                    end;
                end;
                if not v355 then
                    v373 = false;
                end;
                v355 = false;
                if v373 then
                    if not v308 then
                        v308 = true;
                        v316();
                        v294(true);
                        v306(v182[1]);
                    end;
                    local v401 = math.sin((l_TimePosition_0 - 57) / 0.4166666666666667 * 3.141592653589793 * 2 * 1);
                    for v402, v403 in v164 do
                        local v404 = v309[v402] + v401 * 0.5654866776461628 * v403.side;
                        local v405 = v310[v402];
                        v403.model.Rotate:PivotTo(v403.pivot * CFrame.Angles(v405, v404, 0));
                        v403.beam.Brightness = math.lerp(6, 10, v357);
                    end;
                else
                    if v308 then
                        v308 = false;
                    end;
                    v349 = v349 + v351 * v372;
                    v340(v349, 1, 1);
                    for _, v407 in v164 do
                        v407.beam.Brightness = math.lerp(5, 10, 1 / v187 * v357);
                    end;
                end;
            end;
            for _, v409 in v163 do
                v409.beam.Brightness = math.lerp(5, 10, 1 / v187 * v357);
            end;
            for _, v411 in v164 do
                for _, v413 in v411.beams do
                    v26.target(v413.attachment, 0.9, 5, {
                        Position = Vector3.new(v413.targetPosition.X, v368 * (math.abs(v413.index) % 2 == 0 and -1 or 1) * 15, v413.targetPosition.Z)
                    });
                end;
            end;
        end));
        local v414 = {};
        local function v419() --[[ Line: 1289 ]] --[[ Name: cancelCurrentCarpetLightEffects ]]
            -- upvalues: v414 (copy), v83 (ref), v26 (ref), v185 (ref), v70 (ref)
            for _, v416 in v414 do
                if v416 then
                    pcall(task.cancel, v416);
                end;
            end;
            table.clear(v414);
            for _, v418 in v83 do
                v26.target(v418, 1, v185, {
                    Color = v70
                });
            end;
        end;
        local v420 = table.clone(v83);
        table.sort(v420, function(v421, v422) --[[ Line: 1305 ]]
            return v421.Position.Z < v422.Position.Z;
        end);
        local v423 = {};
        for v424, v425 in v420 do
            if v424 % 2 == 0 then
                table.insert(v423, {
                    v420[v424 - 1], 
                    v425
                });
            end;
        end;
        local function v434(v426, v427, v428) --[[ Line: 1317 ]] --[[ Name: playCarpetLightsFillEffect ]]
            -- upvalues: v414 (copy), v420 (copy), v26 (ref), v185 (ref), v70 (ref), l_RunService_0 (ref)
            table.insert(v414, task.spawn(function() --[[ Line: 1319 ]]
                -- upvalues: v427 (copy), v420 (ref), v26 (ref), v185 (ref), v426 (copy), v428 (copy), v414 (ref), v70 (ref), l_RunService_0 (ref)
                local v429 = v427 / 98;
                local v430 = 0;
                for v431, v432 in v420 do
                    v26.target(v432, 1, v185, {
                        Color = v426
                    });
                    if v428 then
                        table.insert(v414, task.delay(v428, function() --[[ Line: 1326 ]]
                            -- upvalues: v26 (ref), v432 (copy), v185 (ref), v70 (ref)
                            v26.target(v432, 1, v185, {
                                Color = v70
                            });
                        end));
                    end;
                    if v431 % 2 == 0 then
                        while v430 < v429 do
                            v430 = v430 + l_RunService_0.PostSimulation:Wait();
                        end;
                        v430 = v430 - v429;
                    end;
                end;
                local v433 = table.find(v414, coroutine.running());
                if v433 then
                    table.remove(v414, v433);
                end;
            end));
        end;
        local function v444(v435, v436) --[[ Line: 1346 ]] --[[ Name: flashingCarpetAlternatingEffect ]]
            -- upvalues: v419 (copy), v414 (copy), v423 (copy), v70 (ref), v26 (ref), v185 (ref)
            v419();
            table.insert(v414, task.spawn(function() --[[ Line: 1349 ]]
                -- upvalues: v423 (ref), v436 (copy), v70 (ref), v26 (ref), v185 (ref), v435 (copy), v414 (ref)
                local v437 = 0;
                while true do
                    for v438, v439 in v423 do
                        local v440 = if (v438 + v437) % 2 == 0 then v436 else v70;
                        for _, v442 in v439 do
                            v26.target(v442, 1, v185, {
                                Color = v440
                            });
                        end;
                    end;
                    local v443 = v435();
                    task.wait(v443);
                    v437 = v437 + 1;
                end;
            end));
        end;
        v136 = 1;
        for _, v446 in l_tracks_0 do
            v446:AdjustSpeed(v195);
            if v176.trackPointers[v446] then
                v176.trackPointers[v446]:AdjustSpeed(v195);
            end;
        end;
        v176.setPlayingTrack(v171);
        v159(18.5, v176.setPlayingTrack, v172);
        v159(20.8, v176.setPlayingTrack, v171);
        v159(44.5, v176.setPlayingTrack, v173);
        v159(49, v176.setPlayingTrack, v174);
        v159(84, v176.setPlayingTrack, v171);
        v159(97, v176.setPlayingTrack, v172);
        v159(99.3, v176.setPlayingTrack, v171);
        v159(124, v176.setPlayingTrack, v173);
        v159(128.5, v176.setPlayingTrack, v174);
        v159(162, v176.setPlayingTrack, v172);
        v159(164.3, v176.setPlayingTrack, v174);
        v159(190, v176.setPlayingTrack, v171);
        v159(201, v176.setPlayingTrack, v173);
        v159(205.5, v176.setPlayingTrack, v174);
        v159(226, v176.setPlayingTrack, v171);
        local function v447() --[[ Line: 1397 ]] --[[ Name: songIntervalGetter ]]
            -- upvalues: v187 (ref)
            return v187;
        end;
        v187 = 0.75;
        v28.enable(l_v70_1);
        v82 = false;
        local v448 = v181[2];
        v419();
        table.insert(v414, task.spawn(function() --[[ Line: 1349 ]]
            -- upvalues: v423 (copy), v448 (copy), v70 (ref), v26 (ref), v185 (ref), v447 (copy), v414 (copy)
            local v449 = 0;
            while true do
                for v450, v451 in v423 do
                    local v452 = if (v450 + v449) % 2 == 0 then v448 else v70;
                    for _, v454 in v451 do
                        v26.target(v454, 1, v185, {
                            Color = v452
                        });
                    end;
                end;
                local v455 = v447();
                task.wait(v455);
                v449 = v449 + 1;
            end;
        end));
        v159(3.8, v419);
        for _, v457 in {
            {
                4, 
                8, 
                2
            }, 
            {
                11, 
                15, 
                2
            }, 
            {
                18, 
                22, 
                2
            }, 
            {
                24, 
                28, 
                2
            }, 
            {
                31, 
                35, 
                2
            }, 
            {
                37, 
                48, 
                2
            }, 
            {
                50, 
                58, 
                1.25
            }, 
            {
                84, 
                86, 
                2
            }, 
            {
                90, 
                94, 
                2
            }, 
            {
                96, 
                96, 
                2
            }, 
            {
                102.5, 
                106.5, 
                2
            }, 
            {
                109.5, 
                113.5, 
                2
            }, 
            {
                116, 
                120, 
                2
            }, 
            {
                122, 
                126, 
                2
            }, 
            {
                214, 
                218, 
                2
            }, 
            {
                220, 
                224, 
                2
            }, 
            {
                226, 
                228, 
                2
            }
        } do
            for v458 = v457[1] - 0, v457[2] - 0, v457[3] do
                v159(v458, v434, v181[2], 0.3, 0.3);
                v159(v458 + 0.6, v434, v181[2], 0.3, 0.3);
            end;
        end;
        v159(57, v444, v447, v181[2]);
        v159(83, v419);
        v159(83, v434, v181[2], 0.3, 0.5);
        v159(130, v444, v447, v181[2]);
        v159(160, v419);
        v159(162, v444, v447, v181[2]);
        v159(188, v419);
        v159(202, v444, v447, v181[2]);
        v159(214, v419);
        local v459 = 3 + 1;
        v159(57, v268, v459);
        v459 = v459 + 1;
        v159(60, v268, v459);
        v459 = v459 + 1;
        v159(63, v268, v459);
        v159(66, v268, v459 + 1);
        v159(4, v193, 0.3);
        v159(44, v193, 0.2);
        v159(57, v193, 0.15);
        v159(70, v193, 0.125);
        v159(79, v193, 0.3);
        v159(84, v193, 0.15);
        v159(84.5, v268, 0);
        v159(135, v193, 0.2);
        v159(149, v193, 0.175);
        v159(161, v193, 0.2);
        v159(187.5, v193, 0.5);
        v159(202, v193, 0.2);
        v159(215, v193, 0.25);
        v159(230.5, function() --[[ Line: 1468 ]]
            -- upvalues: v35 (ref), v225 (copy), v185 (ref), v186 (ref), v70 (ref), v26 (ref), l_HeavenBackwalls_0 (copy), v189 (copy), v191 (copy), v81 (ref), v83 (ref), l_Children_1 (copy), v165 (copy), l_v14_ActiveEventData_0 (ref), v136 (ref), l_tracks_0 (copy), v176 (copy), l_RunService_0 (ref)
            v35:Remove(v225);
            v185 = 1;
            v186 = 2;
            local v460 = ColorSequence.new(v70);
            v26.target(l_HeavenBackwalls_0.NeonDeepYellow, 1, v185, {
                Color = v70
            });
            v26.target(l_HeavenBackwalls_0.NeonRed, 1, v185, {
                Color = v70
            });
            v26.target(l_HeavenBackwalls_0.NeonYellow, 1, v185, {
                Color = v70
            });
            for _, v462 in v189 do
                v26.target(v462, 1, v185, {
                    Color = v70
                });
            end;
            for _, v464 in v191 do
                v26.target(v464, 1, v185, {
                    Color = v70
                });
            end;
            for _, v466 in v81 do
                v26.target(v466, 1, v185, {
                    Color = v70
                });
            end;
            for _, v468 in v83 do
                v26.target(v468, 1, v185, {
                    Color = v70
                });
            end;
            for _, v470 in l_Children_1 do
                v26.target(v470, 1, v185, {
                    Color = v70
                });
            end;
            for _, v472 in v165 do
                v26.target(v472.beam, 0.9, 5, {
                    Width0 = 0, 
                    Width1 = 0
                });
                v26.target(v472.neon, 1, v186, {
                    Color = v70
                });
                v26.target(v472.light, 1, v186, {
                    Color = v70
                });
                v26.target(v472.beam, 1, v186, {
                    Color = v460
                });
                for _, v474 in v472.beams do
                    v26.target(v474.beam, 1, v186, {
                        Color = v460
                    });
                end;
            end;
            if math.max(l_v14_ActiveEventData_0.startedAt + 231.5 - workspace:GetServerTimeNow(), 0) <= 0 then
                return;
            else
                local v475 = os.clock();
                while true do
                    local v476 = (os.clock() - v475) / 0.5;
                    local v477 = math.lerp(1, 0, v476);
                    v136 = v477;
                    for _, v479 in l_tracks_0 do
                        v479:AdjustSpeed(v477);
                        if v176.trackPointers[v479] then
                            v176.trackPointers[v479]:AdjustSpeed(v477);
                        end;
                    end;
                    if v476 < 1 then
                        l_RunService_0.PreRender:Wait();
                    else
                        break;
                    end;
                end;
                return;
            end;
        end);
        v159(228, function() --[[ Line: 1541 ]]
            -- upvalues: v28 (ref), v63 (ref)
            v28.disable(v63.Stage);
        end);
    end;
    local function v526() --[[ Line: 1546 ]] --[[ Name: createStage ]]
        -- upvalues: v35 (ref), v32 (ref), v9 (ref), l_v14_ActiveEventData_0 (copy), l_Lighting_0 (ref), v83 (ref), v63 (copy), v19 (ref), v52 (copy), v16 (ref), v155 (copy), v64 (copy), v70 (copy), v133 (ref), v132 (copy), v104 (copy), v135 (copy), v66 (copy), v67 (copy), v69 (copy), v68 (copy), v136 (ref), l_RunService_0 (ref), v90 (copy), v26 (ref), v17 (ref), v65 (copy), v480 (copy)
        v35:Add(function() --[[ Line: 1550 ]]
            -- upvalues: v32 (ref)
            v32[1]:Stop();
            v32[2]:Stop();
        end);
        v35:Add(task.spawn(function() --[[ Line: 1555 ]]
            -- upvalues: v9 (ref), v32 (ref), l_v14_ActiveEventData_0 (ref)
            v9:WaitForAssetId("rbxassetid://80460751675093");
            v32[1].SoundId = "";
            v32[1].SoundId = "rbxassetid://80460751675093";
            while not v32[1].IsLoaded do
                task.wait();
            end;
            local v481 = workspace:GetServerTimeNow() - (l_v14_ActiveEventData_0.startedAt + 5);
            if v481 >= 209.5 then
                return;
            else
                v32[1].TimePosition = v481;
                v32[1].Volume = 0.25;
                v32[1]:Play();
                return;
            end;
        end));
        v35:Clone(script.Night_Sky).Parent = l_Lighting_0;
        local l_Atmosphere_0 = l_Lighting_0:FindFirstChild("Atmosphere");
        if l_Atmosphere_0 then
            l_Atmosphere_0.Parent = script;
            v35:Add(function() --[[ Line: 1580 ]]
                -- upvalues: l_Atmosphere_0 (copy), l_Lighting_0 (ref)
                l_Atmosphere_0.Parent = l_Lighting_0;
            end);
        end;
        v35:Clone(script.AtmosphereLance).Parent = l_Lighting_0;
        local v483 = v35:Clone(script.CarpetLights);
        v83 = v483:GetChildren();
        v483.Parent = v63;
        v63.Parent = workspace;
        v63.Pavillion.Marquee.NowPlayingSign.Gui:FindFirstChild("Text").Text = "NOW PLAYING... <br /> I JUST MIGHT";
        v35:Add(v19.observeTag("HideInLance", function(v484) --[[ Line: 1594 ]]
            local l_Parent_0 = v484.Parent;
            v484.Parent = script;
            return function() --[[ Line: 1597 ]]
                -- upvalues: v484 (copy), l_Parent_0 (copy)
                pcall(function() --[[ Line: 1598 ]]
                    -- upvalues: v484 (ref), l_Parent_0 (ref)
                    v484.Parent = l_Parent_0;
                end);
            end;
        end, {
            workspace, 
            script, 
            l_Lighting_0
        }));
        local l_v52_1 = v52;
        local function v488(v487, ...) --[[ Line: 1605 ]]
            -- upvalues: l_v52_1 (copy)
            return l_v52_1(v487 + 5, ...);
        end;
        local v489 = {};
        local function v492(v490) --[[ Line: 1610 ]] --[[ Name: playInstrumentLooped ]]
            -- upvalues: v489 (copy), v16 (ref), v35 (ref)
            if not v489[v490] and v490:FindFirstChild("Animation") then
                local v491 = v16.loadAnimation(v35, v490.AnimationController.Animator, v490.Animation);
                v491.Looped = true;
                v491:Play();
                v489[v490] = v491;
            end;
        end;
        local function v495(v493) --[[ Line: 1620 ]] --[[ Name: playInstrumentOnce ]]
            -- upvalues: v489 (copy), v16 (ref), v35 (ref)
            local v494 = v489[v493];
            if not v494 and v493:FindFirstChild("Animation") then
                v494 = v16.loadAnimation(v35, v493.AnimationController.Animator, v493.Animation);
                assert(v494);
                v494.Looped = false;
                v489[v493] = v494;
            end;
            if v494 then
                v494:Stop();
                v494:Play();
            end;
        end;
        local l_Instruments_0 = v63.Stage.Rotate.TheRomantic.Instruments;
        v488(2, v492, l_Instruments_0.DrumKit.TomDrum1);
        v488(2, v492, l_Instruments_0.DrumKit.TomDrum2);
        local l_MainLance_1 = v63.Stage.Rotate.TheRomantic.MainLance;
        local v498 = v16.loadAnimation(v35, v63.Stage.Rotate.TheRomantic.CongaLance.Humanoid.Animator, script.LanceConga);
        v498.Looped = true;
        v498:Play();
        v35:Add(v498:GetMarkerReachedSignal("Conga1"):Connect(function() --[[ Line: 1648 ]]
            -- upvalues: v495 (copy), l_Instruments_0 (copy)
            v495(l_Instruments_0.Conga1);
        end));
        v35:Add(v498:GetMarkerReachedSignal("Conga2"):Connect(function() --[[ Line: 1652 ]]
            -- upvalues: v495 (copy), l_Instruments_0 (copy)
            v495(l_Instruments_0.Conga2);
        end));
        local v499 = v16.loadAnimation(v35, v63.Stage.Rotate.TheRomantic.DrumsLance.Humanoid.Animator, script.LanceDrums);
        v499.Looped = true;
        v499:Play();
        v35:Add(v499:GetMarkerReachedSignal("Drum1"):Connect(function() --[[ Line: 1660 ]]
            -- upvalues: v495 (copy), l_Instruments_0 (copy)
            v495(l_Instruments_0.DrumKit.Drum1);
        end));
        v35:Add(v499:GetMarkerReachedSignal("Drum2"):Connect(function() --[[ Line: 1664 ]]
            -- upvalues: v495 (copy), l_Instruments_0 (copy)
            v495(l_Instruments_0.DrumKit.Drum2);
        end));
        v35:Add(v499:GetMarkerReachedSignal("Drum3"):Connect(function() --[[ Line: 1668 ]]
            -- upvalues: v495 (copy), l_Instruments_0 (copy)
            v495(l_Instruments_0.DrumKit.Drum3);
        end));
        local v500 = v16.loadAnimation(v35, v63.Stage.Rotate.TheRomantic.GuitarLance1.Humanoid.Animator, script.LanceGuitar);
        v500.Looped = true;
        v500:Play();
        local v501 = v16.loadAnimation(v35, v63.Stage.Rotate.TheRomantic.GuitarLance2.Humanoid.Animator, script.LanceGuitar);
        v501.Looped = true;
        v501:Play();
        local v502 = v16.loadAnimation(v35, l_MainLance_1.Humanoid.Animator, script.Lance1);
        local v503 = v16.loadAnimation(v35, l_MainLance_1.Humanoid.Animator, script.Lance2);
        local v504 = v16.loadAnimation(v35, l_MainLance_1.Humanoid.Animator, script.Lance4);
        local v505 = v16.loadAnimation(v35, l_MainLance_1.Humanoid.Animator, script.Lance5);
        local v506 = v16.loadAnimation(v35, l_MainLance_1.Humanoid.Animator, script.Lance6);
        local v507 = v16.loadAnimation(v35, l_MainLance_1.Humanoid.Animator, script.Lance8);
        local v508 = {
            [v504] = true
        };
        local v509 = v155(l_MainLance_1.Humanoid.Animator, {
            v502, 
            v503, 
            v504, 
            v505, 
            v506, 
            v507
        }, v508, {
            [v504] = 1.5, 
            [v503] = 0.95, 
            [v505] = 0.3, 
            [v506] = 0.5, 
            [v507] = 0.8
        });
        local l_setPlayingTrack_0 = v509.setPlayingTrack;
        local l_trackPointers_0 = v509.trackPointers;
        local l_tracks_1 = v509.tracks;
        v504:AdjustWeight(1);
        v488(0, l_setPlayingTrack_0, v504);
        v488(5, l_setPlayingTrack_0, v502);
        v488(14, l_setPlayingTrack_0, v503);
        v488(27, l_setPlayingTrack_0, v504);
        v488(36, l_setPlayingTrack_0, v503);
        v488(64, l_setPlayingTrack_0, v506);
        v488(97, l_setPlayingTrack_0, v503);
        v488(117, l_setPlayingTrack_0, v507);
        v488(135, l_setPlayingTrack_0, v505);
        v488(161, l_setPlayingTrack_0, v507);
        v488(180, l_setPlayingTrack_0, v502);
        v64.Play("WhitePlain");
        local l_v70_2 = v70;
        if v133 then
            v35:Remove(v133);
            v133 = nil;
        end;
        if v132[l_v70_2] then
            v133 = v35:Add(v132[l_v70_2]());
        else
            v104(l_v70_2);
        end;
        v488(1.8, v64.Stop);
        v488(2, v64.Play, "RowSpinWhite");
        v488(2, v135, v66);
        v488(2.5, v64.Stop);
        v488(2.5, v135, v70);
        v488(3, v64.Play, "OrangePlain");
        v488(3, v135, v67);
        v488(3.5, v64.Stop);
        v488(3.5, v135, v70);
        v488(4, v64.Play, "OrangePlain");
        v488(4, v135, v67);
        v488(4.5, v64.Stop);
        v488(4.5, v135, v70);
        v488(5, v64.Play, "Mirage");
        v488(5, v135, v67);
        v488(9.2, v64.Stop);
        v488(9.2, v135, v70);
        v488(9.5, v64.Play, "Spiral");
        v488(9.5, v135, v66);
        v488(13, v64.Play, "OrangePlain");
        v488(13, v135, v67);
        v488(13.3, v64.Play, "RedPlain");
        v488(13.3, v135, v69);
        v488(13.5, v64.Play, "OrangePlain");
        v488(13.5, v135, v67);
        v488(13.7, v64.Stop);
        v488(13.7, v135, v70);
        v488(14, v64.Play, "BackAndForth");
        v488(14, v135, v67);
        v488(23, v64.Stop);
        v488(23, v135, v70);
        v488(23.5, v64.Play, "BackAndForth");
        v488(23.5, v135, v67);
        v488(31.5, v64.Stop);
        v488(31.5, v135, v70);
        v488(32, v64.Play, "OrangePlain");
        v488(32, v135, v67);
        v488(32.5, v64.Play, "Crazy");
        v488(32.5, v135, "CRAZY_SEQUENCE");
        v488(36.4, v64.Stop);
        v488(36.4, v135, v70);
        v488(36.7, v64.Play, "Mirage");
        v488(36.7, v135, v66);
        v488(39.6, v64.Stop);
        v488(39.6, v135, v70);
        v488(41, v64.Play, "WhitePlain");
        v488(41, v135, v66);
        v488(41.8, v64.Play, "BackAndForth");
        v488(41.8, v135, v67);
        v488(50, v64.Play, "WhitePlain");
        v488(50, v135, v66);
        v488(50.5, v64.Stop);
        v488(50.5, v135, v70);
        v488(51, v64.Play, "WhitePlain");
        v488(51, v135, v66);
        v488(51.5, v64.Play, "ExtraCrazy");
        v488(51.5, v135, "EXTRA_CRAZY_SEQUENCE");
        v488(62.5, v64.Stop);
        v488(62.5, v135, v70);
        v488(63, v64.Play, "WhitePlain");
        v488(63, v135, v66);
        v488(63.5, v64.Stop);
        v488(63.5, v135, v70);
        v488(64, v64.Play, "WhitePlain");
        v488(64, v135, v66);
        v488(64.5, v64.Stop);
        v488(64.5, v135, v70);
        v488(65, v64.Play, "RowSpinWhite");
        v488(65, v135, v66);
        v488(67, v64.Play, "RowSpinRed");
        v488(67, v135, v69);
        v488(74, v64.Play, "WhitePlain");
        v488(74, v135, v66);
        v488(74.3, v64.Play, "OrangePlain");
        v488(74.3, v135, v67);
        v488(74.6, v64.Play, "WhitePlain");
        v488(74.6, v135, v66);
        v488(74.8, v64.Stop, true);
        v488(74.8, v135, v70);
        v488(75, v64.Play, "RowSpinRed");
        v488(75, v135, v69);
        v488(78, v64.Stop, true);
        v488(78, v135, v70);
        v488(78.5, v64.Play, "WhitePlain");
        v488(78.5, v135, v66);
        v488(84, v64.Play, "OrangePlain");
        v488(84, v135, v67);
        v488(85.5, v64.Play, "WhitePlain");
        v488(85.5, v135, v66);
        v488(88.5, v64.Play, "OrangePlain");
        v488(88.5, v135, v67);
        v488(88.8, v64.Stop, true);
        v488(88.8, v135, v70);
        v488(89.3, v64.Play, "WhitePlain");
        v488(89.3, v135, v66);
        v488(97, v64.Stop, true);
        v488(97, v135, v70);
        v488(98, v64.Play, "Crazy");
        v488(98, v135, "CRAZY_SEQUENCE");
        v488(102.5, v64.Play, "MirageRed");
        v488(102.5, v135, v69);
        v488(106, v64.Play, "OrangePlain");
        v488(106, v135, v67);
        v488(106.4, v64.Play, "WhitePlain");
        v488(106.4, v135, v66);
        v488(107, v64.Stop, true);
        v488(107, v135, v70);
        v488(107.5, v64.Play, "Crazy");
        v488(107.5, v135, "CRAZY_SEQUENCE");
        v488(111.5, v64.Play, "BackAndForthOrange");
        v488(111.5, v135, v67);
        v488(116, v64.Play, "WhitePlain");
        v488(116, v135, v66);
        v488(116.3, v64.Stop, true);
        v488(116.3, v135, v70);
        v488(116.5, v64.Play, "WhitePlain");
        v488(116.5, v135, v66);
        v488(116.8, v64.Stop, true);
        v488(116.8, v135, v70);
        v488(117, v64.Play, "ExtraCrazy");
        v488(117, v135, "EXTRA_CRAZY_SEQUENCE");
        v488(128, v64.Stop, true);
        v488(128, v135, v70);
        v488(128.5, v64.Play, "ExtraCrazy");
        v488(128.5, v135, "EXTRA_CRAZY_SEQUENCE");
        v488(129, v64.Stop);
        v488(129, v135, v70);
        v488(129.5, v64.Play, "WhitePlain");
        v488(129.5, v135, v66);
        v488(129.8, v64.Stop);
        v488(129.8, v135, v70);
        v488(130.3, v64.Play, "WhitePlain");
        v488(130.3, v135, v66);
        v488(130.6, v64.Stop);
        v488(130.6, v135, v70);
        v488(131, v64.Play, "RowSpinWhite");
        v488(131, v135, v66);
        v488(132.5, v64.Play, "RowSpinRed");
        v488(132.5, v135, v69);
        v488(135, v64.Stop);
        v488(135, v135, v70);
        v488(135.5, v64.Play, "BluePlain");
        v488(135.5, v135, v68);
        v488(136, v64.Play, "BackAndForthBlue");
        v488(136, v135, v68);
        v488(157, v64.Play, "WhitePlain");
        v488(157, v135, v66);
        v488(157.5, v64.Stop);
        v488(157.5, v135, v70);
        v488(158, v64.Play, "WhitePlain");
        v488(158, v135, v66);
        v488(158.5, v64.Stop);
        v488(158.5, v135, v70);
        v488(159, v64.Play, "RowSpinWhite");
        v488(159, v135, v66);
        v488(160.5, v64.Play, "RowSpinRed");
        v488(160.5, v135, v69);
        v488(161.7, v64.Stop);
        v488(161.7, v135, v70);
        v488(162.3, v64.Play, "WhitePlain");
        v488(162.3, v135, v66);
        v488(162.6, v64.Stop);
        v488(162.6, v135, v70);
        v488(162.8, v64.Play, "WhitePlain");
        v488(162.8, v135, v66);
        v488(163.2, v64.Play, "ExtraCrazy");
        v488(163.2, v135, "EXTRA_CRAZY_SEQUENCE");
        v488(176, v64.Stop);
        v488(176, v135, v70);
        v488(176.5, v64.Play, "WhitePlain");
        v488(176.5, v135, v66);
        v488(176.7, v64.Stop);
        v488(176.7, v135, v70);
        v488(177, v64.Play, "RowSpinWhite");
        v488(177, v135, v66);
        v488(179, v64.Play, "RowSpinRed");
        v488(179, v135, v69);
        v488(181, v64.Play, "OrangePlain");
        v488(181, v135, v67);
        v488(181.3, v64.Stop);
        v488(181.3, v135, v70);
        v488(181.6, v64.Play, "WhitePlain");
        v488(181.6, v135, v66);
        v488(181.6, v64.Play, "Mirage");
        v488(181.6, v135, v67);
        v488(187.5, v64.Play, "ExtraCrazy");
        v488(187.5, v135, "EXTRA_CRAZY_SEQUENCE");
        v488(193.9, v64.Stop);
        v488(193.9, v135, v70);
        v488(194.4, v64.Play, "WhitePlain");
        v488(194.4, v135, v66);
        v488(194.8, v64.Stop);
        v488(194.8, v135, v70);
        v488(195, v64.Play, "WhitePlain");
        v488(195, v135, v66);
        v488(195.3, v64.Stop);
        v488(195.3, v135, v70);
        v488(195.6, v64.Play, "RowSpinWhite");
        v488(195.6, v135, v66);
        v488(198, v64.Play, "RowSpinRed");
        v488(198, v135, v69);
        v488(200, v64.Play, "Crazy");
        v488(200, v135, "CRAZY_SEQUENCE");
        v488(204, v64.Play, "OrangePlain");
        v488(204, v135, v67);
        v488(204.3, v64.Play, "WhitePlain");
        v488(204.3, v135, v66);
        v488(204.6, v64.Stop);
        v488(204.6, v135, v70);
        v488(205, v64.Play, "Crazy");
        v488(205, v135, "CRAZY_SEQUENCE");
        v488(208, v64.Stop);
        v488(208, v135, v70);
        v488(208.5, v64.Play, "Mirage");
        v488(208.5, v135, v67);
        v488(209, function() --[[ Line: 2038 ]]
            -- upvalues: v136 (ref), l_tracks_1 (copy), l_trackPointers_0 (copy), v500 (copy), v501 (copy), v498 (copy), v499 (copy), l_RunService_0 (ref)
            local v514 = os.clock();
            while true do
                local v515 = (os.clock() - v514) / 0.5;
                local v516 = math.lerp(1, 0, v515);
                v136 = v516;
                for _, v518 in l_tracks_1 do
                    v518:AdjustSpeed(v516);
                    if l_trackPointers_0[v518] then
                        l_trackPointers_0[v518]:AdjustSpeed(v516);
                    end;
                end;
                v500:AdjustSpeed(v516);
                v501:AdjustSpeed(v516);
                v498:AdjustSpeed(v516);
                v499:AdjustSpeed(v516);
                if v515 < 1 then
                    l_RunService_0.PreRender:Wait();
                else
                    break;
                end;
            end;
        end);
        v488(209.5, v64.Stop);
        v488(209.5, v135, v70);
        v488(209.5, function() --[[ Line: 2072 ]]
            -- upvalues: v90 (ref), v26 (ref), v70 (ref), v35 (ref), v17 (ref), v32 (ref), l_v14_ActiveEventData_0 (ref), v65 (ref)
            for _, v520 in v90 do
                v26.target(v520, 1, 3, {
                    Color = v70
                });
            end;
            v35:Add(v17(v32[1], TweenInfo.new((math.max(math.max(l_v14_ActiveEventData_0.startedAt + 215.5 - workspace:GetServerTimeNow(), 0), 0.05))), {
                Volume = 0
            })).Completed:Wait();
            v65.Play(function(v521) --[[ Line: 2084 ]]
                -- upvalues: l_v14_ActiveEventData_0 (ref)
                local l_new_0 = TweenInfo.new;
                local v523 = v521 * 2 + 215.5;
                return l_new_0(math.max(l_v14_ActiveEventData_0.startedAt + v523 - workspace:GetServerTimeNow(), 0), Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
            end);
        end);
        v488(216.5, function() --[[ Line: 2093 ]]
            -- upvalues: l_tracks_1 (copy), v35 (ref), v480 (ref)
            for _, v525 in l_tracks_1 do
                v35:Add(task.delay(5, v525.Stop, v525, 0));
            end;
            v480();
        end);
    end;
    v35:Add((v48(0, 5, function(v527) --[[ Line: 2102 ]]
        -- upvalues: v35 (ref), v17 (ref), v62 (copy), v11 (ref), v526 (copy), l_Lighting_0 (ref), l_v14_ActiveEventData_0 (copy)
        v35:Add(v17(v62, TweenInfo.new(v527(), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            Brightness = -1.2
        }));
        v11:Run("LanceEvent", "GrassRecolor");
        v35:Add(function() --[[ Line: 2108 ]]
            -- upvalues: v11 (ref)
            v11:Stop("LanceEvent", "GrassRecolor");
        end);
        v35:Add(task.delay(v527(), function() --[[ Line: 2112 ]]
            -- upvalues: v526 (ref), l_Lighting_0 (ref), v62 (ref), v35 (ref), v17 (ref), l_v14_ActiveEventData_0 (ref)
            v526();
            l_Lighting_0.Brightness = 1;
            l_Lighting_0.Ambient = Color3.fromRGB(0, 0, 0);
            l_Lighting_0.GlobalShadows = false;
            l_Lighting_0.OutdoorAmbient = Color3.fromRGB(20, 20, 20);
            l_Lighting_0.ExposureCompensation = 1.5;
            v62.Saturation = 0.15;
            v62.Contrast = -0.1;
            v35:Add(function() --[[ Line: 2122 ]]
                -- upvalues: l_Lighting_0 (ref)
                l_Lighting_0.Brightness = 2;
                l_Lighting_0.GlobalShadows = true;
                l_Lighting_0.Ambient = Color3.fromRGB(241, 241, 241);
                l_Lighting_0.OutdoorAmbient = Color3.fromRGB(212, 212, 212);
                l_Lighting_0.ExposureCompensation = 0;
            end);
            v35:Add(v17(v62, TweenInfo.new(math.max(l_v14_ActiveEventData_0.startedAt + 6 - workspace:GetServerTimeNow(), 0), Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                Brightness = -0.1
            }));
        end));
    end)));
    v15:Update();
    v13:UpdateOST();
end;
v8.OnStop = function(_) --[[ Line: 2140 ]] --[[ Name: OnStop ]]
    -- upvalues: v35 (copy)
    v35:Destroy();
end;
v8.OnLoad = function(_) --[[ Line: 2144 ]] --[[ Name: OnLoad ]]
    -- upvalues: l_ContentProvider_0 (copy), v9 (copy), v32 (copy)
    task.spawn(pcall, function() --[[ Line: 2145 ]]
        -- upvalues: l_ContentProvider_0 (ref)
        l_ContentProvider_0:PreloadAsync(script:GetChildren());
    end);
    task.spawn(pcall, function() --[[ Line: 2149 ]]
        -- upvalues: v9 (ref), v32 (ref), l_ContentProvider_0 (ref)
        v9:WaitForAssetId("rbxassetid://80460751675093");
        v32[1].SoundId = "rbxassetid://80460751675093";
        l_ContentProvider_0:PreloadAsync({
            v32[1]
        });
    end);
    task.spawn(pcall, function() --[[ Line: 2155 ]]
        -- upvalues: v9 (ref), v32 (ref), l_ContentProvider_0 (ref)
        v9:WaitForAssetId("rbxassetid://129124740133884");
        v32[2].SoundId = "rbxassetid://129124740133884";
        l_ContentProvider_0:PreloadAsync({
            v32[2]
        });
    end);
end;
return v8;