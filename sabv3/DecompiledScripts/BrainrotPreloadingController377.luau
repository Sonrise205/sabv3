local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v2 = require(l_ReplicatedStorage_0.Datas.Animals);
return {
    Start = function(_) --[[ Line: 9 ]] --[[ Name: Start ]]
        -- upvalues: v2 (copy), l_ReplicatedStorage_0 (copy), l_ContentProvider_0 (copy)
        for v4, v5 in v2 do
            local v6 = false;
            if v5.IsEnabled and not v5.IsEnabled() then
                v6 = true;
            end;
            if v5.ShouldPreload and v5.ShouldPreload() then
                v6 = true;
            end;
            if v6 then
                local l_FirstChild_0 = l_ReplicatedStorage_0.Models.Animals:FindFirstChild(v4);
                local l_FirstChild_1 = l_ReplicatedStorage_0.Animations.Animals:FindFirstChild(v4);
                task.spawn(pcall, l_ContentProvider_0.PreloadAsync, l_ContentProvider_0, {
                    l_FirstChild_0, 
                    l_FirstChild_1
                });
            end;
        end;
    end
};