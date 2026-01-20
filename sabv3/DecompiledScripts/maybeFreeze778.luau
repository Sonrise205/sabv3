return function(v0) --[[ Line: 5 ]]
    if table.isfrozen(v0) then
        return v0;
    else
        return table.freeze(v0);
    end;
end;