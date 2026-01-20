local v0 = require(script.Parent.Parent.Parent.Freeze);
local v1 = require(script.Parent.Parent.Internal.Utils);
local v2 = require(script.Parent.Parent.Parent.Signal);
local _ = require(script.Parent.Parent.Internal.Types);
local v4 = require(script.Parent.Parent.Internal.Signals);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 99 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v4 (copy), v5 (copy)
    return (setmetatable({
        Data = v6[3], 
        Tags = v6[5], 
        ReplicateTo = v6[4], 
        _channel = v6[2], 
        _beforeDestroy = v2.new(), 
        _signals = v4.new()
    }, v5));
end;
v5.__tostring = function(v7) --[[ Line: 114 ]] --[[ Name: __tostring ]]
    return (("Replion<%*>"):format(v7._channel));
end;
v5.BeforeDestroy = function(v8, v9) --[[ Line: 125 ]] --[[ Name: BeforeDestroy ]]
    return v8._beforeDestroy:Connect(v9);
end;
v5.OnDataChange = function(v10, v11) --[[ Line: 136 ]] --[[ Name: OnDataChange ]]
    return v10._signals:Connect("onDataChange", "__root", v11);
end;
v5.OnChange = function(v12, v13, v14) --[[ Line: 154 ]] --[[ Name: OnChange ]]
    return v12._signals:Connect("onChange", v13, v14);
end;
v5.OnDescendantChange = function(v15, v16, v17) --[[ Line: 177 ]] --[[ Name: OnDescendantChange ]]
    return v15._signals:Connect("onDescendantChange", v16, v17);
end;
v5.OnArrayInsert = function(v18, v19, v20) --[[ Line: 189 ]] --[[ Name: OnArrayInsert ]]
    return v18._signals:Connect("onArrayInsert", v19, v20);
end;
v5.OnArrayRemove = function(v21, v22, v23) --[[ Line: 201 ]] --[[ Name: OnArrayRemove ]]
    return v21._signals:Connect("onArrayRemove", v22, v23);
