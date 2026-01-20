--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Collections.DeepEquals);
local v2 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v7 = table.freeze({
    Get = function(v3) --[[ Line: 45 ]] --[[ Name: Get ]]
        return v3.Value;
    end, 
    Set = function(v4, v5) --[[ Line: 62 ]] --[[ Name: Set ]]
        -- upvalues: v1 (copy)
        if v4.Assertion then
            v5 = v4.Assertion(v5);
        end;
        local l_Value_0 = v4.Value;
        v4.Value = v5;
        if not v1(v5, l_Value_0) then
            v4.Changed:Fire(v5, l_Value_0);
        end;
        return l_Value_0;
    end
});
local v8 = table.freeze({
    __index = v7
});
return table.freeze({
    new = function(v9, v10) --[[ Line: 84 ]] --[[ Name: new ]]
        -- upvalues: v2 (copy), v8 (copy)
        assert(type(v9) == "function");
        v10 = v9(v10);
        local v11 = {
            Changed = v2.new(), 
            Assertion = v9, 
            Value = v10
        };
        v11.Readonly = v11;
        return (setmetatable(v11, v8));
    end, 
    Unasserted = function(v12) --[[ Line: 100 ]] --[[ Name: Unasserted ]]
        -- upvalues: v2 (copy), v8 (copy)
        local v13 = {
            Changed = v2.new(), 
            Value = v12
        };
        v13.Readonly = v13;
        return (setmetatable(v13, v8));
    end
});