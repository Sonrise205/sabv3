local _ = game:GetService("StarterPlayer");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ServerScriptService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Net);
local v5 = require(l_Packages_0.Debounce);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v8 = nil;
l_Parent_0.Activated:Connect(function() --[[ Line: 15 ]]
    -- upvalues: v5 (copy), l_Parent_1 (copy), v8 (ref), v4 (copy)
    if v5(("ItemUse/ThrowTableAnimation/%*"):format(l_Parent_1.Name), 4) then
        return;
    else
        if not v8 then
            v8 = l_Parent_1.Character:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(script.ThrowTable);
            v8.Priority = Enum.AnimationPriority.Action;
            v8.Looped = false;
        end;
        v4:RemoteEvent("UseItem"):FireServer();
        task.wait(0.1);
        v8:Play();
        return;
    end;
end);