--!native
local _ = game:GetService("ServerScriptService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.Packages.Squash);
local l_T_0 = v2.T;
local _ = v2.uint;
local v5 = v2.vlq();
local v6 = v2.boolean();
local v7 = v2.string();
local v8 = v2.number(4);
local _ = v2.Vector2;
local l_array_0 = v2.array;
local l_map_0 = v2.map;
local l_opt_0 = v2.opt;
local l_record_0 = v2.record;
local v14 = {
    "boolean", 
    "number"
};
local v15 = nil;
v15 = function() --[[ Line: 23 ]] --[[ Name: any ]]
    -- upvalues: v7 (copy), v15 (ref), v5 (copy), v2 (copy), v14 (copy)
    return {
        ser = function(v16, v17) --[[ Line: 25 ]] --[[ Name: ser ]]
            -- upvalues: v7 (ref), v15 (ref), v5 (ref), v2 (ref), v14 (ref)
            local v18 = typeof(v17);
            if v18 == "nil" then
                v7.ser(v16, "nil");
                return;
            elseif v18 == "table" then
                local v19 = 0;
                for v20, v21 in v17 do
                    v19 = v19 + 1;
                    v15().ser(v16, v20);
                    v15().ser(v16, v21);
                end;
                v5.ser(v16, v19);
                v7.ser(v16, "table");
                return;
            else
                local v22 = v2[v18];
                if not v22 then
                    error((("not found for %*"):format(v18)));
                end;
                if typeof(v22) == "function" or v18 == "string" then
                    v22 = v22(if v18 == "string" then nil else table.find(v14, v18) and 8 or v2.number(8));
                end;
                v22.ser(v16, v17);
                v7.ser(v16, v18);
                return;
            end;
        end, 
        des = function(v23) --[[ Line: 55 ]] --[[ Name: des ]]
            -- upvalues: v7 (ref), v5 (ref), v15 (ref), v2 (ref), v14 (ref)
            local v24 = v7.des(v23);
            if v24 == "nil" then
                return nil;
            elseif v24 == "table" then
                local v25 = {};
                for _ = 1, v5.des(v23) do
                    local v27 = v15().des(v23);
                    v25[v15().des(v23)] = v27;
                end;
                return v25;
            else
                local v28 = v2[v24];
                if not v28 then
                    error((("not found for %*"):format(v24)));
                end;
                if typeof(v28) == "function" or v24 == "string" then
                    v28 = v28(if v24 == "string" then nil else table.find(v14, v24) and 8 or v2.number(8));
                end;
                return v28.des(v23);
            end;
        end
    };
end;
return l_record_0({
    Information = l_T_0(l_record_0({
        Looped = l_T_0(v6), 
        Length = l_T_0(v5), 
        FPS = l_T_0(l_opt_0(v5))
    })), 
    Compiled = l_T_0(l_array_0(l_record_0({
        Path = l_record_0({
            InstanceNames = l_T_0(l_array_0(v7)), 
            InstanceTypes = l_T_0(l_array_0(v7)), 
            ItemType = l_T_0(v7)
        }), 
        Props = l_T_0(l_opt_0(l_map_0(v7, l_record_0({
            Default = l_T_0(v15()), 
            Static = l_T_0(l_opt_0(v6)), 
            Sequence = l_T_0(l_array_0(l_record_0({
                Ease = l_T_0(l_opt_0(l_record_0({
                    Params = l_record_0({
                        Direction = l_T_0(l_opt_0(v7)), 
                        Overshoot = l_T_0(l_opt_0(v8)), 
                        Amplitude = l_T_0(l_opt_0(v8)), 
                        Period = l_T_0(l_opt_0(v8))
                    }), 
                    Type = l_T_0(v7)
                }))), 
                Time = l_T_0(v5), 
                Value = l_T_0(v15())
            })))
        }))))
    })))
});