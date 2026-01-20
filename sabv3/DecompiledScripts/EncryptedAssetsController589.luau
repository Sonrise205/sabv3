local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local _ = game:GetService("Players");
local v3 = require(l_ReplicatedStorage_0.Packages.Net);
local v4 = {};
return {
    WaitForAssetId = function(_, v6) --[[ Line: 12 ]] --[[ Name: WaitForAssetId ]]
        -- upvalues: v4 (copy)
        while not v4[v6] do
            task.wait();
        end;
    end, 
    Start = function(_) --[[ Line: 18 ]] --[[ Name: Start ]]
        -- upvalues: v3 (copy), l_ContentProvider_0 (copy), v4 (copy)
        for v8, v9 in v3:Invoke("EncryptedAssetsService/Load") do
            task.spawn(function() --[[ Line: 20 ]]
                -- upvalues: l_ContentProvider_0 (ref), v8 (copy), v9 (copy), v4 (ref)
                l_ContentProvider_0:RegisterSessionEncryptedAsset(v8, v9);
                v4[v8] = true;
            end);
        end;
    end
};