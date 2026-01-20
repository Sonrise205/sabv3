isPointInVolume = @native function(v0, v1, v2) --[[ Line: 2 ]] --[[ Name: isPointInVolume ]]
    local v3 = vector.abs(v1:Inverse() * v0);
    local v4 = false;
    if v3.x <= v2.x * 0.5 then
        v4 = false;
        if v3.y <= v2.y * 0.5 then
            v4 = v3.z <= v2.z * 0.5;
        end;
    end;
    return v4;
end;
isPointInVolume_direct = @native function(v5, v6, v7) --[[ Line: 9 ]] --[[ Name: isPointInVolume_direct ]]
    local v8 = vector.abs(v6 * v5);
    local v9 = false;
    if v8.x <= v7.x * 0.5 then
        v9 = false;
        if v8.y <= v7.y * 0.5 then
            v9 = v8.z <= v7.z * 0.5;
        end;
    end;
    return v9;
end;
return {
    isPointInVolume = isPointInVolume, 
    isPointInVolume_direct = isPointInVolume_direct, 
    quadBezier = @native function(v10, v11, v12, v13) --[[ Line: 16 ]] --[[ Name: quadBezier ]]
        return (1 - v10) ^ 2 * v11 + (1 - v10) * 2 * v10 * v12 + v10 ^ 2 * v13;
    end, 
    cubicBezier = @native function(v14, v15, v16, v17, v18) --[[ Line: 20 ]] --[[ Name: cubicBezier ]]
        return (1 - v14) ^ 3 * v15 + (1 - v14) ^ 2 * 3 * v14 * v16 + (1 - v14) * 3 * v14 ^ 2 * v17 + v14 ^ 3 * v18;
    end, 
    sortByXdesc = @native function(...) --[[ Line: 65 ]] --[[ Name: sortByXdesc ]]
        local v19 = select("#", ...);
        if v19 == 1 then
            error("sortByXdesc requires at least 2 vectors");
        elseif v19 == 2 then
            local v20, v21 = ...;
            if v20.x >= v21.x then
                return v20, v21;
            else
                return v21, v20;
            end;
        elseif v19 == 3 then
            local v22, v23, v24 = ...;
            if v22.x >= v23.x and v22.x >= v24.x then
                if v23.x >= v24.x then
                    return v22, v23, v24;
                else
                    return v22, v24, v23;
                end;
            elseif v23.x >= v22.x and v23.x >= v24.x then
                if v22.x >= v24.x then
                    return v23, v22, v24;
                else
                    return v23, v24, v22;
                end;
            elseif v22.x >= v23.x then
                return v24, v22, v23;
            else
                return v24, v23, v22;
            end;
        end;
        local v25 = {
            ...
        };
        table.sort(v25, function(v26, v27) --[[ Line: 100 ]]
            return v26.x > v27.x;
        end);
        return table.unpack(v25, 1, v19);
    end, 
    sortByYdesc = @native function(...) --[[ Line: 106 ]] --[[ Name: sortByYdesc ]]
        local v28 = select("#", ...);
        if v28 == 1 then
            error("sortByYdesc requires at least 2 vectors");
        elseif v28 == 2 then
            local v29, v30 = ...;
            if v29.y >= v30.y then
                return v29, v30;
            else
                return v30, v29;
            end;
        elseif v28 == 3 then
            local v31, v32, v33 = ...;
            if v31.y >= v32.y and v31.y >= v33.y then
                if v32.y >= v33.y then
                    return v31, v32, v33;
                else
                    return v31, v33, v32;
                end;
            elseif v32.y >= v31.y and v32.y >= v33.y then
                if v31.y >= v33.y then
                    return v32, v31, v33;
                else
                    return v32, v33, v31;
                end;
            elseif v31.y >= v32.y then
                return v33, v31, v32;
            else
                return v33, v32, v31;
            end;
        end;
        local v34 = {
            ...
        };
        table.sort(v34, function(v35, v36) --[[ Line: 141 ]]
            return v35.y > v36.y;
        end);
        return table.unpack(v34, 1, v28);
    end, 
    sortByZdesc = @native function(...) --[[ Line: 24 ]] --[[ Name: sortByZdesc ]]
        local v37 = select("#", ...);
        if v37 == 1 then
            error("sortByZdesc requires at least 2 vectors");
        elseif v37 == 2 then
            local v38, v39 = ...;
            if v38.z >= v39.z then
                return v38, v39;
            else
                return v39, v38;
            end;
        elseif v37 == 3 then
            local v40, v41, v42 = ...;
            if v40.z >= v41.z and v40.z >= v42.z then
                if v41.z >= v42.z then
                    return v40, v41, v42;
                else
                    return v40, v42, v41;
                end;
            elseif v41.z >= v40.z and v41.z >= v42.z then
                if v40.z >= v42.z then
                    return v41, v40, v42;
                else
                    return v41, v42, v40;
                end;
            elseif v40.z >= v41.z then
                return v42, v40, v41;
            else
                return v42, v41, v40;
            end;
        end;
        local v43 = {
            ...
        };
        table.sort(v43, function(v44, v45) --[[ Line: 59 ]]
            return v44.z > v45.z;
        end);
        return table.unpack(v43, 1, v37);
    end, 
    areVectorsAligned = @native function(v46, v47, v48) --[[ Line: 147 ]] --[[ Name: areVectorsAligned ]]
        return math.deg((math.acos((math.clamp(vector.dot(vector.normalize(v46), (vector.normalize(v47))), -1, 1))))) <= v48;
    end, 
    simulateGravity = @native function(v49) --[[ Line: 154 ]] --[[ Name: simulateGravity ]]
        return v49 * v49 * 98.1;
    end, 
    calculateTimeToGround = @native function(v50, v51) --[[ Line: 158 ]] --[[ Name: calculateTimeToGround ]]
        return (math.sqrt((v50 - v51) * 2 / 196.2));
    end
};