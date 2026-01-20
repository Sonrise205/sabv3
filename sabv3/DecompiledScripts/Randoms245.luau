--!native
local _ = require(game.ReplicatedStorage.UserGenerated.Randoms.Base);
local v1 = require(game.ReplicatedStorage.UserGenerated.Randoms.Xorshift128);
local v4 = {
    DefaultXorshift128 = v1.R, 
    Xorshift128 = function(v2) --[[ Line: 28 ]] --[[ Name: Xorshift128 ]]
        -- upvalues: v1 (copy)
        return v1.new(v2);
    end, 
    UniqueXorshift128 = function(v3) --[[ Line: 31 ]] --[[ Name: UniqueXorshift128 ]]
        -- upvalues: v1 (copy)
        return v1.Unique(v3);
    end
};
return table.freeze(v4);