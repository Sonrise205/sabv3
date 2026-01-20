local l_Players_0 = game:GetService("Players");
local l_Packages_0 = game:GetService("ReplicatedStorage"):WaitForChild("Packages");
local _ = require(l_Packages_0.Net);
local _ = require(l_Packages_0.Ragdoll);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v11 = {
    ToggleControls = function(_, v6) --[[ Line: 16 ]] --[[ Name: ToggleControls ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        local l_PlayerScripts_0 = l_LocalPlayer_0:WaitForChild("PlayerScripts");
        local l_Controls_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule")):GetControls();
        if v6 == true then
            l_Controls_0:Enable();
            return;
        else
            if v6 == false then
                l_Controls_0:Disable();
            end;
            return;
        end;
    end, 
    IsInRagdoll = function(_) --[[ Line: 29 ]] --[[ Name: IsInRagdoll ]]
        -- upvalues: l_LocalPlayer_0 (copy)
        local l_workspace_ServerTimeNow_0 = workspace:GetServerTimeNow();
        return math.clamp((l_LocalPlayer_0:GetAttribute("RagdollEndTime") or l_workspace_ServerTimeNow_0) - l_workspace_ServerTimeNow_0, 0, 1e999) > 0;
    end
};
v11.Start = function(_) --[[ Line: 39 ]] --[[ Name: Start ]]
    -- upvalues: l_LocalPlayer_0 (copy), v11 (copy)
    local v13 = nil;
    local function v16() --[[ Line: 42 ]] --[[ Name: toggleControls ]]
        -- upvalues: v13 (ref), l_LocalPlayer_0 (ref), v11 (ref)
        if v13 and coroutine.status(v13) ~= "dead" then
            task.cancel(v13);
        end;
        v13 = task.spawn(function() --[[ Line: 48 ]]
            -- upvalues: l_LocalPlayer_0 (ref), v11 (ref), v13 (ref)
            local l_workspace_ServerTimeNow_1 = workspace:GetServerTimeNow();
            local v15 = math.clamp((l_LocalPlayer_0:GetAttribute("RagdollEndTime") or l_workspace_ServerTimeNow_1) - l_workspace_ServerTimeNow_1, 0, 1e999);
            if v15 < 0 then
                v11:ToggleControls(true);
                return;
            else
                v11:ToggleControls(false);
                v13 = coroutine.running();
                task.wait(v15);
                v11:ToggleControls(true);
                return;
            end;
        end);
    end;
    l_LocalPlayer_0:GetAttributeChangedSignal("RagdollEndTime"):Connect(v16);
end;
return v11;