local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Replion);
local v2 = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(script.Parent.Types);
local v33 = {
    _loaded = false, 
    _updatedSignal = v2.new(), 
    _loadedSignal = v2.new(), 
    IsLoaded = function(_) --[[ Line: 50 ]] --[[ Name: IsLoaded ]]
        -- upvalues: v1 (copy)
        return (v1.Client:WaitReplion("FFlags"):Get("Loaded"));
    end, 
    OnLoad = function(v5, v6) --[[ Line: 55 ]] --[[ Name: OnLoad ]]
        return v5._loadedSignal:Connect(v6);
    end, 
    OnUpdate = function(v7, v8) --[[ Line: 59 ]] --[[ Name: OnUpdate ]]
        return v7._updatedSignal:Connect(v8);
    end, 
    OnChange = function(_, v10, v11) --[[ Line: 63 ]] --[[ Name: OnChange ]]
        -- upvalues: v1 (copy)
        return v1.Client:WaitReplion("FFlags"):OnChange({
            "Values", 
            v10
        }, v11);
    end, 
    Get = function(v12, v13, v14) --[[ Line: 69 ]] --[[ Name: Get ]]
        -- upvalues: v1 (copy)
        local v15 = v1.Client:WaitReplion("FFlags");
        if not v12:IsLoaded() then
            v12._loadedSignal:Wait();
        end;
        local v16 = v15:Get({
            "Values", 
            v13
        });
        if v16 == nil then
            return v14;
        else
            return v16;
        end;
    end, 
    GetInstant = function(_, v18, v19) --[[ Line: 83 ]] --[[ Name: GetInstant ]]
        -- upvalues: v1 (copy)
        local l_Replion_0 = v1.Client:GetReplion("FFlags");
        if not l_Replion_0 then
            return v19;
        else
            local v21 = l_Replion_0:Get({
                "Values", 
                v18
            });
            if v21 == nil then
                return v19;
            else
                return v21;
            end;
        end;
    end, 
    _loadMemoryStore = function(_) --[[ Line: 98 ]] --[[ Name: _loadMemoryStore ]]
        warn("FFlags:_loadMemoryStore() cannot be used on the client!");
        return false;
    end, 
    _loadDataStore = function(_) --[[ Line: 103 ]] --[[ Name: _loadDataStore ]]
        warn("FFlags:_loadDataStore() cannot be used on the client!");
        return false;
    end, 
    Set = function(_) --[[ Line: 108 ]] --[[ Name: Set ]]
        warn("FFlags:Set() cannot be used on the client!");
        return false;
    end, 
    Load = function(_) --[[ Line: 113 ]] --[[ Name: Load ]]
        warn("FFlags:Load() cannot be used on the client!");
        return false;
    end, 
    Start = function(v26) --[[ Line: 118 ]] --[[ Name: Start ]]
        -- upvalues: v1 (copy)
        local v27 = v1.Client:WaitReplion("FFlags");
        v26._loaded = v27:Get("Loaded");
        local v28 = nil;
        v28 = v27:OnChange("Loaded", function(v29, v30) --[[ Line: 123 ]]
            -- upvalues: v26 (copy), v27 (copy), v28 (ref)
            if v29 and not v30 then
                v26._loaded = v29;
                v26._loadedSignal:Fire(v27.Data);
                if v28.Connected then
                    v28:Disconnect();
                end;
            end;
        end);
        v27:OnChange("LastChange", function(_, _) --[[ Line: 134 ]]
            -- upvalues: v26 (copy), v27 (copy)
            v26._updatedSignal:Fire(v27.Data);
        end);
    end
};
task.spawn(v33.Start, v33);
return v33;