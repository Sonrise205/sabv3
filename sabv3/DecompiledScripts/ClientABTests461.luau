--!native
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v2 = require(l_ReplicatedStorage_0.UserGenerated.ABTests.SharedABTests);
local v3 = require(l_ReplicatedStorage_0.UserGenerated.Collections.DeepFreezeUnsafe);
local v4 = require(l_ReplicatedStorage_0.UserGenerated.Concurrency.Bindable);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v6 = false;
local v7 = v4.new();
local function v8() --[[ Line: 31 ]] --[[ Name: IsLoaded ]]
    -- upvalues: v6 (ref)
    return v6;
end;
local v9 = nil;
local function v14(v10, v11) --[[ Line: 36 ]] --[[ Name: GetAssignmentsAsync ]]
    -- upvalues: l_LocalPlayer_0 (copy), v9 (ref)
    local v12 = false;
    if typeof(v10) == "Instance" then
        v12 = v10:IsA("Player");
    end;
    assert(v12);
    assert(type(v11) == "boolean");
    if v10 ~= l_LocalPlayer_0 then
        return nil;
    else
        while true do
            local l_v9_0 = v9;
            if l_v9_0 then
                return l_v9_0;
            elseif not v11 then
                return nil;
            elseif not v10.Parent then
                return nil;
            else
                task.wait();
            end;
        end;
    end;
end;
local v15 = nil;
local function v18(v16) --[[ Line: 61 ]] --[[ Name: GetAttributes ]]
    -- upvalues: l_LocalPlayer_0 (copy), v15 (ref)
    if v16 ~= l_LocalPlayer_0 then
        local v17 = false;
        if typeof(v16) == "Instance" then
            v17 = v16:IsA("Player");
        end;
        assert(v17);
        return nil;
    else
        return v15;
    end;
end;
local function v25(v19, v20, v21) --[[ Line: 68 ]] --[[ Name: GetAttribute ]]
    -- upvalues: l_LocalPlayer_0 (copy), v15 (ref)
    assert(type(v20) == "string");
    local v22;
    if v19 ~= l_LocalPlayer_0 then
        local v23 = false;
        if typeof(v19) == "Instance" then
            v23 = v19:IsA("Player");
        end;
        assert(v23);
        v22 = nil;
    else
        v22 = v15;
    end;
    local v24 = v22 and v22[v20];
    if v24 == nil then
        return v21, false;
    else
        return v24, true;
    end;
end;
local function v29(v26, v27, v28) --[[ Line: 81 ]] --[[ Name: GetAttributeAsync ]]
    -- upvalues: v14 (copy), v25 (copy)
    assert(type(v27) == "string");
    if not v14(v26, true) then
        return v28, false;
    else
        return v25(v26, v27, v28);
    end;
end;
local function v32() --[[ Line: 93 ]] --[[ Name: GetJobAttributes ]]
    -- upvalues: l_LocalPlayer_0 (copy), v15 (ref)
    local l_l_LocalPlayer_0_0 = l_LocalPlayer_0;
    if l_l_LocalPlayer_0_0 ~= l_LocalPlayer_0 then
        local v31 = false;
        if typeof(l_l_LocalPlayer_0_0) == "Instance" then
            v31 = l_l_LocalPlayer_0_0:IsA("Player");
        end;
        assert(v31);
        return nil;
    else
        return v15;
    end;
end;
local function v35(v33, v34) --[[ Line: 96 ]] --[[ Name: GetJobAttribute ]]
    -- upvalues: v25 (copy), l_LocalPlayer_0 (copy)
    return v25(l_LocalPlayer_0, v33, v34);
end;
local function v38(v36, v37) --[[ Line: 102 ]] --[[ Name: GetJobAttributeAsync ]]
    -- upvalues: v29 (copy), l_LocalPlayer_0 (copy)
    return v29(l_LocalPlayer_0, v36, v37);
end;
local function v39() --[[ Line: 108 ]] --[[ Name: GetJobAssignments ]]
    -- upvalues: v9 (ref)
    return v9;
end;
local function v41(v40) --[[ Line: 111 ]] --[[ Name: GetJobAssignmentsAsync ]]
    -- upvalues: v14 (copy), l_LocalPlayer_0 (copy)
    return v14(l_LocalPlayer_0, v40);
end;
local v42 = v4.new();
local v43 = v4.new();
v2.UpdateRemote.OnClientEvent:Connect(function(v44, v45) --[[ Line: 120 ]]
    -- upvalues: v3 (copy), v15 (ref), v9 (ref), v6 (ref), v7 (copy), v42 (copy), l_LocalPlayer_0 (copy), v43 (copy)
    v3(v44);
    v3(v45);
    v15 = v44;
    v9 = v45;
    v6 = true;
    v7:Fire();
    v42:Fire(l_LocalPlayer_0);
    v43:Fire();
end);
return table.freeze({
    GetAttributes = v18, 
    GetAttribute = v25, 
    GetAttributeAsync = v29, 
    GetAssignmentsAsync = v14, 
    GetJobAttributes = v32, 
    GetJobAttribute = v35, 
    GetJobAttributeAsync = v38, 
    GetJobAssignments = v39, 
    GetJobAssignmentsAsync = v41, 
    IsLoaded = v8, 
    Loaded = v7, 
    PlayerUpdated = v42, 
    JobUpdated = v43
});