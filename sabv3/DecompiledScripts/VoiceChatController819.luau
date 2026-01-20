local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_VoiceChatService_0 = game:GetService("VoiceChatService");
local l_TeleportService_0 = game:GetService("TeleportService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local v5 = require(l_ReplicatedStorage_0.Controllers.NotificationController);
local v6 = require(l_ReplicatedStorage_0.Packages.TopbarPlus);
local v7 = require(l_ReplicatedStorage_0.Datas.ServerData);
local v8 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_PlayerGui_0 = l_LocalPlayer_0.PlayerGui;
local v11 = nil;
local v12 = v6.new():setLabel("VC Servers"):setOrder(3);
local _ = game.GameId == 7766605450;
local l_VoiceChat_0 = l_PlayerGui_0:WaitForChild("VoiceChat").VoiceChat;
local l_Close_0 = l_VoiceChat_0.Close;
local l_Yes_0 = l_VoiceChat_0.Yes;
local l_Cancel_0 = l_VoiceChat_0.Cancel;
return {
    Start = function(_) --[[ Line: 33 ]] --[[ Name: Start ]]
        -- upvalues: v7 (copy), v12 (copy), v11 (ref), v4 (copy), l_VoiceChat_0 (copy), l_Close_0 (copy), l_Cancel_0 (copy), v8 (copy), l_Yes_0 (copy), l_VoiceChatService_0 (copy), l_LocalPlayer_0 (copy), l_TeleportService_0 (copy), v5 (copy)
        if game.PlaceId == v7.VoiceServersPlaceId or v7.IsDuelsServer() then
            v12:setEnabled(false);
        end;
        v11 = v4:Register("VoiceChat", l_VoiceChat_0, "TopQuint");
        v11:AttachCloseButton(l_Close_0);
        v11:AttachCloseButton(l_Cancel_0);
        v11:Close();
        v12.selected:Connect(function() --[[ Line: 44 ]]
            -- upvalues: v4 (ref)
            v4:SetState("VoiceChat", true);
        end);
        v12.deselected:Connect(function() --[[ Line: 48 ]]
            -- upvalues: v4 (ref)
            v4:SetState("VoiceChat", false);
        end);
        v11.OnOpen:Connect(function() --[[ Line: 52 ]]
            -- upvalues: v12 (ref)
            v12:select();
        end);
        v11.OnClose:Connect(function() --[[ Line: 56 ]]
            -- upvalues: v12 (ref)
            v12:deselect();
        end);
        local v19 = v8.new(l_Yes_0);
        v19:Animate();
        v19.OnActivated:Connect(function() --[[ Line: 62 ]]
            -- upvalues: l_VoiceChatService_0 (ref), l_LocalPlayer_0 (ref), l_TeleportService_0 (ref), v7 (ref), v5 (ref)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 63 ]]
                -- upvalues: l_VoiceChatService_0 (ref), l_LocalPlayer_0 (ref)
                return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_LocalPlayer_0.UserId);
            end);
            if l_status_0 and l_result_0 then
                l_TeleportService_0:Teleport(v7.VoiceServersPlaceId, l_LocalPlayer_0);
                return;
            else
                v5:Error("You must have Voice Chat enabled to join this experience.");
                return;
            end;
        end);
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 74 ]]
            -- upvalues: l_VoiceChatService_0 (ref), l_LocalPlayer_0 (ref)
            return l_VoiceChatService_0:IsVoiceEnabledForUserIdAsync(l_LocalPlayer_0.UserId);
        end);
        if l_status_1 and not l_result_1 then
            v12:setEnabled(false);
        end;
    end
};