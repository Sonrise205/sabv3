local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.Parent.Internal.Network);
local v2 = require(script.Parent.Parent.Parent.Signal);
local v3 = require(script.Parent.Parent.Internal.Utils);
local v4 = require(script.Parent.Parent.Internal.Signals);
local _ = require(script.Parent.Parent.Internal.Types);
local v6 = require(script.Parent.Parent.Parent.Freeze);
local v7 = 0;
local v8 = {};
local v9 = {};
v9.__index = v9;
v9.new = function(v10) --[[ Line: 153 ]] --[[ Name: new ]]
    -- upvalues: v7 (ref), v8 (copy), v2 (copy), v4 (copy), v9 (copy), v1 (copy)
    assert(type(v10.Channel) == "string", (("\"Channel\" expected string, got %*"):format((type(v10.Channel)))));
    assert(v10.ReplicateTo, "ReplicateTo is required!");
    local l_ReplicateTo_0 = v10.ReplicateTo;
    local v12 = nil;
    if v7 + 1 > 65535 or #v8 >= 16 then
        v12 = table.remove(v8, 1);
    else
        v7 = v7 + 1;
        v12 = v7;
    end;
    assert(v12, "No available ID!");
    assert(v12 <= 65535, (("ID limit reached! You already have %* ServerReplions!"):format(65535)));
    local v13 = setmetatable({
        Data = v10.Data, 
        Channel = v10.Channel, 
        Tags = if v10.Tags then v10.Tags else {}, 
        ReplicateTo = l_ReplicateTo_0, 
        DisableAutoDestroy = v10.DisableAutoDestroy, 
        _id = v12, 
        _packedId = utf8.char(v12), 
        _beforeDestroy = v2.new(), 
        _signals = v4.new(), 
        _replicateToChanged = v2.new()
    }, v9);
    v1.sendTo(l_ReplicateTo_0, "Added", v13:_serialize());
    return v13;
end;
v9.__tostring = function(v14) --[[ Line: 191 ]] --[[ Name: __tostring ]]
    local l_Channel_0 = v14.Channel;
    local l_ReplicateTo_1 = v14.ReplicateTo;
    local v17 = nil;
    if type(l_ReplicateTo_1) == "table" then
        local v18 = {};
        for v19, v20 in l_ReplicateTo_1 do
            v18[v19] = v20.Name;
        end;
        v17 = table.concat(v18, ", ");
    else
        v17 = if typeof(l_ReplicateTo_1) == "Instance" then l_ReplicateTo_1.Name else l_ReplicateTo_1;
    end;
    return (("Replion<%*:%*>"):format(l_Channel_0, v17));
end;
v9._serialize = function(v21) --[[ Line: 219 ]] --[[ Name: _serialize ]]
    return {
        v21._packedId, 
        v21.Channel, 
        v21.Data, 
        v21.ReplicateTo, 
        v21.Tags
    };
end;
v9.BeforeDestroy = function(v22, v23) --[[ Line: 233 ]] --[[ Name: BeforeDestroy ]]
    return v22._beforeDestroy:Connect(v23);
end;
v9.OnDataChange = function(v24, v25) --[[ Line: 244 ]] --[[ Name: OnDataChange ]]
    return v24._signals:Connect("onDataChange", "__root", v25);
end;
v9.OnChange = function(v26, v27, v28) --[[ Line: 256 ]] --[[ Name: OnChange ]]
    return v26._signals:Connect("onChange", v27, v28);
end;
v9.OnArrayInsert = function(v29, v30, v31) --[[ Line: 268 ]] --[[ Name: OnArrayInsert ]]
    return v29._signals:Connect("onArrayInsert", v30, v31);
end;
v9.OnArrayRemove = function(v32, v33, v34) --[[ Line: 280 ]] --[[ Name: OnArrayRemove ]]
    return v32._signals:Connect("onArrayRemove", v33, v34);
end;
v9.OnDescendantChange = function(v35, v36, v37) --[[ Line: 292 ]] --[[ Name: OnDescendantChange ]]
    return v35._signals:Connect("onDescendantChange", v36, v37);
