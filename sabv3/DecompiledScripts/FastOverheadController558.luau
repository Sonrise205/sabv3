local l_RunService_0 = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.VirtualInstance);
local v4 = require(l_ReplicatedStorage_0.Packages.FFlags);
local v5 = {
    AnimalOverhead = script.AnimalOverhead, 
    CashPad = script.CashPad
};
local v6 = {
    [v5.AnimalOverhead] = {
        PhysicalSize = Vector3.new(15, 5, 0.10000000149011612, 0), 
        Ranges = {
            Close = {
                Distance = 40, 
                px = 340
            }, 
            Standard = {
                Distance = 80, 
                px = 220
            }, 
            Far = {
                Distance = 1e999, 
                px = 10
            }
        }
    }, 
    [v5.CashPad] = {
        PhysicalSize = Vector3.new(5, 3, 0.10000000149011612, 0), 
        Ranges = {
            Close = {
                Distance = 40, 
                px = 200
            }, 
            Standard = {
                Distance = 80, 
                px = 100
            }, 
            Far = {
                Distance = 1e999, 
                px = 10
            }
        }
    }
};
for _, v8 in v6 do
    local v9 = v8.PhysicalSize.Y / v8.PhysicalSize.X;
    for _, v11 in v8.Ranges do
        v11.size = Vector2.new(v11.px, v11.px * v9);
    end;
end;
local _ = l_Players_0.LocalPlayer;
local l_CurrentCamera_0 = workspace.CurrentCamera;
local v14 = Vector3.new(0, 1, 0, 0);
local v15 = Vector3.new(0, 0, 1, 0);
local v16 = Vector3.new(0, 0, 0, 0);
local v17 = {};
local v18 = {};
local v19 = {};
local v20 = {
    GuiTemplates = v5
};
local function _(v21, v22) --[[ Line: 87 ]] --[[ Name: getAdorneePosition ]]
    if v22 == "BasePart" then
        return v21.Position;
    elseif v22 == "Attachment" then
        return v21.WorldPosition;
    else
        return;
    end;
end;
local function _(v24, v25) --[[ Line: 98 ]] --[[ Name: solveBillboardCFrame ]]
    -- upvalues: v14 (ref), v15 (ref)
    local v26 = v24 + v14 * v25.studsOffsetY;
    return CFrame.lookAlong(v26, -v15);
end;
v20.createFastOverhead = function(v28) --[[ Line: 108 ]] --[[ Name: createFastOverhead ]]
    -- upvalues: v6 (copy), v4 (copy), v17 (copy)
    local v29 = v28.adornee:IsA("BasePart") and "BasePart" or v28.adornee:IsA("Attachment") and "Attachment" or error((("invalid adornee \"%*\""):format(v28.adornee)));
    local v30 = v6[v28.guiTemplate];
    local v31 = script.FastOverheadTemplate:Clone();
    v31.CFrame = CFrame.new(0, 10000, 0);
    v31.Size = v30.PhysicalSize;
    v31.Parent = workspace.Debris;
    local l___foh_transform_0 = v31.__foh_transform;
    if v4:GetInstant("FastOverhead.UseMotor6D", true) then
        l___foh_transform_0.Part0 = workspace.Terrain;
        l___foh_transform_0.Part1 = v31;
        v31.Anchored = false;
    else
        l___foh_transform_0:Destroy();
        l___foh_transform_0 = nil;
    end;
    local v33 = v28.guiTemplate:Clone();
    v33.Adornee = v31;
    v33.MaxDistance = v30.Ranges.Standard.Distance * 0.9;
    v33.Parent = v31;
    local v34 = {
        part = v31, 
        motor6D = l___foh_transform_0, 
        gui = v33, 
        adornee = v28.adornee, 
        adorneeType = v29, 
        studsOffsetY = v28.studsOffsetY or 2.5, 
        guiTemplate = v28.guiTemplate, 
        adorneePosition = Vector3.new(0, 10000, 0, 0), 
        lastPositionCheck = -1
    };
    table.insert(v17, v34);
    local v35 = nil;
    local v36 = false;
    local function v38() --[[ Line: 154 ]] --[[ Name: cleanup ]]
        -- upvalues: v36 (ref), v31 (copy), v17 (ref), v34 (copy), v35 (ref)
        if v36 then
            return;
        else
            v36 = true;
            v31:Destroy();
            local v37 = table.find(v17, v34);
            if v37 then
                table.remove(v17, v37);
            end;
            if v35 then
                v35:Disconnect();
                v35 = nil;
            end;
            return;
        end;
    end;
    v35 = v33.Destroying:Connect(v38);
    return v33, v38;
end;
v20.Start = function(_) --[[ Line: 178 ]] --[[ Name: Start ]]
    -- upvalues: v17 (copy), v16 (ref), v6 (copy), v14 (ref), v15 (ref), v18 (copy), v19 (copy), l_RunService_0 (copy), l_CurrentCamera_0 (copy)
    local function v46() --[[ Line: 179 ]] --[[ Name: updatePositionsAndResolution ]]
        -- upvalues: v17 (ref), v16 (ref), v6 (ref)
        for _, v41 in v17 do
            local l_adornee_0 = v41.adornee;
            local l_adorneeType_0 = v41.adorneeType;
            local v44 = if l_adorneeType_0 == "BasePart" then l_adornee_0.Position else if l_adorneeType_0 == "Attachment" then l_adornee_0.WorldPosition else nil;
            v41.adorneePosition = v44;
            l_adornee_0 = (v16 - v44).Magnitude;
            local l_Ranges_0 = v6[v41.guiTemplate].Ranges;
            if l_adornee_0 < l_Ranges_0.Close.Distance then
                v41.gui.CanvasSize = l_Ranges_0.Close.size;
            elseif l_adornee_0 < l_Ranges_0.Standard.Distance then
                v41.gui.CanvasSize = l_Ranges_0.Standard.size;
            else
                v41.gui.CanvasSize = l_Ranges_0.Far.size;
            end;
        end;
    end;
    local function v51() --[[ Line: 201 ]] --[[ Name: updateOverheads ]]
        -- upvalues: v17 (ref), v14 (ref), v15 (ref), v18 (ref), v19 (ref)
        for _, v48 in v17 do
            local v49 = v48.adorneePosition + v14 * v48.studsOffsetY;
            local v50 = CFrame.lookAlong(v49, -v15);
            if v48.motor6D then
                v48.motor6D.Transform = v50;
            elseif v50 ~= v48.lastCFrame then
                table.insert(v18, v48.part);
                table.insert(v19, v50);
                v48.lastCFrame = v50;
            end;
        end;
        if #v18 > 0 then
            workspace:BulkMoveTo(v18, v19, Enum.BulkMoveMode.FireCFrameChanged);
            table.clear(v18);
            table.clear(v19);
        end;
    end;
    l_RunService_0.Stepped:Connect(function(_) --[[ Line: 224 ]]
        -- upvalues: l_CurrentCamera_0 (ref), v15 (ref), v14 (ref), v16 (ref), v46 (copy), v51 (copy)
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        v15 = l_CFrame_0.LookVector;
        v14 = l_CFrame_0.UpVector;
        v16 = l_CFrame_0.Position;
        v46();
        v51();
    end);
end;
return v20;