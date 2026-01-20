local l_UnixTimestamp_0 = DateTime.fromUniversalTime(2025, 12, 1, 0, 0, 0).UnixTimestamp;
local v1 = {
    [1] = {
        type = "brainrot", 
        name = "Admin Lucky Block"
    }, 
    [2] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [3] = {
        type = "brainrot", 
        name = "Los Lucky Blocks"
    }, 
    [4] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [5] = {
        type = "brainrot", 
        name = "Ballerina Peppermintina"
    }, 
    [6] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [7] = {
        type = "skipfuse"
    }, 
    [8] = {
        type = "brainrot", 
        name = "Admin Lucky Block", 
        quantity = 2
    }, 
    [9] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [10] = {
        type = "brainrot", 
        name = "Please my Present"
    }, 
    [11] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [12] = {
        type = "brainrot", 
        name = "Los Lucky Blocks", 
        quantity = 2
    }, 
    [13] = {
        type = "skipfuse"
    }, 
    [14] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [15] = {
        type = "candyCane", 
        quantity = 50
    }, 
    [16] = {
        type = "skipfuse"
    }, 
    [17] = {
        type = "luck", 
        multiplier = "2x"
    }, 
    [18] = {
        type = "candyCane", 
        quantity = 50
    }, 
    [19] = {
        type = "skipfuse"
    }, 
    [20] = {
        type = "brainrot", 
        name = "Festive Lucky Block", 
        quantity = 1
    }, 
    [21] = {
        type = "candyCane", 
        quantity = 50
    }, 
    [22] = {
        type = "skipfuse"
    }, 
    [23] = {
        type = "candyCane", 
        quantity = 50
    }, 
    [24] = {
        type = "brainrot", 
        name = "Bunnyman", 
        quantity = 1
    }, 
    [25] = {
        type = "brainrot", 
        name = "Festive Lucky Block", 
        quantity = 1
    }
};
local v2 = {
    [3] = {
        type = "brainrot", 
        name = "Admin Lucky Block", 
        quantity = 3
    }, 
    [7] = {
        type = "brainrot", 
        name = "Los Lucky Blocks", 
        quantity = 1
    }, 
    [14] = {
        type = "brainrot", 
        name = "Festive Lucky Block", 
        quantity = 3
    }, 
    [25] = {
        type = "brainrot", 
        name = "25"
    }
};
local v5 = {
    Rewards = {
        Calendar = v1, 
        Streak = v2
    }, 
    TotalDays = 25, 
    getCurrentDay = function(v3) --[[ Line: 69 ]] --[[ Name: getCurrentDay ]]
        -- upvalues: l_UnixTimestamp_0 (copy)
        return ((v3 or workspace:GetServerTimeNow() // 1) - l_UnixTimestamp_0) // 86400 + 1;
    end, 
    timeToReward = function(v4) --[[ Line: 76 ]] --[[ Name: timeToReward ]]
        -- upvalues: v1 (copy), l_UnixTimestamp_0 (copy)
        if not v1[v4] then
            return nil;
        else
            return l_UnixTimestamp_0 + (v4 - 1) * 86400;
        end;
    end
};
v5.getNextRewardTimestamp = function(v6) --[[ Line: 84 ]] --[[ Name: getNextRewardTimestamp ]]
    -- upvalues: v5 (copy)
    local v7 = v5.getCurrentDay(v6);
    return v5.timeToReward(v7 + 1);
end;
v5.getCalendarReward = function(v8) --[[ Line: 89 ]] --[[ Name: getCalendarReward ]]
    -- upvalues: v1 (copy)
    return v1[v8];
end;
v5.getStreakReward = function(v9) --[[ Line: 93 ]] --[[ Name: getStreakReward ]]
    -- upvalues: v2 (copy)
    return v2[v9];
end;
v5.getStreak = function(v10, v11, v12) --[[ Line: 97 ]] --[[ Name: getStreak ]]
    -- upvalues: v5 (copy)
    local v13 = v11 or v5.getCurrentDay(v12);
    local v14 = 0;
    for v15 = 1, v13 do
        if v10[tostring(v15)] ~= nil then
            v14 = v14 + 1;
        else
            v14 = 0;
        end;
    end;
    return v14;
end;
v5.getLastFailedDay = function(v16, v17, v18) --[[ Line: 110 ]] --[[ Name: getLastFailedDay ]]
    -- upvalues: v5 (copy)
    local v19 = v17 or v5.getCurrentDay(v18);
    for v20 = v19 - 1, 1, -1 do
        if v16[tostring(v20)] == nil then
            return v20;
        end;
    end;
    return nil;
end;
return v5;