local _ = game:GetService("ReplicatedStorage");
return {
    Dialogs = {
        [1] = {
            Text = "TRA-LA-LA! You smell that? That\226\128\153s the smell of gold melting into chaos!", 
            Sound = "Sounds.Others.Tralala", 
            Duration = 3, 
            Answers = {
                [1] = {
                    Text = "What are you doing here?", 
                    Next = 2
                }, 
                [2] = {
                    Text = "How does this machine work?", 
                    Next = 4
                }, 
                [3] = {
                    Text = "Nevermind", 
                    Next = 5
                }
            }
        }, 
        [2] = {
            Text = "I found this magical hunk of junk while chilling at the bottom of the ocean.", 
            Duration = 3, 
            Next = 3, 
            Wait = 3
        }, 
        [3] = {
            Text = "No idea how it works and i don\226\128\153t care all i know you feed it stolen <font color=\"#FFDE59\">golden</font> brainrots and it shoots a rainbow in the sky.", 
            Duration = 4, 
            Wait = 5
        }, 
        [4] = {
            Text = "Steal golden brainrots from random players and bring them back to me so we can power this thing up!", 
            Duration = 4, 
            Wait = 3
        }, 
        [5] = {
            Text = "Fine.", 
            Duration = 0.2, 
            Wait = 2
        }
    }
};