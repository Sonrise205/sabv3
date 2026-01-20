local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v1 = {};
return {
    RemoveCache = function(_, v3) --[[ Line: 25 ]] --[[ Name: RemoveCache ]]
        -- upvalues: v1 (copy)
        v1[v3] = nil;
    end, 
    GetProductInfo = function(_, v5, v6) --[[ Line: 29 ]] --[[ Name: GetProductInfo ]]
        -- upvalues: v1 (copy), l_MarketplaceService_0 (copy)
        local v7 = v1[v5];
        if not v7 or os.time() - v7.LastUpdate >= 3600 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
                -- upvalues: l_MarketplaceService_0 (ref), v5 (copy), v6 (copy)
                return l_MarketplaceService_0:GetProductInfo(v5, v6 == "Gamepass" and Enum.InfoType.GamePass or Enum.InfoType.Product);
            end);
            v1[v5] = {
                PriceInRobux = l_status_0 and l_result_0.PriceInRobux or 999999999, 
                Title = l_status_0 and l_result_0.Name or "Failed to load", 
                Icon = l_status_0 and l_result_0.IconImageAssetId and ("rbxassetid://%*"):format(l_result_0.IconImageAssetId) or "Failed to load", 
                LastUpdate = os.time()
            };
        end;
        return v1[v5];
    end
};