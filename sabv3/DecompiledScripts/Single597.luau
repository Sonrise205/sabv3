local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_SingleStockMachine_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("SingleStockMachine").SingleStockMachine;
local l_Content_0 = l_SingleStockMachine_0.Content;
local l_Close_0 = l_SingleStockMachine_0.Header.Close;
local v6 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v7 = require(l_ReplicatedStorage_0.Shared.Animals);
local v8 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local v9 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v10 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v11 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local v12 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v13 = require(l_ReplicatedStorage_0.Datas.Animals);
local v14 = require(l_ReplicatedStorage_0.Packages.Trove);
local _ = require(l_ReplicatedStorage_0.Shared.StockMachineTypes);
l_SingleStockMachine_0.Visible = false;
local v16 = v9:Register("SingleStockMachine", l_SingleStockMachine_0, "TopQuint");
v16:AttachCloseButton(l_Close_0);
v16:Close();
return {
    Setup = function(_, v18, v19) --[[ Line: 35 ]] --[[ Name: Setup ]]
        -- upvalues: v14 (copy), v10 (copy), l_LocalPlayer_0 (copy), v16 (copy), v13 (copy), v12 (copy), v6 (copy), v7 (copy), l_SingleStockMachine_0 (copy), l_Content_0 (copy), v8 (copy), v11 (copy), v9 (copy)
        local v20 = v14.new();
        local v21 = v10:Wait(l_LocalPlayer_0);
        v20:Add(v16.OnOpen:Connect(function() --[[ Line: 39 ]]
            -- upvalues: v18 (copy)
            v18:SetOpen(true);
        end));
        v20:Add(v16.OnClose:Connect(function() --[[ Line: 43 ]]
            -- upvalues: v18 (copy)
            v18:SetOpen(false);
        end));
        local v22 = {};
        local function v28(v23, v24) --[[ Line: 49 ]] --[[ Name: renderBrainrotAtFrame ]]
            -- upvalues: v13 (ref), v12 (ref), v20 (copy), v6 (ref), v7 (ref)
            local v25 = v13[v24];
            if not v25 then
                return;
            else
                local v26 = v12[v25.Rarity];
                v23.Title.Text = v24;
                if v26.GradientPreset then
                    v23.UIStroke.Color = Color3.new(1, 1, 1);
                    v23.Title.TextColor3 = Color3.new(1, 1, 1);
                    v20:Add(v6.apply(v23.UIStroke, v26.GradientPreset));
                    v20:Add(v6.apply(v23.Title, v26.GradientPreset));
                else
                    v23.UIStroke.Color = v26.Color;
                    v23.Title.TextColor3 = v26.Color;
                end;
                v23.Visible = true;
                local v27 = v7:AttachOnViewportWithOptimizations(v24, v23.ViewportFrame, true);
                if v27 then
                    v20:Add(v27);
                end;
                return;
            end;
        end;
        local v29, v30 = next(v19);
        assert(v29);
        v28(l_SingleStockMachine_0.Output.Brainrot, v30.Output);
        local v31 = {};
        for v32, v33 in v30.Inputs do
            local v34 = v13[v33];
            if v34 then
                local v35 = v12[v34.Rarity];
                local v36 = v20:Clone(l_Content_0.Template);
                v36.LayoutOrder = v35.Weight * 100 + v32;
                v28(v36, v33);
                v36.ViewportFrame.ImageColor3 = Color3.new(0, 0, 0);
                v36.Return.Visible = false;
                v36.Visible = true;
                v36.Parent = l_Content_0;
                if not v31[v33] then
                    v31[v33] = {};
                end;
                table.insert(v31[v33], v36);
                local v37 = v8.new(v36.Return);
                v20:Add(v37);
                v37:Animate();
                v20:Add(v37.OnActivated:Connect(function() --[[ Line: 106 ]]
                    -- upvalues: v21 (copy), v33 (copy), v18 (copy)
                    for v38, v39 in (v21:Get("AnimalPodiums")) do
                        if type(v39) == "table" and v39.Index == v33 and v39.Machine and v39.Machine.Type == v18.MachineName and not v39.Machine.Active then
                            v18:Return(v38);
                            return;
                        end;
                    end;
                end));
            end;
        end;
        local function v51() --[[ Line: 117 ]] --[[ Name: updateBrainrotFrame ]]
            -- upvalues: v21 (copy), v18 (copy), v31 (copy), l_SingleStockMachine_0 (ref)
            local v40 = v21:Get("AnimalPodiums");
            local v41 = {};
            for _, v43 in v40 do
                if type(v43) == "table" and v43.Machine and v43.Machine.Type == v18.MachineName and not v43.Machine.Active then
                    v41[v43.Index] = (v41[v43.Index] or 0) + 1;
                end;
            end;
            local v44 = true;
            for v45, v46 in v31 do
                local v47 = v41[v45] or 0;
                for v48, v49 in v46 do
                    local v50 = v48 <= v47;
                    v49.Return.Visible = v50;
                    v49.ViewportFrame.ImageColor3 = if v50 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0);
                    if not v50 then
                        v44 = false;
                    end;
                end;
            end;
            l_SingleStockMachine_0.Spawn.Interactable = v44;
            l_SingleStockMachine_0.Spawn.BackgroundColor3 = if v44 then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(127, 127, 127);
        end;
        v20:Add(v21:OnChanged("AnimalAddedOrRemoved", v51));
        task.spawn(v51);
        local v52 = v8.new(l_SingleStockMachine_0.Spawn);
        v20:Add(v52);
        v52:Animate();
        v20:Add(v52.OnActivated:Connect(function() --[[ Line: 153 ]]
            -- upvalues: v18 (copy), v29 (copy), v22 (copy)
            v18:Redeem(v29);
            v22:Close();
        end));
        local l_Quantity_0 = l_SingleStockMachine_0.Output.Holder.Quantity;
        local v54 = nil;
        local function v56() --[[ Line: 161 ]] --[[ Name: updateStock ]]
            -- upvalues: v18 (copy), v29 (copy), l_Quantity_0 (copy), v11 (ref), v54 (ref), v6 (ref)
            local l_v18_Stock_0 = v18:GetStock(v29);
            l_Quantity_0.TextColor3 = Color3.fromRGB(255, 255, 255);
            if l_v18_Stock_0 == nil or l_v18_Stock_0 > 0 then
                l_Quantity_0.Text = l_v18_Stock_0 and ("%* Left"):format((v11:Comma(l_v18_Stock_0))) or "Loading...";
                if not v54 then
                    v54 = v6.apply(l_Quantity_0, "Rainbow");
                    return;
                end;
            else
                l_Quantity_0.TextColor3 = Color3.fromRGB(255, 0, 0);
                l_Quantity_0.Text = "SOLD OUT";
                if v54 then
                    v54();
                    v54 = nil;
                end;
            end;
        end;
        v20:Add(v18:OnStockChange(v29, v56));
        task.spawn(v56);
        v20:Add(function() --[[ Line: 184 ]]
            -- upvalues: v54 (ref)
            if v54 then
                v54();
                v54 = nil;
            end;
        end);
        v22.Toggle = function(_) --[[ Line: 191 ]] --[[ Name: Toggle ]]
            -- upvalues: v9 (ref)
            v9:Toggle("SingleStockMachine");
        end;
        v22.Open = function(_) --[[ Line: 195 ]] --[[ Name: Open ]]
            -- upvalues: v9 (ref)
            v9:SetState("SingleStockMachine", true);
        end;
        v22.Close = function(_) --[[ Line: 199 ]] --[[ Name: Close ]]
            -- upvalues: v9 (ref)
            v9:SetState("SingleStockMachine", false);
        end;
        v22.Destroy = function(_) --[[ Line: 203 ]] --[[ Name: Destroy ]]
            -- upvalues: v20 (copy)
            v20:Destroy();
        end;
        return v22;
    end
};