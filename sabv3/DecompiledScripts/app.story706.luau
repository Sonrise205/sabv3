local v0 = require("../../roblox_packages/conch");
local v1 = require("../../roblox_packages/vide");
local v2 = require("../app");
local v3 = require("../state");
return function(v4) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v0 (copy), v1 (copy), v2 (copy)
    v3.opened(true);
    v0.register_default_commands();
    v0._.create_local_user();
    return v1.mount(function() --[[ Line: 11 ]]
        -- upvalues: v2 (ref)
        return v2();
    end, v4);
end;