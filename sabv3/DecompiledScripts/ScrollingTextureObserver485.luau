local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Observers);
local v3 = {};
v2.observeTag("ScrollingTexture", function(v4) --[[ Line: 8 ]]
    -- upvalues: v3 (copy)
    local v5 = {
        texture = v4, 
        initial = v4.OffsetStudsV, 
        speed = v4:GetAttribute("ScrollSpeed") or 10, 
        direction = v4:GetAttribute("Direction") or 1, 
        start = time()
    };
    table.insert(v3, v5);
    local v6 = v4:GetAttributeChangedSignal("ScrollSpeed"):Connect(function() --[[ Line: 19 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5.speed = v4:GetAttribute("ScrollSpeed");
    end);
    local v7 = v4:GetAttributeChangedSignal("Direction"):Connect(function() --[[ Line: 23 ]]
        -- upvalues: v5 (copy), v4 (copy)
        v5.direction = v4:GetAttribute("Direction");
    end);
    return function() --[[ Line: 27 ]]
        -- upvalues: v6 (copy), v7 (copy), v3 (ref), v5 (copy)
        v6:Disconnect();
        v7:Disconnect();
        local v8 = table.find(v3, v5);
        if v8 then
            table.remove(v3, v8);
        end;
    end;
end);
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 38 ]]
    -- upvalues: v3 (copy)
    local v9 = time();
    for _, v11 in v3 do
        local v12 = v11.initial + (v9 - v11.start) * v11.speed * v11.direction;
        v11.texture.OffsetStudsV = v12;
    end;
end);