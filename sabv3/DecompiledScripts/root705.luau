if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.throw);
local v1 = require(script.Parent.graph);
local l_create_node_0 = v1.create_node;
local l_push_scope_0 = v1.push_scope;
local l_pop_scope_0 = v1.pop_scope;
local l_destroy_0 = v1.destroy;
local v6 = {};
return function(v7) --[[ Line: 13 ]] --[[ Name: root ]]
    -- upvalues: l_create_node_0 (copy), v6 (copy), v0 (copy), l_destroy_0 (copy), l_push_scope_0 (copy), l_pop_scope_0 (copy)
    local v8 = l_create_node_0(false, false, false);
    v6[v8] = true;
    local function v9() --[[ Line: 18 ]]
        -- upvalues: v6 (ref), v8 (copy), v0 (ref), l_destroy_0 (ref)
        if not v6[v8] then
            v0("root already destroyed");
        end;
        v6[v8] = nil;
        l_destroy_0(v8);
    end;
    l_push_scope_0(v8);
    local v11 = {
        xpcall(v7, function(v10) --[[ Line: 26 ]] --[[ Name: efn ]]
            return debug.traceback(v10, 3);
        end, v9)
    };
    l_pop_scope_0();
    if not v11[1] then
        if not v6[v8] then
            v0("root already destroyed");
        end;
        v6[v8] = nil;
        l_destroy_0(v8);
        v0((("error while running root():\n\n%*"):format(v11[2])));
    end;
    return v9, unpack(v11, 2);
end;