local l_RunService_0 = game:GetService("RunService");
local v1 = newproxy();
local v2 = newproxy();
local v3 = table.freeze({
    "Destroy", 
    "Disconnect", 
    "destroy", 
    "disconnect"
});
local function v9(v4, v5) --[[ Line: 126 ]] --[[ Name: GetObjectCleanupFunction ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v6 = typeof(v4);
    if v6 == "function" then
        return v1;
    elseif v6 == "thread" then
        return v2;
    elseif v5 then
        return v5;
    elseif v6 == "Instance" then
        return "Destroy";
    elseif v6 == "RBXScriptConnection" then
        return "Disconnect";
    else
        if v6 == "table" then
            for _, v8 in v3 do
                if typeof(v4[v8]) == "function" then
                    return v8;
                end;
            end;
        end;
        error(("failed to get cleanup function for object %*: %*"):format(v6, v4), 3);
        return;
    end;
end;
local function _(v10) --[[ Line: 154 ]] --[[ Name: AssertPromiseLike ]]
    if typeof(v10) ~= "table" or typeof(v10.getStatus) ~= "function" or typeof(v10.finally) ~= "function" or typeof(v10.cancel) ~= "function" then
        error("did not receive a promise as an argument", 3);
    end;
end;
local v12 = {};
v12.__index = v12;
v12.new = function() --[[ Line: 181 ]] --[[ Name: new ]]
    -- upvalues: v12 (copy)
    local v13 = setmetatable({}, v12);
    v13._objects = {};
    v13._cleaning = false;
    return v13;
end;
v12.Add = function(v14, v15, v16) --[[ Line: 240 ]] --[[ Name: Add ]]
    -- upvalues: v9 (copy)
    if v14._cleaning then
        error("cannot call trove:Add() while cleaning", 2);
    end;
    local v17 = v9(v15, v16);
    table.insert(v14._objects, {
        v15, 
        v17
    });
    return v15;
end;
v12.Clone = function(v18, v19) --[[ Line: 262 ]] --[[ Name: Clone ]]
    if v18._cleaning then
        error("cannot call trove:Clone() while cleaning", 2);
    end;
    return v18:Add(v19:Clone());
end;
v12.Construct = function(v20, v21, ...) --[[ Line: 305 ]] --[[ Name: Construct ]]
    if v20._cleaning then
        error("Cannot call trove:Construct() while cleaning", 2);
    end;
    local v22 = nil;
    local v23 = type(v21);
    if v23 == "table" then
        v22 = v21.new(...);
    elseif v23 == "function" then
        v22 = v21(...);
    end;
    return v20:Add(v22);
end;
v12.Connect = function(v24, v25, v26) --[[ Line: 338 ]] --[[ Name: Connect ]]
    if v24._cleaning then
        error("Cannot call trove:Connect() while cleaning", 2);
    end;
    return v24:Add(v25:Connect(v26));
end;
v12.BindToRenderStep = function(v27, v28, v29, v30) --[[ Line: 361 ]] --[[ Name: BindToRenderStep ]]
    -- upvalues: l_RunService_0 (copy)
    if v27._cleaning then
        error("cannot call trove:BindToRenderStep() while cleaning", 2);
    end;
    l_RunService_0:BindToRenderStep(v28, v29, v30);
    v27:Add(function() --[[ Line: 368 ]]
        -- upvalues: l_RunService_0 (ref), v28 (copy)
        l_RunService_0:UnbindFromRenderStep(v28);
    end);
end;
v12.AddPromise = function(v31, v32) --[[ Line: 398 ]] --[[ Name: AddPromise ]]
    if v31._cleaning then
        error("cannot call trove:AddPromise() while cleaning", 2);
    end;
    if typeof(v32) ~= "table" or typeof(v32.getStatus) ~= "function" or typeof(v32.finally) ~= "function" or typeof(v32.cancel) ~= "function" then
        error("did not receive a promise as an argument", 3);
    end;
    if v32:getStatus() == "Started" then
        v32:finally(function() --[[ Line: 405 ]]
            -- upvalues: v31 (copy), v32 (copy)
            if v31._cleaning then
                return;
            else
                v31:_findAndRemoveFromObjects(v32, false);
                return;
            end;
        end);
        v31:Add(v32, "cancel");
    end;
    return v32;
end;
v12.Remove = function(v33, v34) --[[ Line: 430 ]] --[[ Name: Remove ]]
    if v33._cleaning then
        error("cannot call trove:Remove() while cleaning", 2);
    end;
    return v33:_findAndRemoveFromObjects(v34, true);
end;
v12.Pop = function(v35, v36) --[[ Line: 452 ]] --[[ Name: Pop ]]
    if v35._cleaning then
        error("cannot call trove:Pop() while cleaning", 2);
    end;
    return v35:_findAndRemoveFromObjects(v36, false);
end;
v12.Extend = function(v37) --[[ Line: 481 ]] --[[ Name: Extend ]]
    -- upvalues: v12 (copy)
    if v37._cleaning then
        error("cannot call trove:Extend() while cleaning", 2);
    end;
    return v37:Construct(v12);
end;
v12.Clean = function(v38) --[[ Line: 501 ]] --[[ Name: Clean ]]
    if v38._cleaning then
        return;
    else
        v38._cleaning = true;
        for _, v40 in v38._objects do
            v38:_cleanupObject(v40[1], v40[2]);
        end;
        table.clear(v38._objects);
        v38._cleaning = false;
        return;
    end;
end;
v12.WrapClean = function(v41) --[[ Line: 543 ]] --[[ Name: WrapClean ]]
    return function() --[[ Line: 544 ]]
        -- upvalues: v41 (copy)
        v41:Clean();
    end;
end;
v12._findAndRemoveFromObjects = function(v42, v43, v44) --[[ Line: 549 ]] --[[ Name: _findAndRemoveFromObjects ]]
    local l__objects_0 = v42._objects;
    for v46, v47 in l__objects_0 do
        if v47[1] == v43 then
            local v48 = #l__objects_0;
            l__objects_0[v46] = l__objects_0[v48];
            l__objects_0[v48] = nil;
            if v44 then
                v42:_cleanupObject(v47[1], v47[2]);
            end;
            return true;
        end;
    end;
    return false;
end;
v12._cleanupObject = function(_, v50, v51) --[[ Line: 569 ]] --[[ Name: _cleanupObject ]]
    -- upvalues: v1 (copy), v2 (copy)
    if v51 == v1 then
        task.spawn(v50);
        return;
    elseif v51 == v2 then
        pcall(task.cancel, v50);
        return;
    else
        v50[v51](v50);
        return;
    end;
end;
v12.AttachToInstance = function(v52, v53) --[[ Line: 609 ]] --[[ Name: AttachToInstance ]]
    if v52._cleaning then
        error("cannot call trove:AttachToInstance() while cleaning", 2);
    elseif not v53:IsDescendantOf(game) then
        error("instance is not a descendant of the game hierarchy", 2);
    end;
    return v52:Connect(v53.Destroying, function() --[[ Line: 616 ]]
        -- upvalues: v52 (copy)
        v52:Destroy();
    end);
end;
v12.Destroy = function(v54) --[[ Line: 630 ]] --[[ Name: Destroy ]]
    v54:Clean();
end;
return {
    new = v12.new
};