end;
v9.SetReplicateTo = function(v38, v39) --[[ Line: 301 ]] --[[ Name: SetReplicateTo ]]
    -- upvalues: l_Players_0 (copy), v1 (copy)
    local v40 = true;
    if v39 ~= "All" then
        v40 = true;
        if type(v39) ~= "table" then
            v40 = false;
            if typeof(v39) == "Instance" then
                v40 = v39:IsA("Player");
            end;
        end;
    end;
    assert(v40, "ReplicateTo must be a Player, a table of Players or \"All\"");
    local l_ReplicateTo_2 = v38.ReplicateTo;
    if l_ReplicateTo_2 == v39 then
        return;
    else
        v40 = if l_ReplicateTo_2 == "All" then l_Players_0:GetPlayers() else if type(l_ReplicateTo_2) == "table" then l_ReplicateTo_2 else {
            l_ReplicateTo_2
        };
        local v42 = if v39 == "All" then l_Players_0:GetPlayers() else if type(v39) == "table" then v39 else {
            v39
        };
        for _, v44 in v40 do
            if not table.find(v42, v44) then
                v1.sendTo(v44, "Removed", v38._packedId);
            end;
        end;
        for _, v46 in v42 do
            if not table.find(v40, v46) then
                v1.sendTo(v46, "Added", v38:_serialize());
            end;
        end;
        v38.ReplicateTo = v39;
        v38._replicateToChanged:Fire(v39, l_ReplicateTo_2);
        v1.sendTo(v39, "UpdateReplicateTo", v38._packedId, v39);
        return;
    end;
end;
v9.Set = function(v47, v48, v49) --[[ Line: 361 ]] --[[ Name: Set ]]
    -- upvalues: v3 (copy), v6 (copy), v1 (copy)
    local v50 = v3.getPathTable(v48);
    local v51 = v6.Dictionary.getIn(v47.Data, v50);
    if v51 and v6.Dictionary.equals(v51, v49) then
        if _G.__DEV__ and type(v51) == "table" and v51 == v49 then
            local v52, v53 = debug.info(2, "sl");
            local v54 = v3.getPathString(v48);
            warn(("Warning: Skipping Replion:Set('%*') due to identical table references.\n"):format(v54) .. ("Consider using Replion:Update('%*') at %*:%* instead."):format(v54, v52, v53));
        end;
        return v51;
    else
        if _G.__DEV__ and type(v51) == "table" and type(v49) == "table" then
            local v55 = v6.Dictionary.keys(v51);
            local v56 = v6.Dictionary.keys(v49);
            if v6.List.equals(v55, v56) then
                local v57, v58 = debug.info(2, "sl");
                local v59 = v3.getPathString(v48);
                local v62 = v6.Dictionary.filter(v49, function(v60, v61) --[[ Line: 390 ]]
                    -- upvalues: v6 (ref), v51 (copy)
                    return not v6.Dictionary.equals(v51[v61], v60);
                end);
                if v6.Dictionary.count(v62) ~= v6.Dictionary.count(v49) then
                    local v63 = "";
                    for v64, v65 in v62 do
                        v63 = v63 .. ("\n\t%* = %*,"):format(v64, v65);
                    end;
                    warn("Warning: Sending a table with identical keys but different values to the client.\n" .. ("Consider using Replion:Update('%*', {%*\n}) at %*:%* for optimized updates."):format(v59, v63, v57, v58));
                end;
            end;
        end;
        local v66 = v6.Dictionary.setIn(v47.Data, v50, v49);
        local l_Data_0 = v47.Data;
        v47.Data = v66;
        v47._signals:FireEvent("onDataChange", "__root", v66, v50);
        v47._signals:FireChange(v48, v66, l_Data_0);
        v1.sendTo(v47.ReplicateTo, "Set", v47._packedId, v48, v49);
        return v49;
    end;
