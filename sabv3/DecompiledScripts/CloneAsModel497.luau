return function(v0, v1) --[[ Line: 1 ]] --[[ Name: cloneAsModel ]]
    local l_Model_0 = Instance.new("Model");
    l_Model_0:ScaleTo(v1);
    local v3 = {};
    for _, v5 in v0 do
        v3[v5] = v5.Parent;
        v5.Parent = l_Model_0;
    end;
    local v6 = l_Model_0:Clone();
    for v7, v8 in v3 do
        v7.Parent = v8;
    end;
    return v6, v6:GetChildren();
end;