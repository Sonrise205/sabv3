local l_Parent_0 = script.Parent;
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_ReplicatedStorage_0.Shared.RecolorPart);
local l_Value_0 = script:WaitForChild("Reference").Value;
l_RunService_0.RenderStepped:Connect(function(_) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), l_Parent_0 (copy), l_Value_0 (copy)
    v3(l_Parent_0, l_Value_0:GetAttribute("Color"));
end);