end;
v9.Update = function(v68, v69, v70) --[[ Line: 452 ]] --[[ Name: Update ]]
    -- upvalues: v3 (copy), v6 (copy), v1 (copy)
    local v71 = if v70 then v3.getPathTable(v69) else nil;
    local v72 = if v71 then v6.Dictionary.getIn(v68.Data, v71) else v68.Data;
    local v75 = v6.Dictionary.filter(v70 or v69, function(v73, v74) --[[ Line: 456 ]]
        -- upvalues: v72 (copy), v6 (ref)
        if not v72 then
            return true;
        else
            return not v6.Dictionary.equals(v72[v74], v73);
        end;
    end);
    if v6.isEmpty(v75) then
        return;
    else
        local l_Data_1 = v68.Data;
        if not v71 then
            local v77 = v6.Dictionary.merge(v68.Data, v75);
            v68.Data = v77;
            v68._signals:FireEvent("onDataChange", "__root", v77, {});
            for v78, v79 in v75 do
                v68._signals:FireEvent("onChange", v78, v3.getValue(v79), l_Data_1[v78]);
            end;
        else
            local v80 = v6.Dictionary.mergeIn(v68.Data, v71, v75);
            v68.Data = v80;
            v68._signals:FireEvent("onDataChange", "__root", v80, v71);
            for v81, v82 in v75 do
                local v83 = v6.List.push(v71, v81);
                local v84 = v6.Dictionary.getIn(l_Data_1, v83);
                v68._signals:FireEvent("onChange", v83, v3.getValue(v82), v84);
            end;
            v68._signals:FireChange(v69, v80, l_Data_1);
        end;
        local v85 = table.maxn(v75);
        local v86 = nil;
        if v85 > 0 then
            local v87 = 0;
            for v88 in v75 do
                v87 = v87 + 1;
                if v88 ~= v87 then
                    v86 = true;
                    break;
                end;
            end;
            v86 = v86 or v87 ~= v85;
            if _G.__DEV__ and v86 then
                local v89, v90 = debug.info(2, "sl");
                warn("Warning: You're trying to send an unordered array to the client, RemotesEvents can't send unordered arrays.\n" .. "The array will be transformed into a dictionary to be sent to the client.\n" .. ("at %*:%*"):format(v89, v90));
            end;
        end;
        local v94 = v6.Dictionary.map(v75, function(v91, v92) --[[ Line: 526 ]]
            -- upvalues: v6 (ref), v3 (ref), v86 (ref)
            local v93 = if v91 == v6.None then v3.SerializedNone else v91;
            if v86 then
                return v93, (tostring(v92));
            else
                return v93, v92;
            end;
        end);
        if not v71 then
            v1.sendTo(v68.ReplicateTo, "Update", v68._packedId, v94, nil, v86);
        else
            v1.sendTo(v68.ReplicateTo, "Update", v68._packedId, v69, v94, v86);
        end;
        return;
    end;
end;
v9.Increase = function(v95, v96, v97) --[[ Line: 547 ]] --[[ Name: Increase ]]
    -- upvalues: v3 (copy)
    assert(type(v97) == "number", (("\"amount\" expected number, got %*"):format((type(v97)))));
    local l_v95_Expect_0 = v95:GetExpect(v96, (("\"%*\" is not a valid path!"):format((v3.getPathString(v96)))));
    if v97 == 0 then
        return l_v95_Expect_0;
    elseif _G.__DEV__ and type(l_v95_Expect_0) ~= "number" then
        local v99, v100 = debug.info(2, "sl");
        warn(("Warning: Attempt to increase non-numeric value at \"%*\"\n"):format((v3.getPathString(v96))) .. ("Check if the path is correct at %*:%*."):format(v99, v100));
        return l_v95_Expect_0;
    else
        return v95:Set(v96, l_v95_Expect_0 + v97);
    end;
end;
v9.Decrease = function(v101, v102, v103) --[[ Line: 579 ]] --[[ Name: Decrease ]]
    return v101:Increase(v102, -v103);
end;
v9.Insert = function(v104, v105, v106, v107) --[[ Line: 609 ]] --[[ Name: Insert ]]
    -- upvalues: v3 (copy), v6 (copy), v1 (copy)
    local v108 = v3.getPathTable(v105);
    local l_v104_Expect_0 = v104:GetExpect(v105, (("\"%*\" is not a valid path!"):format((v3.getPathString(v105)))));
    local v110 = v107 or #l_v104_Expect_0 + 1;
    local v111 = v6.List.insert(l_v104_Expect_0, v110, v106);
    local l_Data_2 = v104.Data;
    local v113 = v6.Dictionary.setIn(v104.Data, v108, v111);
    v104.Data = v113;
    v104._signals:FireEvent("onDataChange", "__root", v113, v108);
    v104._signals:FireEvent("onArrayInsert", v108, v110, v106);
    v104._signals:FireChange(v108, v113, l_Data_2);
    v1.sendTo(v104.ReplicateTo, "ArrayUpdate", v104._packedId, "i", v105, v106, v107);
