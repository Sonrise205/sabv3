--!native
return function(v0, v1) --[[ Line: 20 ]] --[[ Name: ThreadJoin ]]
    local v2 = os.clock();
    while true do
        if coroutine.status(v0) == "dead" then
            return true;
        elseif v1 ~= nil and v1 <= os.clock() - v2 then
            return false;
        else
            task.wait();
        end;
    end;
end;