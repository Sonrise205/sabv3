local l_Shared_0 = game:GetService("ReplicatedStorage").Shared;
local _ = require(l_Shared_0.Updates);
return {
    ["Starter Rod"] = {
        Price = 0, 
        Currency = "Coins", 
        RebirthRequired = 0, 
        Icon = "rbxassetid://78462319444797", 
        Description = "A basic Fishing Rod used to catch Brainrots", 
        LayoutOrder = 1, 
        Luck = 1.5
    }, 
    ["Frozen Rod"] = {
        Price = 2500000, 
        Currency = "Coins", 
        RebirthRequired = 5, 
        Icon = "rbxassetid://105439588364768", 
        Description = "A more powerful Frozen Rod", 
        LayoutOrder = 2, 
        Luck = 2
    }, 
    ["Fiery Rod"] = {
        Price = 75000000, 
        Currency = "Coins", 
        RebirthRequired = 10, 
        Icon = "rbxassetid://126183163184359", 
        Description = "An even more powerful Fiery Rod", 
        LayoutOrder = 3, 
        Luck = 3
    }, 
    ["Radioactive Rod"] = {
        Price = 1000000000, 
        Currency = "Coins", 
        RebirthRequired = 15, 
        Icon = "rbxassetid://112962148127151", 
        Description = "The most powerful rod, Radioactive Rod", 
        LayoutOrder = 4, 
        Luck = 4
    }
};