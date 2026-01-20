local l_Parent_0 = script.Parent;
local v1 = nil;
UpdateIcon = function() --[[ Line: 10 ]] --[[ Name: UpdateIcon ]]
    -- upvalues: v1 (ref), l_Parent_0 (copy)
    if v1 then
        v1.Icon = l_Parent_0.Enabled and "rbxasset://textures/GunCursor.png" or "rbxasset://textures/GunWaitCursor.png";
    end;
end;
OnEquipped = function(v2) --[[ Line: 16 ]] --[[ Name: OnEquipped ]]
    -- upvalues: v1 (ref)
    v1 = v2;
    UpdateIcon();
end;
OnChanged = function(v3) --[[ Line: 21 ]] --[[ Name: OnChanged ]]
    if v3 == "Enabled" then
        UpdateIcon();
    end;
end;
l_Parent_0.Equipped:Connect(OnEquipped);
l_Parent_0.Changed:Connect(OnChanged);