if not game then
    script = require("test/relative-string");
end;
local v0 = require(script.Parent.flags);
local v1 = require(script.Parent.throw);
local v2 = require(script.Parent.graph);
return function(v3) --[[ Line: 7 ]] --[[ Name: batch ]]
    -- upvalues: v0 (copy), v2 (copy), v1 (copy)
    local l_batch_0 = v0.batch;
    local v5 = nil;
    if not l_batch_0 then
        v0.batch = true;
        v5 = v2.get_update_queue_length();
    end;
    local l_status_0, l_result_0 = pcall(v3);
    if not l_batch_0 then
        v0.batch = false;
        v2.flush_update_queue(v5);
    end;
    if not l_status_0 then
        v1((("error occured while batching updates: %*"):format(l_result_0)));
    end;
end;