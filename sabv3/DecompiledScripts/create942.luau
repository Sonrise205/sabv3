if not game then
    script = require("test/relative-string");
end;
local v0 = game and typeof or require("test/mock").typeof;
local v1 = game and Instance or require("test/mock").Instance;
local v2 = require(script.Parent.throw);
local v3 = require(script.Parent.defaults);
local v4 = require(script.Parent.apply);
local v5 = {};
setmetatable(v5, {
    __index = function(v6, v7) --[[ Line: 12 ]] --[[ Name: __index ]]
        -- upvalues: v1 (copy), v2 (copy), v3 (copy), v4 (copy)
        local l_status_0, l_result_0 = pcall(v1.new, v7);
        if not l_status_0 then
            v2((("invalid class name, could not create instance of class %*"):format(v7)));
        end;
        local v10 = v3[v7];
        if v10 then
            for v11, v12 in next, v10 do
                l_result_0[v11] = v12;
            end;
        end;
        local function v14(v13) --[[ Line: 23 ]] --[[ Name: ctor ]]
            -- upvalues: v4 (ref), l_result_0 (copy)
            return v4(l_result_0:Clone(), v13);
        end;
        v6[v7] = v14;
        return v14;
    end
});
local function _(v15) --[[ Line: 32 ]] --[[ Name: create_instance ]]
    -- upvalues: v5 (copy)
    return v5[v15];
end;
local function _(v17) --[[ Line: 36 ]] --[[ Name: clone_instance ]]
    -- upvalues: v2 (copy), v4 (copy)
    return function(v18) --[[ Line: 37 ]]
        -- upvalues: v17 (copy), v2 (ref), v4 (ref)
        local v19 = v17:Clone();
        if not v19 then
            v2("attempt to clone a non-archivable instance");
        end;
        return v4(v19, v18);
    end;
end;
return function(v21) --[[ Line: 44 ]] --[[ Name: create ]]
    -- upvalues: v5 (copy), v0 (copy), v2 (copy), v4 (copy)
    if type(v21) == "string" then
        return v5[v21];
    elseif v0(v21) == "Instance" then
        return function(v22) --[[ Line: 37 ]]
            -- upvalues: v21 (copy), v2 (ref), v4 (ref)
            local v23 = v21:Clone();
            if not v23 then
                v2("attempt to clone a non-archivable instance");
            end;
            return v4(v23, v22);
        end;
    else
        v2("bad argument #1, expected string or instance, got " .. v0(v21));
        return nil;
    end;
end;