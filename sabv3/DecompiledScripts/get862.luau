return function(v0, v1, v2) --[[ Line: 21 ]] --[[ Name: get ]]
    if type(v1) == "number" and v1 < 0 then
        v1 = #v0 + (v1 + 1);
    end;
    return v0[v1] or v2;
end;