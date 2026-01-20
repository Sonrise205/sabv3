local l_RunService_0 = game:GetService("RunService");
local v1 = 0;
return {
    GetFps = function(_) --[[ Line: 12 ]] --[[ Name: GetFps ]]
        -- upvalues: v1 (ref)
        return v1;
    end, 
    Start = function(_) --[[ Line: 16 ]] --[[ Name: Start ]]
        -- upvalues: l_RunService_0 (copy), v1 (ref)
        l_RunService_0.RenderStepped:Connect(function(v4) --[[ Line: 18 ]]
            -- upvalues: v1 (ref)
            debug.profilebegin("PlayerController");
            v1 = math.floor(1 / v4);
            debug.profileend();
        end);
    end
};