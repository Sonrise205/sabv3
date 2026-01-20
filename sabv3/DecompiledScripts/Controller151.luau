local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent;
l_Parent_0.Equipped:Connect(function() --[[ Line: 7 ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_Parent_0 (copy)
    l_ReplicatedStorage_0:WaitForChild("Client"):WaitForChild("BanHammer"):WaitForChild("Equipped"):Fire(l_Parent_0);
end);