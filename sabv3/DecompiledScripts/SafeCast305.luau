--!native
return function(v0, v1, v2, v3) --[[ Line: 29 ]] --[[ Name: SafeCast ]]
    local l_X_0 = v0.X;
    local l_Y_0 = v0.Y;
    local l_Z_0 = v0.Z;
    local v7 = v1.X - l_X_0;
    local v8 = v1.Y - l_Y_0;
    local v9 = v1.Z - l_Z_0;
    local v10 = math.sqrt(v7 * v7 + v8 * v8 + v9 * v9);
    if v10 == 0 then
        return nil;
    else
        local v11 = nil;
        local v12 = nil;
        if v2 > 0 then
            v11 = 0.15;
            v12 = workspace:Spherecast(Vector3.new(l_X_0 - v7 * v11 / v10, l_Y_0 - v8 * v11 / v10, l_Z_0 - v9 * v11 / v10), v2, Vector3.new(v7 * (v10 + v11) / v10, v8 * (v10 + v11) / v10, v9 * (v10 + v11) / v10), v3);
        else
            v11 = 0.001;
            v12 = workspace:Raycast(Vector3.new(l_X_0 - v7 * v11 / v10, l_Y_0 - v8 * v11 / v10, l_Z_0 - v9 * v11 / v10), Vector3.new(v7 * (v10 + v11) / v10, v8 * (v10 + v11) / v10, v9 * (v10 + v11) / v10), v3);
        end;
        if not v12 then
            return nil;
        else
            local v13 = math.clamp((v12.Distance - v11) / v10, 0, 1);
            return {
                Alpha = v13, 
                Instance = v12.Instance, 
                Material = v12.Material, 
                Position = v12.Position, 
                Normal = v12.Normal, 
                Ending = Vector3.new(l_X_0 + v7 * v13, l_Y_0 + v8 * v13, l_Z_0 + v9 * v13)
            };
        end;
    end;
end;