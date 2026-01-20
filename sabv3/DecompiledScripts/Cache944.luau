local v0 = {};
return {
    Print = function(_) --[[ Line: 14 ]] --[[ Name: Print ]]
        -- upvalues: v0 (copy)
        print(v0);
    end, 
    Create = function(_, v3) --[[ Line: 18 ]] --[[ Name: Create ]]
        -- upvalues: v0 (copy)
        if v0[v3] then
            return v0[v3];
        else
            v0[v3] = {
                Connections = {}, 
                Table = {}
            };
            return v0[v3];
        end;
    end, 
    Get = function(_, v5) --[[ Line: 28 ]] --[[ Name: Get ]]
        -- upvalues: v0 (copy)
        return v0[v5];
    end, 
    Destroy = function(_, v7) --[[ Line: 34 ]] --[[ Name: Destroy ]]
        -- upvalues: v0 (copy)
        if v0[v7] then
            for _, v9 in v0[v7].Connections do
                v9:Disconnect();
            end;
            table.clear(v0[v7].Connections);
            table.clear(v0[v7].Table);
            v0[v7] = nil;
        end;
    end
};