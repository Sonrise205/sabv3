--!native
local l_Debris_0 = game:GetService("Debris");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.UserGenerated.VFX.Emit);
return function(v3, v4, v5) --[[ Line: 25 ]] --[[ Name: PlayVFX ]]
    -- upvalues: l_Debris_0 (copy), v2 (copy)
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.CFrame = v3.CFrame:ToObjectSpace(v4);
    for _, v8 in ipairs(v5:GetDescendants()) do
        if v8:IsA("ParticleEmitter") then
            v8.Parent = l_Attachment_0;
        end;
    end;
    if v5:IsA("ParticleEmitter") then
        v5.Parent = l_Attachment_0;
    else
        v5:Destroy();
    end;
    l_Attachment_0.Parent = v3;
    l_Debris_0:AddItem(l_Attachment_0, v2(l_Attachment_0));
end;