end;
v5._set = function(v24, v25, v26) --[[ Line: 205 ]] --[[ Name: _set ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v27 = v1.getPathTable(v25);
    if v0.Dictionary.getIn(v24.Data, v27) == v26 then
        return v26;
    else
        local v28 = v0.Dictionary.setIn(v24.Data, v27, v26);
        local l_Data_0 = v24.Data;
        v24.Data = v28;
        v24._signals:FireEvent("onDataChange", "__root", v28, v27);
        v24._signals:FireChange(v25, v28, l_Data_0);
        return v26;
    end;
end;
v5._update = function(v30, v31, v32, v33) --[[ Line: 224 ]] --[[ Name: _update ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v37 = v0.Dictionary.map(v32 or v31, function(v34, v35) --[[ Line: 225 ]]
        -- upvalues: v1 (ref), v0 (ref), v33 (copy)
        local v36 = if v34 == v1.SerializedNone then v0.None else v34;
        if v33 then
            return v36, (tonumber(v35));
        else
            return v36, v35;
        end;
    end);
    local l_Data_1 = v30.Data;
    if v32 == nil then
        local v39 = v0.Dictionary.merge(v30.Data, v37);
        v30.Data = v39;
        v30._signals:FireEvent("onDataChange", "__root", v39, {});
        for v40, v41 in v37 do
            v30._signals:FireEvent("onChange", v40, v1.getValue(v41), l_Data_1[v40]);
        end;
        return;
    else
        local v42 = v1.getPathTable(v31);
        local v43 = v0.Dictionary.mergeIn(v30.Data, v42, v37);
        v30.Data = v43;
        v30._signals:FireEvent("onDataChange", "__root", v43, v42);
        for v44, v45 in v37 do
            local v46 = v0.List.push(v42, v44);
            local v47 = v0.Dictionary.getIn(l_Data_1, v46);
            v30._signals:FireEvent("onChange", v46, v1.getValue(v45), v47);
        end;
        v30._signals:FireChange(v31, v43, l_Data_1);
        return;
    end;
end;
v5._increase = function(v48, v49, v50) --[[ Line: 260 ]] --[[ Name: _increase ]]
    return v48:_set(v49, v48:GetExpect(v49) + v50);
end;
v5._decrease = function(v51, v52, v53) --[[ Line: 266 ]] --[[ Name: _decrease ]]
    return v51:_increase(v52, -v53);
end;
v5._insert = function(v54, v55, v56, v57) --[[ Line: 270 ]] --[[ Name: _insert ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v58 = v1.getPathTable(v55);
    local v59 = assert(v0.Dictionary.getIn(v54.Data, v58), (("\"%*\" is not a valid path!"):format((v1.getPathString(v55)))));
    local v60 = v57 or #v59 + 1;
    local v61 = v0.List.insert(v59, v60, v56);
    local l_Data_2 = v54.Data;
    local v63 = v0.Dictionary.setIn(v54.Data, v58, v61);
    v54.Data = v63;
    v54._signals:FireEvent("onDataChange", "__root", v63, v58);
    v54._signals:FireEvent("onArrayInsert", v58, v60, v56);
    v54._signals:FireChange(v58, v63, l_Data_2);
end;
v5._remove = function(v64, v65, v66) --[[ Line: 289 ]] --[[ Name: _remove ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v67 = v1.getPathTable(v65);
    local v68 = assert(v0.Dictionary.getIn(v64.Data, v67), (("\"%*\" is not a valid path!"):format((v1.getPathString(v65)))));
    local v69 = v66 or #v68;
    local v70 = v68[v69];
    local v71 = v0.List.remove(v68, v69);
    local l_Data_3 = v64.Data;
    local v73 = v0.Dictionary.setIn(v64.Data, v67, v71);
    v64.Data = v73;
    v64._signals:FireEvent("onDataChange", "__root", v73, v67);
    v64._signals:FireEvent("onArrayRemove", v65, v69, v70);
    v64._signals:FireChange(v65, v73, l_Data_3);
    return v70;
end;
v5._clear = function(v74, v75) --[[ Line: 311 ]] --[[ Name: _clear ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v76 = v1.getPathTable(v75);
    local l_Data_4 = v74.Data;
    local v78 = v0.Dictionary.setIn(v74.Data, v76, {});
    v74.Data = v78;
    v74._signals:FireEvent("onDataChange", "__root", v78, v76);
    v74._signals:FireChange(v75, v78, l_Data_4);
end;
v5.Find = function(v79, v80, v81) --[[ Line: 336 ]] --[[ Name: Find ]]
    local v82 = v79:Get(v80);
    if not v82 then
        return;
    else
        local v83 = table.find(v82, v81);
        if not v83 then
            return;
        else
            return v83, v81;
        end;
    end;
end;
v5.Get = function(v84, v85) --[[ Line: 360 ]] --[[ Name: Get ]]
    -- upvalues: v0 (copy), v1 (copy)
    return v0.Dictionary.getIn(v84.Data, v1.getPathTable(v85));
end;
v5.GetExpect = function(v86, v87, v88) --[[ Line: 378 ]] --[[ Name: GetExpect ]]
    -- upvalues: v1 (copy)
    assert(v87, "Path is required!");
    if not v88 then
        v88 = ("\"%*\" is not a valid path!"):format((v1.getPathString(v87)));
    end;
    local v89 = v86:Get(v87);
    if v89 == nil then
        error(v88);
    end;
    return v89;
end;
v5.Destroy = function(v90) --[[ Line: 391 ]] --[[ Name: Destroy ]]
    if v90.Destroyed then
        return;
    else
        v90._beforeDestroy:Fire();
        v90._beforeDestroy:DisconnectAll();
        v90._signals:Destroy();
        v90.Destroyed = true;
        return;
    end;
end;
return v5;