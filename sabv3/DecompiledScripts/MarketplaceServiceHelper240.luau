--!native
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v1 = require(game.ReplicatedStorage.UserGenerated.Concurrency.Cache);
local v2 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v3 = v2.Table({
    PurchaseId = v2.String, 
    PlayerId = v2.Integer, 
    ProductId = v2.Integer, 
    PlaceIdWherePurchased = v2.Integer, 
    CurrencySpent = v2.IntegerNonNegative, 
    CurrencyType = v2.AnyOf(v2.Enum(Enum.CurrencyType), v2.String), 
    ProductPurchaseChannel = v2.Enum(Enum.ProductPurchaseChannel)
});
local v4 = v2.Table({
    AssetId = v2.Integer, 
    InfoType = v2.Enum(Enum.InfoType)
});
local v7 = v1.new({
    Callback = function(v5) --[[ Line: 158 ]] --[[ Name: Callback ]]
        -- upvalues: l_MarketplaceService_0 (copy)
        return l_MarketplaceService_0:GetProductInfo(v5.AssetId, v5.InfoType);
    end, 
    AssertKey = function(v6) --[[ Line: 161 ]] --[[ Name: AssertKey ]]
        -- upvalues: v4 (copy)
        v4(v6);
        return (("%*,%*"):format(v6.AssetId, v6.InfoType.Value));
    end
});
local v12 = {
    AssertReceiptInfo = v3, 
    GetInfoAsync = function(v8, v9, v10) --[[ Line: 171 ]] --[[ Name: GetInfoAsync ]]
        -- upvalues: v2 (copy), v7 (copy)
        v2.Integer(v8);
        v2.Enum(Enum.InfoType)(v9);
        v2.Optional(v2.Boolean)(v10);
        local v11 = {
            AssetId = v8, 
            InfoType = v9
        };
        if v10 then
            return v7:Get(v11);
        else
            return v7:GetAsync(v11);
        end;
    end
};
return table.freeze(v12);