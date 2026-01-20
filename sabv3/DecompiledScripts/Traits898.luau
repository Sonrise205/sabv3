local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Conch);
local _ = require(l_ReplicatedStorage_0.Datas.Animals);
local v3 = require(l_ReplicatedStorage_0.Datas.Traits);
local v4 = {};
for v5 in v3 do
    table.insert(v4, v5);
end;
return v1.register_type("Traits", {
    convert = function(v6) --[[ Line: 14 ]] --[[ Name: convert ]]
        -- upvalues: v3 (copy)
        if typeof(v6) == "table" then
            local v7 = table.clone(v6);
            for v8, v9 in v7 do
                local v10 = tostring(v9);
                if not v3[v10] then
                    error((("Trait %* not found"):format(v10)));
                end;
                v7[v8] = v10;
            end;
            return v7;
        else
            local v11 = tostring(v6);
            if not v3[v11] then
                error((("Trait %* not found"):format(v11)));
            end;
            return {
                v11
            };
        end;
    end, 
    analysis = {
        kind = "argument", 
        optional = false, 
        name = "traits", 
        type = "{ Trait }"
    }
});