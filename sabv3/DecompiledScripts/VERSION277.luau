local v0 = {
    appVersion = "v3.3.1", 
    latestVersion = nil, 
    getLatestVersion = function() --[[ Line: 14 ]] --[[ Name: getLatestVersion ]]
        return nil;
    end
};
v0.getAppVersion = function() --[[ Line: 40 ]] --[[ Name: getAppVersion ]]
    -- upvalues: v0 (copy)
    return v0.appVersion;
end;
v0.isUpToDate = function() --[[ Line: 44 ]] --[[ Name: isUpToDate ]]
    -- upvalues: v0 (copy)
    local v1 = v0.getLatestVersion();
    local v2 = v0.getAppVersion();
    local v3 = false;
    if v1 ~= nil then
        v3 = v1 == v2;
    end;
    return v3;
end;
return v0;