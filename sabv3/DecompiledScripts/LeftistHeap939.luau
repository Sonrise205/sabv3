--!native
_merge1 = function(v0, v1, v2) --[[ Line: 96 ]] --[[ Name: _merge1 ]]
    if v1.Left then
        v1.Right = _merge(v0, v1.Right, v2);
        if v1.Left.Npl < v1.Right.Npl then
            local l_Right_0 = v1.Right;
            local l_Left_0 = v1.Left;
            v1.Left = l_Right_0;
            v1.Right = l_Left_0;
        end;
        v1.Npl = v1.Right.Npl + 1;
        return v1;
    else
        v1.Left = v2;
        return v1;
    end;
end;
_merge = function(v5, v6, v7) --[[ Line: 119 ]] --[[ Name: _merge ]]
    if v6 then
        if v7 then
            if v5(v6.Value, v7.Value) < 0 then
                return _merge1(v5, v6, v7);
            else
                return _merge1(v5, v7, v6);
            end;
        else
            return v6;
        end;
    else
        return v7;
    end;
end;
local v8 = {};
local v9 = table.freeze({
    __index = v8
});
v8.Merge = function(v10, v11) --[[ Line: 142 ]] --[[ Name: Merge ]]
    if v10.Root ~= v11.Root then
        v10.Root = _merge(v10.Comparator, v10.Root, v11.Root);
        v11.Root = nil;
    end;
end;
v8.Insert = function(v12, v13) --[[ Line: 149 ]] --[[ Name: Insert ]]
    v12.Root = _merge(v12.Comparator, {
        Value = v13, 
        Npl = 0
    }, v12.Root);
end;
v8.Min = function(v14) --[[ Line: 156 ]] --[[ Name: Min ]]
    assert(v14.Root);
    return v14.Root.Value;
end;
v8.TryMin = function(v15) --[[ Line: 161 ]] --[[ Name: TryMin ]]
    if v15.Root then
        return true, v15.Root.Value;
    else
        return false, nil;
    end;
end;
v8.Pop = function(v16) --[[ Line: 168 ]] --[[ Name: Pop ]]
    assert(v16.Root);
    local l_Value_0 = v16.Root.Value;
    v16.Root = _merge(v16.Comparator, v16.Root.Left, v16.Root.Right);
    return l_Value_0;
end;
v8.TryPop = function(v18) --[[ Line: 175 ]] --[[ Name: TryPop ]]
    if v18.Root then
        local l_Value_1 = v18.Root.Value;
        v18.Root = _merge(v18.Comparator, v18.Root.Left, v18.Root.Right);
        return true, l_Value_1;
    else
        return false, nil;
    end;
end;
v8.PopFast = function(v20) --[[ Line: 184 ]] --[[ Name: PopFast ]]
    v20.Root = _merge(v20.Comparator, v20.Root.Left, v20.Root.Right);
end;
v8.Empty = function(v21) --[[ Line: 192 ]] --[[ Name: Empty ]]
    return v21.Root == nil;
end;
v8.Clear = function(v22) --[[ Line: 196 ]] --[[ Name: Clear ]]
    v22.Root = nil;
end;
table.freeze(v8);
local v27 = {
    Compare = function(v23, v24) --[[ Line: 205 ]] --[[ Name: Compare ]]
        if v23 < v24 then
            return -1;
        elseif v24 < v23 then
            return 1;
        else
            return 0;
        end;
    end, 
    new = function(v25, _) --[[ Line: 211 ]] --[[ Name: new ]]
        -- upvalues: v9 (copy)
        assert(type(v25) == "function");
        return (setmetatable({
            Comparator = v25
        }, v9));
    end
};
return table.freeze(v27);