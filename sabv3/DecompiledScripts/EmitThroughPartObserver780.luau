local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v2 = require(l_ReplicatedStorage_0.Packages.Observers);
local l_Part_0 = script.Part;
local v4 = {};
local _ = function() --[[ Line: 14 ]] --[[ Name: start ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), l_Part_0 (copy)
    return v2.observeTag("EmitThroughPart", function(v5) --[[ Line: 15 ]]
        -- upvalues: v1 (ref), v4 (ref), l_Part_0 (ref)
        if not v1:GetInstant("Optimisation.EmitThroughPart", true) then
            return;
        else
            local l_Parent_0 = v5.Parent;
            if not l_Parent_0:IsA("Attachment") then
                return;
            else
                local v7 = v4[l_Parent_0];
                if not v7 then
                    local v8 = l_Part_0:Clone();
                    v8.RigidConstraint.Attachment0 = l_Parent_0;
                    v8.Parent = l_Parent_0;
                    local l___derp_a1_0 = v8.__derp_a1;
                    l___derp_a1_0.ChildRemoved:Connect(function(_) --[[ Line: 38 ]]
                        -- upvalues: l___derp_a1_0 (copy), v8 (copy), v4 (ref), l_Parent_0 (copy)
                        if l___derp_a1_0:FindFirstChildOfClass("ParticleEmitter") == nil then
                            v8:Destroy();
                            v4[l_Parent_0] = nil;
                        end;
                    end);
                    v4[l_Parent_0] = v8;
                    v7 = v8;
                end;
                v5.Parent = v7.__derp_a1;
                return function() --[[ Line: 52 ]]
                    -- upvalues: v5 (copy), l_Parent_0 (copy)
                    pcall(function() --[[ Line: 53 ]]
                        -- upvalues: v5 (ref), l_Parent_0 (ref)
                        v5.Parent = l_Parent_0;
                    end);
                end;
            end;
        end;
    end, {
        workspace
    });
end;
local v12 = nil;
local function v19() --[[ Line: 62 ]] --[[ Name: toggle ]]
    -- upvalues: v1 (copy), v12 (ref), v2 (copy), v4 (copy), l_Part_0 (copy)
    if v1:GetInstant("Optimisation.EmitThroughPart", true) then
        if not v12 then
            v12 = v2.observeTag("EmitThroughPart", function(v13) --[[ Line: 15 ]]
                -- upvalues: v1 (ref), v4 (ref), l_Part_0 (ref)
                if not v1:GetInstant("Optimisation.EmitThroughPart", true) then
                    return;
                else
                    local l_Parent_1 = v13.Parent;
                    if not l_Parent_1:IsA("Attachment") then
                        return;
                    else
                        local v15 = v4[l_Parent_1];
                        if not v15 then
                            local v16 = l_Part_0:Clone();
                            v16.RigidConstraint.Attachment0 = l_Parent_1;
                            v16.Parent = l_Parent_1;
                            local l___derp_a1_1 = v16.__derp_a1;
                            l___derp_a1_1.ChildRemoved:Connect(function(_) --[[ Line: 38 ]]
                                -- upvalues: l___derp_a1_1 (copy), v16 (copy), v4 (ref), l_Parent_1 (copy)
                                if l___derp_a1_1:FindFirstChildOfClass("ParticleEmitter") == nil then
                                    v16:Destroy();
                                    v4[l_Parent_1] = nil;
                                end;
                            end);
                            v4[l_Parent_1] = v16;
                            v15 = v16;
                        end;
                        v13.Parent = v15.__derp_a1;
                        return function() --[[ Line: 52 ]]
                            -- upvalues: v13 (copy), l_Parent_1 (copy)
                            pcall(function() --[[ Line: 53 ]]
                                -- upvalues: v13 (ref), l_Parent_1 (ref)
                                v13.Parent = l_Parent_1;
                            end);
                        end;
                    end;
                end;
            end, {
                workspace
            });
            return;
        end;
    elseif v12 then
        v12();
        v12 = nil;
    end;
end;
if v1:GetInstant("Optimisation.EmitThroughPart", true) then
    if not v12 then
        v12 = v2.observeTag("EmitThroughPart", function(v20) --[[ Line: 15 ]]
            -- upvalues: v1 (copy), v4 (copy), l_Part_0 (copy)
            if not v1:GetInstant("Optimisation.EmitThroughPart", true) then
                return;
            else
                local l_Parent_2 = v20.Parent;
                if not l_Parent_2:IsA("Attachment") then
                    return;
                else
                    local v22 = v4[l_Parent_2];
                    if not v22 then
                        local v23 = l_Part_0:Clone();
                        v23.RigidConstraint.Attachment0 = l_Parent_2;
                        v23.Parent = l_Parent_2;
                        local l___derp_a1_2 = v23.__derp_a1;
                        l___derp_a1_2.ChildRemoved:Connect(function(_) --[[ Line: 38 ]]
                            -- upvalues: l___derp_a1_2 (copy), v23 (copy), v4 (ref), l_Parent_2 (copy)
                            if l___derp_a1_2:FindFirstChildOfClass("ParticleEmitter") == nil then
                                v23:Destroy();
                                v4[l_Parent_2] = nil;
                            end;
                        end);
                        v4[l_Parent_2] = v23;
                        v22 = v23;
                    end;
                    v20.Parent = v22.__derp_a1;
                    return function() --[[ Line: 52 ]]
                        -- upvalues: v20 (copy), l_Parent_2 (copy)
                        pcall(function() --[[ Line: 53 ]]
                            -- upvalues: v20 (ref), l_Parent_2 (ref)
                            v20.Parent = l_Parent_2;
                        end);
                    end;
                end;
            end;
        end, {
            workspace
        });
    end;
elseif v12 then
    v12();
    v12 = nil;
end;
v1:OnChange("Optimisation.EmitThroughPart", v19);