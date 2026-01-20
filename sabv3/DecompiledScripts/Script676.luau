local v0 = game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(3, Enum.EasingStyle.Linear), {
    Position = UDim2.new(0.5, 64, 0.5, 0)
});
while true do
    script.Parent.Position = UDim2.new(0.5, 0, 0.5, 0);
    v0:Play();
    v0.Completed:Wait();
end;