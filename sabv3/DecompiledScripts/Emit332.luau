--!native
local v0 = require(game.ReplicatedStorage.UserGenerated.VFX.EmitOnce);
local function v1(v2) --[[ Line: 22 ]] --[[ Name: Emit ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v3 = 0;
    if v2:IsA("ParticleEmitter") then
        v3 = math.max(v3, v0(v2));
    end;
    for _, v5 in ipairs(v2:GetChildren()) do
        v3 = math.max(v3, v1(v5));
    end;
    return v3;
end;
return v1;