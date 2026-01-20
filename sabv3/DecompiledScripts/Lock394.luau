--!native
local v0 = require(game.ReplicatedStorage.UserGenerated.Lang.Finally);
local v8 = {
    Call = function(v1, v2, ...) --[[ Line: 42 ]] --[[ Name: Call ]]
        -- upvalues: v0 (copy)
        assert(type(v2) == "function");
        while v1.Count > 0 do
            task.wait();
        end;
        v1.Count = v1.Count + 1;
        return v0(v2, function() --[[ Line: 52 ]]
            -- upvalues: v1 (copy)
            local l_v1_0 = v1;
            l_v1_0.Count = l_v1_0.Count - 1;
        end, ...);
    end, 
    Try = function(v4, v5, ...) --[[ Line: 57 ]] --[[ Name: Try ]]
        -- upvalues: v0 (copy)
        assert(type(v5) == "function");
        if v4.Count > 0 then
            return false;
        else
            v4.Count = v4.Count + 1;
            return true, v0(v5, function() --[[ Line: 67 ]]
                -- upvalues: v4 (copy)
                local l_v4_0 = v4;
                l_v4_0.Count = l_v4_0.Count - 1;
            end, ...);
        end;
    end, 
    IsLocked = function(v7) --[[ Line: 72 ]] --[[ Name: IsLocked ]]
        return v7.Count > 0;
    end
};
local v9 = {};
local v10 = table.freeze({
    __index = table.freeze(v8)
});
v9.new = function() --[[ Line: 82 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy)
    return (setmetatable({
        Count = 0
    }, v10));
end;
return table.freeze(v9);