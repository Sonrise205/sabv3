--!native
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local v1 = require(l_ReplicatedStorage_0.UserGenerated.Strings.TrimmedNumberString);
return function(v2) --[[ Line: 35 ]] --[[ Name: Commas ]]
    -- upvalues: v1 (copy)
    local v3 = nil;
    v3 = if type(v2) == "string" then v2 else v1(v2);
    local v4, v5, v6 = string.match(v3, "^(.-)([0-9,]+)(.*)$");
    if not v5 then
        return v3;
    else
        local v7 = {};
        if v4 then
            table.insert(v7, v4);
        end;
        v5 = string.gsub(v5, ",", "");
        local v8 = 1;
        local v9 = #v5 % 3;
        if v9 > 0 then
            table.insert(v7, (string.sub(v5, v8, v8 + v9 - 1)));
            v8 = v8 + v9;
        end;
        while v8 <= #v5 do
            if v8 > 1 then
                table.insert(v7, ",");
            end;
            table.insert(v7, (string.sub(v5, v8, v8 + 2)));
            v8 = v8 + 3;
        end;
        if v6 then
            table.insert(v7, v6);
        end;
        return table.concat(v7);
    end;
end;