--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v2 = require(game.ReplicatedStorage.UserGenerated.Collections.DeepFreeze);
local v3 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Lock);
local v4 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local function _(v5, v6) --[[ Line: 38 ]] --[[ Name: ValueAge ]]
    local l_RetrievedAt_0 = v5.RetrievedAt;
    if l_RetrievedAt_0 then
        return v6 - l_RetrievedAt_0;
    else
        return nil;
    end;
end;
local function _(v9, v10) --[[ Line: 46 ]] --[[ Name: AttemptAge ]]
    local l_AttemptedAt_0 = v9.AttemptedAt;
    if l_AttemptedAt_0 then
        return v10 - l_AttemptedAt_0;
    else
        return 1e999;
    end;
end;
local v27 = {
    RemoveUsedAt = function(_, _) --[[ Line: 89 ]] --[[ Name: RemoveUsedAt ]]

    end, 
    InsertUsedAt = function(_, _) --[[ Line: 93 ]] --[[ Name: InsertUsedAt ]]

    end, 
    SetUsedAt = function(v17, v18, v19) --[[ Line: 97 ]] --[[ Name: SetUsedAt ]]
        v17:RemoveUsedAt(v18);
        v18.UsedAt = v19;
        v17:InsertUsedAt(v18);
    end, 
    Get = function(v20, v21) --[[ Line: 109 ]] --[[ Name: Get ]]
        local v22 = v20.AssertKey(v21);
        local v23 = v20.Cache[v22];
        if not v23 then
            return nil;
        else
            local v24 = os.clock();
            local l_RetrievedAt_1 = v23.RetrievedAt;
            local v26 = if l_RetrievedAt_1 then v24 - l_RetrievedAt_1 else nil;
            if not v26 or v20.MaxAge <= v26 and not v20.ReturnStale then
                return nil;
            else
                v20:SetUsedAt(v23, v24);
                return v23.Value;
            end;
        end;
    end
};
AsyncCallback = function(v28, v29, v30, v31) --[[ Line: 124 ]] --[[ Name: AsyncCallback ]]
    -- upvalues: v2 (copy)
    local l_v31_0 = v31;
    local l_RetrievedAt_2 = v29.RetrievedAt;
    local v34 = if l_RetrievedAt_2 then l_v31_0 - l_RetrievedAt_2 else nil;
    if v34 and v34 < v28.MaxAge then
        return v29.Value;
    else
        l_RetrievedAt_2 = v31;
        local l_AttemptedAt_1 = v29.AttemptedAt;
        if (if l_AttemptedAt_1 then l_RetrievedAt_2 - l_AttemptedAt_1 else 1e999) < v28.FailureRetryDelay then
            if v28.ReturnStale then
                return v29.Value;
            else
                return nil;
            end;
        else
            v29.AttemptedAt = v31;
            l_RetrievedAt_2, l_AttemptedAt_1 = pcall(v28.Callback, v30);
            v31 = os.clock();
            v29.AttemptedAt = v31;
            v28:SetUsedAt(v29, v31);
            if not l_RetrievedAt_2 then
                if v28.ReturnStale then
                    return v29.Value;
                else
                    return nil;
                end;
            else
                if v28.Freeze then
                    l_AttemptedAt_1 = v2(l_AttemptedAt_1);
                end;
                v29.Value = l_AttemptedAt_1;
                v29.RetrievedAt = v31;
                v28.Updated:Fire(v30);
                return l_AttemptedAt_1;
            end;
        end;
    end;
end;
v27.GetAsync = function(v36, v37) --[[ Line: 156 ]] --[[ Name: GetAsync ]]
    -- upvalues: v3 (copy)
    local v38 = os.clock();
    local v39 = v36.AssertKey(v37);
    local v40 = v36.Cache[v39];
    if not v40 then
        local v41 = {
            Lock = v3.new(), 
            UsedAt = v38
        };
        v36.Cache[v39] = v41;
        v36:InsertUsedAt(v41);
        v40 = v41;
    else
        v36:SetUsedAt(v40, v38);
    end;
    return v40.Lock:Call(AsyncCallback, v36, v40, v37, v38);
end;
v27.Delete = function(v42, v43) --[[ Line: 174 ]] --[[ Name: Delete ]]
    local v44 = v42.AssertKey(v43);
    if v42.Cache[v44] then
        v42.Cache[v44] = nil;
        v42.Deleted:Fire(v43);
    end;
end;
local v45 = table.freeze({
    __index = table.freeze(v27)
});
local v46 = v4.Table({
    Callback = v4.Function, 
    AssertKey = v4.Function, 
    MaxAge = v4.Optional(v4.NonNegative), 
    FailureRetryDelay = v4.Optional(v4.NonNegative), 
    ReturnStale = v4.Optional(v4.Boolean), 
    Freeze = v4.Optional(v4.Boolean)
});
local v49 = {
    new = function(v47) --[[ Line: 210 ]] --[[ Name: new ]]
        -- upvalues: v46 (copy), v1 (copy), v45 (copy)
        v46(v47);
        local v48 = setmetatable({
            Updated = v1.new(), 
            Deleted = v1.new(), 
            Callback = v47.Callback, 
            AssertKey = v47.AssertKey, 
            MaxAge = v47.MaxAge or 1e999, 
            FailureRetryDelay = v47.FailureRetryDelay or 300, 
            ReturnStale = v47.ReturnStale == nil or v47.ReturnStale, 
            Freeze = v47.Freeze == nil or v47.Freeze, 
            Cache = {}
        }, v45);
        table.freeze(v48);
        return v48;
    end
};
return table.freeze(v49);