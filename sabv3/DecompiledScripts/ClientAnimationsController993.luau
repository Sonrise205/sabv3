local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Observers);
local v2 = require(l_ReplicatedStorage_0.Utils.StringUtils);
return {
    Start = function(_) --[[ Line: 9 ]] --[[ Name: Start ]]
        -- upvalues: v1 (copy), v2 (copy), l_ReplicatedStorage_0 (copy)
        v1.observeTag("ClientLoadAnimation", function(v4) --[[ Line: 10 ]]
            -- upvalues: v1 (ref), v2 (ref), l_ReplicatedStorage_0 (ref)
            return v1.observeAttribute(v4, "Animation", function(v5) --[[ Line: 11 ]]
                -- upvalues: v2 (ref), l_ReplicatedStorage_0 (ref), v4 (copy)
                local v6 = v2:ReadPath(l_ReplicatedStorage_0, v5);
                if typeof(v6) ~= "Instance" or not v6:IsA("Animation") then
                    return nil;
                else
                    local v7 = v4:LoadAnimation(v6);
                    v7.Looped = true;
                    v7:Play();
                    return function() --[[ Line: 20 ]]
                        -- upvalues: v7 (copy)
                        v7:Stop(0);
                        v7:Destroy();
                    end;
                end;
            end);
        end);
    end
};