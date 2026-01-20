local v0 = {};
local _ = require(script.Types);
local v2 = require(script.Specials);
local v3 = require(script.EaseFuncs);
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("HttpService");
if l_RunService_0:IsServer() and l_RunService_0:IsStudio() then
    warn("Moonlite should NOT be used on the server! Rig transforms will not be replicated.");
end;
local v6 = {};
v6.__index = v6;
local v7 = {
    Instance = true, 
    boolean = true, 
    string = true, 
    ["nil"] = true
};
local v8 = {};
local function v12(v9, v10, v11) --[[ Line: 99 ]] --[[ Name: lerp ]]
    if type(v9) == "number" then
        return (math.lerp(v9, v10, v11));
    else
        return v9:Lerp(v10, v11);
    end;
end;
local function v13(v14) --[[ Line: 107 ]] --[[ Name: deepCopy ]]
    -- upvalues: v13 (copy)
    local v15 = {};
    for v16, v17 in next, v14 do
        v15[if type(v16) == "table" then v13(v16) else v16] = if type(v17) == "table" then v13(v17) else v17;
    end;
    return v15;
end;
local function v19(v18) --[[ Line: 116 ]] --[[ Name: toPath ]]
    return table.concat(v18.InstanceNames, ".");
end;
local function v24(v20) --[[ Line: 120 ]] --[[ Name: instanceToMoonAnimPath ]]
    if not v20:IsDescendantOf(game) then
        error("Instance is not descendant of game");
    end;
    local v21 = {};
    local v22 = {};
    local l_v20_0 = v20;
    while l_v20_0 ~= game do
        table.insert(v21, 1, l_v20_0.Name);
        table.insert(v22, 1, l_v20_0.ClassName);
        l_v20_0 = l_v20_0.Parent;
    end;
    table.insert(v21, 1, "game");
    table.insert(v22, 1, "DataModel");
    return {
        InstanceTypes = v22, 
        ItemType = v20.ClassName, 
        InstanceNames = v21
    };
end;
local function v35(v25, v26) --[[ Line: 145 ]] --[[ Name: resolveAnimPath ]]
    if not v25 then
        return nil;
    else
        local v27 = #v25.InstanceNames;
        local v28 = v26 or game;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 153 ]]
            -- upvalues: v27 (copy), v25 (copy), v28 (ref)
            for v29 = 2, v27 do
                local v30 = v25.InstanceNames[v29];
                local v31 = v25.InstanceTypes[v29];
                if v30 == "CoreGui" then
                    v25.InstanceNames[v29] = "ReplicatedStorage";
                    v25.InstanceTypes[v29] = "ReplicatedStorage";
                    v30 = v25.InstanceNames[v29];
                    v31 = v25.InstanceTypes[v29];
                end;
                local l_v28_FirstChild_0 = v28:FindFirstChild(v30);
                assert(typeof(l_v28_FirstChild_0) == "Instance");
                assert(l_v28_FirstChild_0.ClassName == v31);
                v28 = l_v28_FirstChild_0;
            end;
        end);
        if l_status_0 then
            return v28;
        else
            warn("!! PATH RESOLVE FAILED:", table.concat(v25.InstanceNames, "."), "\n", l_result_0);
            return nil;
        end;
    end;
