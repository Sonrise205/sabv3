local v0 = {};
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("ReplicatedStorage");
local _ = game:GetService("ScriptContext");
v0.initClient = function() --[[ Line: 15 ]] --[[ Name: initClient ]]
    -- upvalues: l_GuiService_0 (copy), l_UserInputService_0 (copy)
    local v5 = require(script.Parent.GameAnalytics.Postie);
    local function v6() --[[ Line: 19 ]] --[[ Name: getPlatform ]]
        -- upvalues: l_GuiService_0 (ref), l_UserInputService_0 (ref)
        if l_GuiService_0:IsTenFootInterface() then
            return "Console";
        elseif l_UserInputService_0.TouchEnabled and not l_UserInputService_0.MouseEnabled then
            return "Mobile";
        else
            return "Desktop";
        end;
    end;
    v5.setCallback("getPlatform", v6);
end;
return v0;