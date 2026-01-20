if not game then
    script = require("test/relative-string");
end;
local v0 = game and typeof or require("test/mock").typeof;
local v1 = require(script.Parent.throw);
local v2 = require(script.Parent.graph);
local l_get_scope_0 = v2.get_scope;
local l_push_cleanup_0 = v2.push_cleanup;
local function v6(v5) --[[ Line: 9 ]] --[[ Name: helper ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v0(v5) == "RBXScriptConnection" then
        return function() --[[ Line: 11 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    elseif v0(v5) == "Instance" then
        return function() --[[ Line: 12 ]]
            -- upvalues: v5 (copy)
            v5:Destroy();
        end;
    elseif v5.destroy then
        return function() --[[ Line: 13 ]]
            -- upvalues: v5 (copy)
            v5:destroy();
        end;
    elseif v5.disconnect then
        return function() --[[ Line: 14 ]]
            -- upvalues: v5 (copy)
            v5:disconnect();
        end;
    elseif v5.Destroy then
        return function() --[[ Line: 15 ]]
            -- upvalues: v5 (copy)
            v5:Destroy();
        end;
    elseif v5.Disconnect then
        return function() --[[ Line: 16 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end;
    else
        return (v1("cannot cleanup given object"));
    end;
end;
return function(v7) --[[ Line: 20 ]] --[[ Name: cleanup ]]
    -- upvalues: l_get_scope_0 (copy), v1 (copy), l_push_cleanup_0 (copy), v6 (copy)
    local v8 = l_get_scope_0();
    if not v8 then
        v1("cannot cleanup outside a stable or reactive scope");
    end;
    assert(v8);
    if type(v7) == "function" then
        l_push_cleanup_0(v8, v7);
        return;
    else
        l_push_cleanup_0(v8, (v6(v7)));
        return;
    end;
end;