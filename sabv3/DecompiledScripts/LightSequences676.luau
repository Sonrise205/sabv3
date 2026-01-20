local l_TweenService_0 = game:GetService("TweenService");
local v1 = {};
local l_Lights_0 = script.Parent.Rotate.TheRomantic.Ceiling.Lights;
local v3 = Color3.fromRGB(180, 144, 120);
local v4 = Color3.fromRGB(195, 128, 89);
local v5 = Color3.fromRGB(111, 73, 61);
local v6 = Color3.fromRGB(90, 192, 217);
local v7 = Color3.fromRGB(90, 180, 90);
local v8 = Color3.fromRGB(40, 93, 180);
local v9 = Color3.fromRGB(255, 0, 0);
local v10 = Color3.fromRGB(0, 0, 0);
local v11 = {
    "1"
};
local v12 = {
    "2a", 
    "2b", 
    "2c", 
    "2d", 
    "2e"
};
local v13 = {
    "3a", 
    "3b", 
    "3c", 
    "3d", 
    "3e"
};
local v14 = {
    "4a", 
    "4b", 
    "4c", 
    "4d", 
    "4e"
};
local v15 = {
    "5a", 
    "5b", 
    "5c", 
    "5d", 
    "5e"
};
local v16 = {
    "1", 
    "2a", 
    "2b", 
    "2c", 
    "2d", 
    "2e", 
    "3a", 
    "3b", 
    "3c", 
    "3d", 
    "3e", 
    "4a", 
    "4b", 
    "4c", 
    "4d", 
    "4e", 
    "5a", 
    "5b", 
    "5c", 
    "5d", 
    "5e"
};
local v17 = {};
local function v20() --[[ Line: 36 ]] --[[ Name: RefreshLights ]]
    -- upvalues: v17 (copy), l_Lights_0 (copy)
    table.clear(v17);
    for _, v19 in ipairs(l_Lights_0:GetChildren()) do
        if v19:IsA("BasePart") then
            v17[v19.Name] = v19;
        end;
    end;
end;
v20();
local v21 = {};
local function v26(v22) --[[ Line: 50 ]] --[[ Name: CancelTweensForLight ]]
    -- upvalues: v21 (copy)
    local v23 = v21[v22];
    if v23 then
        for _, v25 in ipairs(v23) do
            pcall(function() --[[ Line: 54 ]]
                -- upvalues: v25 (copy)
                v25:Cancel();
            end);
        end;
    end;
    v21[v22] = nil;
end;
local _ = function() --[[ Line: 62 ]] --[[ Name: CancelAllTweens ]]
    -- upvalues: v16 (copy), v26 (copy)
    for _, v28 in ipairs(v16) do
        v26(v28);
    end;
end;
local function _(v30, v31) --[[ Line: 68 ]] --[[ Name: SetLightColorImmediate ]]
    -- upvalues: v17 (copy)
    local v32 = v17[v30];
    if v32 then
        v32.Color = v31;
    end;
end;
local function v40(v34, v35, v36) --[[ Line: 75 ]] --[[ Name: TweenLightColor ]]
    -- upvalues: v17 (copy), l_TweenService_0 (copy), v21 (copy)
    local v37 = v17[v34];
    if not v37 then
        return nil;
    else
        local v38 = TweenInfo.new(v36, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut);
        local v39 = l_TweenService_0:Create(v37, v38, {
            Color = v35
        });
        v21[v34] = v21[v34] or {};
        table.insert(v21[v34], v39);
        v39:Play();
        return v39;
    end;
end;
local v41 = Random.new();
local function _(v42) --[[ Line: 93 ]] --[[ Name: Clamp ]]
    return (math.clamp(v42, 0, 1));
end;
local function v49(v44, v45) --[[ Line: 97 ]] --[[ Name: MultiplyColor ]]
    local v46 = math.clamp(math.floor(v44.R * 255 * v45 + 0.5), 0, 255);
    local v47 = math.clamp(math.floor(v44.G * 255 * v45 + 0.5), 0, 255);
    local v48 = math.clamp(math.floor(v44.B * 255 * v45 + 0.5), 0, 255);
    return Color3.fromRGB(v46, v47, v48);
