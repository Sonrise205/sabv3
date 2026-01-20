local v0 = require(game.ReplicatedStorage.UserGenerated.Strings.Stringify);
local v1 = require(game.ReplicatedStorage.UserGenerated.Collections.DeepEquals);
local function v4(v2, v3) --[[ Line: 21 ]] --[[ Name: Equals ]]
    if rawequal(v2, v3) then
        return true;
    elseif (type(v2) ~= "table" or type(v3) ~= "table") and v2 ~= v2 and v3 ~= v3 then
        return true;
    else
        return false;
    end;
end;
local function _(v5) --[[ Line: 38 ]] --[[ Name: StripErrorSource ]]
    local v6 = tostring(v5);
    local v7, v8 = string.match(v6, "^(.*:%d+): (.+)$");
    if v7 and v8 then
        v6 = v8;
    end;
    return v6;
end;
local function _(v10) --[[ Line: 48 ]] --[[ Name: ToString ]]
    -- upvalues: v0 (copy)
    return v0.Pretty(v10, {
        Pretty = false, 
        IndentChar = "", 
        IndentSize = 0
    });
end;
local v41 = {
    IsEqual = v4, 
    ErrorUnsafe = function(v12, v13, ...) --[[ Line: 60 ]] --[[ Name: ErrorUnsafe ]]
        local v14 = nil;
        local v16 = table.pack(xpcall(v13, function(v15) --[[ Line: 66 ]]
            -- upvalues: v14 (ref)
            v14 = v15;
        end, ...));
        if v16[1] then
            error("ExpectedError", 2);
        end;
        if v14 ~= v12 then
            error(("ExpectedError Mismatch: %*"):format((string.format("%q", (tostring(v14))))), 2);
        end;
        return table.unpack(v16, 2);
    end, 
    Error = function(v17, v18, ...) --[[ Line: 79 ]] --[[ Name: Error ]]
        -- upvalues: v0 (copy)
        local v19 = nil;
        local v21 = table.pack(xpcall(v18, function(v20) --[[ Line: 85 ]]
            -- upvalues: v19 (ref)
            v19 = v20;
        end, ...));
        if v21[1] then
            error(("ExpectedError(%*)"):format((v0.Pretty(v17, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }))), 2);
        end;
        if type(v19) == "string" then
            local v22 = tostring(v19);
            local v23, v24 = string.match(v22, "^(.*:%d+): (.+)$");
            if v23 and v24 then
                v22 = v24;
            end;
            v19 = v22;
        end;
        if v17 ~= v19 then
            local l_error_0 = error;
            local v26 = "ExpectedError(%*): %*";
            local v27 = v0.Pretty(v17, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            });
            local l_v19_0 = v19;
            l_error_0(v26:format(v27, (v0.Pretty(l_v19_0, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }))), 2);
        end;
        return table.unpack(v21, 2);
    end, 
    Equal = function(v29, v30) --[[ Line: 101 ]] --[[ Name: Equal ]]
        -- upvalues: v0 (copy)
        if not (rawequal(v29, v30) and true or (not (type(v29) == "table") or type(v30) ~= "table") and v29 ~= v29 and v30 ~= v30) then
            error(("Equal(%*, %*)"):format(v0.Pretty(v29, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }), (v0.Pretty(v30, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }))), 2);
        end;
    end, 
    DeepEqual = function(v31, v32) --[[ Line: 107 ]] --[[ Name: DeepEqual ]]
        -- upvalues: v1 (copy), v0 (copy)
        if not v1(v31, v32) then
            error(("DeepEqual(%*, %*)"):format(v0.Pretty(v31, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }), (v0.Pretty(v32, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }))), 2);
        end;
    end, 
    FuzzyEqual = function(v33, v34, v35) --[[ Line: 113 ]] --[[ Name: FuzzyEqual ]]
        if (v35 or 0.001) < math.abs(v33 - v34) then
            error(("FuzzyEqual(%*, %*): %*"):format(tostring(v33), tostring(v34), (math.abs(v33 - v34))), 2);
        end;
    end, 
    ColorEqual = function(v36, v37, v38) --[[ Line: 120 ]] --[[ Name: ColorEqual ]]
        -- upvalues: v0 (copy)
        local v39 = v38 or 0.001;
        local v40 = Vector3.new(v36.R, v36.G, v36.B) * 255;
        if v39 < (Vector3.new(v37.R, v37.G, v37.B) * 255 - v40).Magnitude then
            error(("ColorEqual(%*, %*)"):format(v0.Pretty(v36, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }), (v0.Pretty(v37, {
                Pretty = false, 
                IndentChar = "", 
                IndentSize = 0
            }))), 2);
        end;
    end
};
return table.freeze(v41);