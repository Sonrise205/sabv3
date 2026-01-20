local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_Players_0 = game:GetService("Players");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v4 = require(l_Packages_0.Synchronizer);
local v5 = require(l_Packages_0.Timer);
local v6 = require(l_Packages_0.Net);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v8 = require(l_Datas_0.Tips);
local v9 = v5.new(1);
local v10 = v6:RemoteEvent("ChatService/ChatMessage");
local v11 = nil;
local v14 = {
    SendMessage = function(_, v13) --[[ Line: 25 ]] --[[ Name: SendMessage ]]
        -- upvalues: v11 (ref)
        if v11 then
            v11:DisplaySystemMessage(v13);
        end;
    end
};
v14.Start = function(_) --[[ Line: 31 ]] --[[ Name: Start ]]
    -- upvalues: v11 (ref), l_TextChatService_0 (copy), v4 (copy), l_Players_0 (copy), v10 (copy), v14 (copy), v9 (copy), v8 (copy)
    v11 = l_TextChatService_0:WaitForChild("TextChannels"):WaitForChild("RBXSystem");
    local v16 = v4:Wait(l_Players_0.LocalPlayer);
    v10.OnClientEvent:Connect(function(...) --[[ Line: 36 ]]
        -- upvalues: v14 (ref)
        v14:SendMessage(...);
    end);
    local v17 = {};
    v9.Tick:Connect(function() --[[ Line: 41 ]]
        -- upvalues: v8 (ref), v17 (copy), v16 (copy), v14 (ref)
        for v18 = 1, #v8 do
            local v19 = v8[v18];
            local v20 = os.clock();
            v17[v18] = v17[v18] or v20;
            if v20 - v17[v18] >= v19.ShowEvery and v16:Get("Settings.Chat Tips") then
                v17[v18] = v20;
                v14:SendMessage(v19.ChatMessage);
            end;
        end;
    end);
    v9:Start();
end;
return v14;