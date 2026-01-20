local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("RunService");
local v2 = require(l_ReplicatedStorage_0.Controllers.AnimalController);
return {
    getAnimalPosition = @native function(v3, v4) --[[ Line: 12 ]] --[[ Name: getAnimalPosition ]]
        -- upvalues: v2 (copy)
        local v5 = v2:GetAnimals()[v3];
        if not v5 then
            return (Vector3.new(0, 0, 0, 0));
        else
            local l_Position_0 = v5.AnimalModel:GetPivot().Position;
            if v4 and v4.top then
                return l_Position_0 + Vector3.new(0, v5.AnimalModel:GetExtentsSize().Y * 0.5, 0);
            else
                if v4 and v4.bottom then
                    l_Position_0 = l_Position_0 - Vector3.new(0, v5.AnimalModel:GetExtentsSize().Y * 0.5, 0);
                end;
                return l_Position_0;
            end;
        end;
    end
};