--!native
local function _(v0, v1) --[[ Line: 78 ]] --[[ Name: insertRight2 ]]
    local l_Right2_0 = v0.Right2;
    v1.Right2 = l_Right2_0;
    v1.Left2 = v0;
    v0.Right2 = v1;
    l_Right2_0.Left2 = v1;
end;
local function _(v4) --[[ Line: 86 ]] --[[ Name: unlink2 ]]
    v4.Left2.Right2 = v4.Right2;
    v4.Right2.Left2 = v4.Left2;
end;
local function _(v6) --[[ Line: 91 ]] --[[ Name: unlink ]]
    v6.Left2.Right2 = v6.Right2;
    v6.Right2.Left2 = v6.Left2;
    v6.Left1 = nil;
    v6.Right1 = nil;
    v6.Left2 = nil;
    v6.Right2 = nil;
end;
local function _(v8) --[[ Line: 101 ]] --[[ Name: isRed ]]
    if v8 then
        return v8.Color1;
    else
        return false;
    end;
end;
local function _(v10) --[[ Line: 109 ]] --[[ Name: rotateLeft ]]
    local l_Right1_0 = v10.Right1;
    v10.Right1 = l_Right1_0.Left1;
    l_Right1_0.Left1 = v10;
    l_Right1_0.Color1 = v10.Color1;
    v10.Color1 = true;
    return l_Right1_0;
end;
local function _(v13) --[[ Line: 119 ]] --[[ Name: rotateRight ]]
    local l_Left1_0 = v13.Left1;
    v13.Left1 = l_Left1_0.Right1;
    l_Left1_0.Right1 = v13;
    l_Left1_0.Color1 = v13.Color1;
    v13.Color1 = true;
    return l_Left1_0;
end;
local function _(v16) --[[ Line: 129 ]] --[[ Name: flipColors ]]
    v16.Color1 = not v16.Color1;
    local l_Left1_1 = v16.Left1;
    l_Left1_1.Color1 = not l_Left1_1.Color1;
    local l_Right1_1 = v16.Right1;
    l_Right1_1.Color1 = not l_Right1_1.Color1;
end;
local function _(v20) --[[ Line: 139 ]] --[[ Name: moveRedLeft ]]
    local l_v20_0 = v20;
    l_v20_0.Color1 = not l_v20_0.Color1;
    local l_Left1_2 = l_v20_0.Left1;
    l_Left1_2.Color1 = not l_Left1_2.Color1;
    local l_Right1_2 = l_v20_0.Right1;
    l_Right1_2.Color1 = not l_Right1_2.Color1;
    l_Left1_2 = v20.Right1.Left1;
    if if l_Left1_2 then l_Left1_2.Color1 else false then
        l_Left1_2 = v20.Right1;
        l_Right1_2 = l_Left1_2.Left1;
        l_Left1_2.Left1 = l_Right1_2.Right1;
        l_Right1_2.Right1 = l_Left1_2;
        l_Right1_2.Color1 = l_Left1_2.Color1;
        l_Left1_2.Color1 = true;
        v20.Right1 = l_Right1_2;
        l_v20_0 = v20;
        l_Left1_2 = l_v20_0.Right1;
        l_v20_0.Right1 = l_Left1_2.Left1;
        l_Left1_2.Left1 = l_v20_0;
        l_Left1_2.Color1 = l_v20_0.Color1;
        l_v20_0.Color1 = true;
        v20 = l_Left1_2;
        l_v20_0 = v20;
        l_v20_0.Color1 = not l_v20_0.Color1;
        l_Left1_2 = l_v20_0.Left1;
        l_Left1_2.Color1 = not l_Left1_2.Color1;
        l_Right1_2 = l_v20_0.Right1;
        l_Right1_2.Color1 = not l_Right1_2.Color1;
    end;
    return v20;
