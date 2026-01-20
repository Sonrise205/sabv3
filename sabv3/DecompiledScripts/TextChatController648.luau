local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Packages_0 = l_ReplicatedStorage_0.Packages;
local _ = require(l_Packages_0.Synchronizer);
local v5 = require(l_ReplicatedStorage_0.Datas.ServerData);
return {
    Start = function(_) --[[ Line: 15 ]] --[[ Name: Start ]]
        -- upvalues: l_TextChatService_0 (copy), l_Players_0 (copy), v5 (copy)
        l_TextChatService_0.OnIncomingMessage = function(v7) --[[ Line: 17 ]]
            -- upvalues: l_Players_0 (ref), v5 (ref)
            local v8 = v7.TextSource and l_Players_0:GetPlayerByUserId(v7.TextSource.UserId);
            if not v8 then
                return;
            else
                local l_TextChatMessageProperties_0 = Instance.new("TextChatMessageProperties");
                local v10 = "";
                local l_v8_Attribute_0 = v8:GetAttribute("Role");
                if l_v8_Attribute_0 == "Lead" and (not v5.IsProdGame() or v8.UserId == 2678001507) then
                    v10 = v10 .. ("<font color=\"#fa0909\">[SPYDER]</font> %*"):format(v7.PrefixText or "");
                elseif l_v8_Attribute_0 == "Dev" then
                    v10 = v10 .. ("<font color=\"#9fc1ff\">[DEV]</font> %*"):format(v7.PrefixText or "");
                elseif l_v8_Attribute_0 == "Tester" then
                    v10 = v10 .. ("<font color=\"#00aeff\">[TESTER]</font> %*"):format(v7.PrefixText or "");
                elseif v8:GetAttribute("VIP") then
                    v10 = v10 .. ("<font color=\"#FFD700\">[VIP]</font> %*"):format(v7.PrefixText or "");
                end;
                l_TextChatMessageProperties_0.PrefixText = v10;
                return l_TextChatMessageProperties_0;
            end;
        end;
    end
};