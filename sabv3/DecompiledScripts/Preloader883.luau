local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, script.Parent:GetDescendants());
local l_SantasSleigh_0 = l_ReplicatedStorage_0:WaitForChild("Assets"):WaitForChild("Tools"):WaitForChild("SantasSleigh");
task.spawn(l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, l_SantasSleigh_0:GetDescendants());