end;
local function _(v25) --[[ Line: 151 ]] --[[ Name: moveRedRight ]]
    local l_v25_0 = v25;
    l_v25_0.Color1 = not l_v25_0.Color1;
    local l_Left1_3 = l_v25_0.Left1;
    l_Left1_3.Color1 = not l_Left1_3.Color1;
    local l_Right1_3 = l_v25_0.Right1;
    l_Right1_3.Color1 = not l_Right1_3.Color1;
    l_Left1_3 = v25.Left1.Left1;
    if if l_Left1_3 then l_Left1_3.Color1 else false then
        l_v25_0 = v25;
        l_Left1_3 = l_v25_0.Left1;
        l_v25_0.Left1 = l_Left1_3.Right1;
        l_Left1_3.Right1 = l_v25_0;
        l_Left1_3.Color1 = l_v25_0.Color1;
        l_v25_0.Color1 = true;
        v25 = l_Left1_3;
        l_v25_0 = v25;
        l_v25_0.Color1 = not l_v25_0.Color1;
        l_Left1_3 = l_v25_0.Left1;
        l_Left1_3.Color1 = not l_Left1_3.Color1;
        l_Right1_3 = l_v25_0.Right1;
        l_Right1_3.Color1 = not l_Right1_3.Color1;
    end;
    return v25;
end;
local function v36(v30) --[[ Line: 161 ]] --[[ Name: balance ]]
    local l_Right1_4 = v30.Right1;
    if if l_Right1_4 then l_Right1_4.Color1 else false then
        local l_v30_0 = v30;
        l_Right1_4 = l_v30_0.Right1;
        l_v30_0.Right1 = l_Right1_4.Left1;
        l_Right1_4.Left1 = l_v30_0;
        l_Right1_4.Color1 = l_v30_0.Color1;
        l_v30_0.Color1 = true;
        v30 = l_Right1_4;
    end;
    l_Right1_4 = v30.Left1;
    if if l_Right1_4 then l_Right1_4.Color1 else false then
        l_Right1_4 = v30.Left1.Left1;
        if if l_Right1_4 then l_Right1_4.Color1 else false then
            local l_v30_1 = v30;
            l_Right1_4 = l_v30_1.Left1;
            l_v30_1.Left1 = l_Right1_4.Right1;
            l_Right1_4.Right1 = l_v30_1;
            l_Right1_4.Color1 = l_v30_1.Color1;
            l_v30_1.Color1 = true;
            v30 = l_Right1_4;
        end;
    end;
    l_Right1_4 = v30.Left1;
    if if l_Right1_4 then l_Right1_4.Color1 else false then
        l_Right1_4 = v30.Right1;
        if if l_Right1_4 then l_Right1_4.Color1 else false then
            local l_v30_2 = v30;
            l_v30_2.Color1 = not l_v30_2.Color1;
            l_Right1_4 = l_v30_2.Left1;
            l_Right1_4.Color1 = not l_Right1_4.Color1;
            local l_Right1_5 = l_v30_2.Right1;
            l_Right1_5.Color1 = not l_Right1_5.Color1;
        end;
    end;
    return v30;
end;
local function v37(v38) --[[ Line: 174 ]] --[[ Name: removeMin ]]
    -- upvalues: v37 (copy), v36 (copy)
    if not v38.Left1 then
        return nil, v38;
    else
        local l_Left1_4 = v38.Left1;
        if not if l_Left1_4 then l_Left1_4.Color1 else false then
            l_Left1_4 = v38.Left1.Left1;
            if not if l_Left1_4 then l_Left1_4.Color1 else false then
                local l_v38_0 = v38;
                l_Left1_4 = l_v38_0;
                l_Left1_4.Color1 = not l_Left1_4.Color1;
                local l_Left1_5 = l_Left1_4.Left1;
                l_Left1_5.Color1 = not l_Left1_5.Color1;
                local l_Right1_6 = l_Left1_4.Right1;
                l_Right1_6.Color1 = not l_Right1_6.Color1;
                l_Left1_5 = l_v38_0.Right1.Left1;
                if if l_Left1_5 then l_Left1_5.Color1 else false then
                    l_Left1_5 = l_v38_0.Right1;
                    l_Right1_6 = l_Left1_5.Left1;
                    l_Left1_5.Left1 = l_Right1_6.Right1;
                    l_Right1_6.Right1 = l_Left1_5;
                    l_Right1_6.Color1 = l_Left1_5.Color1;
                    l_Left1_5.Color1 = true;
                    l_v38_0.Right1 = l_Right1_6;
                    l_Left1_4 = l_v38_0;
                    l_Left1_5 = l_Left1_4.Right1;
                    l_Left1_4.Right1 = l_Left1_5.Left1;
                    l_Left1_5.Left1 = l_Left1_4;
                    l_Left1_5.Color1 = l_Left1_4.Color1;
                    l_Left1_4.Color1 = true;
                    l_v38_0 = l_Left1_5;
                    l_Left1_4 = l_v38_0;
                    l_Left1_4.Color1 = not l_Left1_4.Color1;
                    l_Left1_5 = l_Left1_4.Left1;
                    l_Left1_5.Color1 = not l_Left1_5.Color1;
                    l_Right1_6 = l_Left1_4.Right1;
                    l_Right1_6.Color1 = not l_Right1_6.Color1;
                end;
                v38 = l_v38_0;
            end;
        end;
        local _ = nil;
        local v44;
        l_Left1_4, v44 = v37(v38.Left1);
        v38.Left1 = l_Left1_4;
        return v36(v38), v44;
    end;
