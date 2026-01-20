local l_Text_0 = script.Parent:WaitForChild("Text");
task.spawn(function() --[[ Line: 7 ]]
    -- upvalues: l_Text_0 (copy)
    local v1 = {
        "", 
        ".", 
        "..", 
        "..."
    };
    local v2 = 1;
    while true do
        l_Text_0.Text = "WAITING FOR PLAYER" .. v1[v2];
        v2 = v2 % #v1 + 1;
        task.wait(0.4);
    end;
end);