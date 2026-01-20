local v0 = require(script.Parent.Parent.ColorSequenceUtils);
local v1 = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.new(1, 0, 0)), 
    ColorSequenceKeypoint.new(0.1510416716337204, Color3.new(0, 1, 0)), 
    ColorSequenceKeypoint.new(0.3072916567325592, Color3.new(1, 0, 0)), 
    ColorSequenceKeypoint.new(0.4965277910232544, Color3.new(0, 1, 0)), 
    ColorSequenceKeypoint.new(0.6649305820465088, Color3.new(1, 0, 0)), 
    ColorSequenceKeypoint.new(0.8385416865348816, Color3.new(0, 1, 0)), 
    ColorSequenceKeypoint.new(1, Color3.new(1, 0, 0))
});
local v2 = 0;
return {
    simulate = function(v3) --[[ Line: 17 ]] --[[ Name: simulate ]]
        -- upvalues: v2 (ref), v0 (copy), v1 (copy)
        v2 = v2 + v3 * 0.5;
        return {
            main = v0.calculateColorSequence(v1, v2)
        };
    end, 
    apply = function(v4) --[[ Line: 29 ]] --[[ Name: apply ]]
        local v5 = {};
        local l_UIGradient_0 = v4:FindFirstChildWhichIsA("UIGradient");
        local v7 = if l_UIGradient_0 then l_UIGradient_0.Color else nil;
        if not l_UIGradient_0 then
            local l_UIGradient_1 = Instance.new("UIGradient");
            l_UIGradient_1.Parent = v4;
            table.insert(v5, l_UIGradient_1);
            l_UIGradient_0 = l_UIGradient_1;
        end;
        assert(l_UIGradient_0);
        return {
            main = l_UIGradient_0, 
            cleanup = function() --[[ Line: 47 ]] --[[ Name: cleanup ]]
                -- upvalues: v7 (copy), l_UIGradient_0 (ref), v5 (copy)
                if v7 then
                    l_UIGradient_0.Color = v7;
                end;
                for _, v10 in v5 do
                    v10:Destroy();
                end;
            end
        };
    end
};