--!native
local function v1(v0) --[[ Line: 107 ]] --[[ Name: ErrorHandler ]]
    warn((("%*\nStack Begin\n%*Stack End"):format(tostring(v0), (debug.traceback(nil, 3)))));
end;
local function v3(v2, ...) --[[ Line: 111 ]] --[[ Name: WCall ]]
    -- upvalues: v1 (copy)
    return xpcall(v2, v1, ...);
end;
local function v11(v4, v5) --[[ Line: 122 ]] --[[ Name: FindRight ]]
    local v6 = false;
    local v7 = 1;
    local v8 = #v4;
    while v7 <= v8 do
        local v9 = v7 + (v8 - v7) // 2;
        local v10 = v4[v9].Pr - v5.Pr;
        if v10 > 0 then
            v8 = v9 - 1;
        elseif v10 < 0 then
            v7 = v9 + 1;
        else
            v6 = true;
            v7 = v9 + 1;
        end;
    end;
    return v6 and v7 or -v7;
end;
local function v19(v12, v13) --[[ Line: 149 ]] --[[ Name: FindLeft ]]
    local v14 = false;
    local v15 = 1;
    local v16 = #v12;
    while v15 <= v16 do
        local v17 = v15 + (v16 - v15) // 2;
        local v18 = v12[v17].Pr - v13.Pr;
        if v18 > 0 then
            v16 = v17 - 1;
        elseif v18 < 0 then
            v15 = v17 + 1;
        else
            v14 = true;
            v16 = v17 - 1;
        end;
    end;
    return v14 and v15 or -v15;
end;
local function _(v20, v21) --[[ Line: 175 ]] --[[ Name: InsertRight ]]
    -- upvalues: v11 (copy)
    local v22 = math.abs((v11(v20, v21)));
    table.insert(v20, v22, v21);
    return v22;
end;
local function v28(v24, v25) --[[ Line: 188 ]] --[[ Name: Remove ]]
    -- upvalues: v19 (copy)
    local v26 = v19(v24, v25);
    if v26 > 0 then
        for v27 = v26, #v24 do
            if v24[v27] == v25 then
                table.remove(v24, v27);
                return true;
            end;
        end;
    end;
    return false;
end;
local function v30(v29) --[[ Line: 205 ]] --[[ Name: Connection_IsConnected ]]
    return v29.Ow ~= nil;
end;
local function v35(v31) --[[ Line: 209 ]] --[[ Name: Connection_Disconnect ]]
    -- upvalues: v28 (copy)
    local l_Ow_0 = v31.Ow;
    if l_Ow_0 ~= nil then
        v31.Ow = nil;
        if not v28(l_Ow_0.Cs, v31) then
            warn("BindableConnectionDisconnect");
        end;
        for _, v34 in ipairs(v31.Wt) do
            task.spawn(v34);
        end;
        table.clear(v31.Wt);
    end;
end;
local v37 = table.freeze({
    IsConnected = v30, 
    Disconnect = v35, 
    GetPriority = function(v36) --[[ Line: 223 ]] --[[ Name: Connection_GetPriority ]]
        return v36.Pr;
    end
});
local v38 = table.freeze({
    __index = v37
});
local function _(v39, v40, v41) --[[ Line: 235 ]] --[[ Name: Connection_new ]]
    -- upvalues: v38 (copy)
    return (setmetatable({
        Ow = v39, 
        Cb = v40, 
        Pr = v41, 
        Wt = {}
    }, v38));
end;
local function v45(v43) --[[ Line: 249 ]] --[[ Name: Connection_IsA ]]
    -- upvalues: v38 (copy)
    local v44 = false;
    if type(v43) == "table" then
        v44 = getmetatable(v43) == v38;
    end;
    return v44;
end;
local function v48(v46) --[[ Line: 253 ]] --[[ Name: Connection_Assert ]]
    -- upvalues: v38 (copy)
    local v47 = false;
    if type(v46) == "table" then
        v47 = getmetatable(v46) == v38;
    end;
    if not v47 then
        error("Connection", 2);
    end;
    return v46;
