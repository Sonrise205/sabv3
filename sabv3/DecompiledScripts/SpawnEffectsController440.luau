local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.Net);
local v2 = require(l_ReplicatedStorage_0.Shared.VFX);
return {
    Start = function(_) --[[ Line: 9 ]] --[[ Name: Start ]]
        -- upvalues: v1 (copy), v2 (copy)
        v1:RemoteEvent("GameService/SpawnEffect").OnClientEvent:Connect(function(v4, _, v6, v7) --[[ Line: 10 ]]
            -- upvalues: v2 (ref)
            local v8 = script[v4]:Clone();
            if v7 then
                local v9 = workspace.Road.Start:Clone();
                v9.Parent = v8;
                v8.PrimaryPart = v9;
                v8:PivotTo(v7);
                v8.PrimaryPart = nil;
                v9:Destroy();
            end;
            v8.Parent = workspace;
            v2.emit(v8);
            for _, v11 in v8:GetDescendants() do
                if v11:IsA("Sound") then
                    v11:Play();
                end;
            end;
            task.wait(v6 + 5);
            v8:Destroy();
        end);
    end
};