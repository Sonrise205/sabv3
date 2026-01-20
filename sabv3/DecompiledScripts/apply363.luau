if not game then
    script = require("test/relative-string");
end;
local v0 = game and typeof or require("test/mock").typeof;
local v1 = game and Vector2 or require("test/mock").Vector2;
local v2 = game and UDim2 or require("test/mock").UDim2;
local v3 = require(script.Parent.flags);
local v4 = require(script.Parent.throw);
local v5 = require(script.Parent.bind);
local _, v7 = require(script.Parent.action)();
local _ = require(script.Parent.graph);
local v9 = nil;
local function v15() --[[ Line: 43 ]] --[[ Name: borrow_caches ]]
    -- upvalues: v9 (ref)
    if v9 then
        local l_v9_0 = v9;
        v9 = nil;
        return l_v9_0;
    else
        return {
            events = {}, 
            actions = setmetatable({}, {
                __index = function(v11, v12) --[[ Line: 52 ]] --[[ Name: __index ]]
                    v11[v12] = {};
                    return v11[v12];
                end
            }), 
            nested_debug = setmetatable({}, {
                __index = function(v13, v14) --[[ Line: 55 ]] --[[ Name: __index ]]
                    v13[v14] = {};
                    return v13[v14];
                end
            }), 
            nested_stack = {}
        };
    end;
end;
local function _(v16) --[[ Line: 62 ]] --[[ Name: return_caches ]]
    -- upvalues: v9 (ref)
    v9 = v16;
end;
local v18 = {};
for v19, v20 in {
    CFrame = CFrame, 
    Color3 = Color3, 
    UDim = UDim, 
    UDim2 = v2, 
    Vector2 = v1, 
    Vector3 = Vector3, 
    Rect = Rect
} do
    v18[v19] = v20.new;
end;
return function(v21, v22) --[[ Line: 81 ]] --[[ Name: apply ]]
    -- upvalues: v4 (copy), v3 (copy), v15 (copy), v18 (copy), v0 (copy), v5 (copy), v7 (copy), v9 (ref)
    if not v22 then
        v4("attempt to call a constructor returned by create() with no properties");
    end;
    local l_strict_0 = v3.strict;
    local l_Parent_0 = v22.Parent;
    local v25 = v15();
    local l_events_0 = v25.events;
    local l_actions_0 = v25.actions;
    local l_nested_debug_0 = v25.nested_debug;
    local l_nested_stack_0 = v25.nested_stack;
    local v30 = 1;
    repeat
        for v31, v32 in v22 do
            if v31 ~= "Parent" then
                if type(v31) == "string" then
                    if l_strict_0 then
                        if l_nested_debug_0[v30][v31] then
                            v4((("duplicate property %* at depth %*"):format(v31, v30)));
                        end;
                        l_nested_debug_0[v30][v31] = true;
                    end;
                    if type(v32) == "table" then
                        local v33 = v18[v0(v21[v31])];
                        if v33 == nil then
                            v4((("cannot aggregate type %* for property %*"):format(v0(v32), v31)));
                        end;
                        v21[v31] = v33(unpack(v32));
                    elseif type(v32) == "function" then
                        if v0(v21[v31]) == "RBXScriptSignal" then
                            l_events_0[v31] = v32;
                        else
                            v5.property(v21, v31, v32);
                        end;
                    else
                        v21[v31] = v32;
                    end;
                elseif type(v31) == "number" then
                    if type(v32) == "function" then
                        v5.children(v21, v32);
                    elseif type(v32) == "table" then
                        if v7(v32) then
                            table.insert(l_actions_0[v32.priority], v32.callback);
                        else
                            table.insert(l_nested_stack_0, v32);
                            table.insert(l_nested_stack_0, v30 + 1);
                        end;
                    else
                        v32.Parent = v21;
                    end;
                end;
            end;
        end;
        v30 = table.remove(l_nested_stack_0);
        v22 = table.remove(l_nested_stack_0);
    until not v22;
    for v34, v35 in next, l_events_0 do
        v21[v34]:Connect(v35);
    end;
    for _, v37 in next, l_actions_0 do
        for _, v39 in next, v37 do
            v39(v21);
        end;
    end;
    if l_Parent_0 then
        if type(l_Parent_0) == "function" then
            v5.parent(v21, l_Parent_0);
        else
            v21.Parent = l_Parent_0;
        end;
    end;
    table.clear(l_events_0);
    for _, v41 in next, l_actions_0 do
        table.clear(v41);
    end;
    if l_strict_0 then
        table.clear(l_nested_debug_0);
    end;
    table.clear(l_nested_stack_0);
    v9 = v25;
    return v21;
end;