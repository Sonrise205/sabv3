local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_ReplicatedStorage_0.Packages.Net);
local v3 = require(l_ReplicatedStorage_0.Packages.Signal);
local v4 = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local l_PlayerGui_0 = l_Players_0.LocalPlayer.PlayerGui;
local v6 = v2:RemoteEvent("ConfirmationService/Show");
local l_Confirmation_0 = l_PlayerGui_0:WaitForChild("Confirmation");
local l_Template_0 = l_Confirmation_0:WaitForChild("Template");
local v9 = {};
local v10 = false;
v9.IsInPrompt = function(_) --[[ Line: 21 ]] --[[ Name: IsInPrompt ]]
    -- upvalues: v10 (ref)
    return v10;
end;
v9.Show = function(_, v13, v14, v15) --[[ Line: 25 ]] --[[ Name: Show ]]
    -- upvalues: v10 (ref), v3 (copy), l_Confirmation_0 (copy), l_Template_0 (copy), v4 (copy)
    while v10 do
        task.wait();
    end;
    v10 = true;
    v13 = v13 or "Do you really want to do this?";
    local v16 = v3.new();
    local v17 = v15 and l_Confirmation_0:FindFirstChild(v15) or l_Template_0:Clone();
    v17.Name = "Confirmation";
    v17.Visible = true;
    v17.Parent = l_Confirmation_0;
    local l_Description_0 = v17.Content.Description;
    local l_Close_0 = v17.Close;
    local l_Yes_0 = v17.Yes;
    local l_No_0 = v17.No;
    l_Description_0.Text = v13;
    local function _() --[[ Line: 49 ]] --[[ Name: cleanup ]]
        -- upvalues: v17 (copy)
        v17:Destroy();
    end;
    local function _(v23) --[[ Line: 53 ]] --[[ Name: respond ]]
        -- upvalues: v16 (copy)
        v16:Fire(v23);
    end;
    local v25 = v4.new(l_Yes_0);
    v25:Animate();
    v25.OnActivated:Connect(function() --[[ Line: 59 ]]
        -- upvalues: v16 (copy)
        v16:Fire(true);
    end);
    local v26 = v4.new(l_No_0);
    v26:Animate();
    v26.OnActivated:Connect(function() --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        v16:Fire(false);
    end);
    local v27 = v4.new(l_Close_0);
    v27:Animate();
    v27.OnActivated:Connect(function() --[[ Line: 71 ]]
        -- upvalues: v16 (copy)
        v16:Fire(false);
    end);
    local v28 = nil;
    if v14 then
        v28 = task.delay(v14, function() --[[ Line: 77 ]]
            -- upvalues: v16 (copy)
            v16:Fire(false);
        end);
    end;
    local v29 = v16:Wait();
    v17:Destroy();
    v16:Destroy();
    if v28 and coroutine.status(v28) == "suspended" then
        pcall(task.cancel, v28);
    end;
    v10 = false;
    return v29;
end;
v9.Start = function(_) --[[ Line: 95 ]] --[[ Name: Start ]]
    -- upvalues: v6 (copy), v9 (copy)
    v6.OnClientEvent:Connect(function(v31, v32, v33) --[[ Line: 96 ]]
        -- upvalues: v9 (ref), v6 (ref)
        local v34 = v9:Show(v32, v33 - workspace:GetServerTimeNow());
        v6:FireServer(v31, v34);
    end);
end;
return v9;