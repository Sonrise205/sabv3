--!native
local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game.ReplicatedStorage.UserGenerated.Lang.Keys);
local v2 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v3 = require(game.ReplicatedStorage.UserGenerated.IO.JSONEncoder);
local v4 = {
    http = 80, 
    https = 443
};
local v5 = v2.Optional(v2.Set(v1(v4)));
local l_String_0 = v2.String;
local v7 = v2.Optional(v2.IntegerRange(0, 65535));
local function v9(v8) --[[ Line: 34 ]]
    if type(v8) ~= "string" then
        error("string", 2);
    end;
    if not utf8.len(v8) then
        error("UTF8", 2);
    end;
    if #v8 > 0 and string.byte(v8, 1) ~= 47 then
        error("PathPrefix", 2);
    end;
    return v8;
end;
local v10 = v2.Map(v2.String, v2.Any);
local v11 = v2.Table({
    Protocol = v5, 
    Host = l_String_0, 
    Port = v7, 
    Path = v9, 
    Params = v2.Optional(v10), 
    Fragment = v2.Optional(v2.String)
});
local v20 = {
    AssertProtocol = v5, 
    AssertHost = l_String_0, 
    AssertPort = v7, 
    AssertPath = v9, 
    AssertEncodeParams = v10, 
    AssertParams = v11, 
    EncodePath = function(v12) --[[ Line: 72 ]] --[[ Name: EncodePath ]]
        -- upvalues: v2 (copy), l_HttpService_0 (copy)
        v2.String(v12);
        return (v12:gsub("([^/]+)", function(v13) --[[ Line: 76 ]]
            -- upvalues: l_HttpService_0 (ref)
            return l_HttpService_0:UrlEncode(v13);
        end));
    end, 
    EncodeParams = function(v14) --[[ Line: 82 ]] --[[ Name: EncodeParams ]]
        -- upvalues: v10 (copy), v1 (copy), v3 (copy), l_HttpService_0 (copy)
        v10(v14);
        local v15 = v1(v14);
        table.sort(v15);
        local v16 = {};
        for _, v18 in ipairs(v15) do
            local v19 = v3.Compact(v14[v18]);
            table.insert(v16, l_HttpService_0:UrlEncode(v18) .. "=" .. l_HttpService_0:UrlEncode(v19));
        end;
        return table.concat(v16, "&");
    end
};
v20.Build = function(v21) --[[ Line: 99 ]] --[[ Name: Build ]]
    -- upvalues: v11 (copy), v4 (copy), v20 (copy), l_HttpService_0 (copy)
    v11(v21);
    local v22 = v21.Protocol or "https";
    local v23 = v4[v22] or 80;
    local v24 = v21.Port or v23;
    local v25 = {};
    table.insert(v25, v22);
    table.insert(v25, "://");
    table.insert(v25, v21.Host);
    if v24 ~= v23 then
        table.insert(v25, ":");
        table.insert(v25, (tostring(v24)));
    end;
    table.insert(v25, v20.EncodePath(v21.Path));
    local l_Params_0 = v21.Params;
    if l_Params_0 and next(l_Params_0) ~= nil then
        table.insert(v25, "?");
        table.insert(v25, v20.EncodeParams(l_Params_0));
    end;
    if v21.Fragment then
        table.insert(v25, "#");
        table.insert(v25, l_HttpService_0:UrlEncode(v21.Fragment));
    end;
    return table.concat(v25);
end;
return table.freeze(v20);