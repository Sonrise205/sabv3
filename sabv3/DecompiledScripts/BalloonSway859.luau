if not script:IsDescendantOf(workspace) then
    return;
else
    local l_RunService_0 = game:GetService("RunService");
    local l_Parent_0 = script.Parent;
    for _, v3 in ipairs(l_Parent_0:GetDescendants()) do
        if v3.Name == "Balloon" and v3:IsA("BasePart") then
            task.spawn(function() --[[ Line: 10 ]]
                -- upvalues: v3 (copy), l_RunService_0 (copy)
                local v4 = Random.new();
                local l_CFrame_0 = v3.CFrame;
                local v6 = v4:NextNumber(0.4, 0.8);
                local v7 = v4:NextNumber(2, 4);
                local v8 = v4:NextNumber(0.08726646259971647, 0.17453292519943295);
                local v9 = v4:NextNumber(0, 6.283185307179586);
                while v3.Parent do
                    local v10 = os.clock() * v6 + v9;
                    local v11 = math.sin(v10) * v7;
                    local v12 = math.sin(v10) * v8;
                    v3.CFrame = l_CFrame_0 * CFrame.new(0, v11, 0) * CFrame.Angles(v12, 0, v12);
                    l_RunService_0.Heartbeat:Wait();
                end;
            end);
        end;
    end;
    return;
end;