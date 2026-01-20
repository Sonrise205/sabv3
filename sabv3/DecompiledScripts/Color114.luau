local l_SurfaceAppearance_0 = script.Parent:FindFirstChildOfClass("SurfaceAppearance");
local v1 = Color3.fromRGB(105, 90, 180);
local v2 = Color3.fromRGB(173, 216, 230);
local v3 = Color3.fromRGB(255, 182, 193);
local v4 = Color3.fromRGB(255, 255, 255);
local v5 = 0;
(function() --[[ Line: 15 ]] --[[ Name: efeitoGalaxiaSuave ]]
    -- upvalues: v5 (ref), v1 (copy), v2 (copy), v3 (copy), v4 (copy), l_SurfaceAppearance_0 (copy)
    while true do
        v5 = v5 + 0.02;
        local v6 = (math.sin(v5 * 1.2) + 1) / 2;
        local v7 = (math.sin((v5 + 1) * 1.2) + 1) / 2;
        local v8 = v1:Lerp(v2, v6):Lerp(v3, v7):Lerp(v4, 0.5);
        if l_SurfaceAppearance_0 then
            l_SurfaceAppearance_0.Color = v8;
        end;
        wait(0.02);
    end;
end)();