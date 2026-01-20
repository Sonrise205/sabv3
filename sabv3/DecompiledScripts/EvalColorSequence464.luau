--!native
local function v10(v0, v1, v2) --[[ Line: 20 ]] --[[ Name: LerpColor ]]
    local v3, v4, v5 = v0:ToHSV();
    local v6, v7, v8 = v1:ToHSV();
    local v9 = (v3 + ((v6 - v3 + 0.5) % 1 - 0.5) * v2) % 1;
    return Color3.fromHSV(v9, v4 + (v7 - v4) * v2, v5 + (v8 - v5) * v2);
end;
return function(v11, v12) --[[ Line: 28 ]] --[[ Name: EvalColorSequence ]]
    -- upvalues: v10 (copy)
    local l_Keypoints_0 = v11.Keypoints;
    if v12 <= 0 then
        return l_Keypoints_0[1].Value;
    elseif v12 >= 1 then
        return l_Keypoints_0[#l_Keypoints_0].Value;
    else
        for v14 = 1, #l_Keypoints_0 - 1 do
            local v15 = l_Keypoints_0[v14];
            local v16 = l_Keypoints_0[v14 + 1];
            if v15.Time <= v12 and v12 < v16.Time then
                return v10(v15.Value, v16.Value, (v12 - v15.Time) / (v16.Time - v15.Time));
            end;
        end;
        return l_Keypoints_0[#l_Keypoints_0].Value;
    end;
end;