end;
local function v55(v36) --[[ Line: 181 ]] --[[ Name: resolveJoints ]]
    local v37 = {};
    local v38 = {};
    for _, v40 in v36:GetDescendants() do
        if v40:IsA("Motor6D") and v40.Active then
            local l_Part1_0 = v40.Part1;
            local v42 = l_Part1_0 and l_Part1_0.Name;
            if v42 then
                v37[v42] = {
                    Name = v42, 
                    Joint = v40, 
                    Children = {}
                };
            end;
        elseif v40:IsA("Bone") then
            local l_Name_0 = v40.Name;
            v37[l_Name_0] = {
                Name = l_Name_0, 
                Joint = v40, 
                Children = {}
            };
        end;
    end;
    for v44, v45 in v37 do
        local l_Joint_0 = v45.Joint;
        if l_Joint_0:IsA("Motor6D") then
            local l_Part0_0 = l_Joint_0.Part0;
            if l_Part0_0 then
                local v48 = v37[l_Part0_0.Name];
                if v48 then
                    v48.Children[v44] = v45;
                    v45.Parent = v48;
                end;
            end;
        elseif l_Joint_0:IsA("Bone") then
            local l_Parent_0 = l_Joint_0.Parent;
            if l_Parent_0 then
                local v50 = v37[l_Parent_0.Name];
                if v50 then
                    v50.Children[v44] = v45;
                    v45.Parent = v50;
                end;
            end;
        end;
    end;
    for _, v52 in v37 do
        local l_Name_1 = v52.Name;
        local l_Parent_1 = v52.Parent;
        while l_Parent_1 do
            l_Name_1 = ("%*.%*"):format(l_Parent_1.Name, l_Name_1);
            l_Parent_1 = l_Parent_1.Parent;
        end;
        v38[l_Name_1] = v52;
    end;
    return v38;
end;
local function v63(v56) --[[ Line: 248 ]] --[[ Name: parseEase ]]
    local l_Type_0 = v56:FindFirstChild("Type");
    local l_Params_0 = v56:FindFirstChild("Params");
    local v59 = {
        Type = assert(if l_Type_0 and l_Type_0:IsA("StringValue") then l_Type_0.Value else nil), 
        Params = {}
    };
    if l_Params_0 then
        for _, v61 in l_Params_0:GetChildren() do
            if v61:IsA("ValueBase") then
                local l_Value_0 = v61.Value;
                v59.Params[v61.Name] = l_Value_0;
            end;
        end;
    end;
    return v59;
end;
local function v67(v64) --[[ Line: 273 ]] --[[ Name: parseEaseOld ]]
    local l_Style_0 = v64:FindFirstChild("Style");
    assert(l_Style_0 and l_Style_0:IsA("StringValue"), "No style in legacy ease!");
    local l_Direction_0 = v64:FindFirstChild("Direction");
    assert(l_Direction_0 and l_Direction_0:IsA("StringValue"), "No direction in legacy ease!");
    return {
        Type = l_Style_0.Value, 
        Params = {
            Direction = l_Direction_0.Value
        }
    };
end;
local function v72(v68) --[[ Line: 289 ]] --[[ Name: readValue ]]
    if v68:IsA("ValueBase") then
        local v69 = if tonumber(v68.Name) then assert(v68.Parent) else v68;
        local l_Value_1 = v68.Value;
        local l_EnumType_0 = v69:FindFirstChild("EnumType");
        if l_EnumType_0 and l_EnumType_0:IsA("StringValue") then
            return Enum[l_EnumType_0.Value][l_Value_1];
        elseif v69:FindFirstChild("Vector2") then
            return (Vector2.new(l_Value_1.X, l_Value_1.Y));
        elseif v69:FindFirstChild("ColorSequence") then
            return (ColorSequence.new(l_Value_1));
        elseif v69:FindFirstChild("NumberSequence") then
            return (NumberSequence.new(l_Value_1));
        else
            if v69:FindFirstChild("NumberRange") then
                l_Value_1 = NumberRange.new(l_Value_1);
            end;
            return l_Value_1;
        end;
    else
        return v68:GetAttribute("Value");
    end;
end;
local function v78(v73, v74, v75) --[[ Line: 317 ]] --[[ Name: getPropValue ]]
    -- upvalues: v2 (copy)
    if v74 then
        local v76 = v2.Get(v73._scratch, v74, v75);
        if v76 then
            local l_Get_0 = v76.Get;
            if l_Get_0 then
                return pcall(l_Get_0, v74);
            else
                return true, v76.Default;
            end;
        end;
    end;
    return pcall(function() --[[ Line: 332 ]]
        -- upvalues: v74 (copy), v75 (copy)
        return v74[v75];
    end);
