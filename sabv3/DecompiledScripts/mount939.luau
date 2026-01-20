if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.root);
local v1 = require(script.Parent.apply);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: mount ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0(function() --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (ref)
        local v4 = v2();
        if v3 then
            v1(v3, {
                v4
            });
        end;
    end);
end;