local l_UserService_0 = game:GetService("UserService");
local l_Players_0 = game:GetService("Players");
local v2 = {
    RequestQuota = 250, 
    UserCache = {}, 
    RequestBatch = {}, 
    ResumeThreads = {}
};
local function _(v3) --[[ Line: 25 ]] --[[ Name: addToBatch ]]
    -- upvalues: v2 (copy)
    if v2.UserCache[v3] then
        return;
    else
        if not table.find(v2.RequestBatch, v3) then
            table.insert(v2.RequestBatch, v3);
        end;
        return;
    end;
end;
local function _(v5) --[[ Line: 35 ]] --[[ Name: consumeQuota ]]
    -- upvalues: v2 (copy)
    local l_v2_0 = v2;
    l_v2_0.RequestQuota = l_v2_0.RequestQuota - v5;
    task.delay(60, function() --[[ Line: 37 ]]
        -- upvalues: v2 (ref), v5 (copy)
        local l_v2_1 = v2;
        l_v2_1.RequestQuota = l_v2_1.RequestQuota + v5;
    end);
end;
local function v25() --[[ Line: 42 ]] --[[ Name: tryUpdate ]]
    -- upvalues: v2 (copy), l_UserService_0 (copy)
    local v9 = #v2.RequestBatch;
    if v9 == 0 then
        return true, false;
    else
        local v10 = math.min(v9, v2.RequestQuota, 250);
        if v10 == 0 then
            return true, false;
        else
            local v11 = table.move(v2.RequestBatch, 1, v10, 1, {});
            local v12 = #v11;
            local l_v2_2 = v2;
            l_v2_2.RequestQuota = l_v2_2.RequestQuota - v12;
            local l_v12_0 = v12 --[[ copy: 3 -> 18 ]];
            task.delay(60, function() --[[ Line: 37 ]]
                -- upvalues: v2 (ref), l_v12_0 (copy)
                local l_v2_3 = v2;
                l_v2_3.RequestQuota = l_v2_3.RequestQuota + l_v12_0;
            end);
            v12, l_v2_2 = pcall(function() --[[ Line: 56 ]]
                -- upvalues: l_UserService_0 (ref), v11 (copy)
                return l_UserService_0:GetUserInfosByUserIdsAsync(v11);
            end);
            if not v12 or type(l_v2_2) ~= "table" then
                return false, false;
            else
                for _, v17 in v11 do
                    local v18 = nil;
                    for _, v20 in l_v2_2 do
                        if v20.Id == v17 then
                            v18 = v20;
                            break;
                        end;
                    end;
                    if not v18 then
                        v18 = {
                            IsLoaded = false, 
                            DisplayName = "Failed to load", 
                            HasVerifiedBadge = false, 
                            Id = v17, 
                            Username = "Failed to load"
                        };
                    else
                        v18.IsLoaded = true;
                        v2.UserCache[v17] = v18;
                    end;
                    local v21 = table.find(v2.RequestBatch, v17);
                    if v21 then
                        table.remove(v2.RequestBatch, v21);
                    end;
                    local v22 = v2.ResumeThreads[v17];
                    if v22 then
                        for _, v24 in v22 do
                            if coroutine.status(v24) == "suspended" then
                                task.spawn(v24, v18);
                            end;
                        end;
                        v2.ResumeThreads[v17] = nil;
                    end;
                end;
                return true, true;
            end;
        end;
    end;
end;
local function v26() --[[ Line: 108 ]] --[[ Name: start ]]
    -- upvalues: v25 (copy)
    while true do
        task.wait(5);
        v25();
    end;
end;
v2.AddToBatch = function(_, v28) --[[ Line: 116 ]] --[[ Name: AddToBatch ]]
    -- upvalues: v2 (copy)
    if type(v28) == "number" then
        if v2.UserCache[v28] then
            return;
        elseif not table.find(v2.RequestBatch, v28) then
            table.insert(v2.RequestBatch, v28);
            return;
        end;
    else
        for _, v30 in v28 do
            if not v2.UserCache[v30] and not table.find(v2.RequestBatch, v30) then
                table.insert(v2.RequestBatch, v30);
            end;
        end;
    end;
end;
v2.GetUser = function(_, v32) --[[ Line: 126 ]] --[[ Name: GetUser ]]
    -- upvalues: v2 (copy), l_Players_0 (copy)
    assert(type(v32) == "number", "UsersAPI:GetUser | userId must be a number");
    if v32 <= 0 then
        local v33 = ("Player%*"):format(v32);
        return {
            IsLoaded = true, 
            DisplayName = v33, 
            HasVerifiedBadge = false, 
            Id = v32, 
            Username = v33
        };
    else
        local v34 = v2.UserCache[v32];
        if v34 and v34.IsLoaded then
            return v34;
        else
            local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v32);
            if l_l_Players_0_PlayerByUserId_0 then
                v2.UserCache[v32] = {
                    IsLoaded = true, 
                    DisplayName = l_l_Players_0_PlayerByUserId_0.DisplayName, 
                    HasVerifiedBadge = l_l_Players_0_PlayerByUserId_0.HasVerifiedBadge, 
                    Id = v32, 
                    Username = l_l_Players_0_PlayerByUserId_0.Name
                };
                return v2.UserCache[v32];
            else
                local v36 = coroutine.running();
                if not v2.UserCache[v32] and not table.find(v2.RequestBatch, v32) then
                    table.insert(v2.RequestBatch, v32);
                end;
                if not v2.ResumeThreads[v32] then
                    v2.ResumeThreads[v32] = {
                        v36
                    };
                else
                    table.insert(v2.ResumeThreads[v32], v36);
                end;
                return coroutine.yield();
            end;
        end;
    end;
end;
task.spawn(v26);
return v2;