end;
v9.Remove = function(v114, v115, v116) --[[ Line: 655 ]] --[[ Name: Remove ]]
    -- upvalues: v3 (copy), v6 (copy), v1 (copy)
    local v117 = v3.getPathTable(v115);
    local l_v114_Expect_0 = v114:GetExpect(v115, (("\"%*\" is not a valid path!"):format((v3.getPathString(v115)))));
    local v119 = v116 or #l_v114_Expect_0;
    local v120 = l_v114_Expect_0[v119];
    local v121 = v6.List.remove(l_v114_Expect_0, v119);
    local l_Data_3 = v114.Data;
    local v123 = v6.Dictionary.setIn(v114.Data, v117, v121);
    v114.Data = v123;
    v114._signals:FireEvent("onDataChange", "__root", v123, v117);
    v114._signals:FireEvent("onArrayRemove", v115, v119, v120);
    v114._signals:FireChange(v115, v123, l_Data_3);
    v1.sendTo(v114.ReplicateTo, "ArrayUpdate", v114._packedId, "r", v115, v116);
    return v120;
end;
v9.Clear = function(v124, v125) --[[ Line: 703 ]] --[[ Name: Clear ]]
    -- upvalues: v3 (copy), v6 (copy), v1 (copy)
    local l_v124_Expect_0 = v124:GetExpect(v125, (("\"%*\" is not a valid path!"):format((v3.getPathString(v125)))));
    if v6.isEmpty(l_v124_Expect_0) then
        return;
    else
        local v127 = v3.getPathTable(v125);
        local l_Data_4 = v124.Data;
        local v129 = v6.Dictionary.setIn(v124.Data, v127, {});
        v124.Data = v129;
        v124._signals:FireEvent("onDataChange", "__root", v129, v127);
        v124._signals:FireChange(v125, v129, l_Data_4);
        v1.sendTo(v124.ReplicateTo, "ArrayUpdate", v124._packedId, "c", v125);
        return;
    end;
end;
v9.Find = function(v130, v131, v132) --[[ Line: 747 ]] --[[ Name: Find ]]
    local v133 = v130:Get(v131);
    if not v133 then
        return;
    else
        local v134 = table.find(v133, v132);
        if not v134 then
            return;
        else
            return v134, v132;
        end;
    end;
end;
v9.Get = function(v135, v136) --[[ Line: 770 ]] --[[ Name: Get ]]
    -- upvalues: v6 (copy), v3 (copy)
    assert(v136, "Path is required!");
    local v137 = v6.Dictionary.getIn(v135.Data, v3.getPathTable(v136));
    if _G.__DEV__ and v137 == nil then
        local v138 = v3.getPathTable(v136);
        for v139, v140 in v138 do
            if type(v140) == "string" then
                local v141 = v3.trimString(v140);
                if v141 ~= v140 then
                    local v142 = v6.List.set(v138, v139, v141);
                    if v6.Dictionary.getIn(v135.Data, v142) then
                        local v143, v144 = debug.info(2, "sl");
                        warn(("Warning: the path \"%*\" has a key with leading or trailing whitespaces.\n"):format((v3.getPathString(v136))) .. ("This is likely a mistake, consider using \"%*\" at %*:%* instead."):format(v3.getPathString(v142), v143, v144));
                    end;
                end;
            end;
        end;
    end;
    return v137;
end;
v9.GetExpect = function(v145, v146, v147) --[[ Line: 818 ]] --[[ Name: GetExpect ]]
    -- upvalues: v3 (copy)
    assert(v146, "Path is required!");
    if not v147 then
        v147 = ("\"%*\" is not a valid path!"):format((v3.getPathString(v146)));
    end;
    local v148 = v145:Get(v146);
    if v148 == nil then
        error(v147);
    end;
    return v148;
end;
v9.Destroy = function(v149) --[[ Line: 835 ]] --[[ Name: Destroy ]]
    -- upvalues: v1 (copy), v8 (copy)
    if v149.Destroyed then
        return;
    else
        v149._beforeDestroy:Fire();
        v149._beforeDestroy:DisconnectAll();
        v149._replicateToChanged:Destroy();
        v149._signals:Destroy();
        v149.Destroyed = true;
        v1.sendTo(v149.ReplicateTo, "Removed", v149._packedId);
        table.insert(v8, v149._id);
        return;
    end;
end;
return v9;