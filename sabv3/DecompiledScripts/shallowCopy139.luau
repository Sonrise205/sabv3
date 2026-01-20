local v0 = require(script.Parent.isImmutable);
return function(v1) --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    if v0(v1) then
        return v1:clone();
    else
        return table.clone(v1);
    end;
end;