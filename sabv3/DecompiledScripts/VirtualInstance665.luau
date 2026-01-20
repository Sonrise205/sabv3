local v10 = {
    __index = function(v0, v1) --[[ Line: 15 ]] --[[ Name: __index ]]
        local l___internals_0 = v0.__internals;
        if l___internals_0.lastSet[v1] ~= nil then
            return l___internals_0.lastSet[v1];
        else
            return l___internals_0.instance[v1];
        end;
    end, 
    __newindex = function(v3, v4, v5) --[[ Line: 23 ]] --[[ Name: __newindex ]]
        assert(v5 ~= nil, "cannot set vinst property to nil");
        local l___internals_1 = v3.__internals;
        if l___internals_1.lastSet[v4] == v5 then
            return;
        else
            l___internals_1.bufferedChanges[v4] = v5;
            l___internals_1.lastSet[v4] = v5;
            if not l___internals_1.hasBuffered then
                l___internals_1.hasBuffered = true;
                task.defer(function() --[[ Line: 34 ]]
                    -- upvalues: l___internals_1 (copy)
                    local l_instance_0 = l___internals_1.instance;
                    if not l___internals_1.hasBuffered then
                        return;
                    else
                        l___internals_1.hasBuffered = false;
                        for v8, v9 in l___internals_1.bufferedChanges do
                            l_instance_0[v8] = v9;
                        end;
                        table.clear(l___internals_1.bufferedChanges);
                        return;
                    end;
                end);
            end;
            return;
        end;
    end
};
return {
    wrap = function(v11) --[[ Line: 48 ]] --[[ Name: wrap ]]
        -- upvalues: v10 (copy)
        return (setmetatable({
            __internals = {
                instance = v11, 
                lastSet = {}, 
                bufferedChanges = {}, 
                hasBuffered = false
            }
        }, v10));
    end
};