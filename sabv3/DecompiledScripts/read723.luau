if not game then
    script = require("test/relative-string");
end;
return function(v0) --[[ Line: 3 ]] --[[ Name: read ]]
    if type(v0) == "function" then
        return (v0());
    else
        return v0;
    end;
end;