end;
local function v45(v46) --[[ Line: 188 ]] --[[ Name: removeMax ]]
    -- upvalues: v45 (copy), v36 (copy)
    local l_Left1_6 = v46.Left1;
    if if l_Left1_6 then l_Left1_6.Color1 else false then
        local l_v46_0 = v46;
        l_Left1_6 = l_v46_0.Left1;
        l_v46_0.Left1 = l_Left1_6.Right1;
        l_Left1_6.Right1 = l_v46_0;
        l_Left1_6.Color1 = l_v46_0.Color1;
        l_v46_0.Color1 = true;
        v46 = l_Left1_6;
    end;
    if not v46.Right1 then
        return nil, v46;
    else
        l_Left1_6 = v46.Right1;
        if not if l_Left1_6 then l_Left1_6.Color1 else false then
            l_Left1_6 = v46.Right1.Left1;
            if not if l_Left1_6 then l_Left1_6.Color1 else false then
                local l_v46_1 = v46;
                l_Left1_6 = l_v46_1;
                l_Left1_6.Color1 = not l_Left1_6.Color1;
                local l_Left1_7 = l_Left1_6.Left1;
                l_Left1_7.Color1 = not l_Left1_7.Color1;
                local l_Right1_7 = l_Left1_6.Right1;
                l_Right1_7.Color1 = not l_Right1_7.Color1;
                l_Left1_7 = l_v46_1.Left1.Left1;
                if if l_Left1_7 then l_Left1_7.Color1 else false then
                    l_Left1_6 = l_v46_1;
                    l_Left1_7 = l_Left1_6.Left1;
                    l_Left1_6.Left1 = l_Left1_7.Right1;
                    l_Left1_7.Right1 = l_Left1_6;
                    l_Left1_7.Color1 = l_Left1_6.Color1;
                    l_Left1_6.Color1 = true;
                    l_v46_1 = l_Left1_7;
                    l_Left1_6 = l_v46_1;
                    l_Left1_6.Color1 = not l_Left1_6.Color1;
                    l_Left1_7 = l_Left1_6.Left1;
                    l_Left1_7.Color1 = not l_Left1_7.Color1;
                    l_Right1_7 = l_Left1_6.Right1;
                    l_Right1_7.Color1 = not l_Right1_7.Color1;
                end;
                v46 = l_v46_1;
            end;
        end;
        local _ = nil;
        local v53;
        l_Left1_6, v53 = v45(v46.Right1);
        v46.Right1 = l_Left1_6;
        return v36(v46), v53;
    end;
end;
local function v54(v55) --[[ Line: 205 ]] --[[ Name: height ]]
    -- upvalues: v54 (copy)
    if v55 then
        return math.max(v54(v55.Left1), v54(v55.Right1)) + 1;
    else
        return -1;
    end;
end;
local function v56(v57, v58, v59, v60) --[[ Line: 214 ]] --[[ Name: isBST ]]
    -- upvalues: v56 (copy)
    if v58 then
        if v59 ~= nil and v57(v58.Key, v59) <= 0 then
            return false;
        elseif v60 ~= nil and v57(v58.Key, v60) >= 0 then
            return false;
        else
            return v56(v57, v58.Left1, v59, v58.Key) and v56(v57, v58.Right1, v58.Key, v60);
        end;
    else
        return true;
    end;