end;
local function v85(v79, v80, v81, v82, v83) --[[ Line: 337 ]] --[[ Name: setPropValue ]]
    -- upvalues: v2 (copy)
    if v80 then
        local v84 = v2.Get(v79._scratch, v80, v81);
        if v84 then
            if v84.Get == nil and v83 and v82 == true then
                v82 = false;
            end;
            return pcall(v84.Set, v82);
        end;
    end;
    return pcall(function() --[[ Line: 354 ]]
        -- upvalues: v80 (copy), v81 (copy), v82 (ref)
        v80[v81] = v82;
    end);
end;
local function v102(v86) --[[ Line: 359 ]] --[[ Name: parseKeyframePack ]]
    -- upvalues: v72 (copy), v63 (copy), v67 (copy)
    local v87 = tonumber(v86.Name);
    assert(v87, "Bad frame number");
    local l_Values_0 = v86:FindFirstChild("Values");
    assert(l_Values_0, "No value folder!");
    assert(l_Values_0:FindFirstChild("0"), "No starting value!");
    local v89 = {};
    local v90 = 0;
    for _, v92 in l_Values_0:GetChildren() do
        local v93 = tonumber(v92.Name);
        if v93 then
            local l_status_1, l_result_1 = pcall(v72, v92);
            if l_status_1 then
                v89[v93] = l_result_1;
                v90 = math.max(v93, v90);
            end;
        end;
    end;
    local l_Eases_0 = v86:FindFirstChild("Eases");
    local l_Ease_0 = v86:FindFirstChild("Ease");
    local v98 = {};
    if l_Eases_0 then
        for _, v100 in l_Eases_0:GetChildren() do
            local v101 = tonumber(v100.Name);
            assert(v101, (("Bad index on ease @%*"):format((v100:GetFullName()))));
            v98[v101] = v63(v100);
        end;
    elseif l_Ease_0 then
        v98[v90] = v67(l_Ease_0);
    end;
    return {
        FrameIndex = v87, 
        FrameCount = v90, 
        Values = v89, 
        Eases = v98
    };
end;
local function v120(v103, v104) --[[ Line: 410 ]] --[[ Name: unpackKeyframes ]]
    -- upvalues: v102 (copy)
    local v105 = {};
    local v106 = {};
    local v107 = {};
    for _, v109 in v103:GetChildren() do
        local v110 = tonumber(v109.Name);
        if v110 then
            v105[v110] = v102(v109);
            table.insert(v106, v110);
        end;
    end;
    table.sort(v106);
    for v111 = 2, #v106 do
        local v112 = v105[v106[v111 - 1]];
        local v113 = v105[v106[v111]];
        v112.Next = v113;
        v113.Prev = v112;
    end;
    local v114 = v105[v106[1]];
    while v114 do
        local l_FrameIndex_0 = v114.FrameIndex;
        local v116 = nil;
        for v117 = 0, v114.FrameCount do
            local v118 = v114.Eases[v117] or v116;
            local v119 = v114.Values[v117];
            if v119 ~= nil then
                if v104 then
                    v119 = v104(v119);
                end;
                table.insert(v107, {
                    Time = l_FrameIndex_0 + v117, 
                    Value = v119, 
                    Ease = v118
                });
                if v118 then
                    v116 = v118;
                end;
            end;
        end;
        v114 = v114.Next;
    end;
    return v107;
end;
local function _(v121, v122) --[[ Line: 468 ]] --[[ Name: readValueBase ]]
    local l_v121_FirstChild_0 = v121:FindFirstChild(v122);
    assert(l_v121_FirstChild_0 and l_v121_FirstChild_0:IsA("ValueBase"));
    return l_v121_FirstChild_0.Value;
