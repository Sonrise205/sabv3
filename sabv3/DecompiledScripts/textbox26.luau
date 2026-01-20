local v0 = require("../theme");
local v1 = require("../../roblox_packages/vide");
local l_create_0 = v1.create;
local l_source_0 = v1.source;
local l_effect_0 = v1.effect;
local l_changed_0 = v1.changed;
local l_read_0 = v1.read;
return function(v7) --[[ Line: 30 ]]
    -- upvalues: l_source_0 (copy), l_create_0 (copy), l_read_0 (copy), v0 (copy), l_changed_0 (copy), l_effect_0 (copy)
    local v8 = l_source_0("");
    local v10 = l_create_0("TextBox")({
        Size = function() --[[ Line: 33 ]] --[[ Name: Size ]]
            -- upvalues: l_read_0 (ref), v7 (copy)
            return UDim2.fromOffset(l_read_0(v7.width) or 0, l_read_0(v7.height) or 0);
        end, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Text = v7.text, 
        PlaceholderText = v7.placeholder, 
        TextSize = v7.text_size or 16, 
        TextColor3 = v0.text, 
        TextXAlignment = v7.xalignment, 
        MultiLine = v7.multiline, 
        FontFace = v0.font, 
        BackgroundTransparency = 1, 
        if v7.update_text then l_changed_0("Text", v7.update_text) else nil, 
        l_changed_0("Text", v8), 
        Focused = function() --[[ Line: 54 ]] --[[ Name: Focused ]]
            -- upvalues: v7 (copy)
            if not v7.update_focused then
                return;
            else
                v7.update_focused(true);
                return;
            end;
        end, 
        FocusLost = function(v9) --[[ Line: 59 ]] --[[ Name: FocusLost ]]
            -- upvalues: v7 (copy), v8 (copy)
            if v7.update_focused then
                v7.update_focused(false);
            end;
            if not v9 then
                return;
            elseif not v7.focused then
                return;
            else
                v7.enter(v8());
                return;
            end;
        end, 
        unpack(v7)
    });
    l_effect_0(function() --[[ Line: 69 ]]
        -- upvalues: l_read_0 (ref), v7 (copy), v10 (copy)
        local v11 = l_read_0(v7.focused);
        if v10:IsFocused() == v11 then
            return;
        else
            task.defer(function() --[[ Line: 72 ]]
                -- upvalues: v11 (copy), v10 (ref)
                if v11 then
                    v10:CaptureFocus();
                    return;
                else
                    v10:ReleaseFocus(false);
                    return;
                end;
            end);
            return;
        end;
    end);
    return v10;
end;