end;
local function v61(v62, v63, v64) --[[ Line: 233 ]] --[[ Name: remove ]]
    -- upvalues: v61 (copy), v37 (copy), v36 (copy)
    local v65 = nil;
    if v63 then
        if v62(v63.Key, v64) > 0 then
            local l_Left1_8 = v63.Left1;
            if not if l_Left1_8 then l_Left1_8.Color1 else false then
                l_Left1_8 = v63.Left1.Left1;
                if not if l_Left1_8 then l_Left1_8.Color1 else false then
                    local l_v63_0 = v63;
                    l_Left1_8 = l_v63_0;
                    l_Left1_8.Color1 = not l_Left1_8.Color1;
                    local l_Left1_9 = l_Left1_8.Left1;
                    l_Left1_9.Color1 = not l_Left1_9.Color1;
                    local l_Right1_8 = l_Left1_8.Right1;
                    l_Right1_8.Color1 = not l_Right1_8.Color1;
                    l_Left1_9 = l_v63_0.Right1.Left1;
                    if if l_Left1_9 then l_Left1_9.Color1 else false then
                        l_Left1_9 = l_v63_0.Right1;
                        l_Right1_8 = l_Left1_9.Left1;
                        l_Left1_9.Left1 = l_Right1_8.Right1;
                        l_Right1_8.Right1 = l_Left1_9;
                        l_Right1_8.Color1 = l_Left1_9.Color1;
                        l_Left1_9.Color1 = true;
                        l_v63_0.Right1 = l_Right1_8;
                        l_Left1_8 = l_v63_0;
                        l_Left1_9 = l_Left1_8.Right1;
                        l_Left1_8.Right1 = l_Left1_9.Left1;
                        l_Left1_9.Left1 = l_Left1_8;
                        l_Left1_9.Color1 = l_Left1_8.Color1;
                        l_Left1_8.Color1 = true;
                        l_v63_0 = l_Left1_9;
                        l_Left1_8 = l_v63_0;
                        l_Left1_8.Color1 = not l_Left1_8.Color1;
                        l_Left1_9 = l_Left1_8.Left1;
                        l_Left1_9.Color1 = not l_Left1_9.Color1;
                        l_Right1_8 = l_Left1_8.Right1;
                        l_Right1_8.Color1 = not l_Right1_8.Color1;
                    end;
                    v63 = l_v63_0;
                end;
            end;
            local v70;
            v70, l_Left1_8 = v61(v62, v63.Left1, v64);
            v63.Left1 = v70;
            v65 = l_Left1_8;
        else
            local l_Left1_10 = v63.Left1;
            if if l_Left1_10 then l_Left1_10.Color1 else false then
                local l_v63_1 = v63;
                l_Left1_10 = l_v63_1.Left1;
                l_v63_1.Left1 = l_Left1_10.Right1;
                l_Left1_10.Right1 = l_v63_1;
                l_Left1_10.Color1 = l_v63_1.Color1;
                l_v63_1.Color1 = true;
                v63 = l_Left1_10;
            end;
            if v62(v63.Key, v64) == 0 and not v63.Right1 then
                local l_v63_2 = v63;
                l_v63_2.Left2.Right2 = l_v63_2.Right2;
                l_v63_2.Right2.Left2 = l_v63_2.Left2;
                l_v63_2.Left1 = nil;
                l_v63_2.Right1 = nil;
                l_v63_2.Left2 = nil;
                l_v63_2.Right2 = nil;
                return nil, v63;
            else
                if v63.Right1 then
                    l_Left1_10 = v63.Right1;
                    if not if l_Left1_10 then l_Left1_10.Color1 else false then
                        l_Left1_10 = v63.Right1.Left1;
                        if not if l_Left1_10 then l_Left1_10.Color1 else false then
                            local l_v63_3 = v63;
                            l_Left1_10 = l_v63_3;
                            l_Left1_10.Color1 = not l_Left1_10.Color1;
                            local l_Left1_11 = l_Left1_10.Left1;
                            l_Left1_11.Color1 = not l_Left1_11.Color1;
                            local l_Right1_9 = l_Left1_10.Right1;
                            l_Right1_9.Color1 = not l_Right1_9.Color1;
                            l_Left1_11 = l_v63_3.Left1.Left1;
                            if if l_Left1_11 then l_Left1_11.Color1 else false then
                                l_Left1_10 = l_v63_3;
                                l_Left1_11 = l_Left1_10.Left1;
                                l_Left1_10.Left1 = l_Left1_11.Right1;
                                l_Left1_11.Right1 = l_Left1_10;
                                l_Left1_11.Color1 = l_Left1_10.Color1;
                                l_Left1_10.Color1 = true;
                                l_v63_3 = l_Left1_11;
                                l_Left1_10 = l_v63_3;
                                l_Left1_10.Color1 = not l_Left1_10.Color1;
                                l_Left1_11 = l_Left1_10.Left1;
                                l_Left1_11.Color1 = not l_Left1_11.Color1;
                                l_Right1_9 = l_Left1_10.Right1;
                                l_Right1_9.Color1 = not l_Right1_9.Color1;
                            end;
                            v63 = l_v63_3;
                        end;
                    end;
                end;
                if v62(v63.Key, v64) == 0 then
                    local l_Left1_12 = v63.Left1;
                    l_Left1_10 = v63.Right1;
                    local l_Color1_0 = v63.Color1;
                    local l_v63_4 = v63;
                    l_v63_4.Left2.Right2 = l_v63_4.Right2;
                    l_v63_4.Right2.Left2 = l_v63_4.Left2;
                    l_v63_4.Left1 = nil;
                    l_v63_4.Right1 = nil;
                    l_v63_4.Left2 = nil;
                    l_v63_4.Right2 = nil;
                    v65 = v63;
                    if l_Left1_12 and l_Left1_10 then
                        l_v63_4 = nil;
                        local v80, v81 = v37(l_Left1_10);
                        l_v63_4 = v80;
                        v63 = v81;
                        v63.Right1 = l_v63_4;
                        v63.Left1 = l_Left1_12;
                        v63.Color1 = l_Color1_0;
                    else
                        v63 = l_Left1_12 or l_Left1_10;
                        v63.Color1 = l_Color1_0;
                    end;
                else
                    local v82;
                    v82, l_Left1_10 = v61(v62, v63.Right1, v64);
                    v63.Right1 = v82;
                    v65 = l_Left1_10;
                end;
            end;
        end;
        v63 = v36(v63);
    end;
    return v63, v65;
