--!native
local function v0(v1, v2) --[[ Line: 7 ]] --[[ Name: RecolorPart ]]
    -- upvalues: v0 (copy)
    if v1:GetAttribute("__RECOLOR") ~= false then
        if v1:IsA("BasePart") then
            v1.Color = v2;
        elseif v1:IsA("SurfaceAppearance") then
            v1.Color = v2;
        elseif v1:IsA("Highlight") then
            v1.FillColor = v2;
            v1.OutlineColor = v2;
        elseif v1:IsA("ParticleEmitter") then
            v1.Color = ColorSequence.new(v2);
        end;
    end;
    for _, v4 in ipairs(v1:GetChildren()) do
        v0(v4, v2);
    end;
end;
return v0;