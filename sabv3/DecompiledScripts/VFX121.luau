local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Packages.Observers);
local v3 = require(l_ReplicatedStorage_0.Packages.Timer);
local v4 = require(l_ReplicatedStorage_0.Shared.SharedEventUtils);
local v28 = {
    Library = script.Library, 
    copy = function(v5, v6, v7) --[[ Line: 17 ]] --[[ Name: copy ]]
        if v7 == nil then
            v7 = if v5:IsA("Attachment") then workspace.Terrain else workspace.CurrentCamera;
        end;
        local v8 = v5:Clone();
        if v8:IsA("Attachment") then
            v8.WorldCFrame = if typeof(v6) == "CFrame" then v6 else CFrame.new(v6);
        elseif v8:IsA("PVInstance") then
            v8:PivotTo(if typeof(v6) == "CFrame" then v6 else CFrame.new(v6));
        else
            v8:Destroy();
            error("Can't move Container");
        end;
        v8.Parent = v7;
        return v8;
    end, 
    weld = function(v9, v10) --[[ Line: 38 ]] --[[ Name: weld ]]
        local l_Weld_0 = Instance.new("Weld");
        l_Weld_0.Part0 = v9;
        l_Weld_0.Part1 = v10;
        l_Weld_0.Parent = v9;
        return l_Weld_0;
    end, 
    weldPosition = function(v12, v13) --[[ Line: 48 ]] --[[ Name: weldPosition ]]
        -- upvalues: l_RunService_0 (copy), v4 (copy)
        v12.Anchored = true;
        local v14 = l_RunService_0.PostSimulation:Connect(function() --[[ Line: 51 ]]
            -- upvalues: v4 (ref), v12 (copy), v13 (copy)
            debug.profilebegin("VFX:weldPosition:pushCFrame");
            v4.pushPartCFrame(v12, CFrame.new(v13:GetPivot().Position));
            debug.profileend();
        end);
        local v15 = v12.Destroying:Once(function() --[[ Line: 57 ]]
            -- upvalues: v14 (copy)
            v14:Disconnect();
        end);
        return function() --[[ Line: 61 ]]
            -- upvalues: v14 (copy), v15 (copy)
            v14:Disconnect();
            v15:Disconnect();
        end;
    end, 
    rescale = function(v16, v17) --[[ Line: 68 ]] --[[ Name: rescale ]]
        local l_Parent_0 = v16.Parent;
        local l_Model_0 = Instance.new("Model");
        v16.Parent = l_Model_0;
        l_Model_0:ScaleTo(v17);
        v16.Parent = l_Parent_0;
    end, 
    enable = function(v20, v21) --[[ Line: 77 ]] --[[ Name: enable ]]
        for _, v23 in v20:GetDescendants() do
            if v23:IsA("ParticleEmitter") then
                v23.Enabled = true;
            elseif v23:IsA("Beam") then
                v23.Enabled = true;
            elseif v21 and v23:IsA("Light") then
                v23.Enabled = true;
            end;
        end;
    end, 
    disable = function(v24, v25) --[[ Line: 90 ]] --[[ Name: disable ]]
        for _, v27 in v24:GetDescendants() do
            if v27:IsA("ParticleEmitter") then
                v27.Enabled = false;
            elseif v27:IsA("Beam") then
                v27.Enabled = false;
            elseif v25 and v27:IsA("Light") then
                v27.Enabled = false;
            end;
        end;
    end
};
local function v32(v29) --[[ Line: 106 ]] --[[ Name: emit ]]
    local v30 = tonumber(v29:GetAttribute("EmitCount")) or tonumber(v29.Name) or 0;
    local v31 = tonumber(v29:GetAttribute("EmitDuration")) or 0;
    v29:Emit(v30);
    if v31 > 0 then
        v29.Enabled = true;
        task.delay(v31, function() --[[ Line: 113 ]]
            -- upvalues: v29 (copy)
            v29.Enabled = false;
        end);
    end;
end;
v28.emit = function(v33) --[[ Line: 119 ]] --[[ Name: emit ]]
    -- upvalues: v32 (copy)
    for _, v35 in v33:GetDescendants() do
        if v35:IsA("ParticleEmitter") then
            local l_v35_Attribute_0 = v35:GetAttribute("EmitDelay");
            if l_v35_Attribute_0 ~= nil then
                task.delay(l_v35_Attribute_0, v32, v35);
            else
                v32(v35);
            end;
        end;
    end;
    if v33:IsA("ParticleEmitter") then
        local l_v33_Attribute_0 = v33:GetAttribute("EmitDelay");
        if l_v33_Attribute_0 ~= nil then
            task.delay(l_v33_Attribute_0, v32, v33);
            return;
        else
            v32(v33);
        end;
    end;
end;
v28.emitLoop = function(v38, v39) --[[ Line: 146 ]] --[[ Name: emitLoop ]]
    v38:SetAttribute("LoopTimer", v39);
    v38:AddTag("EmitLoop");
end;
if l_RunService_0:IsClient() then
    v2.observeTag("EmitLoop", function(v40) --[[ Line: 152 ]]
        -- upvalues: v2 (copy), v3 (copy), v28 (copy)
        return v2.observeAttribute(v40, "LoopTimer", function(v41) --[[ Line: 153 ]]
            -- upvalues: v3 (ref), v28 (ref), v40 (copy)
            if type(v41) ~= "number" then
                return nil;
            else
                local v42 = v3.Simple(v41, function() --[[ Line: 158 ]]
                    -- upvalues: v28 (ref), v40 (ref)
                    v28.emit(v40);
                end, true);
                return function() --[[ Line: 162 ]]
                    -- upvalues: v42 (copy)
                    v42:Disconnect();
                end;
            end;
        end);
    end, {
        workspace
    });
end;
return v28;