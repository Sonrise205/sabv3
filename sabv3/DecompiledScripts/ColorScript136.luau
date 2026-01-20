local l_Parent_0 = script.Parent;
local v1 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(0.16666666666666666, Color3.fromRGB(255, 180, 110)), 
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 62, 48)), 
    ColorSequenceKeypoint.new(0.8333333333333334, Color3.fromRGB(97, 160, 255)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
});
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v4 = require(l_ReplicatedStorage_0.Shared.EvalColorSequence);
local v5 = require(l_ReplicatedStorage_0.Shared.RecolorPart);
local v6 = 0;
l_RunService_0.RenderStepped:Connect(function(v7) --[[ Line: 19 ]]
    -- upvalues: v6 (ref), v4 (copy), v1 (copy), v5 (copy), l_Parent_0 (copy)
    v6 = v6 + v7 * script:GetAttribute("Speed");
    local v8 = v4(v1, v6 % 1);
    script:SetAttribute("Color", v8);
    v5(l_Parent_0, v8);
end);