end;
local function v83(v84, v85, v86, v87, v88) --[[ Line: 280 ]] --[[ Name: insert ]]
    -- upvalues: v83 (copy), v36 (copy)
    if v85 then
        local v89 = nil;
        local v90 = false;
        local v91 = v84(v85.Key, v87);
        if v91 == 0 then
            v89 = v85;
            v85.Value = v88;
        else
            if v91 > 0 then
                local v92, v93, v94 = v83(v84, v85.Left1, v85.Left2, v87, v88);
                v85.Left1 = v92;
                v89 = v93;
                v90 = v94;
            else
                local v95, v96, v97 = v83(v84, v85.Right1, v85, v87, v88);
                v85.Right1 = v95;
                v89 = v96;
                v90 = v97;
            end;
            if v90 then
                v85 = v36(v85);
            end;
        end;
        return v85, v89, v90;
    else
        local v98 = {
            Color1 = true, 
            Key = v87, 
            Value = v88, 
            Left2 = nil, 
            Right2 = nil
        };
        local l_Right2_1 = v86.Right2;
        v98.Right2 = l_Right2_1;
        v98.Left2 = v86;
        v86.Right2 = v98;
        l_Right2_1.Left2 = v98;
        return v98, v98, true;
    end;
end;
local function v100(v101, v102) --[[ Line: 317 ]] --[[ Name: isBalanced ]]
    -- upvalues: v100 (copy)
    if v101 then
        if not if v101 then v101.Color1 else false then
            v102 = v102 - 1;
        end;
        return v100(v101.Left1, v102) and v100(v101.Right1, v102);
    else
        return v102 == 0;
    end;
end;
local function v103(v104) --[[ Line: 330 ]] --[[ Name: size ]]
    -- upvalues: v103 (copy)
    local v105 = 0;
    if v104 then
        v105 = v105 + 1 + v103(v104.Left1) + v103(v104.Right1);
    end;
    return v105;
end;
local function v106(v107, v108) --[[ Line: 340 ]] --[[ Name: selectRank ]]
    -- upvalues: v103 (copy), v106 (copy)
    if v107 then
        local l_Left1_13 = v107.Left1;
        local v110 = 0;
        if l_Left1_13 then
            v110 = v110 + 1 + v103(l_Left1_13.Left1) + v103(l_Left1_13.Right1);
        end;
        local l_v110_0 = v110;
        if v108 < l_v110_0 then
            return v106(v107.Left1, v108);
        elseif l_v110_0 < v108 then
            return v106(v107.Right1, v108 - l_v110_0 - 1);
        else
            return v107.Key;
        end;
    else
        return nil;
    end;
