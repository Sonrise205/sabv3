--!native
local l_Debris_0 = game:GetService("Debris");
local l_Part_0 = Instance.new("Part");
l_Part_0.Anchored = true;
l_Part_0.CanCollide = false;
l_Part_0.CanQuery = false;
l_Part_0.CanTouch = false;
l_Part_0.TopSurface = Enum.SurfaceType.Smooth;
l_Part_0.BottomSurface = Enum.SurfaceType.Smooth;
local v19 = {
    GetOptions = function(v2) --[[ Line: 74 ]] --[[ Name: GetOptions ]]
        return table.clone(v2.options);
    end, 
    GetLines = function(v3) --[[ Line: 78 ]] --[[ Name: GetLines ]]
        local v4 = table.clone(v3.lines);
        for _, v6 in v3.branches do
            local l_v6_Lines_0 = v6:GetLines();
            table.move(l_v6_Lines_0, 1, #l_v6_Lines_0, #v4 + 1, v4);
        end;
        return v4;
    end, 
    IsDestroyed = function(v8) --[[ Line: 87 ]] --[[ Name: IsDestroyed ]]
        return v8.destroyed or false;
    end, 
    IsDrawn = function(v9) --[[ Line: 91 ]] --[[ Name: IsDrawn ]]
        return v9.drew or false;
    end, 
    Draw = function(v10, v11) --[[ Line: 95 ]] --[[ Name: Draw ]]
        -- upvalues: l_Part_0 (copy), l_Debris_0 (copy)
        local l_Model_0 = Instance.new("Model");
        l_Model_0.Name = "LightningBolt";
        v10.model = l_Model_0;
        for _, v14 in v10:GetLines() do
            local v15 = l_Part_0:Clone();
            local v16 = v10.thickness - v14.depth * 2 * 0.1;
            v15.Material = v10.material;
            v15.Color = v10.color;
            v15.Size = Vector3.new(v16, v16, (v14.goal - v14.origin).Magnitude + 0.5);
            v15.CFrame = CFrame.lookAt((v14.goal + v14.origin) * 0.5, v14.goal);
            v15.Transparency = v14.transparency;
            v15.Parent = l_Model_0;
        end;
        l_Model_0.Parent = v11 or workspace.CurrentCamera;
        v10.drew = true;
        local l_decay_0 = v10.options.decay;
        if l_decay_0 then
            l_Debris_0:AddItem(l_Model_0, tonumber(l_decay_0) or 0);
            v10.destroyed = true;
        end;
    end, 
    Destroy = function(v18) --[[ Line: 121 ]] --[[ Name: Destroy ]]
        if v18.model then
            v18.model:Destroy();
            v18.destroyed = true;
        end;
    end
};
local function v20(v21, v22, v23) --[[ Line: 128 ]] --[[ Name: create ]]
    -- upvalues: v19 (copy), v20 (copy)
    assert(typeof(v21) == "Vector3", "LightningBolt: `origin` must be a Vector3");
    assert(typeof(v22) == "Vector3", "LightningBolt: `goal` must be a Vector3");
    local v24 = v23 or {};
    local v25 = Random.new(if v24 then v24.seed else nil);
    local v26 = {};
    local v27 = setmetatable({
        options = v24 or {}, 
        random = v25, 
        origin = v21, 
        goal = v22, 
        depth = v24.max_depth or 0, 
        thickness = v24.thickness or 1, 
        rep = v24.bends or 6, 
        color = v24.color or Color3.fromRGB(255, 255, 255), 
        material = v24.material or Enum.Material.Neon, 
        branches = v26
    }, {
        __index = v19
    });
    local v28 = {
        {
            origin = v21, 
            goal = v22, 
            transparency = v24.transparency or 0.4, 
            depth = v27.depth
        }
    };
    v27.lines = v28;
    for _ = 1, v27.rep do
        for v30 = 1, #v28 do
            local v31 = v28[v30];
            local l_goal_0 = v31.goal;
            local v33 = v31.origin + (l_goal_0 - v31.origin) * (v25:NextInteger(40, 60) / 100);
            local v34 = v25:NextNumber();
            local v35 = v25:NextInteger(-530, 530) / 100;
            local v36 = math.sin(3.141592653589793 * v34 * 2) * v35;
            local v37 = math.cos(3.141592653589793 * v34 * 2) * v35;
            v31.goal = (CFrame.lookAt(v33, v31.goal) * CFrame.new(v36, v37, 0)).Position;
            table.insert(v28, {
                origin = v31.goal, 
                goal = l_goal_0, 
                transparency = v31.transparency, 
                depth = v31.depth
            });
            if v31.depth <= (v24.max_depth or 3) then
                local v38 = (v21 - v31.goal).Magnitude / (v21 - v22).Magnitude;
                if v25:NextInteger(1, 100) < (v24.fork_chance or 50) * v38 then
                    local l_v27_Options_0 = v27:GetOptions();
                    l_v27_Options_0.depth = v31.depth + 1;
                    l_v27_Options_0.bends = l_v27_Options_0.fork_bends or 2;
                    table.insert(v26, (v20(v31.goal, v31.goal + (v31.goal - v31.origin).Unit * v25:NextInteger(20, 40), l_v27_Options_0)));
                end;
            end;
        end;
    end;
    return v27;
end;
return {
    create = v20
};