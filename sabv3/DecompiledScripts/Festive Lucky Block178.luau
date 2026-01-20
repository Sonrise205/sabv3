local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("ContentProvider");
local _ = game:GetService("SoundService");
local _ = game:GetService("TweenService");
local _ = game:GetService("HttpService");
local _ = game:GetService("RunService");
local _ = game:GetService("StarterGui");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Packages.Serialization);
local v9 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.CreateTween);
local _ = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v12 = require(l_ReplicatedStorage_0.Packages.Gradients);
local v13 = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Packages.Moonlite);
local _ = require(l_ReplicatedStorage_0.Packages.Squash);
local v16 = require(l_ReplicatedStorage_0.Packages.FFlags);
local _ = require(l_ReplicatedStorage_0.Packages.Timer);
local v18 = require(l_ReplicatedStorage_0.Packages.Trove);
local v19 = require(l_ReplicatedStorage_0.Packages.Spr);
local v20 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local _ = require(l_ReplicatedStorage_0.Controllers.NewPlayersController);
local v23 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Controllers.CharacterController);
local _ = require(l_ReplicatedStorage_0.Controllers.SoundController);
local _ = require(l_ReplicatedStorage_0.Controllers.PlotController);
local v27 = require(l_ReplicatedStorage_0.Utils.NumberUtils);
local _ = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local _ = require(l_ReplicatedStorage_0.Shared.VFX);
local v30 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local v33 = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Shared.Index);
local _ = require(l_ReplicatedStorage_0.Datas.Mutations);
local v36 = require(l_ReplicatedStorage_0.Datas.Rarities);
local v37 = require(l_ReplicatedStorage_0.Datas.Animals);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local l_Name_0 = script.Name;
local _ = require(l_ReplicatedStorage_0.Shared.EventTypes);
local v57 = {
    Setup = function(_) --[[ Line: 64 ]] --[[ Name: Setup ]]
        -- upvalues: l_PlayerGui_0 (copy), v23 (copy), v9 (copy), l_LocalPlayer_0 (copy), v37 (copy), v36 (copy), v12 (copy), v33 (copy), v30 (copy), v20 (copy), l_Name_0 (copy), v16 (copy), v27 (copy), v19 (copy)
        local l_Frame_0 = l_PlayerGui_0:WaitForChild("FestiveLuckyBlock").Frame;
        local l_Spawn_0 = l_Frame_0.Spawn;
        local l_Close_0 = l_Frame_0.Header.Close;
        l_Frame_0.Visible = false;
        local v46 = v23:Register("FestiveLuckyBlockMachine", l_Frame_0, "TopQuint");
        v46:AttachCloseButton(l_Close_0);
        v46:Close();
        local v47 = v9:Wait(l_LocalPlayer_0);
        if not v47 then
            return;
        else
            (function(v48, v49) --[[ Line: 81 ]] --[[ Name: renderBrainrotAtFrame ]]
                -- upvalues: v37 (ref), v36 (ref), v12 (ref), v33 (ref)
                local v50 = v37[v49];
                if not v50 then
                    return;
                else
                    local v51 = v36[v50.Rarity];
                    v48.Title.Text = v49;
                    if v51.GradientPreset then
                        v48.UIStroke.Color = Color3.new(1, 1, 1);
                        v48.Title.TextColor3 = Color3.new(1, 1, 1);
                        v12.apply(v48.UIStroke, v51.GradientPreset);
                        v12.apply(v48.Title, v51.GradientPreset);
                    else
                        v48.UIStroke.Color = v51.Color;
                        v48.Title.TextColor3 = v51.Color;
                    end;
                    v48.Visible = true;
                    v33:AttachOnViewportWithOptimizations(v49, v48.ViewportFrame);
                    return;
                end;
            end)(l_Frame_0.Mid, "Festive Lucky Block");
            v12.apply(l_Frame_0.Mid.Title, "GreenRed");
            local v52 = v30.new(l_Spawn_0);
            v52:Animate();
            v52.OnActivated:Connect(function() --[[ Line: 109 ]]
                -- upvalues: v20 (ref), l_Name_0 (ref), v23 (ref)
                v20:RemoteEvent((("EventService/%*/Spawn"):format(l_Name_0))):FireServer();
                v23:SetState("FestiveLuckyBlockMachine", false);
            end);
            local function v56() --[[ Line: 114 ]] --[[ Name: updateCandyCane ]]
                -- upvalues: v16 (ref), v47 (copy), l_Frame_0 (copy), v27 (ref), v19 (ref)
                local l_v16_Instant_0 = v16:GetInstant("ChristmasEventSpawnFestiveLuckyBlockRequirement", 300);
                local v54 = v47:Get("ChristmasEvent.CandyCane") or 0;
                l_Frame_0.Subtitle.Text = ("Collect <font color=\"rgb(255, 64, 64)\">%* Candy Canes</font> to spawn a\n<font color=\"rgb(60, 255, 0)\">Festive Lucky Block</font>"):format(l_v16_Instant_0);
                l_Frame_0.Progress.Label.Text = ("%*/%*"):format(v27:Comma(v54), l_v16_Instant_0);
                v19.target(l_Frame_0.Progress.Fill, 1, 5, {
                    Size = UDim2.fromScale(math.clamp(v54 / l_v16_Instant_0, 0, 1), 1)
                });
                local v55 = l_v16_Instant_0 <= v54;
                l_Frame_0.Spawn.Interactable = v55;
                l_Frame_0.Spawn.BackgroundColor3 = if v55 then Color3.fromRGB(81, 158, 86) else Color3.fromRGB(127, 127, 127);
            end;
            v47:OnChanged("ChristmasEvent.CandyCane", v56, true);
            v16:OnUpdate(function() --[[ Line: 130 ]]
                -- upvalues: v56 (copy)
                v56();
            end);
            return;
        end;
    end
};
local v58 = v18.new();
v57.OnStart = function(_) --[[ Line: 136 ]] --[[ Name: OnStart ]]