end;
local function v112(v113, v114, v115) --[[ Line: 354 ]] --[[ Name: rank ]]
    -- upvalues: v112 (copy), v103 (copy)
    if v115 then
        local v116 = v113(v115.Key, v114);
        if v116 > 0 then
            return v112(v113, v114, v115.Left1);
        elseif v116 < 0 then
            local v117 = 1;
            local l_Left1_14 = v115.Left1;
            local v119 = 0;
            if l_Left1_14 then
                v119 = v119 + 1 + v103(l_Left1_14.Left1) + v103(l_Left1_14.Right1);
            end;
            return v117 + v119 + v112(v113, v114, v115.Right1);
        else
            local l_Left1_15 = v115.Left1;
            local v121 = 0;
            if l_Left1_15 then
                v121 = v121 + 1 + v103(l_Left1_15.Left1) + v103(l_Left1_15.Right1);
            end;
            return v121;
        end;
    else
        return 0;
    end;
end;
local function v122(v123, v124) --[[ Line: 368 ]] --[[ Name: is23 ]]
    -- upvalues: v122 (copy)
    if v124 then
        local l_Right1_10 = v124.Right1;
        if if l_Right1_10 then l_Right1_10.Color1 else false then
            return false;
        else
            if v124 ~= v123 and if v124 then v124.Color1 else false then
                l_Right1_10 = v124.Left1;
                if if l_Right1_10 then l_Right1_10.Color1 else false then
                    return false;
                end;
            end;
            return v122(v123, v124.Left1) and v122(v124.Right1);
        end;
    else
        return true;
    end;
end;
local v126 = {};
local v127 = table.freeze({
    __index = v126
});
v126.Insert = function(v128, v129, v130) --[[ Line: 387 ]] --[[ Name: Insert ]]
    -- upvalues: v83 (copy)
    local v131, v132, v133 = v83(v128.Comparator, v128.Root, v128.List, v129, v130);
    v131.Color1 = false;
    v128.Root = v131;
    if v133 then
        v128.Size = v128.Size + 1;
    end;
    return v132, v133;
end;
v126.Remove = function(v134, v135) --[[ Line: 403 ]] --[[ Name: Remove ]]
    -- upvalues: v61 (copy)
    local v136 = nil;
    local l_Root_0 = v134.Root;
    if l_Root_0 then
        local l_Left1_16 = l_Root_0.Left1;
        if not if l_Left1_16 then l_Left1_16.Color1 else false then
            l_Left1_16 = l_Root_0.Right1;
            if not if l_Left1_16 then l_Left1_16.Color1 else false then
                l_Root_0.Color1 = true;
            end;
        end;
        local v139;
        v139, l_Left1_16 = v61(v134.Comparator, l_Root_0, v135);
        l_Root_0 = v139;
        v136 = l_Left1_16;
        if l_Root_0 then
            l_Root_0.Color1 = false;
        end;
        v134.Root = l_Root_0;
        if v136 then
            v134.Size = v134.Size - 1;
        end;
    end;
    return v136;
end;
v126.RemoveMin = function(v140) --[[ Line: 423 ]] --[[ Name: RemoveMin ]]
    -- upvalues: v37 (copy)
    local v141 = nil;
    local l_Root_1 = v140.Root;
    if l_Root_1 then
        local l_Left1_17 = l_Root_1.Left1;
        if not if l_Left1_17 then l_Left1_17.Color1 else false then
            l_Left1_17 = l_Root_1.Right1;
            if not if l_Left1_17 then l_Left1_17.Color1 else false then
                l_Root_1.Color1 = true;
            end;
        end;
        local v144;
        v144, l_Left1_17 = v37(l_Root_1);
        l_Root_1 = v144;
        v141 = l_Left1_17;
        if l_Root_1 then
            l_Root_1.Color1 = false;
        end;
        v140.Root = l_Root_1;
        if v141 then
            v140.Size = v140.Size - 1;
        end;
    end;
    return v141;
