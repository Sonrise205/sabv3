local l_Players_0 = game:GetService("Players");
local v1 = require("./console");
local v2 = require("./context");
local _ = require("./types");
local function v5(v4) --[[ Line: 7 ]] --[[ Name: noop ]]
    return v4;
end;
local function _(v6) --[[ Line: 9 ]] --[[ Name: wrap_if_not ]]
    if type(v6) == "table" then
        return v6;
    else
        return {
            v6
        };
    end;
end;
local v8 = {
    convert = v5, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "any", 
        type = "any"
    }
};
local v9 = {
    convert = tostring, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "string", 
        type = "string"
    }
};
local v14 = {
    convert = function(v10) --[[ Line: 36 ]] --[[ Name: convert ]]
        if typeof(v10) == "table" then
            local v11 = table.clone(v10);
            for v12, v13 in v11 do
                v11[v12] = tostring(v13);
            end;
            return v11;
        else
            return {
                (tostring(v10))
            };
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "strings", 
        type = "{ string }"
    }
};
local v17 = {
    convert = function(v15) --[[ Line: 57 ]] --[[ Name: convert ]]
        local v16 = tonumber(v15);
        if v16 == nil then
            error((("%* is not a valid number"):format(v15)));
        end;
        return v16;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "number", 
        type = "number"
    }
};
local v24 = {
    convert = function(v18) --[[ Line: 72 ]] --[[ Name: convert ]]
        local v19 = if type(v18) == "table" then v18 else {
            v18
        };
        local v20 = {};
        for v21, _ in v19 do
            local v23 = tonumber(v19);
            if v23 == nil then
                error((("%* is not a valid number"):format(v19)));
            end;
            v20[v21] = v23;
        end;
        return v20;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "numbers", 
        type = "{ number }"
    }
};
local v28 = {
    convert = function(v25) --[[ Line: 92 ]] --[[ Name: convert ]]
        if typeof(v25) == "boolean" then
            return v25;
        elseif typeof(v25) == "number" and v25 > 0 then
            return true;
        elseif typeof(v25) == "number" and v25 <= 0 then
            return false;
        else
            error((("%* is not a valid boolean"):format((typeof(v25)))));
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "boolean", 
        type = "boolean", 
        suggestion_generator = function(v26) --[[ Line: 110 ]] --[[ Name: suggestion_generator ]]
            local v27 = {};
            if string.sub("true", 1, #v26) == v26 then
                table.insert(v27, "true");
            end;
            if string.sub("false", 1, #v26) == v26 then
                table.insert(v27, "false");
            end;
            return v27;
        end
    }
};
local v35 = {
    convert = function(v29) --[[ Line: 127 ]] --[[ Name: convert ]]
        if typeof(v29) == "table" then
            local v30 = table.clone(v29);
            for v31, v32 in v30 do
                if typeof(v32) == "boolean" then
                    v30[v31] = v32;
                elseif typeof(v32) == "number" and v32 > 0 then
                    v30[v31] = true;
                elseif typeof(v32) == "number" and v32 <= 0 then
                    v30[v31] = false;
                else
                    error((("type %* of %* is not a valid boolean"):format(typeof(v32), v31)));
                end;
            end;
            return v30;
        elseif typeof(v29) == "boolean" then
            return {
                v29
            };
        elseif typeof(v29) == "number" and v29 > 0 then
            return {
                true
            };
        elseif typeof(v29) == "number" and v29 <= 0 then
            return {
                false
            };
        else
            error((("%* is not a valid boolean"):format((typeof(v29)))));
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "boolean", 
        type = "boolean", 
        suggestion_generator = function(v33) --[[ Line: 159 ]] --[[ Name: suggestion_generator ]]
            local v34 = {};
            if string.sub("true", 1, #v33) == v33 then
                table.insert(v34, "true");
            end;
            if string.sub("false", 1, #v33) == v33 then
                table.insert(v34, "false");
            end;
            return v34;
        end
    }
};
local v36 = {
    convert = v5, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "table", 
        type = "table"
    }
};
local v38 = {
    convert = function(v37) --[[ Line: 186 ]] --[[ Name: into_vector ]]
        if type(v37) == "vector" then
            return v37;
        elseif typeof(v37) == "table" then
            return (vector.create(v37[1] or 0, v37[2] or 0, v37[3] or 0));
        else
            error(("%* is not valid"):format(v37), 0);
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "vector", 
        type = "vector"
    }
};
local v44 = {
    convert = function(v39) --[[ Line: 207 ]] --[[ Name: convert ]]
        if type(v39) == "vector" then
            return {
                v39
            };
        elseif typeof(v39) == "table" then
            local v40 = {};
            for v41, v42 in v39 do
                local v43;
                if type(v42) == "vector" then
                    v43 = v42;
                elseif typeof(v42) == "table" then
                    v43 = vector.create(v42[1] or 0, v42[2] or 0, v42[3] or 0);
                else
                    error(("%* is not valid"):format(v42), 0);
                    v43 = nil;
                end;
                v40[v41] = v43;
            end;
            return v40;
        else
            error(("%* is not valid"):format(v39), 0);
            return;
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "vector", 
        type = "vector"
    }
};
local function v53(v45, v46, v47) --[[ Line: 234 ]] --[[ Name: enum_map ]]
    return {
        convert = function(v48) --[[ Line: 240 ]] --[[ Name: convert ]]
            -- upvalues: v45 (copy)
            local v49 = tostring(v48);
            if v45[v49] == nil then
                error(("%* is not valid"):format(v49), 0);
            end;
            return v45[v49];
        end, 
        analysis = {
            kind = "argument", 
            optional = false, 
            name = v46 or "enum", 
            description = v47, 
            type = v46 or "enum", 
            suggestion_generator = function(v50) --[[ Line: 252 ]] --[[ Name: suggestion_generator ]]
                -- upvalues: v45 (copy)
                v50 = v50:lower();
                local v51 = {};
                for v52 in v45 do
                    if string.sub(v52:lower(), 1, #v50) == v50 then
                        if string.find(v52, "[^%w_-]") or typeof((tonumber((string.sub(v52, 1, 1))))) == "number" then
                            v52 = string.format("%q", v52);
                        end;
                        table.insert(v51, v52);
                    end;
                end;
                return v51;
            end
        }
    };
end;
local function v60(v54, v55, v56) --[[ Line: 273 ]] --[[ Name: enum_new ]]
    -- upvalues: v53 (copy)
    local v57 = {};
    for _, v59 in v54 do
        v57[tostring(v59)] = v59;
    end;
    return (v53(v57, v55, v56));
end;
local function v63(v61) --[[ Line: 283 ]] --[[ Name: convert_arg_to_player ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    local v62 = v2.get_command_context();
    if v61 == "@s" then
        return v62 and v62.executor.player or error("not executed by a player");
    elseif typeof(v61) == "number" then
        return (assert(l_Players_0:GetPlayerByUserId(v61), (("player with id %* is not in this server"):format(v61))));
    elseif typeof(v61) == "string" then
        return (assert(l_Players_0:FindFirstChild(v61), (("player \"%*\" is not valid"):format(v61))));
    elseif typeof(v61) == "Instance" and v61:IsA("Player") then
        return v61;
    else
        error((("unknown arg %*"):format(v61)));
        return;
    end;
end;
local function v68(v64) --[[ Line: 308 ]] --[[ Name: convert_arg_to_players ]]
    -- upvalues: l_Players_0 (copy), v63 (copy)
    if v64 == "@a" then
        return l_Players_0:GetPlayers();
    elseif typeof(v64) == "table" then
        local v65 = table.clone(v64);
        for v66, v67 in v65 do
            v65[v66] = v63(v67);
        end;
        return v65;
    else
        return {
            v63(v64)
        };
    end;
end;
local v74 = {
    convert = function(v69) --[[ Line: 327 ]] --[[ Name: convert ]]
        -- upvalues: v63 (copy)
        return v63(v69);
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "player", 
        type = "Player", 
        suggestion_generator = function(v70) --[[ Line: 334 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: l_Players_0 (copy)
            v70 = v70:lower();
            local v71 = {};
            if string.sub("@s", 1, #v70) == v70 then
                table.insert(v71, "@s");
            end;
            for _, v73 in l_Players_0:GetPlayers() do
                if string.sub(v73.Name:lower(), 1, #v70) == v70 or string.sub(v73.DisplayName:lower(), 1, #v70) == v70 then
                    table.insert(v71, v73.Name);
                end;
            end;
            return v71;
        end
    }
};
local v80 = {
    convert = function(v75) --[[ Line: 358 ]] --[[ Name: convert ]]
        -- upvalues: v68 (copy)
        return v68(v75);
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "players", 
        type = "{ Player }", 
        suggestion_generator = function(v76) --[[ Line: 365 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: l_Players_0 (copy)
            v76 = v76:lower();
            local v77 = {};
            if string.sub("@s", 1, #v76) == v76 then
                table.insert(v77, "@s");
            end;
            if string.sub("@a", 1, #v76) == v76 then
                table.insert(v77, "@a");
            end;
            for _, v79 in l_Players_0:GetPlayers() do
                if string.sub(v79.Name:lower(), 1, #v76) == v76 or string.sub(v79.DisplayName:lower(), 1, #v76) == v76 then
                    table.insert(v77, v79.Name);
                end;
            end;
            return v77;
        end
    }
};
local function v88(v81) --[[ Line: 391 ]] --[[ Name: convert_arg_to_userid ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    local v82 = v2.get_command_context();
    if v81 == "@s" then
        return v82 and v82.executor.player and v82.executor.player.UserId or error("not executed by a player");
    elseif typeof(v81) == "number" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 400 ]]
            -- upvalues: l_Players_0 (ref), v81 (copy)
            return l_Players_0:GetNameFromUserIdAsync(v81);
        end);
        if not l_status_0 and l_result_0:find("Unknown User") then
            error(("No user found with UserId %*"):format(v81), 0);
        end;
        return v81;
    elseif typeof(v81) == "string" then
        local l_l_Players_0_FirstChild_0 = l_Players_0:FindFirstChild(v81);
        if not l_l_Players_0_FirstChild_0 then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 413 ]]
                -- upvalues: l_Players_0 (ref), v81 (copy)
                return l_Players_0:GetUserIdFromNameAsync(v81);
            end);
            if not l_status_1 and l_result_1:find("Unknown User") then
                error(("No user found with name %*"):format(v81), 0);
                return l_result_1;
            else
                error(("Could not fetch player name, try again later: %*"):format(v81), 0);
                return l_result_1;
            end;
        else
            assert(l_l_Players_0_FirstChild_0:IsA("Player"));
            return l_l_Players_0_FirstChild_0.UserId;
        end;
    elseif typeof(v81) == "Instance" and v81:IsA("Player") then
        return v81.UserId;
    else
        error(("unknown arg %*"):format(v81), 0);
        return;
    end;
end;
local function v93(v89) --[[ Line: 435 ]] --[[ Name: convert_arg_to_userids ]]
    -- upvalues: l_Players_0 (copy), v88 (copy)
    if v89 == "@a" then
        v89 = l_Players_0:GetPlayers();
    end;
    if typeof(v89) == "table" then
        local v90 = {};
        for v91, v92 in v90 do
            v90[v91] = v88(v92);
        end;
        return v90;
    else
        return {
            v88(v89)
        };
    end;
end;
local v99 = {
    convert = function(v94) --[[ Line: 454 ]] --[[ Name: convert ]]
        -- upvalues: v88 (copy)
        return v88(v94);
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "userid", 
        type = "number", 
        suggestion_generator = function(v95) --[[ Line: 461 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: l_Players_0 (copy)
            v95 = v95:lower();
            local v96 = {};
            if string.sub("@s", 1, #v95) == v95 then
                table.insert(v96, "@s");
            end;
            for _, v98 in l_Players_0:GetPlayers() do
                if string.sub(v98.Name:lower(), 1, #v95) == v95 or string.sub(v98.DisplayName:lower(), 1, #v95) == v95 then
                    table.insert(v96, v98.Name);
                end;
            end;
            return v96;
        end
    }
};
local v105 = {
    convert = function(v100) --[[ Line: 485 ]] --[[ Name: convert ]]
        -- upvalues: v93 (copy)
        return (v93(v100));
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "userids", 
        type = "{ number }", 
        suggestion_generator = function(v101) --[[ Line: 492 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: l_Players_0 (copy)
            v101 = v101:lower();
            local v102 = {};
            if string.sub("@s", 1, #v101) == v101 then
                table.insert(v102, "@s");
            end;
            if string.sub("@a", 1, #v101) == v101 then
                table.insert(v102, "@a");
            end;
            for _, v104 in l_Players_0:GetPlayers() do
                if string.sub(v104.Name:lower(), 1, #v101) == v101 or string.sub(v104.DisplayName:lower(), 1, #v101) == v101 then
                    table.insert(v102, v104.Name);
                end;
            end;
            return v102;
        end
    }
};
local v107 = {
    convert = function(v106) --[[ Line: 519 ]] --[[ Name: convert ]]
        if typeof(v106) == "Color3" then
            return v106;
        elseif typeof(v106) == "string" then
            return (Color3.fromHex(v106));
        elseif type(v106) == "vector" then
            return (Color3.fromRGB(v106.x, v106.y, v106.z));
        else
            return (error(("cannot convert %* into color3"):format((typeof(v106))), 0));
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "Color3", 
        type = "Color3"
    }
};
local v112 = {
    convert = function(v108) --[[ Line: 540 ]] --[[ Name: convert ]]
        if typeof(v108) == "Color3" then
            return v108;
        elseif typeof(v108) == "string" then
            return (Color3.fromHex(v108));
        elseif type(v108) == "vector" then
            return (Color3.fromRGB(v108.x, v108.y, v108.z));
        elseif typeof(v108) == "table" then
            return ((function() --[[ Line: 551 ]]
                -- upvalues: v108 (copy)
                local v109 = {};
                for v110, v111 in v108 do
                    v109[v110] = if typeof(v111) == "Color3" then v108 else if typeof(v111) == "string" then Color3.fromHex(v111) else if type(v111) == "vector" then Color3.fromRGB(v111.x, v111.y, v111.z) else error(("cannot convert %* into color3"):format((typeof(v108))), 0);
                end;
                return v109;
            end)());
        else
            return (error(("cannot convert %* into color3"):format((typeof(v108))), 0));
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "Color3", 
        type = "Color3"
    }
};
local v113 = {
    ms = 0.001, 
    milisecond = 0.001, 
    s = 1, 
    sec = 1, 
    second = 1, 
    min = 60, 
    minute = 60, 
    hr = 3600, 
    hour = 3600, 
    d = 86400, 
    day = 86400, 
    wk = 604800, 
    week = 604800, 
    mo = 2592000, 
    month = 2592000, 
    y = 31536000, 
    yr = 31536000, 
    year = 31536000
};
local function v124(v114) --[[ Line: 610 ]] --[[ Name: parse_duration ]]
    -- upvalues: v113 (copy)
    local v115 = string.split(v114, " ");
    local v116 = 0;
    for _, v118 in v115 do
        local v119, v120 = string.match(v118, "(.-)([A-z]+)$");
        if v119 and v120 then
            local v121 = v113[v120];
            if not v121 then
                error(("\"%*\" is not a valid suffix"):format(v121), 0);
            end;
            local v122 = tonumber(v119);
            if not v122 then
                error(("could not convert \"%*\" into a duration"):format(v118), 0);
            end;
            v116 = v116 + v122 * v121;
        else
            local v123 = tonumber(v118);
            if not v123 then
                error(("could not convert \"%*\" into a duration"):format(v118), 0);
            end;
            v116 = v116 + v123;
        end;
    end;
    return v116;
end;
local v137 = {
    convert = function(v125) --[[ Line: 637 ]] --[[ Name: convert ]]
        -- upvalues: v124 (copy)
        if typeof(v125) == "number" then
            return v125;
        else
            return (v124(v125));
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "duration", 
        type = "number", 
        suggestion_generator = function(v126) --[[ Line: 647 ]] --[[ Name: suggestion_generator ]]
            -- upvalues: v113 (copy)
            local v127 = string.split(v126, " ");
            local v128 = v127[#v127] or "1";
            local v129 = {};
            local v130 = table.concat(v127, " ", 1, #v127 - 1);
            local v131, v132 = string.match(v128, "(.-)([A-z]+)$");
            if v132 then
                for v133 in v113 do
                    if v132 == string.sub(v133, 1, #v132) then
                        table.insert(v129, (("%*%*"):format(v131, v133)));
                    end;
                end;
            else
                for v134 in v113 do
                    table.insert(v129, (("%*%*"):format(v128, v134)));
                end;
            end;
            if #v130 > 0 then
                v130 = ("%* "):format(v130);
            end;
            for v135, v136 in v129 do
                v129[v135] = ("\"%*%*\""):format(v130, v136);
            end;
            return v129;
        end
    }
};
local function v142(v138) --[[ Line: 677 ]] --[[ Name: generate_names_for_enum ]]
    -- upvalues: v53 (copy)
    local v139 = {};
    for _, v141 in v138:GetEnumItems() do
        v139[v141.Name] = v141;
    end;
    return (v53(v139, (tostring(v138))));
end;
local function v144(v143) --[[ Line: 689 ]] --[[ Name: variadic ]]
    v143.kind = "varargs";
    return v143;
end;
local function v146(v145) --[[ Line: 695 ]] --[[ Name: optional ]]
    v145.optional = true;
    return v145;
end;
return {
    any = v1.register_type("any", v8), 
    string = v1.register_type("string", v9), 
    strings = v1.register_type("strings", v14), 
    number = v1.register_type("number", v17), 
    numbers = v1.register_type("numbers", v24), 
    boolean = v1.register_type("boolean", v28), 
    booleans = v1.register_type("booleans", v35), 
    table = v1.register_type("table", v36), 
    vector = v1.register_type("vector", v38), 
    vectors = v1.register_type("vectors", v44), 
    player = v1.register_type("player", v74), 
    players = v1.register_type("players", v80), 
    userid = v1.register_type("userid", v99), 
    userids = v1.register_type("userids", v105), 
    color = v1.register_type("color", v107), 
    colors = v1.register_type("colors", v112), 
    duration = v1.register_type("duration", v137), 
    userinput = v1.register_type("userinput", (v142(Enum.UserInputType))), 
    variadic = v144, 
    optional = v146, 
    opt = v146, 
    enum_new = v60, 
    enum_map = v53
};