local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("Players");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v3 = require(l_Controllers_0.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Net):RemoteEvent("CombatService/ApplyImpulse");
local v14 = {
    ApplyImpulse = function(_, v7, v8) --[[ Line: 18 ]] --[[ Name: ApplyImpulse ]]
        -- upvalues: v3 (copy)
        local l_v3_Character_0, v10, v11 = v3:GetCharacter();
        if not l_v3_Character_0 then
            return;
        elseif not v10 then
            return;
        elseif not v11 then
            return;
        else
            local function _() --[[ Line: 25 ]] --[[ Name: canApplyImpulse ]]
                -- upvalues: v11 (copy)
                if v11.Anchored then
                    return false;
                elseif v11:GetAttribute("NetworkOwnerSet") then
                    return false;
                else
                    return true;
                end;
            end;
            local v13 = os.clock() + 1;
            while not (not v11.Anchored and (not v11:GetAttribute("NetworkOwnerSet") or false)) and os.clock() < v13 do
                task.wait();
            end;
            v11:ApplyImpulse(v8 * v7);
            return;
        end;
    end
};
v14.Start = function(_) --[[ Line: 48 ]] --[[ Name: Start ]]
    -- upvalues: v5 (copy), v14 (copy)
    v5.OnClientEvent:Connect(function(...) --[[ Line: 50 ]]
        -- upvalues: v14 (ref)
        v14:ApplyImpulse(...);
    end);
end;
return v14;