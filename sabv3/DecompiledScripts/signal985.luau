local _ = require("./types");
return function() --[[ Line: 4 ]] --[[ Name: create_signal ]]
    local v1 = {};
    return {
        connect = function(_, v3) --[[ Line: 8 ]] --[[ Name: connect ]]
            -- upvalues: v1 (copy)
            local v4 = false;
            local v5 = {
                callback = v3
            };
            v5.disconnect = function() --[[ Line: 12 ]] --[[ Name: disconnect ]]
                -- upvalues: v4 (ref), v5 (copy), v1 (ref)
                if v4 then
                    return;
                else
                    v4 = true;
                    v5.disconnected = true;
                    local v6 = table.find(v1, v5);
                    if not v6 then
                        return;
                    else
                        table.remove(v1, v6);
                        return;
                    end;
                end;
            end;
            table.insert(v1, v5);
            return v5;
        end, 
        fire = function(_, ...) --[[ Line: 29 ]] --[[ Name: fire ]]
            -- upvalues: v1 (copy)
            for _, v9 in v1 do
                v9.callback(...);
            end;
        end
    };
end;