end;
local function _(v50, v51) --[[ Line: 104 ]] --[[ Name: RandomRange ]]
    -- upvalues: v41 (copy)
    if v51 < v50 then
        local l_v51_0 = v51;
        v51 = v50;
        v50 = l_v51_0;
    end;
    return v50 + (v51 - v50) * v41:NextNumber();
end;
local function _(v54) --[[ Line: 111 ]] --[[ Name: RollChance ]]
    -- upvalues: v41 (copy)
    return v41:NextNumber() < math.clamp(v54, 0, 1);
end;
local function v58() --[[ Line: 115 ]] --[[ Name: SetAllOffTween ]]
    -- upvalues: v16 (copy), v26 (copy), v40 (copy), v10 (copy)
    for _, v57 in ipairs(v16) do
        v26(v57);
        v40(v57, v10, 0.1);
    end;
end;
local function v63() --[[ Line: 122 ]] --[[ Name: SetAllOffImmediate ]]
    -- upvalues: v16 (copy), v26 (copy), v10 (copy), v17 (copy)
    for _, v60 in ipairs(v16) do
        v26(v60);
        local l_v10_0 = v10;
        local v62 = v17[v60];
        if v62 then
            v62.Color = l_v10_0;
        end;
    end;
end;
local function v101(v64) --[[ Line: 129 ]] --[[ Name: BuildTargetColorMap ]]
    -- upvalues: v15 (copy), v14 (copy), v13 (copy), v12 (copy), v11 (copy), v3 (copy)
    local v65 = {};
    if v64.RingColors then
        local l_RingColors_0 = v64.RingColors;
        if l_RingColors_0[5] ~= nil then
            for _, v68 in ipairs(v15) do
                v65[v68] = l_RingColors_0[5];
            end;
        end;
        if l_RingColors_0[4] ~= nil then
            for _, v70 in ipairs(v14) do
                v65[v70] = l_RingColors_0[4];
            end;
        end;
        if l_RingColors_0[3] ~= nil then
            for _, v72 in ipairs(v13) do
                v65[v72] = l_RingColors_0[3];
            end;
        end;
        if l_RingColors_0[2] ~= nil then
            for _, v74 in ipairs(v12) do
                v65[v74] = l_RingColors_0[2];
            end;
        end;
        if v64.CenterColor ~= nil then
            for _, v76 in ipairs(v11) do
                v65[v76] = v64.CenterColor;
            end;
        end;
        return v65;
    else
        if v64.RingOn then
            local l_RingOn_0 = v64.RingOn;
            local l_l_RingOn_0_0 = l_RingOn_0 --[[ copy: 2 -> 10 ]];
            local _ = function(v79, v80) --[[ Line: 145 ]] --[[ Name: AddRing ]]
                -- upvalues: l_l_RingOn_0_0 (copy), v65 (copy), v3 (ref)
                if not l_l_RingOn_0_0[v79] then
                    return;
                else
                    for _, v82 in ipairs(v80) do
                        v65[v82] = v3;
                    end;
                    return;
                end;
            end;
            local l_v15_0 = v15;
            if l_RingOn_0[5] then
                for _, v86 in ipairs(l_v15_0) do
                    v65[v86] = v3;
                end;
            end;
            l_v15_0 = v14;
            if l_RingOn_0[4] then
                for _, v88 in ipairs(l_v15_0) do
                    v65[v88] = v3;
                end;
            end;
            l_v15_0 = v13;
            if l_RingOn_0[3] then
                for _, v90 in ipairs(l_v15_0) do
                    v65[v90] = v3;
                end;
            end;
            l_v15_0 = v12;
            if l_RingOn_0[2] then
                for _, v92 in ipairs(l_v15_0) do
                    v65[v92] = v3;
                end;
            end;
        end;
        if v64.OnNames then
            local v93 = v64.Color or v3;
            local l_ColorMap_0 = v64.ColorMap;
            for _, v96 in ipairs(v64.OnNames) do
                v65[v96] = l_ColorMap_0 and l_ColorMap_0[v96] or v93;
            end;
            return v65;
        elseif v64.OnName then
            local v97 = v64.Color or v3;
            local l_ColorMap_1 = v64.ColorMap;
            v65[v64.OnName] = l_ColorMap_1 and l_ColorMap_1[v64.OnName] or v97;
            return v65;
        else
            if v64.CenterOn then
                for _, v100 in ipairs(v11) do
                    v65[v100] = v3;
                end;
            end;
            return v65;
        end;
    end;
