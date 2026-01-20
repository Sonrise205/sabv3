local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local v4 = require(l_Packages_0.Synchronizer);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
return {
    Start = function(_) --[[ Line: 16 ]] --[[ Name: Start ]]
        -- upvalues: v4 (copy), l_LocalPlayer_0 (copy), l_RunService_0 (copy)
        v4:WaitAndCall(l_LocalPlayer_0, function(v7) --[[ Line: 18 ]]
            -- upvalues: l_RunService_0 (ref)
            if v7:Get("TimesJoined") <= 1 then
                task.delay(l_RunService_0:IsStudio() and 10 or 600, function() --[[ Line: 22 ]]
                    game:GetService("AvatarEditorService"):PromptSetFavorite(game.PlaceId, Enum.AvatarItemType.Asset, true);
                end);
            end;
        end);
    end
};