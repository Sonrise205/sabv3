local function v9(v0, v1) --[[ Line: 3 ]] --[[ Name: evalColorSequence ]]
    local v2 = {};
    v1 = v1 + 1;
    for v3 = 0, 2 do
        for v4 = 1, #v0 do
            table.insert(v2, {
                Time = v0[v4].Time + v3, 
                Value = v0[v4].Value
            });
        end;
    end;
    for v5 = 1, #v2 - 1 do
        local v6 = v2[v5];
        local v7 = v2[v5 + 1];
        if v6.Time <= v1 and v1 < v7.Time then
            local v8 = (v1 - v6.Time) / (v7.Time - v6.Time);
            return Color3.new((v7.Value.R - v6.Value.R) * v8 + v6.Value.R, (v7.Value.G - v6.Value.G) * v8 + v6.Value.G, (v7.Value.B - v6.Value.B) * v8 + v6.Value.B);
        end;
    end;
end;
return {
    calculateColorSequence = function(v10, v11) --[[ Line: 31 ]] --[[ Name: calculateColorSequence ]]
        -- upvalues: v9 (copy)
        local v12 = {};
        local v13 = 5;
        local v14 = 100;
        for _, v16 in v10.Keypoints do
            local v17 = v16.Time + v11;
            if v17 > 1 or v17 < 0 then
                v17 = v17 % 1;
            end;
            local v18 = ColorSequenceKeypoint.new(v17, v16.Value);
            if v18.Time <= v14 then
                v12[v13 - 1] = v18;
                v13 = v13 - 1;
                v14 = v18.Time;
            else
                v12[#v12 + 1] = v18;
            end;
        end;
        local v19 = {};
        for _, v21 in v12 do
            table.insert(v19, v21);
        end;
        table.sort(v19, function(v22, v23) --[[ Line: 56 ]]
            return v22.Time < v23.Time;
        end);
        if v19[1].Time ~= 0 then
            table.insert(v19, 1, (ColorSequenceKeypoint.new(0, v9(v19, 0))));
        end;
        if v19[#v19].Time ~= 1 then
            table.insert(v19, (ColorSequenceKeypoint.new(1, v9(v19, 1))));
        end;
        return ColorSequence.new(v19);
    end
};