end;
local v93 = table.freeze({
    Fire = function(v49, ...) --[[ Line: 278 ]] --[[ Name: Bindable_Fire ]]
        local l_Cs_0 = v49.Cs;
        local v51 = 1;
        while v51 <= #l_Cs_0 do
            local v52 = l_Cs_0[v51];
            task.spawn(v52.Cb, ...);
            if l_Cs_0[v51] == v52 then
                v51 = v51 + 1;
            end;
        end;
    end, 
    FireAndWait = function(v53, ...) --[[ Line: 292 ]] --[[ Name: Bindable_FireAndWait ]]
        -- upvalues: v3 (copy)
        local l_Cs_1 = v53.Cs;
        if #l_Cs_1 == 0 then
            return;
        else
            local v55 = 1;
            local v56 = coroutine.running();
            local function v58(v57, ...) --[[ Line: 299 ]] --[[ Name: executor ]]
                -- upvalues: v3 (ref), v55 (ref), v56 (copy)
                v3(v57, ...);
                v55 = v55 - 1;
                if v55 == 0 then
                    task.spawn(v56);
                end;
            end;
            local v59 = 1;
            while v59 <= #l_Cs_1 do
                local v60 = l_Cs_1[v59];
                v55 = v55 + 1;
                task.spawn(v58, v60.Cb, ...);
                if l_Cs_1[v59] == v60 then
                    v59 = v59 + 1;
                end;
            end;
            v55 = v55 - 1;
            if v55 > 0 then
                coroutine.yield();
            end;
            return;
        end;
    end, 
    FireSync = function(v61, ...) --[[ Line: 321 ]] --[[ Name: Bindable_FireSync ]]
        -- upvalues: v3 (copy)
        local l_Cs_2 = v61.Cs;
        local v63 = 1;
        while v63 <= #l_Cs_2 do
            local v64 = l_Cs_2[v63];
            v3(v64.Cb, ...);
            if l_Cs_2[v63] == v64 then
                v63 = v63 + 1;
            end;
        end;
    end, 
    Invoke = function(v65, ...) --[[ Line: 333 ]] --[[ Name: Bindable_Invoke ]]
        local l_Cs_3 = v65.Cs;
        if #l_Cs_3 >= 1 then
            return l_Cs_3[1].Cb(...);
        else
            error("Invoke");
            return;
        end;
    end, 
    Connect = function(v67, v68, v69) --[[ Line: 261 ]] --[[ Name: Bindable_Connect ]]
        -- upvalues: v38 (copy), v11 (copy)
        local v70 = true;
        if v69 ~= nil then
            v70 = false;
            if type(v69) == "number" then
                v70 = v69 == v69;
            end;
        end;
        assert(v70);
        local v71 = v69 or 1e999;
        v70 = setmetatable({
            Ow = v67, 
            Cb = v68, 
            Pr = v71, 
            Wt = {}
        }, v38);
        if v71 == 1e999 then
            table.insert(v67.Cs, v70);
            return v70;
        else
            local l_Cs_4 = v67.Cs;
            table.insert(l_Cs_4, math.abs((v11(l_Cs_4, v70))), v70);
            return v70;
        end;
    end, 
    Wait = function(v73) --[[ Line: 344 ]] --[[ Name: Bindable_Wait ]]
        -- upvalues: v35 (copy), v38 (copy)
        local v74 = coroutine.running();
        local v75 = true;
        local v76 = nil;
        local function v78(...) --[[ Line: 348 ]]
            -- upvalues: v76 (ref), v74 (copy), v75 (ref), v35 (ref)
            local v77 = table.find(v76.Wt, v74);
            if v77 then
                table.remove(v76.Wt, v77);
            end;
            v75 = false;
            v35(v76);
            task.spawn(v74, ...);
        end;
        assert(true);
        local v79 = setmetatable({
            Ow = v73, 
            Cb = v78, 
            Pr = 1e999, 
            Wt = {}
        }, v38);
        table.insert(v73.Cs, v79);
        v76 = v79;
        table.insert(v76.Wt, v74);
        v78 = table.pack(coroutine.yield());
        if v75 then
            error("Disconnected");
        end;
        return table.unpack(v78);
    end, 
    Once = function(v80, v81, v82) --[[ Line: 365 ]] --[[ Name: Bindable_Once ]]
        -- upvalues: v35 (copy), v38 (copy), v11 (copy)
        local v83 = nil;
        local function v84(...) --[[ Line: 371 ]]
            -- upvalues: v35 (ref), v83 (ref), v81 (copy)
            v35(v83);
            return v81(...);
        end;
        local v85 = true;
        if v82 ~= nil then
            v85 = false;
            if type(v82) == "number" then
                v85 = v82 == v82;
            end;
        end;
        assert(v85);
        local v86 = v82 or 1e999;
        v85 = setmetatable({
            Ow = v80, 
            Cb = v84, 
            Pr = v86, 
            Wt = {}
        }, v38);
        if v86 == 1e999 then
            table.insert(v80.Cs, v85);
        else
            local l_Cs_5 = v80.Cs;
            table.insert(l_Cs_5, math.abs((v11(l_Cs_5, v85))), v85);
        end;
        v83 = v85;
        return v83;
    end, 
    DisconnectAll = function(v88) --[[ Line: 378 ]] --[[ Name: Bindable_DisconnectAll ]]
        -- upvalues: v35 (copy)
        local l_Cs_6 = v88.Cs;
        for v90 = #l_Cs_6, 1, -1 do
            v35(l_Cs_6[v90]);
        end;
    end, 
    GetSize = function(v91) --[[ Line: 385 ]] --[[ Name: Bindable_GetSize ]]
        return #v91.Cs;
    end, 
    IsEmpty = function(v92) --[[ Line: 389 ]] --[[ Name: Bindable_IsEmpty ]]
        return #v92.Cs == 0;
    end
});
local v94 = table.freeze({
    __index = v93
});
return table.freeze({
    new = function(_) --[[ Line: 408 ]] --[[ Name: new ]]
        -- upvalues: v94 (copy)
        local v96 = {
            Cs = {}
        };
        return (table.freeze((setmetatable(v96, v94))));
    end, 
    IsA = function(v97) --[[ Line: 421 ]] --[[ Name: IsA ]]
        -- upvalues: v94 (copy)
        local v98 = false;
        if type(v97) == "table" then
            v98 = getmetatable(v97) == v94;
        end;
        return v98;
    end, 
    Assert = function(v99) --[[ Line: 425 ]] --[[ Name: Assert ]]
        -- upvalues: v94 (copy)
        local v100 = false;
        if type(v99) == "table" then
            v100 = getmetatable(v99) == v94;
        end;
        if not v100 then
            error("Bindable", 2);
        end;
        return v99;
    end, 
    IsAConnection = v45, 
    AssertConnection = v48
});