local _ = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Workspace_0 = game:GetService("Workspace");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v5 = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Timer);
local v7 = require(l_Utils_0.NumberUtils);
local v8 = require(l_ReplicatedStorage_0.Datas.ServerData);
local l_Map_0 = l_Workspace_0.Map;
local v10 = {};
local v11 = {};
local v12 = {};
local v13 = Color3.fromRGB(255, 213, 0);
local v14 = Color3.fromRGB(116, 116, 116);
local v15 = Color3.fromRGB(143, 87, 35);
local v16 = Color3.fromRGB(255, 255, 255);
local v17 = v5:RemoteFunction("Leaderboard/GetTopPlayers");
local v18 = v5:RemoteFunction("Leaderboard/GetDisplayNames");
local v19 = v5:RemoteEvent("Leaderboard/ReplicateUpdate");
local v20 = v5:RemoteEvent("Leaderboard/ReplicateDisplayNames");
return {
    UpdateBoard = function(_, v22) --[[ Line: 41 ]] --[[ Name: UpdateBoard ]]
        -- upvalues: v12 (ref), v11 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v10 (copy), v7 (copy)
        local v23 = v12[v22];
        if not v23 then
            return;
        else
            local l_ScrollingFrame_0 = v23.Model:WaitForChild("Main"):WaitForChild("SurfaceGui"):WaitForChild("MainFrame"):WaitForChild("ScrollingFrame");
            local l_LeaderboardTemplate_0 = l_ScrollingFrame_0:WaitForChild("LeaderboardTemplate");
            local l_PlayerData_0 = v23.PlayerData;
            for _, v28 in ipairs(l_ScrollingFrame_0:GetChildren()) do
                if v28:IsA("Frame") and v28.Name:sub(1, 4) == "Line" then
                    local l_v28_Attribute_0 = v28:GetAttribute("UserId");
                    local v30 = v11[l_v28_Attribute_0];
                    local v31 = if v30 then table.find(v30, v28) else nil;
                    if v31 then
                        table.remove(v30, v31);
                        if #v30 == 0 then
                            v11[l_v28_Attribute_0] = nil;
                        end;
                    end;
                    v28:Destroy();
                end;
            end;
            for v32 = 1, math.min(100, #l_PlayerData_0) do
                local v33 = l_PlayerData_0[v32];
                local v34 = l_LeaderboardTemplate_0:Clone();
                v34.Visible = true;
                v34.Name = "Line" .. v32;
                v34.LayoutOrder = v32;
                local l_PositionLabel_0 = v34:FindFirstChild("PositionLabel");
                local l_NameLabel_0 = v34:FindFirstChild("NameLabel");
                local l_v34_FirstChild_0 = v34:FindFirstChild(v22 .. "Label");
                local l_AvatarImage_0 = v34:FindFirstChild("AvatarImage");
                local l_UIStroke_0 = l_AvatarImage_0:FindFirstChild("UIStroke");
                local v40 = nil;
                v40 = if v33.Rank == 1 then v13 else if v33.Rank == 2 then v14 else if v33.Rank == 3 then v15 else v16;
                if l_PositionLabel_0 then
                    l_PositionLabel_0.Text = tostring(v33.Rank) .. ".";
                    l_PositionLabel_0.TextColor3 = v40;
                end;
                if l_NameLabel_0 then
                    l_NameLabel_0.Text = v10[v33.UserId] or "Loading...";
                    l_NameLabel_0.TextColor3 = v40;
                end;
                if l_v34_FirstChild_0 then
                    local v41 = v7:ToString(math.round(v33.Value), 2);
                    l_v34_FirstChild_0.Text = if v22 == "Generation" then v41 .. "/s" else v41;
                    l_v34_FirstChild_0.TextColor3 = v40;
                end;
                if l_AvatarImage_0 then
                    l_AvatarImage_0.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(v33.UserId);
                    if l_UIStroke_0 then
                        l_UIStroke_0.Color = v40;
                    end;
                end;
                if not v11[v33.UserId] then
                    v11[v33.UserId] = {
                        v34
                    };
                else
                    table.insert(v11[v33.UserId], v34);
                end;
                v34:SetAttribute("UserId", v33.UserId);
                v34.Parent = l_ScrollingFrame_0;
            end;
            return;
        end;
    end, 
    RefreshLeaderboard = function(v42, v43, v44) --[[ Line: 127 ]] --[[ Name: RefreshLeaderboard ]]
        -- upvalues: v17 (copy), v12 (ref)
        if not v44 then
            pcall(function() --[[ Line: 129 ]]
                -- upvalues: v44 (ref), v17 (ref), v43 (copy)
                v44 = v17:InvokeServer(v43);
            end);
        end;
        if type(v44) == "table" then
            v12[v43].PlayerData = v44;
            v42:UpdateBoard(v43);
        end;
    end, 
    Start = function(v45) --[[ Line: 140 ]] --[[ Name: Start ]]
        -- upvalues: v8 (copy), v12 (ref), l_Map_0 (copy), v10 (copy), v11 (copy), v19 (copy), v20 (copy), v18 (copy)
        if v8.IsDuelsServer() or v8.IsTsunamiServer() then
            return;
        else
            v12 = {
                Generation = {
                    Model = l_Map_0:WaitForChild("GenerationBoard"), 
                    PlayerData = {}
                }, 
                Steals = {
                    Model = l_Map_0:WaitForChild("StealsBoard"), 
                    PlayerData = {}
                }
            };
            task.spawn(function() --[[ Line: 156 ]]
                -- upvalues: v10 (ref), v11 (ref), v19 (ref), v45 (copy), v20 (ref), v18 (ref), v12 (ref)
                local function v54(v46) --[[ Line: 157 ]] --[[ Name: updateNameCache ]]
                    -- upvalues: v10 (ref), v11 (ref)
                    if type(v46) ~= "table" then
                        return;
                    else
                        for v47, v48 in v46 do
                            local v49 = tonumber(v47);
                            if v49 then
                                v10[v49] = v48;
                                local v50 = v11[v49];
                                if type(v50) == "table" then
                                    for _, v52 in v50 do
                                        local l_NameLabel_1 = v52:FindFirstChild("NameLabel");
                                        if l_NameLabel_1 then
                                            l_NameLabel_1.Text = v48;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        return;
                    end;
                end;
                v19.OnClientEvent:Connect(function(v55, v56) --[[ Line: 184 ]]
                    -- upvalues: v45 (ref)
                    v45:RefreshLeaderboard(v55, v56);
                end);
                v20.OnClientEvent:Connect(v54);
                v54(v18:InvokeServer());
                for v57 in pairs(v12) do
                    v45:RefreshLeaderboard(v57);
                end;
            end);
            return;
        end;
    end
};