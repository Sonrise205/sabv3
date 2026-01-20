return {
    ReadPath = function(_, v1, v2) --[[ Line: 7 ]] --[[ Name: ReadPath ]]
        if not v2 then
            return v1;
        else
            local l_v1_0 = v1;
            local v4 = string.split(v2, ".");
            for v5 = 1, #v4 do
                if l_v1_0 == nil then
                    return nil;
                else
                    l_v1_0 = l_v1_0:FindFirstChild(v4[v5]);
                end;
            end;
            return l_v1_0;
        end;
    end
};