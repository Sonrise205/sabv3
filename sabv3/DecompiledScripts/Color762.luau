local l_Parent_0 = script.Parent;
local l_SurfaceAppearance_0 = l_Parent_0:FindFirstChildOfClass("SurfaceAppearance");
local v2 = Color3.fromRGB(200, 25, 25);
local v3 = Color3.fromRGB(155, 25, 25);
local v4 = Color3.fromRGB(125, 25, 25);
local v5 = Color3.fromRGB(75, 25, 25);
local v6 = 0;
(function() --[[ Line: 15 ]] --[[ Name: pulsarCores ]]
    -- upvalues: v6 (ref), v2 (copy), v3 (copy), v4 (copy), v5 (copy), l_SurfaceAppearance_0 (copy), l_Parent_0 (copy)
    while true do
        v6 = v6 + 0.02;
        local v7 = (math.sin(v6 * 10) + 1) / 2;
        local v8 = v2:Lerp(v3, v7);
        local v9 = v4:Lerp(v3, v7);
        local v10 = v3:Lerp(v5, v7);
        if l_SurfaceAppearance_0 then
            l_SurfaceAppearance_0.Color = v8;
        end;
        local l_Highlight_0 = l_Parent_0:FindFirstChildOfClass("Highlight");
        if l_Highlight_0 then
            l_Highlight_0.FillColor = v9;
            l_Highlight_0.OutlineColor = v10;
        end;
        wait(0.02);
    end;
end)();