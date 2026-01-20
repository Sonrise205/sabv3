--!native
return function(v0, v1, v2) --[[ Line: 20 ]] --[[ Name: PlaySFX ]]
    local l_Attachment_0 = Instance.new("Attachment");
    l_Attachment_0.CFrame = v0.CFrame:ToObjectSpace(v1);
    v2.Parent = l_Attachment_0;
    l_Attachment_0.Parent = v0;
    v2.Ended:Connect(function() --[[ Line: 25 ]]
        -- upvalues: l_Attachment_0 (copy)
        l_Attachment_0:Destroy();
    end);
    v2:Play();
end;