end;
v57.OnStop = function(_) --[[ Line: 139 ]] --[[ Name: OnStop ]]
    -- upvalues: v58 (copy)
    v58:Clean();
end;
v57.OnLoad = function(v61) --[[ Line: 143 ]] --[[ Name: OnLoad ]]
    -- upvalues: v13 (copy), v18 (copy), v9 (copy), l_LocalPlayer_0 (copy), v16 (copy), v27 (copy), v23 (copy)
    task.spawn(v61.Setup, v61);
    v13.observeTag("FestiveLuckyBlockAmount", function(v62) --[[ Line: 146 ]]
        -- upvalues: v18 (ref), v9 (ref), l_LocalPlayer_0 (ref), v16 (ref), v27 (ref)
        local v63 = v18.new();
        v63:Add(task.spawn(function() --[[ Line: 149 ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v16 (ref), v62 (copy), v27 (ref), v63 (copy)
            local v64 = v9:Wait(l_LocalPlayer_0);
            if not v64 then
                return;
            else
                v63:Add(v64:OnChanged("ChristmasEvent.CandyCane", function() --[[ Line: 155 ]] --[[ Name: updateCandyCane ]]
                    -- upvalues: v16 (ref), v64 (copy), v62 (ref), v27 (ref)
                    local l_v16_Instant_1 = v16:GetInstant("ChristmasEventSpawnFestiveLuckyBlockRequirement", 300);
                    local v66 = v64:Get("ChristmasEvent.CandyCane") or 0;
                    v62.Text = ("%*/%*"):format(v27:Comma(v66), l_v16_Instant_1);
                end, true));
                v63:Add(v16:OnUpdate(function() --[[ Line: 162 ]]
                    -- upvalues: v16 (ref), v64 (copy), v62 (ref), v27 (ref)
                    local l_v16_Instant_2 = v16:GetInstant("ChristmasEventSpawnFestiveLuckyBlockRequirement", 300);
                    local v68 = v64:Get("ChristmasEvent.CandyCane") or 0;
                    v62.Text = ("%*/%*"):format(v27:Comma(v68), l_v16_Instant_2);
                end));
                return;
            end;
        end));
        return v63:WrapClean();
    end);
    v13.observeTag("FestiveLuckyBlockMachinePrompt", function(v69) --[[ Line: 170 ]]
        -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v23 (ref)
        local v70 = v69.Triggered:Connect(function() --[[ Line: 171 ]]
            -- upvalues: v9 (ref), l_LocalPlayer_0 (ref), v23 (ref)
            if not v9:Get(l_LocalPlayer_0) then
                return;
            else
                v23:Toggle("FestiveLuckyBlockMachine");
                return;
            end;
        end);
        return function() --[[ Line: 180 ]]
            -- upvalues: v70 (copy)
            v70:Disconnect();
        end;
    end);
end;
return v57;