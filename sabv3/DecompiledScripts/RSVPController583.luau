local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_SocialService_0 = game:GetService("SocialService");
local v2 = require(l_ReplicatedStorage_0.Packages.Net):RemoteEvent("RSVPService/Prompt");
return {
    Start = function(_) --[[ Line: 11 ]] --[[ Name: Start ]]
        -- upvalues: v2 (copy), l_SocialService_0 (copy)
        v2.OnClientEvent:Connect(function(v4) --[[ Line: 12 ]]
            -- upvalues: l_SocialService_0 (ref)
            pcall(function() --[[ Line: 13 ]]
                -- upvalues: l_SocialService_0 (ref), v4 (copy)
                local l_l_SocialService_0_EventRsvpStatusAsync_0 = l_SocialService_0:GetEventRsvpStatusAsync((tostring(v4)));
                if l_l_SocialService_0_EventRsvpStatusAsync_0 == Enum.RsvpStatus.None or l_l_SocialService_0_EventRsvpStatusAsync_0 == Enum.RsvpStatus.NotGoing then
                    l_SocialService_0:PromptRsvpToEventAsync((tostring(v4)));
                end;
            end);
        end);
    end
};