end;
local function v167(v125, v126, v127) --[[ Line: 474 ]] --[[ Name: compileItem ]]
    -- upvalues: v35 (copy), v55 (copy), v72 (copy), v120 (copy), v2 (copy)
    assert(v125._data and v125._save, "This track is already compiled from source");
    local v128 = table.find(v125._data.Items, v126);
    if not v128 then
        return;
    else
        local l_Path_0 = v126.Path;
        local l_ItemType_0 = l_Path_0.ItemType;
        local v131 = v126.Override or v35(l_Path_0, v125._root);
        local l_FirstChild_0 = v125._save:FindFirstChild((tostring(v128)));
        if not v131 or not l_FirstChild_0 then
            return;
        else
            assert(v131);
            assert(l_FirstChild_0);
            local l_Rig_0 = l_FirstChild_0:FindFirstChild("Rig");
            local l_MarkerTrack_0 = l_FirstChild_0:FindFirstChild("MarkerTrack");
            if l_Rig_0 and l_ItemType_0 == "Rig" then
                local v135 = v55(v131);
                for _, v137 in l_Rig_0:GetChildren() do
                    if v137.Name == "_joint" then
                        local l__hier_0 = v137:FindFirstChild("_hier");
                        local l_default_0 = v137:FindFirstChild("default");
                        local l__keyframes_0 = v137:FindFirstChild("_keyframes");
                        if l_default_0 then
                            l_default_0 = v72(l_default_0);
                        end;
                        do
                            local l_l_default_0_0 = l_default_0;
                            if l__hier_0 and l__keyframes_0 then
                                local v142 = v135[v72(l__hier_0)];
                                if v142 then
                                    local l_Joint_1 = v142.Joint;
                                    v127[l_Joint_1] = {
                                        Props = {
                                            Transform = {
                                                Default = CFrame.identity, 
                                                Sequence = if l_Joint_1:IsA("Motor6D") then v120(l__keyframes_0, function(v144) --[[ Line: 526 ]]
                                                    -- upvalues: l_l_default_0_0 (ref)
                                                    return v144:Inverse() * l_l_default_0_0;
                                                end) else v120(l__keyframes_0, function(v145) --[[ Line: 529 ]]
                                                    return v145;
                                                end)
                                            }
                                        }, 
                                        Target = l_Joint_1
                                    };
                                end;
                            end;
                        end;
                    end;
                end;
            end;
            local v146 = {};
            for _, v148 in l_FirstChild_0:GetChildren() do
                if v148:IsA("Folder") and v148 ~= l_MarkerTrack_0 and v148.Name ~= "Rig" then
                    local l_default_1 = v148:FindFirstChild("default");
                    local l_Name_2 = v148.Name;
                    if l_default_1 then
                        l_default_1 = v72(l_default_1);
                    end;
                    local v151 = v2.Static(v131, l_Name_2);
                    v146[l_Name_2] = {
                        Default = l_default_1, 
                        Static = if v151 == false then nil else v151, 
                        Sequence = v120(v148)
                    };
                end;
            end;
            v127[v131] = {
                Props = v146, 
                Target = v131
            };
            if l_MarkerTrack_0 then
                local v152 = {};
                v125._markers[v131] = v152;
                for _, v154 in l_MarkerTrack_0:GetChildren() do
                    if v154:FindFirstChild("name") then
                        local v155 = assert((tonumber(v154.Name)));
                        local l_width_0 = v154:FindFirstChild("width");
                        assert(l_width_0 and l_width_0:IsA("ValueBase"));
                        local l_Value_2 = l_width_0.Value;
                        local l_name_0 = v154:FindFirstChild("name");
                        assert(l_name_0 and l_name_0:IsA("ValueBase"));
                        l_width_0 = l_name_0.Value;
                        l_name_0 = {};
                        local l_KFMarkers_0 = v154:FindFirstChild("KFMarkers");
                        if l_KFMarkers_0 then
                            for _, v161 in l_KFMarkers_0:GetChildren() do
                                if v161:IsA("ValueBase") then
                                    local l_Value_3 = v161.Value;
                                    local l_Val_0 = v161:FindFirstChild("Val");
                                    assert(l_Val_0 and l_Val_0:IsA("ValueBase"));
                                    l_name_0[l_Value_3] = l_Val_0.Value;
                                end;
                            end;
                        end;
                        local v164 = v152[v155];
                        if not v164 then
                            v164 = {
                                StartMarkers = {}, 
                                EndMarkers = {}
                            };
                            v152[v155] = v164;
                        end;
                        if l_Value_2 > 0 then
                            local v165 = math.min(v155 + l_Value_2, v125.Frames);
                            local v166 = v152[v165];
                            if not v166 then
                                v166 = {
                                    StartMarkers = {}, 
                                    EndMarkers = {}
                                };
                                v152[v165] = v166;
                            end;
                            v166.EndMarkers[l_width_0] = l_name_0;
                        end;
                        v164.StartMarkers[l_width_0] = l_name_0;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v190(v168) --[[ Line: 627 ]] --[[ Name: getInterpolator ]]
    -- upvalues: v7 (copy), v12 (copy)
    if typeof(v168) == "ColorSequence" then
        return function(v169, v170, v171) --[[ Line: 629 ]]
            local l_Value_4 = v169.Keypoints[1].Value;
            local l_Value_5 = v170.Keypoints[1].Value;
            local v174 = if type(l_Value_4) == "number" then math.lerp(l_Value_4, l_Value_5, v171) else l_Value_4:Lerp(l_Value_5, v171);
            return ColorSequence.new(v174);
        end;
    elseif typeof(v168) == "NumberSequence" then
        return function(v175, v176, v177) --[[ Line: 634 ]]
            local l_Value_6 = v175.Keypoints[1].Value;
            local l_Value_7 = v176.Keypoints[1].Value;
            local v180 = if type(l_Value_6) == "number" then math.lerp(l_Value_6, l_Value_7, v177) else l_Value_6:Lerp(l_Value_7, v177);
            return NumberSequence.new(v180);
        end;
    elseif typeof(v168) == "NumberRange" then
        return function(v181, v182, v183) --[[ Line: 639 ]]
            local l_Min_0 = v181.Min;
            local l_Min_1 = v182.Min;
            local v186 = if type(l_Min_0) == "number" then math.lerp(l_Min_0, l_Min_1, v183) else l_Min_0:Lerp(l_Min_1, v183);
            return NumberRange.new(v186);
        end;
    elseif v7[typeof(v168)] then
        return function(v187, v188, v189) --[[ Line: 644 ]]
            if v189 >= 1 then
                return v188;
            else
                return v187;
            end;
        end;
    else
        return v12;
    end;
