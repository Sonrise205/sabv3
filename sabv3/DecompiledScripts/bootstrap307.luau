local l_RunService_0 = game:GetService("RunService");
local v1 = require("./arguments");
local v2 = require("./console");
local v3 = require("./state");
local _ = require("./types");
local v5 = l_RunService_0:IsClient();
local function _(v6) --[[ Line: 37 ]] --[[ Name: output ]]
    -- upvalues: v2 (copy)
    v2.console.output(v6);
end;
local function v11(...) --[[ Line: 39 ]] --[[ Name: concat ]]
    local v8 = {
        ...
    };
    for v9, v10 in v8 do
        v8[v9] = tostring(v10);
    end;
    return table.concat(v8, " ");
end;
local function v14(...) --[[ Line: 47 ]] --[[ Name: print ]]
    -- upvalues: v11 (copy), v2 (copy)
    local v12 = v11(...);
    local v13 = {
        kind = "normal", 
        text = v12
    };
    v2.console.output(v13);
end;
local function v15(...) --[[ Line: 52 ]] --[[ Name: error ]]
    -- upvalues: v11 (copy), v15 (copy)
    local v16 = v11(...);
    v15(v16, 0);
end;
local function v19(...) --[[ Line: 57 ]] --[[ Name: warn ]]
    -- upvalues: v11 (copy), v2 (copy)
    local v17 = v11(...);
    local v18 = {
        kind = "warn", 
        text = v17
    };
    v2.console.output(v18);
end;
local function v22(...) --[[ Line: 62 ]] --[[ Name: info ]]
    -- upvalues: v11 (copy), v2 (copy)
    local v20 = v11(...);
    local v21 = {
        kind = "info", 
        text = v20
    };
    v2.console.output(v21);
end;
if v5 then
    v2.register_command("license", {
        description = "Outputs the license to the console.", 
        permissions = {}, 
        arguments = function() --[[ Line: 71 ]] --[[ Name: arguments ]]

        end, 
        callback = function() --[[ Line: 72 ]] --[[ Name: callback ]]
            -- upvalues: v2 (copy)
            for _, v24 in string.split("MIT License\n\nCopyright (c) 2025 alicesays_hallo\n\nPermission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the \"Software\"), to deal\nin the Software without restriction, including without limitation the rights\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all\ncopies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\nSOFTWARE.", "\n") do
                local v25 = {
                    kind = "normal", 
                    text = v24
                };
                v2.console.output(v25);
            end;
        end
    });
end;
return function() --[[ Line: 80 ]]
    -- upvalues: v14 (copy), l_RunService_0 (copy), v3 (copy), v5 (copy), v2 (copy), v1 (copy), v15 (copy), v19 (copy), v22 (copy)
    local function _() --[[ Line: 81 ]] --[[ Name: internal ]]
        -- upvalues: v14 (ref), l_RunService_0 (ref), v3 (ref)
        v14((("CONCH INTERNAL INFORMATION - %*"):format(l_RunService_0:IsClient() and "CLIENT" or l_RunService_0:IsServer() and "SERVER" or "?")));
        v14("");
        v14("REGISTERED ROLES:");
        for v26, v27 in v3.roles do
            v14((("[%*]: %*"):format(v26, (table.concat(v27, ", ")))));
        end;
        v14("");
        v14("REGISTERED COMMANDS");
    end;
    local function v32(v29, v30, v31) --[[ Line: 97 ]] --[[ Name: set ]]
        v29[v30] = v31;
    end;
    if v5 then
        v2.register_command("print", {
            permissions = {}, 
            description = "Converts the given arguments into a string and sends it to the output", 
            arguments = function() --[[ Line: 104 ]] --[[ Name: arguments ]]
                -- upvalues: v1 (ref)
                return v1.variadic(v1.any("any", "Arguments to output"));
            end, 
            callback = v14
        });
        v2.register_command("sleep", {
            description = "Waits for a given amount of time before continuing execution", 
            arguments = function() --[[ Line: 112 ]] --[[ Name: arguments ]]
                -- upvalues: v1 (ref)
                return v1.number("time", "The amount of time to sleep for");
            end, 
            callback = task.wait
        });
        v2.register_command("pairs", {
            description = "Iterates over a table", 
            arguments = function() --[[ Line: 120 ]] --[[ Name: arguments ]]
                -- upvalues: v1 (ref)
                return v1.table("t", "Table to iterate over");
            end, 
            callback = function(v33) --[[ Line: 123 ]] --[[ Name: callback ]]
                local v34 = pairs(v33);
                local v35 = nil;
                return function() --[[ Line: 127 ]]
                    -- upvalues: v34 (copy), v33 (copy), v35 (ref)
                    local v36, v37 = v34(v33, v35);
                    v35 = v36;
                    return v36, v37;
                end;
            end
        });
        v2.register_command("ipairs", {
            description = "Iterates over an array", 
            arguments = function() --[[ Line: 137 ]] --[[ Name: arguments ]]
                -- upvalues: v1 (ref)
                return v1.table("t", "Table to iterate over");
            end, 
            callback = function(v38) --[[ Line: 140 ]] --[[ Name: callback ]]
                local v39 = ipairs(v38);
                local v40 = 0;
                return function() --[[ Line: 144 ]]
                    -- upvalues: v39 (copy), v38 (copy), v40 (ref)
                    local v41, v42 = v39(v38, v40);
                    v40 = v41;
                    return v41, v42;
                end;
            end
        });
        v2.register_quick("error", v15);
        v2.register_quick("warn", v19);
        v2.register_quick("info", v22);
        v2.register_command("set", {
            permissions = {}, 
            description = "Attempts to set the given key and value onto the given object", 
            arguments = function() --[[ Line: 158 ]] --[[ Name: arguments ]]
                -- upvalues: v1 (ref)
                return v1.any("object", "the object to set"), v1.any("key", "key of the object"), v1.any("value", "the value to set it to");
            end, 
            callback = v32
        });
    end;
end;