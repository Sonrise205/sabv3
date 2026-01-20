local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_StockMachine_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("StockMachine").StockMachine;
local l_Content_0 = l_StockMachine_0.Content;
local l_Close_0 = l_StockMachine_0.Header.Close;
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
l_StockMachine_0.Visible = false;
local v16 = v9:Register("StockMachine", l_StockMachine_0, "TopQuint");
v16:AttachCloseButton(l_Close_0);
v16:Close();
return {
    Setup = function(_, v18, v19) --[[ Line: 35 ]] --[[ Name: Setup ]]
        -- upvalues: v14 (copy), v10 (copy), l_LocalPlayer_0 (copy), v16 (copy), v13 (copy), v12 (copy), v6 (copy), v7 (copy), l_Content_0 (copy), v8 (copy), v11 (copy), v9 (copy)
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
        for v29, v30 in v19 do
            local v31 = l_Content_0.Template:Clone();
            v31.Visible = true;
            v31.LayoutOrder = v30.Order or 1;
            v31.Parent = l_Content_0;
            v31.Output.LayoutOrder = 999999999;
            v28(v31.Output, v30.Output);
            local v32 = {};
            for v33, v34 in v30.Inputs do
                local v35 = v13[v34];
                if v35 then
                    local v36 = v12[v35.Rarity];
                    local v37 = v20:Clone(v31.Input);
                    v37.LayoutOrder = v36.Weight * 100 + v33;
                    v28(v37, v34);
                    v37.ViewportFrame.ImageColor3 = Color3.new(0, 0, 0);
                    v37.Return.Visible = false;
                    v37.Visible = true;
                    v37.Parent = v31;
                    if not v32[v34] then
                        v32[v34] = {};
                    end;
                    table.insert(v32[v34], v37);
                    local v38 = v8.new(v37.Return);
                    v20:Add(v38);
                    v38:Animate();
                    v20:Add(v38.OnActivated:Connect(function() --[[ Line: 110 ]]
                        -- upvalues: v21 (copy), v34 (copy), v18 (copy)
                        for v39, v40 in (v21:Get("AnimalPodiums")) do
                            if type(v40) == "table" and v40.Index == v34 and v40.Machine and v40.Machine.Type == v18.MachineName and not v40.Machine.Active then
                                v18:Return(v39);
                                return;
                            end;
                        end;
                    end));
                end;
            end;
            local function v52() --[[ Line: 121 ]] --[[ Name: updateBrainrotFrame ]]
                -- upvalues: v21 (copy), v18 (copy), v32 (copy), v31 (copy)
                local v41 = v21:Get("AnimalPodiums");
                local v42 = {};
                for _, v44 in v41 do
                    if type(v44) == "table" and v44.Machine and v44.Machine.Type == v18.MachineName and not v44.Machine.Active then
                        v42[v44.Index] = (v42[v44.Index] or 0) + 1;
                    end;
                end;
                local v45 = true;
                for v46, v47 in v32 do
                    local v48 = v42[v46] or 0;
                    for v49, v50 in v47 do
                        local v51 = v49 <= v48;
                        v50.Return.Visible = v51;
                        v50.ViewportFrame.ImageColor3 = if v51 then Color3.new(1, 1, 1) else Color3.new(0, 0, 0);
                        if not v51 then
                            v45 = false;
                        end;
                    end;
                end;
                v31.Output.Spawn.Interactable = v45;
                v31.Output.Spawn.BackgroundColor3 = if v45 then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(127, 127, 127);
            end;
            v20:Add(v21:OnChanged("AnimalAddedOrRemoved", v52));
            task.spawn(v52);
            local v53 = v8.new(v31.Output.Spawn);
            v20:Add(v53);
            v53:Animate();
            v20:Add(v53.OnActivated:Connect(function() --[[ Line: 157 ]]
                -- upvalues: v18 (copy), v29 (copy), v22 (copy)
                v18:Redeem(v29);
                v22:Close();
            end));
            local l_Quantity_0 = v31.Output.Quantity;
            local v55 = nil;
            do
                local l_v55_0 = v55;
                local function v58() --[[ Line: 167 ]] --[[ Name: updateStock ]]
                    -- upvalues: v18 (copy), v29 (copy), l_Quantity_0 (copy), v11 (ref), l_v55_0 (ref), v6 (ref), v31 (copy)
                    local l_v18_Stock_0 = v18:GetStock(v29);
                    l_Quantity_0.TextColor3 = Color3.fromRGB(255, 255, 255);
                    if l_v18_Stock_0 == nil or l_v18_Stock_0 > 0 then
                        l_Quantity_0.Text = l_v18_Stock_0 and ("%* Left"):format((v11:Comma(l_v18_Stock_0))) or "Loading...";
                        if not l_v55_0 then
                            l_v55_0 = v6.apply(v31.Output.Quantity, "Rainbow");
                            return;
                        end;
                    else
                        l_Quantity_0.TextColor3 = Color3.fromRGB(255, 0, 0);
                        l_Quantity_0.Text = "SOLD OUT";
                        if l_v55_0 then
                            l_v55_0();
                            l_v55_0 = nil;
                        end;
                    end;
                end;
                v20:Add(function() --[[ Line: 187 ]]
                    -- upvalues: l_v55_0 (ref)
                    if l_v55_0 then
                        l_v55_0();
                        l_v55_0 = nil;
                    end;
                end);
                v20:Add(v18:OnStockChange(v29, v58));
                task.spawn(v58);
            end;
        end;
        v22.Toggle = function(_) --[[ Line: 198 ]] --[[ Name: Toggle ]]
            -- upvalues: v9 (ref)
            v9:Toggle("StockMachine");
        end;
        v22.Open = function(_) --[[ Line: 202 ]] --[[ Name: Open ]]
            -- upvalues: v9 (ref)
            v9:SetState("StockMachine", true);
        end;
        v22.Close = function(_) --[[ Line: 206 ]] --[[ Name: Close ]]
            -- upvalues: v9 (ref)
            v9:SetState("StockMachine", false);
        end;
        v22.Destroy = function(_) --[[ Line: 210 ]] --[[ Name: Destroy ]]
            -- upvalues: v20 (copy)
            v20:Destroy();
        end;
        return v22;
    end
};