end;
local function v213(v191, v192) --[[ Line: 656 ]] --[[ Name: compileFrames ]]
    -- upvalues: v190 (copy), v3 (copy)
    local l__buffer_0 = v191._buffer;
    local l__elements_0 = v191._elements;
    for v195, v196 in v192 do
        local v197 = {};
        l__buffer_0[v195] = v197;
        table.insert(l__elements_0, v195);
        for v198, v199 in v196.Props do
            if v199.Sequence[1] then
                local v200 = nil;
                local v201 = 0;
                local l_Default_0 = v199.Default;
                local v203 = v190(v199.Sequence[1].Value);
                for _, v205 in v199.Sequence do
                    if not v197[v205.Time] then
                        v197[v205.Time] = {};
                    end;
                    local v206 = v205.Time - v201;
                    v197[v205.Time][v198] = v205.Value;
                    if v206 <= 1 then
                        l_Default_0 = v205.Value;
                        v200 = v205.Ease;
                        v201 = v205.Time;
                    else
                        if not v199.Static then
                            local v207 = v3.Get(v200);
                            for v208 = 0, v206 do
                                local v209 = v207(v208 / v206);
                                local v210 = v201 + v208;
                                if not v197[v210] then
                                    v197[v210] = {};
                                end;
                                v197[v210][v198] = v203(l_Default_0, v205.Value, v209);
                            end;
                        end;
                        v200 = v205.Ease;
                        l_Default_0 = v205.Value;
                        v201 = v205.Time;
                    end;
                end;
                if not v199.Static and v201 < v191.Frames then
                    local v211 = v197[v201][v198];
                    for v212 = v201, v191.Frames do
                        if not v197[v212] then
                            v197[v212] = {};
                        end;
                        v197[v212][v198] = v211;
                    end;
                end;
            end;
        end;
    end;
