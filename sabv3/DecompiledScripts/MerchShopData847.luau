local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Packages.FFlags);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local v3 = {
    CodeLength = 12, 
    CurrentShopItem = "Festive 67", 
    IsEnabled = function() --[[ Line: 27 ]] --[[ Name: IsEnabled ]]
        -- upvalues: v1 (copy)
        return v1:GetInstant("MerchShopEnabled", true);
    end, 
    Items = {
        ["Festive 67"] = {
            CommerceProductId = "COM-7003089990728810945", 
            DevProductId = 3477983793, 
            RewardType = "Brainrot", 
            RewardId = "Festive 67", 
            StockKey = "Festive 67", 
            InitialStock = 50000, 
            IsEnabled = function() --[[ Line: 44 ]] --[[ Name: IsEnabled ]]
                -- upvalues: v1 (copy)
                return v1:GetInstant("MerchShopEnabled", true) and not v1:Get("MechShopSoldOut", false);
            end
        }
    }, 
    TestProductInfo = {
        Description = "Test description", 
        DisplayPrice = "$29.98", 
        IconImageAssetId = 0, 
        IsPurchasable = true
    }
};
for v4, v5 in v3.Items do
    v5.Name = v4;
end;
v3.CurrentItem = v3.Items[v3.CurrentShopItem];
return v3;