local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.Datas.Mutations);
return {
    Gold = {
        DisplayText = v1.Gold.DisplayText, 
        DisplayWithRichText = v1.Gold.DisplayWithRichText, 
        MainColor = v1.Gold.MainColor, 
        Palettes = v1.Gold.Palettes, 
        Order = 2, 
        ColorOrder = 2, 
        IsMutation = true, 
        CompletitionPercent = 0.75, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(179, 107, 13), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(163, 98, 12), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(200, 150, 0), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(179, 107, 13)
        }
    }, 
    Diamond = {
        DisplayText = v1.Diamond.DisplayText, 
        DisplayWithRichText = v1.Diamond.DisplayWithRichText, 
        MainColor = v1.Diamond.MainColor, 
        Palettes = v1.Diamond.Palettes, 
        Order = 3, 
        ColorOrder = 3, 
        IsMutation = true, 
        CompletitionPercent = 0.75, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(25, 138, 175), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(13, 105, 172), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(28, 150, 194), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(25, 138, 175)
        }
    }, 
    Bloodrot = {
        DisplayText = v1.Bloodrot.DisplayText, 
        DisplayWithRichText = v1.Bloodrot.DisplayWithRichText, 
        MainColor = v1.Bloodrot.MainColor, 
        Palettes = v1.Bloodrot.Palettes, 
        LimitedMutation = 0, 
        ShowInSettings = false, 
        Index = require(script.Index.Bloodrot), 
        DisableIndex = true, 
        IsMutation = true, 
        CompletitionPercent = 1
    }, 
    Rainbow = {
        DisplayText = v1.Rainbow.DisplayText, 
        DisplayWithRichText = v1.Rainbow.DisplayWithRichText, 
        MainColor = v1.Rainbow.MainColor, 
        Palettes = v1.Rainbow.Palettes, 
        Order = 4, 
        ColorOrder = 5, 
        IsMutation = true, 
        CompletitionPercent = 0.75, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(99, 95, 98), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(69, 71, 80), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(27, 42, 53), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(91, 93, 105)
        }
    }, 
    Candy = {
        DisplayText = v1.Candy.DisplayText, 
        DisplayWithRichText = v1.Candy.DisplayWithRichText, 
        MainColor = v1.Candy.MainColor, 
        Palettes = v1.Candy.Palettes, 
        Order = 5, 
        ColorOrder = 4, 
        LimitedMutation = 1753477200, 
        ShowInSettings = false, 
        Index = require(script.Index.Candy), 
        IsMutation = true, 
        CompletitionPercent = 1, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(255, 105, 180), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(177, 73, 125), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(99, 41, 70), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(255, 105, 180)
        }
    }, 
    Lava = {
        DisplayText = v1.Lava.DisplayText, 
        DisplayWithRichText = v1.Lava.DisplayWithRichText, 
        MainColor = v1.Lava.MainColor, 
        Palettes = v1.Lava.Palettes, 
        Order = 5, 
        ColorOrder = 4, 
        LimitedMutation = 1755957600, 
        ShowInSettings = false, 
        Index = require(script.Index.Lava), 
        IsMutation = true, 
        CompletitionPercent = 1, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(62, 31, 15), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(230, 106, 17), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(120, 17, 8), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(255, 160, 0)
        }
    }, 
    Galaxy = {
        DisplayText = v1.Galaxy.DisplayText, 
        DisplayWithRichText = v1.Galaxy.DisplayWithRichText, 
        MainColor = v1.Galaxy.MainColor, 
        Palettes = v1.Galaxy.Palettes, 
        Order = 6, 
        ColorOrder = 4, 
        LimitedMutation = 1758999600, 
        ShowInSettings = false, 
        Index = require(script.Index.Galaxy), 
        IsMutation = true, 
        CompletitionPercent = 1, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(167, 79, 255), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(87, 0, 186), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(32, 12, 48), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(113, 0, 243)
        }
    }, 
    YinYang = {
        DisplayText = v1.YinYang.DisplayText, 
        UseRichText = v1.YinYang.UseRichText, 
        DisplayWithRichText = v1.YinYang.DisplayWithRichText, 
        MainColor = v1.YinYang.MainColor, 
        Palettes = v1.YinYang.Palettes, 
        Order = 7, 
        ColorOrder = 5, 
        LimitedMutation = 1763236800, 
        Index = require(script.Index.YinYang), 
        IsMutation = true, 
        CompletitionPercent = 0.75, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(204, 204, 204), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(204, 204, 204), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(0, 0, 0), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(0, 0, 0), 
            [Vector3.new(196, 40, 28, 0)] = Color3.fromRGB(159, 161, 172), 
            Ground = Color3.fromRGB(159, 161, 172)
        }
    }, 
    Halloween = {
        DisplayText = "Halloween", 
        UseRichText = true, 
        DisplayWithRichText = "<font color=\"#ef7625\">Halloween</font>", 
        MainColor = Color3.fromRGB(239, 118, 37), 
        Order = 8, 
        ShowInSettings = false, 
        Index = require(script.Index.Halloween), 
        LimitedMutation = 1762012800, 
        CountAllMutations = true, 
        CompletitionPercent = 0.75, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(220, 107, 21), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(199, 94, 20), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(161, 78, 16), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(220, 107, 21), 
            [Vector3.new(202, 203, 209, 0)] = Color3.fromRGB(198, 164, 61), 
            [Vector3.new(65, 67, 75, 0)] = Color3.fromRGB(161, 78, 16), 
            [Vector3.new(108, 88, 75, 0)] = Color3.fromRGB(198, 164, 61), 
            Ground = Color3.fromRGB(220, 107, 21)
        }
    }, 
    Radioactive = {
        DisplayText = v1.Radioactive.DisplayText, 
        UseRichText = v1.Radioactive.UseRichText, 
        DisplayWithRichText = v1.Radioactive.DisplayWithRichText, 
        MainColor = v1.Radioactive.MainColor, 
        Palettes = v1.Radioactive.Palettes, 
        Order = 9, 
        ColorOrder = 6, 
        LimitedMutation = 1767470400, 
        IsMutation = true, 
        CompletitionPercent = 0.75, 
        Index = require(script.Index.Radioactive), 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(114, 156, 0), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(156, 227, 50), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(31, 59, 19), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(156, 156, 156), 
            [Vector3.new(202, 203, 209, 0)] = Color3.fromRGB(255, 255, 255), 
            Ground = Color3.fromRGB(114, 156, 0)
        }
    }, 
    Cursed = {
        DisplayText = v1.Cursed.DisplayText, 
        UseRichText = v1.Cursed.UseRichText, 
        DisplayWithRichText = v1.Cursed.DisplayWithRichText, 
        MainColor = v1.Cursed.MainColor, 
        Palettes = v1.Cursed.Palettes, 
        Order = 9, 
        ColorOrder = 6, 
        LimitedMutation = 1771704000, 
        IsMutation = true, 
        CompletitionPercent = 0.75, 
        BaseColors = {}
    }, 
    Aquatic = {
        DisplayText = "Aquatic", 
        UseRichText = true, 
        DisplayWithRichText = "<font color=\"#0096ff\">Aquatic</font>", 
        MainColor = Color3.fromRGB(0, 150, 255), 
        Order = 11, 
        ShowInSettings = false, 
        Index = require(script.Index.Aquatic), 
        LimitedMutation = 1764446400, 
        CustomIndex = {
            Name = "Aquatic"
        }, 
        CountAllMutations = true, 
        CompletitionPercent = 0.9, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(59, 121, 163), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(38, 77, 104), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(21, 35, 65), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(153, 106, 53), 
            [Vector3.new(202, 203, 209, 0)] = Color3.fromRGB(99, 159, 211), 
            Ground = Color3.fromRGB(176, 124, 61)
        }
    }, 
    Christmas = {
        DisplayText = "Christmas", 
        UseRichText = false, 
        DisplayWithRichText = "<font color=\"#ff4343\">Christmas</font>", 
        MainColor = Color3.fromRGB(255, 67, 67), 
        Order = 12, 
        ShowInSettings = false, 
        Index = require(script.Index.Christmas), 
        LimitedMutation = 1767286800, 
        CountAllMutations = true, 
        CompletitionPercent = 0.9, 
        CompletitionForcedAmount = 36, 
        BaseColors = {}
    }, 
    Gingerbread = {
        DisplayText = "Gingerbread", 
        UseRichText = true, 
        DisplayWithRichText = "<font color=\"#ff7327\">Gingerbread</font>", 
        MainColor = Color3.fromRGB(255, 115, 39), 
        Order = 13, 
        ShowInSettings = false, 
        Index = {}, 
        DisableIndex = true, 
        CountAllMutations = false, 
        CompletitionPercent = 1, 
        BaseColors = {}
    }, 
    Skibidi = {
        DisplayText = "Skibidi", 
        UseRichText = false, 
        UseRichTextInSettings = true, 
        DisplayWithRichText = "<stroke thickness=\"2\" transparency=\"0.5\"><font color=\"#ffffff\">Skibidi</font></stroke>", 
        MainColor = Color3.fromRGB(255, 255, 255), 
        Order = 14, 
        ShowInSettings = false, 
        Index = {}, 
        DisableIndex = true, 
        CountAllMutations = false, 
        CompletitionPercent = 1, 
        BaseColors = {}
    }, 
    Meowl = {
        DisplayText = "Meowl", 
        UseRichText = true, 
        DisplayWithRichText = "<font color=\"#ffff14\">Meowl</font>", 
        MainColor = Color3.fromRGB(255, 255, 20), 
        Order = 15, 
        ShowInSettings = false, 
        Index = {}, 
        DisableIndex = true, 
        CountAllMutations = false, 
        CompletitionPercent = 1, 
        BaseColors = {}
    }, 
    Strawberry = {
        DisplayText = "Strawberry", 
        UseRichText = true, 
        DisplayWithRichText = "<font color=\"#cf3b3f\">Strawberry</font>", 
        MainColor = Color3.fromRGB(207, 59, 63), 
        Order = 16, 
        ShowInSettings = false, 
        Index = {}, 
        DisableIndex = true, 
        CountAllMutations = false, 
        CompletitionPercent = 1, 
        BaseColors = {
            [Vector3.new(99, 95, 98, 0)] = Color3.fromRGB(235, 235, 235), 
            [Vector3.new(69, 71, 80, 0)] = Color3.fromRGB(180, 180, 180), 
            [Vector3.new(27, 42, 53, 0)] = Color3.fromRGB(139, 139, 139), 
            [Vector3.new(91, 93, 105, 0)] = Color3.fromRGB(235, 235, 235), 
            [Vector3.new(202, 203, 209, 0)] = Color3.fromRGB(253, 213, 110), 
            Ground = Color3.fromRGB(196, 40, 28)
        }
    }
};