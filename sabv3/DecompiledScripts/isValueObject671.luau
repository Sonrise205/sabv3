return function(v0) --[[ Line: 2 ]]
    if v0 and typeof(v0) == "table" and typeof(v0.equals) == "function" then
        return true;
    else
        return false;
    end;
end;