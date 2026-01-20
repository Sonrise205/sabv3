--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
assert(l_RunService_0:IsClient());
local v3 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local v4 = require(l_ReplicatedStorage_0.UserGenerated.FastFlags.SharedFastFlags);
local v5 = require(l_ReplicatedStorage_0.UserGenerated.Lang.Asserts);
local v6 = require(l_ReplicatedStorage_0.UserGenerated.Collections.DeepEqualsPureUnsafe);
local v7 = require(l_ReplicatedStorage_0.UserGenerated.Collections.DeepCopyPureUnsafe);
local v8 = require(l_ReplicatedStorage_0.UserGenerated.Collections.DeepFreezeUnsafe);
local v9 = require(l_ReplicatedStorage_0.UserGenerated.Strings.ObjectPaths);
local v10 = {};
local v11 = table.freeze({
    __index = v10
});
v10.Get = function(v12) --[[ Line: 48 ]] --[[ Name: Get ]]
    return v12.Value;
end;
v10.GetAsync = function(v13) --[[ Line: 51 ]] --[[ Name: GetAsync ]]
    if v13.ValueLoaded then
        return v13.Value;
    else
        local v14 = coroutine.running();
        local v15 = v13.Loaded:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v14 (copy)
            task.spawn(v14);
        end);
        coroutine.yield();
        v15:Disconnect();
        return v13.Value;
    end;
end;
v10.IsLoaded = function(v16) --[[ Line: 63 ]] --[[ Name: IsLoaded ]]
    return v16.ValueLoaded;
end;
local function v19(v17) --[[ Line: 67 ]] --[[ Name: IsA ]]
    -- upvalues: v11 (copy)
    local v18 = false;
    if type(v17) == "table" then
        v18 = getmetatable(v17) == v11;
    end;
    return v18;
end;
local function v22(v20) --[[ Line: 71 ]] --[[ Name: Assert ]]
    -- upvalues: v11 (copy)
    local v21 = false;
    if type(v20) == "table" then
        v21 = getmetatable(v20) == v11;
    end;
    if not v21 then
        error("FastFlag", 2);
    end;
    return v20;
end;
table.freeze(v10);
local l_NullValue_0 = v4.NullValue;
local l_UpdateRemote_0 = v4.UpdateRemote;
local v25 = {};
local v26 = false;
local v27 = {};
local v28 = v3.new();
local function _(v29) --[[ Line: 89 ]] --[[ Name: DecodeValue ]]
    -- upvalues: l_NullValue_0 (copy)
    if v29 ~= l_NullValue_0 then
        return v29;
    else
        return nil;
    end;
end;
local function v38(v31, v32) --[[ Line: 93 ]] --[[ Name: SetContent ]]
    -- upvalues: v8 (copy), v27 (ref), v25 (copy), l_NullValue_0 (copy), v6 (copy), v26 (ref), v28 (copy)
    v8(v31);
    v27 = v31;
    for v33, v34 in pairs(v31) do
        local v35 = v25[v33];
        if v35 then
            local v36 = if v34 ~= l_NullValue_0 then v34 else nil;
            local l_Value_0 = v35.Value;
            if not v6(v36, l_Value_0) then
                v35.Value = v36;
                v35.Changed:Fire(v36, l_Value_0);
            end;
            if v32 and not v35.ValueLoaded then
                v35.ValueLoaded = true;
                v35.Loaded:Fire();
            end;
        end;
    end;
    if v32 and not v26 then
        v26 = true;
        v28:Fire();
    end;
end;
local function v48(v39, v40, v41) --[[ Line: 124 ]] --[[ Name: Create ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), v25 (copy), v9 (copy), v27 (ref), l_NullValue_0 (copy), v26 (ref), v3 (copy), v11 (copy)
    v5.String(v39);
    v5.Function(v40);
    v40(v41);
    v5.Storable(v41);
    v41 = v7(v41);
    v8(v41);
    assert(not v25[v39], (("ConflictingKeys: %*, %*"):format(v39, v39)));
    for v42, _ in pairs(v25) do
        if v9.HasHierarchicalOverlap(v39, v42) then
            error((("ConflictingKeys: %*, %*"):format(v39, v42)));
        end;
    end;
    local v44 = false;
    local l_v41_0 = v41;
    local v46 = v27[v39];
    if v46 ~= nil then
        l_v41_0 = if v46 ~= l_NullValue_0 then v46 else nil;
        v44 = v26;
    end;
    local v47 = setmetatable({
        Changed = v3.new(), 
        Loaded = v3.new(), 
        Replicated = true, 
        Key = v39, 
        DefaultValue = v41, 
        Assertion = v40, 
        ValueLoaded = v44, 
        Value = l_v41_0
    }, v11);
    v25[v39] = v47;
    return v47;
end;
local v57 = {
    Loaded = v28, 
    IsA = v19, 
    Assert = v22, 
    Replicated = function(v49, v50, v51) --[[ Line: 180 ]] --[[ Name: Replicated ]]
        -- upvalues: v48 (copy)
        return (v48(v49, v50, v51));
    end, 
    Private = function(_, _, _) --[[ Line: 188 ]] --[[ Name: Private ]]
        error("ServerOnly");
    end, 
    Get = function(v55) --[[ Line: 196 ]] --[[ Name: Get ]]
        -- upvalues: v25 (copy), v5 (copy)
        local v56 = v25[v55];
        if v56 then
            return v56;
        else
            v5.String(v55);
            error((("UnknownKey: '%*'"):format(v55)));
            return;
        end;
    end, 
    IsLoaded = function() --[[ Line: 207 ]] --[[ Name: IsLoaded ]]
        -- upvalues: v26 (ref)
        return v26;
    end
};
l_UpdateRemote_0.OnClientEvent:Connect(v38);
table.freeze(v57);
return v57;