local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Net);
return {
    Start = function(_) --[[ Line: 8 ]] --[[ Name: Start ]]
        -- upvalues: v1 (copy), l_ReplicatedStorage_0 (copy)
        if not v1:Invoke("CommandsService/ViewCommands") then
            return;
        else
            local v3 = require(l_ReplicatedStorage_0.Packages.Conch);
            require(l_ReplicatedStorage_0.Shared.ConchTypes);
            v3.initiate_default_lifecycle();
            v3.ui.bind_to(Enum.KeyCode.F2);
            v1:Connect("CommandsService/OpenCommandBar", function() --[[ Line: 19 ]]
                -- upvalues: v3 (copy)
                v3.ui.opened(true);
            end);
            return;
        end;
    end
};