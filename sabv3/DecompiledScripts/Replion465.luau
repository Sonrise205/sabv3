local v0 = require(script.Client);
local v1 = require(script.Server);
local v2 = require(script.Parent.Freeze);
return table.freeze({
    Server = v1, 
    Client = v0, 
    None = v2.None
});