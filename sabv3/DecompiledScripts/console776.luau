local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local v2 = require("../roblox_packages/ast");
local v3 = require("../roblox_packages/compiler");
local v4 = require("../roblox_packages/vm");
local _ = require("../roblox_packages/types");
local v6 = require("../roblox_packages/intel");
local v7 = require("./net");
local v8 = require("./signal");
local v9 = require("./state");
local _ = require("./types");
local v11 = require("./user");
local v12 = l_RunService_0:IsServer();
local v13 = {
    locals = {}, 
    upvalues = {}, 
    instructions = {}
};
local v14 = v4();
local v15 = {};
local v16 = v8();
local v17 = {
    vm = v14, 
    commands = v15, 
    output = print
};
local v18 = {};
local function v23(v19, v20) --[[ Line: 30 ]] --[[ Name: register_type ]]
    -- upvalues: v18 (copy)
    v18[v19] = v20;
    return function(v21, v22) --[[ Line: 40 ]]
        -- upvalues: v19 (copy)
        return {
            name = v21, 
            description = v22, 
            optional = false, 
            kind = "arg", 
            type = v19
        };
    end;
end;
local function v26(v24, v25) --[[ Line: 51 ]] --[[ Name: write_global ]]
    -- upvalues: v9 (copy), v14 (copy)
    assert(v9.local_user, "cannot set global on server");
    assert(string.match(v24, "^[A-z%-@_]*$"), (("%* is not a valid name"):format(v24)));
    v14.globals[v24] = v25;
end;
local function v28(v27) --[[ Line: 57 ]] --[[ Name: get_type ]]
    -- upvalues: v18 (copy)
    return v18[v27];
end;
local function v33(v29, v30) --[[ Line: 59 ]] --[[ Name: replicate_to_player ]]
    -- upvalues: v11 (copy), v9 (copy), v7 (copy)
    local v31 = v11.obtain_user_key(v29);
    local v32 = v9.users[v31];
    if not v32 then
        return;
    elseif not v11.has_permissions(v32, unpack(v30.permissions)) then
        return;
    else
        v7.server.fire_register_command(v29, {
            name = v30.name, 
            description = v30.description, 
            permissions = v30.permissions, 
            arguments = v30.arguments
        });
        return;
    end;
end;
local v34 = false;
local function v41(v35) --[[ Line: 86 ]] --[[ Name: execute ]]
    -- upvalues: v2 (copy), v34 (ref), v17 (copy), v3 (copy), v13 (copy), v14 (copy)
    local v36 = v2(v35, false);
    assert(v36.status ~= "pending", "unfinished block");
    assert(not v34, "already executing!");
    v17.output({
        kind = "info", 
        text = ("> %*"):format(v36.src)
    });
    if v36.status == "error" then
        return v17.output({
            kind = "error", 
            text = v36.why
        });
    else
        v34 = true;
        local v37 = v3(v36.value, v13);
        v13.instructions = {};
        (function(v38, v39, ...) --[[ Line: 101 ]] --[[ Name: on_complete ]]
            -- upvalues: v17 (ref)
            if not v38 then
                v17.output({
                    kind = "error", 
                    text = tostring(v39)
                });
                return;
            else
                for v40 = 1, select("#", ...) do
                    v17.output({
                        kind = "normal", 
                        text = tostring((select(v40, ...)))
                    });
                end;
                return;
            end;
        end)(pcall(v14.run, v37));
        v34 = false;
        return;
    end;
end;
local function v66(v42, v43) --[[ Line: 122 ]] --[[ Name: register_command ]]
    -- upvalues: v18 (copy), v15 (copy), v14 (copy), v9 (copy), v16 (copy), v12 (copy), l_Players_0 (copy), v33 (copy)
    local v44 = {
        v43.arguments()
    } or {
        {
            kind = "varargs", 
            type = "any", 
            name = "...", 
            description = "unspecified"
        }
    };
    local v45 = {};
    local v46 = {};
    for v47, v48 in v44 do
        local v49 = v18[v48.type] or warn((("no argument of type \"%*\" is registered"):format(v48.type))) or v18.any;
        local v50 = table.clone(v49.analysis);
        v46[v47] = v49.convert;
        v45[v47] = {
            kind = v48.kind == "varargs" and "variadic" or "argument", 
            optional = v48.optional, 
            name = v48.name or v50.name, 
            description = v48.description, 
            type = v50.type, 
            suggestion_generator = v50.suggestion_generator
        };
    end;
    local v51 = {
        name = v42, 
        description = v43.description, 
        permissions = v43.permissions, 
        arguments = v44, 
        type_info = {
            kind = "command", 
            name = v42, 
            description = v43.description, 
            arguments = v45
        }, 
        callback = v43.callback, 
        dirty_replicate = true
    };
    v15[v42] = v51;
    v14.commands[v42] = function(...) --[[ Line: 183 ]]
        -- upvalues: v44 (copy), v46 (copy), v43 (copy), v9 (ref), v16 (ref), v42 (copy)
        local v52 = {
            ...
        };
        local function _(v53, ...) --[[ Line: 186 ]] --[[ Name: move ]]
            -- upvalues: v52 (copy)
            for v54 = 0, select("#", ...) - 1 do
                v52[v54 + v53] = select(v54 + 1, ...);
            end;
        end;
        local v56 = nil;
        local v57 = nil;
        for v58, v59 in v44 do
            if v59.variadic then
                v56 = v46[v58];
                v57 = v58;
                break;
            elseif v59.optional and select(v58, ...) == nil then
                v52[v58] = nil;
            else
                v52[v58] = v46[v58]((select(v58, ...)));
            end;
        end;
        if v56 and v57 then
            for v60 = v57 + 1, select("#", ...) do
                v52[v60] = v56((select(v60, ...)));
            end;
        end;
        local v61 = {
            pcall(v43.callback, unpack(v52, 1, select("#", ...)))
        };
        local v62 = table.remove(v61, 1);
        local v63 = v9.command_context[coroutine.running()];
        v16:fire({
            ok = v62, 
            who = v63 and v63.executor, 
            command = v42, 
            arguments = v52, 
            result = v61
        });
        if not v62 then
            error(v61[2]);
        end;
        return unpack(v61);
    end;
    if v12 then
        for _, v65 in l_Players_0:GetPlayers() do
            v33(v65, v51);
        end;
    end;
    return v51;
end;
return {
    console = v17, 
    register_quick = function(v67, v68, ...) --[[ Line: 240 ]] --[[ Name: register ]]
        -- upvalues: v66 (copy)
        v66(v67, {
            name = v67, 
            callback = v68, 
            arguments = function() --[[ Line: 244 ]]

            end, 
            permissions = {
                ...
            }
        });
    end, 
    register_command = v66, 
    replicate_to_player = v33, 
    execute = v41, 
    analyze = function(v69, v70) --[[ Line: 249 ]] --[[ Name: analyze ]]
        -- upvalues: v15 (copy), v14 (copy), v13 (copy), v6 (copy)
        local v71 = {};
        local v72 = {};
        local v73 = 1;
        for _, v75 in v15 do
            v72[v73] = v75.type_info;
            v73 = v73 + 1;
        end;
        for v76, v77 in v14.globals do
            v71[v76] = v77;
        end;
        for v78, v79 in v13.locals do
            v71[v79] = v14.locals[v78];
        end;
        return v6.generate_analysis_info({
            code = v69, 
            where = v70, 
            variables = v71, 
            commands = v72
        });
    end, 
    write_global = v26, 
    after_command_run = v16, 
    register_type = v23, 
    get_type = v28, 
    ast = v2
};