end;
v126.RemoveMax = function(v145) --[[ Line: 442 ]] --[[ Name: RemoveMax ]]
    -- upvalues: v45 (copy)
    local v146 = nil;
    local l_Root_2 = v145.Root;
    if l_Root_2 then
        local l_Left1_18 = l_Root_2.Left1;
        if not if l_Left1_18 then l_Left1_18.Color1 else false then
            l_Left1_18 = l_Root_2.Right1;
            if not if l_Left1_18 then l_Left1_18.Color1 else false then
                l_Root_2.Color1 = true;
            end;
        end;
        local v149;
        v149, l_Left1_18 = v45(l_Root_2);
        l_Root_2 = v149;
        v146 = l_Left1_18;
        if l_Root_2 then
            l_Root_2.Color1 = false;
        end;
        v145.Root = l_Root_2;
        if v146 then
            v145.Size = v145.Size - 1;
        end;
    end;
    return v146;
end;
v126.Min = function(v150) --[[ Line: 462 ]] --[[ Name: Min ]]
    local l_List_0 = v150.List;
    local l_Left1_19 = l_List_0.Left1;
    if l_Left1_19 ~= l_List_0 then
        return l_Left1_19;
    else
        return nil;
    end;
end;
v126.Max = function(v153) --[[ Line: 471 ]] --[[ Name: Max ]]
    local l_List_1 = v153.List;
    local l_Right1_11 = l_List_1.Right1;
    if l_Right1_11 ~= l_List_1 then
        return l_Right1_11;
    else
        return nil;
    end;
end;
v126.GetSize = function(v156) --[[ Line: 481 ]] --[[ Name: GetSize ]]
    return v156.Size;
end;
v126.ForEach = function(v157, v158) --[[ Line: 485 ]] --[[ Name: ForEach ]]
    assert(type(v158) == "function");
    local l_List_2 = v157.List;
    local l_l_List_2_0 = l_List_2;
    while true do
        l_l_List_2_0 = l_l_List_2_0.Right2;
        if l_l_List_2_0 ~= l_List_2 then
            v158(l_l_List_2_0.Key, l_l_List_2_0.Value);
        else
            break;
        end;
    end;
end;
v126.Next = function(v161, v162) --[[ Line: 498 ]] --[[ Name: Next ]]
    local l_List_3 = v161.List;
    local l_Right2_2 = (if v162 ~= nil then v162 else v161.List).Right2;
    if l_Right2_2 ~= l_List_3 then
        return l_Right2_2, l_Right2_2;
    else
        return nil, nil;
    end;
end;
v126.Iterator = function(v165) --[[ Line: 508 ]] --[[ Name: Iterator ]]
    return v165.Next, v165;
end;
v126.IsBST = function(v166) --[[ Line: 512 ]] --[[ Name: IsBST ]]
    -- upvalues: v56 (copy)
    local l_Comparator_0 = v166.Comparator;
    local l_Root_3 = v166.Root;
    local v169;
    if l_Root_3 then
        v169 = v56(l_Comparator_0, l_Root_3.Left1, nil, l_Root_3.Key);
        if v169 then
            return (v56(l_Comparator_0, l_Root_3.Right1, l_Root_3.Key, nil));
        end;
    else
        v169 = true;
    end;
    return v169;
end;
v126.IsSizeConsistent = function(v170) --[[ Line: 516 ]] --[[ Name: IsSizeConsistent ]]
    -- upvalues: v103 (copy)
    local l_Size_0 = v170.Size;
    local l_Root_4 = v170.Root;
    local v173 = 0;
    if l_Root_4 then
        v173 = v173 + 1 + v103(l_Root_4.Left1) + v103(l_Root_4.Right1);
    end;
    if l_Size_0 ~= v173 then
        return false;
    else
        l_Root_4 = 0;
        v173 = v170.List;
        local l_v173_0 = v173;
        while true do
            l_v173_0 = l_v173_0.Right2;
            if l_v173_0 ~= v173 then
                l_Root_4 = l_Root_4 + 1;
            else
                break;
            end;
        end;
        if l_Size_0 ~= l_Root_4 then
            return false;
        else
            return true;
        end;
    end;
