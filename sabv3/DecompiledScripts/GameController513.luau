local _ = game:GetService("ReplicatedStorage");
local l_ReplicatedFirst_0 = game:GetService("ReplicatedFirst");
local v2 = false;
local v3 = {};
return {
    Start = function(_) --[[ Line: 13 ]] --[[ Name: Start ]]
        -- upvalues: l_ReplicatedFirst_0 (copy), v2 (ref), v3 (copy)
        task.spawn(function() --[[ Line: 15 ]]
            -- upvalues: l_ReplicatedFirst_0 (ref), v2 (ref), v3 (ref)
            while l_ReplicatedFirst_0:GetAttribute("ClientLoaded") ~= true do
                task.wait();
            end;
            while l_ReplicatedFirst_0:GetAttribute("DataLoaded") ~= true do
                task.wait();
            end;
            v2 = true;
            for v5 = 1, #v3 do
                local v6 = v3[v5];
                task.spawn(v6);
            end;
            table.clear(v3);
        end);
    end, 
    OnGameLoaded = function(_, v8) --[[ Line: 37 ]] --[[ Name: OnGameLoaded ]]
        -- upvalues: v2 (ref), v3 (copy)
        if v2 == true then
            return v8();
        else
            table.insert(v3, v8);
            return;
        end;
    end
};