end;
local function v218(v214) --[[ Line: 725 ]] --[[ Name: compileRouting ]]
    -- upvalues: v167 (copy), v213 (copy)
    assert(v214._data and v214._save, "This track is already compiled from source");
    table.clear(v214._buffer);
    table.clear(v214._elements);
    table.clear(v214._markers);
    local v215 = {};
    for _, v217 in v214._data.Items do
        v167(v214, v217, v215);
    end;
    v213(v214, v215);
    v214._compiled = true;
end;
local function v225(v219) --[[ Line: 742 ]] --[[ Name: restoreTrack ]]
    -- upvalues: v8 (copy), v85 (copy)
    local v220 = v8[v219];
    if not v220 then
        return;
    else
        if v219.RestoreDefaults then
            for v221, v222 in v220 do
                for v223, v224 in v222 do
                    v85(v219, v221, v223, v224);
                end;
            end;
            v85(v219, workspace.CurrentCamera, "AttachToPart", nil);
            v85(v219, workspace.CurrentCamera, "LookAtPart", nil);
        end;
        table.clear(v219._lastSteppedFrames);
        v8[v219] = nil;
        return;
    end;
end;
local function v242(v226, v227) --[[ Line: 765 ]] --[[ Name: stepTrack ]]
    -- upvalues: v85 (copy)
    local v228 = math.floor(v226.TimePosition * v226.FrameRate);
    if v226.Frames < v228 then
        if v226.Looped then
            v228 = 0;
            v226.TimePosition = 0;
            v226.CurrentFrame = 0;
            table.clear(v226._lastSteppedFrames);
            v226._onLoop:Fire();
        else
            v226._completed:Fire(Enum.PlaybackState.Completed);
            return true;
        end;
    end;
    for v229 = v226.CurrentFrame, v228 do
        for v230, v231 in v226._buffer do
            if v226._locks[v230] == nil then
                local v232 = v231[v229] or v226._lastSteppedFrames[v230];
                if v232 then
                    v226._lastSteppedFrames[v230] = v232;
                    for v233, v234 in v232 do
                        v85(v226, v230, v233, v234);
                    end;
                end;
            end;
        end;
        for v235, v236 in v226._markers do
            local v237 = v236[v229];
            if v237 then
                for v238, v239 in v237.StartMarkers do
                    if v226._markerSignals[v238] then
                        v226._markerSignals[v238]:Fire(v235, v239);
                    end;
                end;
                for v240, v241 in v237.EndMarkers do
                    if v226._endMarkerSignals[v240] then
                        v226._endMarkerSignals[v240]:Fire(v235, v241);
                    end;
                end;
            end;
        end;
    end;
    v226.CurrentFrame = v228;
    v226.TimePosition = v226.TimePosition + v227;
    return false;
end;
v0.CreatePlayer = function(v243, v244) --[[ Line: 823 ]] --[[ Name: CreatePlayer ]]
    -- upvalues: v13 (copy), v6 (copy)
    local l_BindableEvent_0 = Instance.new("BindableEvent");
    local l_BindableEvent_1 = Instance.new("BindableEvent");
    local v247 = v13(v243);
    return (setmetatable({
        Completed = l_BindableEvent_0.Event, 
        OnLoop = l_BindableEvent_1.Event, 
        Looped = v247.Information.Looped, 
        Frames = v247.Information.Length, 
        FrameRate = v247.Information.FPS or 60, 
        RestoreDefaults = true, 
        TimePosition = 0, 
        CurrentFrame = 0, 
        _moduleInfo = v247, 
        _compiled = false, 
        _completed = l_BindableEvent_0, 
        _onLoop = l_BindableEvent_1, 
        _markers = {}, 
        _markerSignals = {}, 
        _endMarkerSignals = {}, 
        _locks = {}, 
        _elements = {}, 
        _buffer = {}, 
        _lastSteppedFrames = {}, 
        _scratch = {}, 
        _root = v244
    }, v6));
