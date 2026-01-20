local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = require(l_ReplicatedStorage_0.Shared.StockMachineTypes);
local v2 = require(l_ReplicatedStorage_0.Packages.Net);
local v3 = v2:RemoteEvent("StockEventService/SetFocused");
local v4 = v2:RemoteEvent("StockEventService/Return");
local v5 = v2:RemoteEvent("StockEventService/Redeem");
local v6 = v2:RemoteFunction("StockEventService/ListItems");
local _ = v2:RemoteFunction("StockEventService/Delivery");
local v8 = {};
local function _(v9) --[[ Line: 18 ]] --[[ Name: formatStockAttribute ]]
    return (("StockEvent_%*"):format((string.gsub(v9, "%s", "_"))));
end;
local v28 = {
    GetStock = function(_, v12) --[[ Line: 24 ]] --[[ Name: GetStock ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        return l_ReplicatedStorage_0:GetAttribute((("StockEvent_%*"):format((string.gsub(v12, "%s", "_")))));
    end, 
    OnStockChange = function(_, v14, v15) --[[ Line: 28 ]] --[[ Name: OnStockChange ]]
        -- upvalues: l_ReplicatedStorage_0 (copy)
        return l_ReplicatedStorage_0:GetAttributeChangedSignal((("StockEvent_%*"):format((string.gsub(v14, "%s", "_"))))):Connect(v15);
    end, 
    Redeem = function(v16, v17) --[[ Line: 32 ]] --[[ Name: Redeem ]]
        -- upvalues: v5 (copy)
        v5:FireServer(v16.MachineName, v17);
    end, 
    Return = function(v18, v19) --[[ Line: 36 ]] --[[ Name: Return ]]
        -- upvalues: v4 (copy)
        v4:FireServer(v18.MachineName, v19);
    end, 
    SetOpen = function(v20, v21) --[[ Line: 40 ]] --[[ Name: SetOpen ]]
        -- upvalues: v3 (copy)
        v3:FireServer("08870265-fdfe-491d-9606-81363c9def3b", v20.MachineName, v21);
    end, 
    ListItems = function(v22) --[[ Line: 48 ]] --[[ Name: ListItems ]]
        -- upvalues: v8 (copy), v6 (copy)
        if v8[v22.MachineName] then
            return true, v8[v22.MachineName];
        else
            local v23 = 3;
            local v24 = nil;
            local v25 = nil;
            while true do
                local v26, v27 = v6:InvokeServer("a694d84f-7b1b-4cec-b21d-c831b291a0c0", v22.MachineName);
                v24 = v26;
                v25 = v27;
                if not v24 then
                    task.wait(3);
                    if v25 ~= "Retry" then
                        if v23 > 0 then
                            v23 = v23 - 1;
                        else
                            break;
                        end;
                    end;
                else
                    break;
                end;
            end;
            if v24 and typeof(v25) == "table" then
                v8[v22.MachineName] = v25;
            end;
            return v24, v25;
        end;
    end
};
return {
    create = function(v29) --[[ Line: 85 ]] --[[ Name: create ]]
        -- upvalues: v28 (copy)
        return (setmetatable({
            MachineName = v29
        }, {
            __index = v28
        }));
    end
};