end;
v126.IsRankConsistent = function(v175) --[[ Line: 538 ]] --[[ Name: IsRankConsistent ]]
    -- upvalues: v103 (copy), v106 (copy), v112 (copy)
    for v176 = 0, v175.Size - 1 do
        local l_Root_5 = v175.Root;
        local v178;
        if l_Root_5 then
            local l_Left1_20 = l_Root_5.Left1;
            local v180 = 0;
            if l_Left1_20 then
                v180 = v180 + 1 + v103(l_Left1_20.Left1) + v103(l_Left1_20.Right1);
            end;
            local l_v180_0 = v180;
            v178 = if v176 < l_v180_0 then v106(l_Root_5.Left1, v176) else if l_v180_0 < v176 then v106(l_Root_5.Right1, v176 - l_v180_0 - 1) else l_Root_5.Key;
        else
            v178 = nil;
        end;
        if v176 ~= v112(v175.Comparator, v178, v175.Root) then
            return false;
        end;
    end;
    local _ = {};
    v175:ForEach(function(v183, _) --[[ Line: 548 ]]
        -- upvalues: v112 (ref), v175 (copy), v103 (ref), v106 (ref)
        local v185 = v112(v175.Comparator, v183, v175.Root);
        local l_Root_6 = v175.Root;
        local v187;
        if l_Root_6 then
            local l_Left1_21 = l_Root_6.Left1;
            local v189 = 0;
            if l_Left1_21 then
                v189 = v189 + 1 + v103(l_Left1_21.Left1) + v103(l_Left1_21.Right1);
            end;
            local l_v189_0 = v189;
            v187 = if v185 < l_v189_0 then v106(l_Root_6.Left1, v185) else if l_v189_0 < v185 then v106(l_Root_6.Right1, v185 - l_v189_0 - 1) else l_Root_6.Key;
        else
            v187 = nil;
        end;
        if v175.Comparator(v187, v183) ~= 0 then
            return false;
        else
            return;
        end;
    end);
    return true;
end;
v126.Is23 = function(v191) --[[ Line: 558 ]] --[[ Name: Is23 ]]
    -- upvalues: v122 (copy)
    return (v122(v191.Root, v191.Root));
end;
v126.IsBalanced = function(v192) --[[ Line: 562 ]] --[[ Name: IsBalanced ]]
    -- upvalues: v100 (copy)
    local v193 = 0;
    local l_Root_7 = v192.Root;
    local l_l_Root_7_0 = l_Root_7;
    while l_l_Root_7_0 do
        local l_l_l_Root_7_0_0 = l_l_Root_7_0;
        if not if l_l_l_Root_7_0_0 then l_l_l_Root_7_0_0.Color1 else false then
            v193 = v193 + 1;
        end;
        l_l_Root_7_0 = l_l_Root_7_0.Left1;
    end;
    local l_v193_0 = v193;
    local v198;
    if l_Root_7 then
        if not if l_Root_7 then l_Root_7.Color1 else false then
            l_v193_0 = l_v193_0 - 1;
        end;
        v198 = v100(l_Root_7.Left1, l_v193_0);
        if v198 then
            return (v100(l_Root_7.Right1, l_v193_0));
        end;
    else
        v198 = l_v193_0 == 0;
    end;
    return v198;
end;
v126.Check = function(v199) --[[ Line: 575 ]] --[[ Name: Check ]]
    if not v199:IsBST() then
        return false, "Not in symmetric order";
    elseif not v199:IsSizeConsistent() then
        return false, "Subtree counts not consistent";
    elseif not v199:IsRankConsistent() then
        return false, "Ranks not consistent";
    elseif not v199:Is23() then
        return false, "Not a 2-3 tree";
    elseif not v199:IsBalanced() then
        return false, "Not balanced";
    else
        return true;
    end;
end;
table.freeze(v126);
local v206 = {
    Compare = function(v200, v201) --[[ Line: 599 ]] --[[ Name: Compare ]]
        if v200 < v201 then
            return -1;
        elseif v201 < v200 then
            return 1;
        else
            return 0;
        end;
    end, 
    new = function(v202, _, _) --[[ Line: 605 ]] --[[ Name: new ]]
        -- upvalues: v127 (copy)
        assert(type(v202) == "function");
        local v205 = {
            Color1 = false, 
            Key = nil, 
            Value = nil
        };
        v205.Left2 = v205;
        v205.Right2 = v205;
        return (setmetatable({
            Comparator = v202, 
            Root = nil, 
            List = v205, 
            Size = 0
        }, v127));
    end
};
return table.freeze(v206);