end;
v6.Compile = function(v248) --[[ Line: 861 ]] --[[ Name: Compile ]]
    -- upvalues: v218 (copy), v35 (copy), v213 (copy)
    if v248._save then
        v218(v248);
        return v248;
    else
        if v248._moduleInfo then
            local v249 = {};
            for v250, v251 in v248._moduleInfo.Compiled do
                v250 = v251.Path or v250;
                local v252 = v251.Override or v35(v250, v248._root);
                if v252 then
                    for _, v254 in v251.Props do
                        local l_Default_1 = v254.Default;
                        if type(l_Default_1) == "table" and type(l_Default_1.ItemType) == "string" then
                            l_Default_1 = l_Default_1.Override or v35(l_Default_1, v248._root);
                        end;
                        v254.Default = l_Default_1;
                        for _, v257 in v254.Sequence do
                            local l_Value_8 = v257.Value;
                            if type(l_Value_8) == "table" and type(l_Value_8.ItemType) == "string" then
                                l_Value_8 = l_Value_8.Override or v35(l_Value_8, v248._root);
                            end;
                            v257.Value = l_Value_8;
                        end;
                    end;
                    v249[v252] = v251;
                end;
            end;
            v213(v248, v249);
            v248._compiled = true;
        end;
        return v248;
    end;
end;
v6.Destroy = function(v259) --[[ Line: 899 ]] --[[ Name: Destroy ]]
    for _, v261 in v259._markerSignals do
        v261:Destroy();
    end;
    for _, v263 in v259._endMarkerSignals do
        v263:Destroy();
    end;
    v259._completed:Destroy();
    table.clear(v259._markerSignals);
    table.clear(v259._endMarkerSignals);
end;
v6.IsPlaying = function(v264) --[[ Line: 913 ]] --[[ Name: IsPlaying ]]
    -- upvalues: v8 (copy)
    return v8[v264] ~= nil;
end;
v6.GetTimeLength = function(v265) --[[ Line: 917 ]] --[[ Name: GetTimeLength ]]
    return v265.Frames / v265.FrameRate;
end;
v6.GetMarkerReachedSignal = function(v266, v267) --[[ Line: 921 ]] --[[ Name: GetMarkerReachedSignal ]]
    if not v266._markerSignals[v267] then
        v266._markerSignals[v267] = Instance.new("BindableEvent");
    end;
    return v266._markerSignals[v267].Event;
end;
v6.GetMarkerEndedSignal = function(v268, v269) --[[ Line: 929 ]] --[[ Name: GetMarkerEndedSignal ]]
    if not v268._endMarkerSignals[v269] then
        v268._endMarkerSignals[v269] = Instance.new("BindableEvent");
    end;
    return v268._endMarkerSignals[v269].Event;
end;
v6.GetSetting = function(v270, v271) --[[ Line: 937 ]] --[[ Name: GetSetting ]]
    return v270._scratch[v271];
end;
v6.SetSetting = function(v272, v273, v274) --[[ Line: 941 ]] --[[ Name: SetSetting ]]
    v272._scratch[v273] = v274;
end;
v6.GetElements = function(v275) --[[ Line: 945 ]] --[[ Name: GetElements ]]
    return table.clone(v275._elements);
end;
v6.LockElement = function(v276, v277, v278) --[[ Line: 949 ]] --[[ Name: LockElement ]]
    if not v276._locks[v277] then
        v276._locks[v277] = {};
    end;
    if v278 then
        v276._locks[v277][v278 or "Default"] = true;
    end;
    return true;
end;
v6.UnlockElement = function(v279, v280, v281) --[[ Line: 961 ]] --[[ Name: UnlockElement ]]
    local v282 = v279._locks[v280];
    if v282 then
        v282[v281 or "Default"] = nil;
        if not next(v282) then
            v279._locks[v280] = nil;
        end;
    end;
    return true;
end;
v6.IsElementLocked = function(v283, v284) --[[ Line: 975 ]] --[[ Name: IsElementLocked ]]
    return v283._locks[v284] ~= nil;
