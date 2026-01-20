local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v3 = require(l_Controllers_0.CharacterController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v5 = require(l_Packages_0.Signal);
local v6 = nil;
local v7 = {
    OnInteractEnter = v5.new(), 
    OnInteractLeave = v5.new()
};
v7.Start = function(_) --[[ Line: 27 ]] --[[ Name: Start ]]
    -- upvalues: v3 (copy), v6 (ref), v7 (copy), l_CollectionService_0 (copy)
    task.spawn(function() --[[ Line: 29 ]]
        -- upvalues: v3 (ref), v6 (ref), v7 (ref), l_CollectionService_0 (ref)
        while true do
            if wait(0.05) then
                local l_v3_Character_0, _, v11 = v3:GetCharacter();
                if not l_v3_Character_0 then
                    if v6 then
                        v7.OnInteractLeave:Fire(v6);
                        v6 = nil;
                    end;
                    return;
                else
                    local v12 = nil;
                    local v13 = nil;
                    for _, v15 in l_CollectionService_0:GetTagged("Interact") do
                        local l_Magnitude_0 = (v11.Position - v15.Position).Magnitude;
                        if l_Magnitude_0 <= (v15:GetAttribute("Distance") or 10) then
                            if v13 == nil then
                                v13 = l_Magnitude_0;
                                v12 = v15;
                            elseif l_Magnitude_0 <= v13 then
                                v13 = l_Magnitude_0;
                                v12 = v15;
                            end;
                        end;
                    end;
                    if v12 then
                        if v12 ~= v6 then
                            if v6 ~= nil then
                                v7.OnInteractLeave:Fire(v6);
                            end;
                            v6 = v12;
                            v7.OnInteractEnter:Fire(v6);
                        end;
                    elseif v6 then
                        v7.OnInteractLeave:Fire(v6);
                        v6 = nil;
                    end;
                end;
            else
                return;
            end;
        end;
    end);
end;
return v7;