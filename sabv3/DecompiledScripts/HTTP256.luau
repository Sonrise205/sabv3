--!native
local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(game.ReplicatedStorage.UserGenerated.Lang.Asserts);
local v2 = v1.Set({
    "GET", 
    "HEAD", 
    "POST", 
    "PUT", 
    "DELETE", 
    "OPTIONS", 
    "TRACE", 
    "PATCH"
});
local v3 = v1.Optional(v1.Enum(Enum.HttpCompression));
local v4 = v1.Table({
    Url = v1.String, 
    Method = v2, 
    Headers = v1.Optional(v1.Map(v1.String, v1.String)), 
    Body = v1.Optional(v1.RawString), 
    Compress = v3, 
    NoCache = v1.Optional(v1.Boolean)
});
local v10 = {
    AssertCompress = v3, 
    AssertMethod = v2, 
    AssertParams = v4, 
    Execute = function(v5) --[[ Line: 69 ]] --[[ Name: Execute ]]
        -- upvalues: v4 (copy), l_HttpService_0 (copy)
        v4(v5);
        local v6 = v5.Headers or {};
        if v5.NoCache then
            v6 = table.clone(v6);
            v6["Cache-Control"] = "no-cache, no-store, must-revalidate";
            v6.Pragma = "no-cache";
            v6.Expires = "0";
        end;
        local v7 = {
            Url = v5.Url, 
            Method = v5.Method, 
            Headers = v6, 
            Body = v5.Body, 
            Compress = v5.Compress
        };
        local l_status_0, l_result_0 = pcall(l_HttpService_0.RequestAsync, l_HttpService_0, v7);
        if not l_status_0 then
            return {
                Success = false, 
                StatusCode = 400, 
                StatusMessage = tostring(l_result_0), 
                Headers = {}
            };
        else
            return l_result_0;
        end;
    end
};
return table.freeze(v10);