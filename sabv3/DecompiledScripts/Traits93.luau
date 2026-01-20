local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
return {
    Taco = {
        Display = "Taco", 
        DisplayWithRichText = "<font color=\"#FFDE59\">Taco</font>", 
        Icon = "rbxassetid://89041930759464", 
        Color = Color3.fromRGB(255, 222, 89), 
        MultiplierModifier = 2
    }, 
    Nyan = {
        Display = "Nyan", 
        DisplayWithRichText = "<font color=\"#EE59FF\">Nyan</font>", 
        Icon = "rbxassetid://104229924295526", 
        Color = Color3.fromRGB(238, 89, 255), 
        MultiplierModifier = 5
    }, 
    Galactic = {
        Display = "Galactic", 
        DisplayWithRichText = "<font color=\"#7D59FF\">Galactic</font>", 
        Icon = "rbxassetid://99181785766598", 
        Color = Color3.fromRGB(125, 89, 255), 
        MultiplierModifier = 3
    }, 
    Fireworks = {
        Display = "Fireworks", 
        DisplayWithRichText = "<font color=\"#FF2828\">Fireworks</font>", 
        Icon = "rbxassetid://121100427764858", 
        Color = Color3.fromRGB(255, 40, 40), 
        MultiplierModifier = 5
    }, 
    Zombie = {
        Display = "Zombie", 
        DisplayWithRichText = "<font color=\"#4aff47\">Zombie</font>", 
        Icon = "rbxassetid://110723387483939", 
        Color = Color3.fromRGB(74, 255, 71), 
        MultiplierModifier = 4
    }, 
    Claws = {
        Display = "Claws", 
        DisplayWithRichText = "<font color=\"#eb391a\">Crab Claws</font>", 
        Icon = "rbxassetid://104964195846833", 
        Color = Color3.fromRGB(235, 57, 26), 
        MultiplierModifier = 4, 
        Modify = function(v1, _, v3) --[[ Line: 66 ]] --[[ Name: Modify ]]
            v1.Size = v3:GetAttribute("Size") or v1.Size;
        end
    }, 
    Glitched = {
        Display = "Glitched", 
        DisplayWithRichText = "<font color=\"#a75edf\">Glitch</font>", 
        Icon = "rbxassetid://121332433272976", 
        Color = Color3.fromRGB(167, 94, 223), 
        MultiplierModifier = 4
    }, 
    Bubblegum = {
        Display = "Bubblegum", 
        DisplayWithRichText = "<font color=\"#f058fe\">Bubblegum</font>", 
        Icon = "rbxassetid://100601425541874", 
        Color = Color3.fromRGB(240, 88, 254), 
        MultiplierModifier = 3
    }, 
    Fire = {
        Display = "Fire", 
        DisplayWithRichText = "<font color=\"#ffaa00\">Fire</font>", 
        Icon = "rbxassetid://118283346037788", 
        Color = Color3.fromRGB(255, 170, 0), 
        MultiplierModifier = 5
    }, 
    Wet = {
        Display = "Wet", 
        DisplayWithRichText = "<font color=\"#1F85DE\">Wet</font>", 
        Icon = "rbxassetid://78474194088770", 
        Color = Color3.fromRGB(30, 130, 220), 
        MultiplierModifier = 1.5
    }, 
    Snowy = {
        Display = "Snowy", 
        DisplayWithRichText = "<font color=\"#FFFFFF\">Snowy</font>", 
        Icon = "rbxassetid://83627475909869", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 2
    }, 
    Cometstruck = {
        Display = "Comet-struck", 
        DisplayWithRichText = "<font color=\"#ae1fde\">Comet-struck</font>", 
        Icon = "rbxassetid://127455440418221", 
        Color = Color3.fromRGB(175, 30, 220), 
        MultiplierModifier = 2.5
    }, 
    Explosive = {
        Display = "Explosive", 
        DisplayWithRichText = "<font color=\"#ff9d26\">Explosive</font>", 
        Icon = "rbxassetid://97725744252608", 
        Color = Color3.fromRGB(255, 170, 0), 
        MultiplierModifier = 3, 
        ModifyVFX = function(v4) --[[ Line: 125 ]] --[[ Name: ModifyVFX ]]
            -- upvalues: l_ReplicatedStorage_0 (copy)
            require(l_ReplicatedStorage_0.Shared.VFX).emitLoop(v4, 4);
        end
    }, 
    Disco = {
        Display = "Disco", 
        DisplayWithRichText = "<font color=\"#e863ff\">Disco</font>", 
        Icon = "rbxassetid://82620342632406", 
        Color = Color3.fromRGB(232, 99, 255), 
        MultiplierModifier = 4
    }, 
    ["10B"] = {
        Display = "10B", 
        DisplayWithRichText = "<font color=\"#FF2828\">10B</font>", 
        Icon = "rbxassetid://134655415681926", 
        Color = Color3.fromRGB(255, 40, 40), 
        MultiplierModifier = 3
    }, 
    ["Shark Fin"] = {
        Display = "Shark Fin", 
        DisplayWithRichText = "<font color=\"#1F85DE\">Shark Fin</font>", 
        Icon = "rbxassetid://104985313532149", 
        Color = Color3.fromRGB(30, 130, 220), 
        MultiplierModifier = 3
    }, 
    ["Matteo Hat"] = {
        Display = "Matteo Hat", 
        DisplayWithRichText = "<font color=\"#ff961d\">Matteo Hat</font>", 
        Icon = "rbxassetid://115664804212096", 
        Color = Color3.fromRGB(255, 150, 29), 
        MultiplierModifier = 3.5
    }, 
    Brazil = {
        Display = "Brazil", 
        DisplayWithRichText = "<font color=\"#00ff00\">Brazil</font>", 
        Icon = "rbxassetid://75650816341229", 
        Color = Color3.fromRGB(0, 255, 0), 
        MultiplierModifier = 5
    }, 
    Sleepy = {
        Display = "Sleepy", 
        DisplayWithRichText = "<font color=\"#2747ff\">Sleepy</font>", 
        Icon = "rbxassetid://115001117876534", 
        Color = Color3.fromRGB(39, 71, 255), 
        MultiplierModifier = 0
    }, 
    Lightning = {
        Display = "Lightning", 
        DisplayWithRichText = "<font color=\"#2747ff\">Lightning</font>", 
        Icon = "rbxassetid://139729696247144", 
        Color = Color3.fromRGB(0, 229, 255), 
        MultiplierModifier = 5
    }, 
    UFO = {
        Display = "UFO", 
        DisplayWithRichText = "<font color=\"#00ff00\">UFO</font>", 
        Icon = "rbxassetid://110910518481052", 
        Color = Color3.fromRGB(0, 255, 0), 
        MultiplierModifier = 2
    }, 
    Spider = {
        Display = "Spider", 
        DisplayWithRichText = "<font color=\"#fff\">Spider</font>", 
        Icon = "rbxassetid://117478971325696", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 3.5
    }, 
    Strawberry = {
        Display = "Strawberry", 
        DisplayWithRichText = "<font color=\"#ff5e5e\">Strawberry</font>", 
        Icon = "rbxassetid://84731118566493", 
        Color = Color3.fromRGB(255, 94, 94), 
        MultiplierModifier = 7
    }, 
    Paint = {
        Display = "Paint", 
        DisplayWithRichText = "<font color=\"#ffc800\">Paint</font>", 
        Icon = "rbxassetid://119591742504251", 
        Color = Color3.fromRGB(255, 200, 0), 
        MultiplierModifier = 5, 
        ModifyVFX = function(v5, v6) --[[ Line: 217 ]] --[[ Name: ModifyVFX ]]
            v5.Attachment.WorldPosition = v6.Parent:GetPivot().Position;
        end
    }, 
    Skeleton = {
        Display = "Skeleton", 
        DisplayWithRichText = "<font color=\"#fff\">Skeleton</font>", 
        Icon = "rbxassetid://89591838221335", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 3
    }, 
    Sombrero = {
        Display = "Sombrero", 
        DisplayWithRichText = "<font color=\"#fac711\">Sombrero</font>", 
        Icon = "rbxassetid://95128039793845", 
        Color = Color3.fromRGB(250, 199, 17), 
        MultiplierModifier = 4
    }, 
    Tie = {
        Display = "Tie", 
        DisplayWithRichText = "<font color=\"#f00\">Tie</font>", 
        Icon = "rbxassetid://103610037004911", 
        Color = Color3.fromRGB(255, 0, 0), 
        MultiplierModifier = 3.75
    }, 
    ["Witch Hat"] = {
        Display = "Witch Hat", 
        DisplayWithRichText = "<font color=\"#7f51cf\">Witch Hat</font>", 
        Icon = "rbxassetid://123964048606874", 
        Color = Color3.fromRGB(127, 81, 207), 
        MultiplierModifier = 3
    }, 
    Indonesia = {
        Display = "Indonesia", 
        DisplayWithRichText = "<font color=\"#fb3d29\">Indonesia</font>", 
        Icon = "rbxassetid://93350414974589", 
        Color = Color3.fromRGB(251, 61, 41), 
        MultiplierModifier = 4
    }, 
    Meowl = {
        Display = "Meowl", 
        DisplayWithRichText = "<font color=\"#ffffff\">Meowl</font>", 
        Icon = "rbxassetid://114748221761549", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 6
    }, 
    ["RIP Gravestone"] = {
        Display = "RIP Gravestone", 
        DisplayWithRichText = "<font color=\"#ffffff\">RIP Gravestone</font>", 
        Icon = "rbxassetid://123115843719383", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 3.5
    }, 
    ["Jackolantern Pet"] = {
        Display = "Jackolantern Pet", 
        DisplayWithRichText = "<font color=\"#ff9d26\">Jackolantern Pet</font>", 
        Icon = "rbxassetid://97054765273857", 
        Color = Color3.fromRGB(255, 170, 0), 
        MultiplierModifier = 4.5
    }, 
    ["Santa Hat"] = {
        Display = "Santa Hat", 
        DisplayWithRichText = "<font color=\"#ce4d4c\">Santa Hat</font>", 
        Icon = "rbxassetid://88375043733582", 
        Color = Color3.fromRGB(206, 77, 76), 
        MultiplierModifier = 4
    }, 
    ["Reindeer Pet"] = {
        Display = "Reindeer Pet", 
        DisplayWithRichText = "<font color=\"#ffffff\">Reindeer Pet</font>", 
        Icon = "rbxassetid://70894779883038", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 5
    }, 
    Skibidi = {
        Display = "Skibidi", 
        DisplayWithRichText = "<font color=\"#ffffff\">Skibidi</font>", 
        Icon = "rbxassetid://83384385019272", 
        Color = Color3.fromRGB(255, 255, 255), 
        MultiplierModifier = 5.5
    }, 
    ["26"] = {
        Display = "26", 
        DisplayWithRichText = "<font color=\"#ffed2c\">26</font>", 
        Icon = "rbxassetid://80468035315420", 
        Color = Color3.fromRGB(255, 237, 44), 
        MultiplierModifier = 5
    }, 
    Rose = {
        Display = "Rose", 
        DisplayWithRichText = "<font color=\"#d95050\">Rose</font>", 
        Icon = "rbxassetid://135489065859287", 
        Color = Color3.fromRGB(217, 80, 80), 
        MultiplierModifier = 5
    }
};