end;
v6.ReplaceElementByPath = function(v285, v286, v287) --[[ Line: 979 ]] --[[ Name: ReplaceElementByPath ]]
    -- upvalues: v19 (copy)
    v286 = string.lower(v286);
    if v285._data then
        for _, v289 in v285._data.Items do
            local l_Path_1 = v289.Path;
            if string.lower(v19(l_Path_1)) == v286 and (l_Path_1.ItemType == "Rig" or v287:IsA(l_Path_1.ItemType)) then
                v289.Override = v287;
                return true;
            end;
        end;
    elseif v285._moduleInfo then
        local v291 = false;
        for v292, v293 in v285._moduleInfo.Compiled do
            local v294 = v293.Path or v292;
            local l_ItemType_1 = v294.ItemType;
            if string.lower(v19(v294)) == v286 and (l_ItemType_1 == "Rig" or v287:IsA(v294.ItemType)) then
                v293.Override = v287;
                v291 = true;
            end;
            for _, v297 in v293.Props do
                local l_Default_2 = v297.Default;
                if type(l_Default_2) == "table" and type(l_Default_2.ItemType) == "string" and v286 == string.lower(v19(l_Default_2)) and (l_Default_2.ItemType == "Rig" or v287:IsA(l_Default_2.ItemType)) then
                    v293.Override = v287;
                    v291 = true;
                end;
                for _, v300 in v297.Sequence do
                    local l_Value_9 = v300.Value;
                    if type(l_Value_9) == "table" and type(l_Value_9.ItemType) == "string" and v286 == string.lower(v19(l_Value_9)) and (l_Value_9.ItemType == "Rig" or v287:IsA(l_Value_9.ItemType)) then
                        v293.Override = v287;
                        v291 = true;
                    end;
                end;
            end;
        end;
        return v291;
    end;
    return false;
end;
v6.FindElement = function(v302, v303) --[[ Line: 1036 ]] --[[ Name: FindElement ]]
    for _, v305 in v302._elements do
        if v305 and v305.Name == v303 then
            return v305;
        end;
    end;
    return nil;
end;
v6.FindElementOfType = function(v306, v307) --[[ Line: 1046 ]] --[[ Name: FindElementOfType ]]
    for _, v309 in v306._elements do
        if v309 and v309:IsA(v307) then
            return v309;
        end;
    end;
    return nil;
end;
v6.Stop = function(v310) --[[ Line: 1056 ]] --[[ Name: Stop ]]
    -- upvalues: v225 (copy)
    v310.TimePosition = 0;
    v310.CurrentFrame = 0;
    table.clear(v310._lastSteppedFrames);
    task.spawn(v225, v310);
    v310._completed:Fire(Enum.PlaybackState.Cancelled);
end;
v6.Reset = function(v311) --[[ Line: 1064 ]] --[[ Name: Reset ]]
    -- upvalues: v242 (copy)
    v311.TimePosition = 0;
    v311.CurrentFrame = 0;
    v242(v311, 0);
    return true;
end;
v6.Play = function(v312) --[[ Line: 1072 ]] --[[ Name: Play ]]
    -- upvalues: v8 (copy), v78 (copy)
    assert(v312._compiled, "Track is not compiled.");
    if v8[v312] then
        return;
    else
        if v312.TimePosition >= v312:GetTimeLength() then
            v312.TimePosition = 0;
            v312.CurrentFrame = 0;
        end;
        table.clear(v312._lastSteppedFrames);
        local v313 = {};
        for v314, v315 in v312._buffer do
            if v315[0] then
                local v316 = {};
                v313[v314] = v316;
                for v317 in v315[0] do
                    local v318, v319 = v78(v312, v314, v317);
                    if v318 then
                        v316[v317] = v319;
                    end;
                end;
            end;
        end;
        v8[v312] = v313;
        v312._completed:Fire(Enum.PlaybackState.Playing);
        return;
    end;
end;
l_RunService_0.PreSimulation:Connect(function(v320) --[[ Line: 1107 ]]
    -- upvalues: v8 (copy), v242 (copy), v225 (copy)
    debug.profilebegin("Moonlite:stepTracks");
    for v321 in v8 do
        if v242(v321, v320) then
            v225(v321);
        end;
    end;
    debug.profileend();
end);
v0.instanceToMoonAnimPath = v24;
v0.resolveAnimPath = v35;
v0.toPathString = v19;
return v0;