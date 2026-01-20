if script:IsDescendantOf(workspace) then
    local l_Highlight_0 = Instance.new("Highlight");
    l_Highlight_0.Name = "Highlight";
    l_Highlight_0.DepthMode = Enum.HighlightDepthMode.Occluded;
    l_Highlight_0.FillTransparency = 1;
    l_Highlight_0.OutlineColor = Color3.fromRGB(255, 12, 12);
    l_Highlight_0.Parent = script.Parent;
end;