end;
local function v178(v102, v103, v104, v105, v106, v107) --[[ Line: 186 ]] --[[ Name: ApplyStep ]]
    -- upvalues: v101 (copy), v5 (copy), v4 (copy), v3 (copy), v26 (copy), v40 (copy), v10 (copy), v17 (copy), v41 (copy), v49 (copy)
    local v108 = v101(v102);
    local v109 = v107.TweenEnabled == true;
    local v110 = v107.TweenMode or "None";
    local v111 = v107.TweenInSeconds or 0.08;
    local v112 = v107.TweenOffSeconds or 0.08;
    local v113 = v107.TweenChangeSeconds or 0.06;
    local v114 = v107.Palette or {
        v5, 
        v4, 
        v3
    };
    if v103 then
        for v115, _ in pairs(v103) do
            if v108[v115] == nil then
                v26(v115);
                if v109 and v112 > 0 then
                    v40(v115, v10, v112);
                else
                    local l_v10_1 = v10;
                    local v118 = v17[v115];
                    if v118 then
                        v118.Color = l_v10_1;
                    end;
                end;
            end;
        end;
    end;
    if not v109 or v110 == "None" then
        for v119, v120 in pairs(v108) do
            v26(v119);
            local v121 = v17[v119];
            if v121 then
                v121.Color = v120;
            end;
        end;
        return v108;
    elseif v110 == "Direct" then
        for v122, v123 in pairs(v108) do
            local v124 = v103 and v103[v122] ~= nil or false;
            local v125 = v103 and v103[v122] or nil;
            v26(v122);
            if not v124 then
                local l_v10_2 = v10;
                local v127 = v17[v122];
                if v127 then
                    v127.Color = l_v10_2;
                end;
                if v123 == v10 then
                    l_v10_2 = v10;
                    v127 = v17[v122];
                    if v127 then
                        v127.Color = l_v10_2;
                    end;
                elseif v111 > 0 then
                    v40(v122, v123, v111);
                else
                    l_v10_2 = v17[v122];
                    if l_v10_2 then
                        l_v10_2.Color = v123;
                    end;
                end;
            elseif v125 and v125 ~= v123 then
                if v123 == v10 and v112 > 0 then
                    v40(v122, v10, v112);
                elseif v113 > 0 then
                    v40(v122, v123, v113);
                else
                    local v128 = v17[v122];
                    if v128 then
                        v128.Color = v123;
                    end;
                end;
            else
                local v129 = v17[v122];
                if v129 then
                    v129.Color = v123;
                end;
            end;
        end;
        return v108;
    else
        local v130 = math.max(v104 / 3, 0.001);
        local v131 = v107.RandomizeEnabled == true;
        local v132 = v107.OnChance or 1;
        local v133 = v107.MinOnPerRing or 0;
        local v134 = v107.TweenDurationMultiplierRange or {
            1, 
            1
        };
        local v135 = v107.IntensityRange or {
            1, 
            1
        };
        local v161 = (function(v136) --[[ Line: 274 ]] --[[ Name: FilterOnLights ]]
            -- upvalues: v131 (copy), v133 (copy), v41 (ref), v132 (copy)
            if not v131 then
                local v137 = {};
                for v138, _ in pairs(v136) do
                    v137[v138] = true;
                end;
                return v137;
            else
                local v140 = {
                    [1] = {}, 
                    [2] = {}, 
                    [3] = {}, 
                    [4] = {}, 
                    [5] = {}
                };
                for v141, _ in pairs(v136) do
                    if v141 == "1" then
                        table.insert(v140[1], v141);
                    elseif v141:sub(1, 1) == "2" then
                        table.insert(v140[2], v141);
                    elseif v141:sub(1, 1) == "3" then
                        table.insert(v140[3], v141);
                    elseif v141:sub(1, 1) == "4" then
                        table.insert(v140[4], v141);
                    elseif v141:sub(1, 1) == "5" then
                        table.insert(v140[5], v141);
                    end;
                end;
                local v143 = {};
                local function v147(v144) --[[ Line: 307 ]] --[[ Name: EnsureMinOn ]]
                    -- upvalues: v133 (ref), v41 (ref), v143 (copy)
                    if v133 <= 0 then
                        return;
                    elseif #v144 == 0 then
                        return;
                    else
                        for _ = 1, math.min(v133, #v144) do
                            local v146 = v41:NextInteger(1, #v144);
                            v143[v144[v146]] = true;
                            table.remove(v144, v146);
                        end;
                        return;
                    end;
                end;
                for _, v149 in pairs(v140) do
                    for _, v151 in ipairs(v149) do
                        local l_v132_0 = v132;
                        if v41:NextNumber() < math.clamp(l_v132_0, 0, 1) then
                            v143[v151] = true;
                        end;
                    end;
                end;
                for _, v154 in pairs(v140) do
                    local v155 = false;
                    for _, v157 in ipairs(v154) do
                        if v143[v157] then
                            v155 = true;
                            break;
                        end;
                    end;
                    if not v155 then
                        local v158 = {};
                        for _, v160 in ipairs(v154) do
                            table.insert(v158, v160);
                        end;
                        v147(v158);
                    end;
                end;
                return v143;
            end;
        end)(v108);
        for v162, _ in pairs(v108) do
            if not v161[v162] then
                v26(v162);
                if v109 and v112 > 0 then
                    v40(v162, v10, v112);
                else
                    local l_v10_3 = v10;
                    local v165 = v17[v162];
                    if v165 then
                        v165.Color = l_v10_3;
                    end;
                end;
            end;
        end;
        for v166, _ in pairs(v108) do
            if v161[v166] then
                v26(v166);
                local v168 = v135[1];
                local v169 = v135[2];
                if v169 < v168 then
                    local l_v169_0 = v169;
                    v169 = v168;
                    v168 = l_v169_0;
                end;
                local v171 = v168 + (v169 - v168) * v41:NextNumber();
                v168 = v49(v114[1], v171);
                v169 = v49(v114[2], v171);
                local v172 = v49(v114[3], v171);
                local v173 = v134[1];
                local v174 = v134[2];
                if v174 < v173 then
                    local l_v174_0 = v174;
                    v174 = v173;
                    v173 = l_v174_0;
                end;
                v173 = math.max(v130 * (v173 + (v174 - v173) * v41:NextNumber()), 0.001);
                v174 = v17[v166];
                if v174 then
                    v174.Color = v168;
                end;
                task.spawn(function() --[[ Line: 386 ]]
                    -- upvalues: v106 (copy), v105 (copy), v40 (ref), v166 (copy), v169 (copy), v173 (copy), v172 (copy)
                    if v106() ~= v105 then
                        return;
                    else
                        local v176 = v40(v166, v169, v173);
                        if v176 then
                            pcall(function() --[[ Line: 390 ]]
                                -- upvalues: v176 (copy)
                                v176.Completed:Wait();
                            end);
                        end;
                        if v106() ~= v105 then
                            return;
                        else
                            local v177 = v40(v166, v172, v173);
                            if v177 then
                                pcall(function() --[[ Line: 394 ]]
                                    -- upvalues: v177 (copy)
                                    v177.Completed:Wait();
                                end);
                            end;
                            if v106() ~= v105 then
                                return;
                            else
                                task.wait(v173);
                                return;
                            end;
                        end;
                    end;
                end);
            end;
        end;
        return v108;
    end;
end;
v1.Sequences = {
    WhitePlain = {
        StepDelaySeconds = 999999, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                RingColors = {
                    [2] = v3, 
                    [3] = v3, 
                    [4] = v3, 
                    [5] = v3
                }, 
                CenterColor = v3
            }
        }
    }, 
    OrangePlain = {
        StepDelaySeconds = 999999, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                RingColors = {
                    [2] = v4, 
                    [3] = v4, 
                    [4] = v4, 
                    [5] = v4
                }, 
                CenterColor = v4
            }
        }
    }, 
    BluePlain = {
        StepDelaySeconds = 999999, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                RingColors = {
                    [2] = v6, 
                    [3] = v6, 
                    [4] = v6, 
                    [5] = v6
                }, 
                CenterColor = v6
            }
        }
    }, 
    RedPlain = {
        StepDelaySeconds = 999999, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                RingColors = {
                    [2] = v9, 
                    [3] = v9, 
                    [4] = v9, 
                    [5] = v9
                }, 
                CenterColor = v9
            }
        }
    }, 
    Mirage = {
        StepDelaySeconds = 0.5, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "PaletteCycle", 
            Palette = {
                v5, 
                v4, 
                v3
            }, 
            TweenOffSeconds = 1, 
            RandomizeEnabled = true, 
            OnChance = 0.75, 
            MinOnPerRing = 1, 
            TweenDurationMultiplierRange = {
                0.5, 
                1.5
            }, 
            IntensityRange = {
                0.65, 
                1.25
            }
        }, 
        Steps = {
            {
                RingOn = {
                    [5] = true, 
                    [4] = true
                }
            }, 
            {
                RingOn = {
                    [5] = true, 
                    [4] = true, 
                    [3] = true
                }
            }, 
            {
                RingOn = {
                    [4] = true, 
                    [3] = true, 
                    [2] = true
                }
            }, 
            {
                RingOn = {
                    [3] = true, 
                    [2] = true
                }, 
                CenterOn = true
            }, 
            {
                RingOn = {
                    [4] = true, 
                    [3] = true, 
                    [2] = true
                }, 
                CenterOn = true
            }, 
            {
                RingOn = {
                    [3] = true, 
                    [2] = true
                }, 
                CenterOn = true
            }, 
            {
                RingOn = {
                    [4] = true, 
                    [3] = true
                }
            }, 
            {
                RingOn = {
                    [5] = true, 
                    [4] = true
                }
            }, 
            {
                RingOn = {
                    [5] = true
                }
            }
        }
    }, 
    MirageRed = {
        StepDelaySeconds = 0.5, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "PaletteCycle", 
            Palette = {
                v9, 
                v9, 
                v9
            }, 
            TweenOffSeconds = 1, 
            RandomizeEnabled = true, 
            OnChance = 0.75, 
            MinOnPerRing = 1, 
            TweenDurationMultiplierRange = {
                0.5, 
                1.5
            }, 
            IntensityRange = {
                0.65, 
                1.25
            }
        }, 
        Steps = {
            {
                RingColors = {
                    [2] = v9, 
                    [3] = v9, 
                    [4] = v9, 
                    [5] = v9
                }, 
                CenterColor = v9
            }, 
            {
                RingOn = {
                    [5] = true, 
                    [4] = true
                }
            }, 
            {
                RingOn = {
                    [5] = true, 
                    [4] = true, 
                    [3] = true
                }
            }, 
            {
                RingOn = {
                    [4] = true, 
                    [3] = true, 
                    [2] = true
                }
            }, 
            {
                RingOn = {
                    [3] = true, 
                    [2] = true
                }, 
                CenterOn = true
            }, 
            {
                RingOn = {
                    [4] = true, 
                    [3] = true, 
                    [2] = true
                }, 
                CenterOn = true
            }, 
            {
                RingOn = {
                    [3] = true, 
                    [2] = true
                }, 
                CenterOn = true
            }, 
            {
                RingOn = {
                    [4] = true, 
                    [3] = true
                }
            }, 
            {
                RingOn = {
                    [5] = true, 
                    [4] = true
                }
            }, 
            {
                RingOn = {
                    [5] = true
                }
            }
        }
    }, 
    Sweep = {
        StepDelaySeconds = 0.05, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "PaletteCycle", 
            Palette = {
                v5, 
                v4, 
                v3
            }, 
            TweenOffSeconds = 0.5, 
            RandomizeEnabled = true, 
            OnChance = 0.75, 
            MinOnPerRing = 1, 
            TweenDurationMultiplierRange = {
                0.5, 
                1.5
            }, 
            IntensityRange = {
                0.65, 
                1.25
            }
        }, 
        Steps = {
            {
                OnName = "5a"
            }, 
            {
                OnName = "4a"
            }, 
            {
                OnName = "3a"
            }, 
            {
                OnName = "2a"
            }, 
            {
                OnName = "1"
            }, 
            {
                OnName = "2e"
            }, 
            {
                OnName = "3e"
            }, 
            {
                OnName = "4e"
            }, 
            {
                OnName = "5e"
            }, 
            {
                OnName = "5d"
            }, 
            {
                OnName = "4d"
            }, 
            {
                OnName = "3d"
            }, 
            {
                OnName = "2d"
            }, 
            {
                OnName = "2c"
            }, 
            {
                OnName = "3c"
            }, 
            {
                OnName = "4c"
            }, 
            {
                OnName = "5c"
            }, 
            {
                OnName = "5b"
            }, 
            {
                OnName = "4b"
            }, 
            {
                OnName = "3b"
            }, 
            {
                OnName = "2b"
            }
        }
    }, 
    Spiral = {
        StepDelaySeconds = 0.125, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "PaletteCycle", 
            Palette = {
                v5, 
                v4, 
                v3
            }, 
            TweenOffSeconds = 2, 
            RandomizeEnabled = true, 
            OnChance = 0.85, 
            MinOnPerRing = 1, 
            TweenDurationMultiplierRange = {
                0.6, 
                1.4
            }, 
            IntensityRange = {
                0.65, 
                1.25
            }
        }, 
        Steps = {
            {
                OnName = "3a"
            }, 
            {
                OnName = "3b"
            }, 
            {
                OnName = "3c"
            }, 
            {
                OnName = "3d"
            }, 
            {
                OnName = "3e"
            }, 
            {
                OnName = "2e"
            }, 
            {
                OnName = "2d"
            }, 
            {
                OnName = "2c"
            }, 
            {
                OnName = "2b"
            }, 
            {
                OnName = "2a"
            }, 
            {
                OnName = "4a"
            }, 
            {
                OnName = "4b"
            }, 
            {
                OnName = "4c"
            }, 
            {
                OnName = "4d"
            }, 
            {
                OnName = "4e"
            }, 
            {
                OnName = "5e"
            }, 
            {
                OnName = "5d"
            }, 
            {
                OnName = "5c"
            }, 
            {
                OnName = "5b"
            }, 
            {
                OnName = "5a"
            }, 
            {
                OnName = "1"
            }
        }
    }, 
    SpiralRed = {
        StepDelaySeconds = 0.125, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "PaletteCycle", 
            Palette = {
                v9, 
                v9, 
                v9
            }, 
            TweenOffSeconds = 2, 
            RandomizeEnabled = true, 
            OnChance = 0.85, 
            MinOnPerRing = 1, 
            TweenDurationMultiplierRange = {
                0.6, 
                1.4
            }, 
            IntensityRange = {
                0.65, 
                1.25
            }
        }, 
        Steps = {
            {
                OnName = "3a"
            }, 
            {
                OnName = "3b"
            }, 
            {
                OnName = "3c"
            }, 
            {
                OnName = "3d"
            }, 
            {
                OnName = "3e"
            }, 
            {
                OnName = "2e"
            }, 
            {
                OnName = "2d"
            }, 
            {
                OnName = "2c"
            }, 
            {
                OnName = "2b"
            }, 
            {
                OnName = "2a"
            }, 
            {
                OnName = "4a"
            }, 
            {
                OnName = "4b"
            }, 
            {
                OnName = "4c"
            }, 
            {
                OnName = "4d"
            }, 
            {
                OnName = "4e"
            }, 
            {
                OnName = "5e"
            }, 
            {
                OnName = "5d"
            }, 
            {
                OnName = "5c"
            }, 
            {
                OnName = "5b"
            }, 
            {
                OnName = "5a"
            }, 
            {
                OnName = "1"
            }
        }
    }, 
    BackAndForth = {
        StepDelaySeconds = 0.35, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                OnNames = {
                    "1", 
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b", 
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c", 
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }
            }, 
            {
                OnNames = {
                    "1", 
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a", 
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            }
        }
    }, 
    BackAndForthOrange = {
        StepDelaySeconds = 0.35, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                Color = v4, 
                OnNames = {
                    "1", 
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b", 
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c", 
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }
            }, 
            {
                Color = v4, 
                OnNames = {
                    "1", 
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a", 
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            }
        }
    }, 
    BackAndForthRed = {
        StepDelaySeconds = 0.35, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                Color = v9, 
                OnNames = {
                    "1", 
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b", 
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c", 
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }
            }, 
            {
                Color = v9, 
                OnNames = {
                    "1", 
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a", 
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            }
        }
    }, 
    BackAndForthBlue = {
        StepDelaySeconds = 0.35, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = {
            {
                Color = v6, 
                OnNames = {
                    "1", 
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b", 
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c", 
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }
            }, 
            {
                Color = v6, 
                OnNames = {
                    "1", 
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a", 
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            }
        }
    }, 
    Crazy = {
        StepDelaySeconds = 0.15, 
        Profile = {
            TweenEnabled = false, 
            TweenMode = "None"
        }, 
        Steps = (function() --[[ Line: 780 ]]
            -- upvalues: v3 (copy), v4 (copy), v5 (copy), v7 (copy), v16 (copy), v41 (copy)
            local v179 = {};
            local v180 = {
                v3, 
                v4, 
                v5, 
                v7
            };
            local v181 = {};
            for _, v183 in ipairs(v16) do
                v181[v183] = v180[v41:NextInteger(1, #v180)];
            end;
            table.insert(v179, {
                ColorMap = v181, 
                OnNames = v16
            });
            for _ = 1, 80 do
                local v185 = {};
                for _ = 1, v41:NextInteger(4, 10) do
                    v185[v16[v41:NextInteger(1, #v16)]] = v180[v41:NextInteger(1, #v180)];
                end;
                table.insert(v179, {
                    ColorMap = v185, 
                    OnNames = v16
                });
            end;
            return v179;
        end)()
    }, 
    ExtraCrazy = {
        StepDelaySeconds = 0.15, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "Direct", 
            TweenOffSeconds = 0.25, 
            TweenInSeconds = 0.05, 
            TweenChangeSeconds = 0.05
        }, 
        Steps = (function() --[[ Line: 820 ]]
            -- upvalues: v8 (copy), v9 (copy), v4 (copy), v5 (copy), v16 (copy), v41 (copy), v10 (copy)
            local v187 = {};
            local v188 = {
                v8, 
                v9, 
                v4, 
                v5
            };
            local v189 = {
                {
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a"
                }, 
                {
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b"
                }, 
                {
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c"
                }, 
                {
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }, 
                {
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            };
            local v190 = {};
            for _, v192 in ipairs(v16) do
                v190[v192] = v188[v41:NextInteger(1, #v188)];
            end;
            table.insert(v187, {
                Color = v10, 
                ColorMap = v190, 
                OnNames = v16
            });
            for _ = 1, 120 do
                local v194 = {};
                for _ = 1, v41:NextInteger(1, 3) do
                    local v196 = v189[v41:NextInteger(1, #v189)];
                    for _, v198 in ipairs(v196) do
                        v194[v198] = v188[v41:NextInteger(1, #v188)];
                    end;
                end;
                if v41:NextNumber() < 0.6 then
                    v194["1"] = v188[v41:NextInteger(1, #v188)];
                end;
                if v41:NextNumber() < 0.75 then
                    for _ = 1, v41:NextInteger(2, 6) do
                        v194[v16[v41:NextInteger(1, #v16)]] = v188[v41:NextInteger(1, #v188)];
                    end;
                end;
                table.insert(v187, {
                    Color = v10, 
                    ColorMap = v194, 
                    OnNames = v16
                });
            end;
            return v187;
        end)()
    }, 
    RowSpinWhite = {
        StepDelaySeconds = 0.12, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "Direct", 
            TweenOffSeconds = 0.18, 
            TweenInSeconds = 0.06, 
            TweenChangeSeconds = 0.06
        }, 
        Steps = (function() --[[ Line: 881 ]]
            -- upvalues: v10 (copy), v16 (copy), v3 (copy)
            local v200 = {};
            local v201 = {
                {
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a"
                }, 
                {
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b"
                }, 
                {
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c"
                }, 
                {
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }, 
                {
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            };
            for _ = 1, 40 do
                for _, v204 in ipairs(v201) do
                    local v205 = {
                        ["1"] = v10
                    };
                    for _, v207 in ipairs(v16) do
                        if v207 ~= "1" then
                            v205[v207] = v10;
                        end;
                    end;
                    for _, v209 in ipairs(v204) do
                        v205[v209] = v3;
                    end;
                    table.insert(v200, {
                        Color = v10, 
                        ColorMap = v205, 
                        OnNames = v16
                    });
                end;
            end;
            return v200;
        end)()
    }, 
    RowSpinRed = {
        StepDelaySeconds = 0.12, 
        Profile = {
            TweenEnabled = true, 
            TweenMode = "Direct", 
            TweenOffSeconds = 0.18, 
            TweenInSeconds = 0.06, 
            TweenChangeSeconds = 0.06
        }, 
        Steps = (function() --[[ Line: 925 ]]
            -- upvalues: v10 (copy), v16 (copy), v9 (copy)
            local v210 = {};
            local v211 = {
                {
                    "2a", 
                    "3a", 
                    "4a", 
                    "5a"
                }, 
                {
                    "2b", 
                    "3b", 
                    "4b", 
                    "5b"
                }, 
                {
                    "2c", 
                    "3c", 
                    "4c", 
                    "5c"
                }, 
                {
                    "2d", 
                    "3d", 
                    "4d", 
                    "5d"
                }, 
                {
                    "2e", 
                    "3e", 
                    "4e", 
                    "5e"
                }
            };
            for _ = 1, 40 do
                for _, v214 in ipairs(v211) do
                    local v215 = {
                        ["1"] = v10
                    };
                    for _, v217 in ipairs(v16) do
                        if v217 ~= "1" then
                            v215[v217] = v10;
                        end;
                    end;
                    for _, v219 in ipairs(v214) do
                        v215[v219] = v9;
                    end;
                    table.insert(v210, {
                        Color = v10, 
                        ColorMap = v215, 
                        OnNames = v16
                    });
                end;
            end;
            return v210;
        end)()
    }
};
local v220 = nil;
local v221 = false;
local v222 = 0;
local function v223() --[[ Line: 966 ]] --[[ Name: GetPlayToken ]]
    -- upvalues: v222 (ref)
    return v222;
end;
local _ = function() --[[ Line: 970 ]] --[[ Name: StopInternal ]]
    -- upvalues: v221 (ref), v222 (ref), v220 (ref), v16 (copy), v26 (copy)
    v221 = false;
    v222 = v222 + 1;
    if v220 then
        pcall(task.cancel, v220);
    end;
    v220 = nil;
    for _, v225 in ipairs(v16) do
        v26(v225);
    end;
end;
v1.Stop = function(v227) --[[ Line: 980 ]] --[[ Name: Stop ]]
    -- upvalues: v221 (ref), v222 (ref), v220 (ref), v16 (copy), v26 (copy), v63 (copy), v58 (copy)
    v221 = false;
    v222 = v222 + 1;
    if v220 then
        pcall(task.cancel, v220);
    end;
    v220 = nil;
    for _, v229 in ipairs(v16) do
        v26(v229);
    end;
    if v227 then
        v63();
        return;
    else
        v58();
        return;
    end;
end;
v1.Play = function(v230, v231) --[[ Line: 989 ]] --[[ Name: Play ]]
    -- upvalues: v20 (copy), v1 (copy), v221 (ref), v222 (ref), v220 (ref), v16 (copy), v26 (copy), v58 (copy), v178 (copy), v223 (copy)
    v20();
    local v232 = v1.Sequences[v230];
    if not v232 then
        warn(("LightSequences.Play: Unknown sequence '%s'"):format(v230));
        return;
    else
        local l_Steps_0 = v232.Steps;
        local v234 = v232.Profile or {
            TweenEnabled = false, 
            TweenMode = "None"
        };
        v221 = false;
        v222 = v222 + 1;
        if v220 then
            pcall(task.cancel, v220);
        end;
        v220 = nil;
        for _, v236 in ipairs(v16) do
            v26(v236);
        end;
        v58();
        local v237 = v231 or v232.StepDelaySeconds or 0.25;
        v221 = true;
        local l_v222_0 = v222;
        v220 = task.spawn(function() --[[ Line: 1009 ]]
            -- upvalues: v221 (ref), l_v222_0 (copy), v222 (ref), l_Steps_0 (copy), v237 (copy), v178 (ref), v223 (ref), v234 (copy)
            local v239 = nil;
            while true do
                if v221 and l_v222_0 == v222 then
                    for _, v241 in ipairs(l_Steps_0) do
                        if not v221 or l_v222_0 ~= v222 then
                            return;
                        else
                            local v242 = v241.DelaySeconds or v237;
                            v239 = v178(v241, v239, v242, l_v222_0, v223, v234);
                            task.wait(v242);
                        end;
                    end;
                else
                    return;
                end;
            end;
        end);
        return;
    end;
end;
return v1;