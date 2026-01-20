if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.action)();
local v1 = require(script.Parent.cleanup);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: changed ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0(function(v4) --[[ Line: 7 ]]
        -- upvalues: v2 (copy), v3 (copy), v1 (ref)
        local v5 = v4:GetPropertyChangedSignal(v2):Connect(function() --[[ Line: 8 ]]
            -- upvalues: v3 (ref), v4 (copy), v2 (ref)
            v3(v4[v2]);
        end);
        v1(function() --[[ Line: 12 ]]
            -- upvalues: v5 (copy)
            v5:Disconnect();
        end);
        v3(v4[v2]);
    end);
end;