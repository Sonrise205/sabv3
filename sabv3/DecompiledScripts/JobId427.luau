--!native
local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_JobId_0 = game.JobId;
if #l_JobId_0 == 0 or l_JobId_0 == "00000000-0000-0000-0000-000000000000" then
    assert(l_RunService_0:IsStudio());
    if l_RunService_0:IsServer() then
        l_JobId_0 = l_HttpService_0:GenerateGUID(false):lower();
        script:SetAttribute("Studio", l_JobId_0);
        return l_JobId_0;
    else
        local v3;
        while true do
            v3 = script:GetAttribute("Studio");
            if type(v3) ~= "string" then
                task.wait();
            else
                break;
            end;
        end;
        return v3;
    end;
else
    return l_JobId_0;
end;