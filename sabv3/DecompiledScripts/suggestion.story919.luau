local v0 = require("../../roblox_packages/conch");
local v1 = require("../../roblox_packages/vide");
local v2 = require("../state");
local v3 = require("../components/suggestion");
local l_source_0 = v1.source;
return function(v5) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy), v3 (copy), l_source_0 (copy)
    v2.opened(true);
    v0._.create_local_user();
    return v1.mount(function() --[[ Line: 13 ]]
        -- upvalues: v3 (ref), l_source_0 (ref)
        return v3({
            highlighted_suggestion = l_source_0({
                name = "highlight", 
                description = "this argument onmly takes like a vector or something and does this and that i honestly dont care.", 
                type = "meow"
            }), 
            suggestions = l_source_0({
                "test", 
                "value", 
                "grapes", 
                "apples"
            })
        });
    end, v5);
end;