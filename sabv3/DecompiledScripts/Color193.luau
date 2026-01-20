local l_Parent_0 = script.Parent;
local l_SurfaceAppearance_0 = l_Parent_0:FindFirstChildOfClass("SurfaceAppearance");
local v2 = Color3.fromRGB(10, 0, 20);
local v3 = Color3.fromRGB(128, 17, 255);
local v4 = Color3.fromRGB(220, 180, 255);
local v5 = Color3.fromRGB(255, 240, 255);
local v6 = 0;
(function() --[[ Line: 16 ]] --[[ Name: pulsarCores ]]
    -- upvalues: l_Parent_0 (copy), v6 (ref), v2 (copy), v3 (copy), v4 (copy), v5 (copy), l_SurfaceAppearance_0 (copy)
    while true do
        local l_Highlight_0 = l_Parent_0:FindFirstChildOfClass("Highlight");
        v6 = v6 + 0.02;
        local v8 = (math.sin(v6 * 10) + 1) / 2;
        local v9 = v2:Lerp(v3, v8);
        local v10 = v4:Lerp(v3, v8);
        local v11 = v3:Lerp(v5, v8);
        if l_SurfaceAppearance_0 then
            l_SurfaceAppearance_0.Color = v9;
        end;
        if l_Highlight_0 then
            l_Highlight_0.FillColor = v10;
            l_Highlight_0.OutlineColor = v11;
        end;
        wait(0.02);
    end;
end)();