local l_TextService_0 = game:GetService("TextService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v2 = require("./components/background");
local v3 = require("../roblox_packages/conch");
local v4 = require("./components/corner");
local v5 = require("./components/flex");
local v6 = require("./components/gap");
local v7 = require("./components/loading");
local v8 = require("./components/padding");
local v9 = require("./components/screen");
local v10 = require("./state");
local v11 = require("./components/suggestion");
local v12 = require("./components/text");
local v13 = require("./components/textbox");
local v14 = require("./theme");
local v15 = require("../roblox_packages/vide");
local l_source_0 = v15.source;
local l_derive_0 = v15.derive;
local l_show_0 = v15.show;
local l_changed_0 = v15.changed;
local l_effect_0 = v15.effect;
local l_cleanup_0 = v15.cleanup;
local l_indexes_0 = v15.indexes;
local v23 = 0;
local v24 = {};
return function() --[[ Line: 34 ]]
    -- upvalues: v10 (copy), v3 (copy), l_source_0 (copy), l_derive_0 (copy), l_effect_0 (copy), v14 (copy), l_TextService_0 (copy), l_cleanup_0 (copy), l_UserInputService_0 (copy), v23 (ref), v24 (copy), v9 (copy), v5 (copy), v8 (copy), l_show_0 (copy), v15 (copy), v11 (copy), v2 (copy), v4 (copy), l_indexes_0 (copy), v12 (copy), v6 (copy), v7 (copy), v13 (copy), l_changed_0 (copy)
    local function v29(v25) --[[ Line: 35 ]] --[[ Name: output ]]
        -- upvalues: v10 (ref)
        for _, v27 in (string.split(v25.text, "\n")) do
            local v28 = v10.logs();
            table.insert(v28, 1, {
                kind = v25.kind, 
                text = v27
            });
            table.remove(v28, 100);
            v10.logs(v28);
        end;
    end;
    v3.console.output = v29;
    for _, v31 in string.split("Conch 0.2.x\nCopyright (c) alicesays_hallo - This project is licensed under MIT, you can view the included license with `license`", "\n") do
        v29({
            kind = "normal", 
            text = v31
        });
    end;
    v29({
        kind = "warn", 
        text = "If you got here accidentally, run the `close-ui` command to close this UI."
    });
    v3.register("clear", {
        description = "Clears the console.", 
        permissions = {}, 
        arguments = function() --[[ Line: 59 ]] --[[ Name: arguments ]]

        end, 
        callback = function() --[[ Line: 60 ]] --[[ Name: callback ]]
            -- upvalues: v10 (ref)
            v10.logs({});
        end
    });
    v3.register("close-ui", {
        description = "Close the CLI", 
        permissions = {}, 
        arguments = function() --[[ Line: 66 ]] --[[ Name: arguments ]]

        end, 
        callback = function() --[[ Line: 67 ]] --[[ Name: callback ]]
            -- upvalues: v10 (ref)
            v10.opened(false);
            v10.focused(false);
        end
    });
    local v32 = l_source_0("");
    local v33 = l_source_0(false);
    local v34 = l_source_0(0);
    local v35 = l_source_0(Vector2.zero);
    local v36 = l_source_0();
    local v37 = l_derive_0(function() --[[ Line: 79 ]]
        -- upvalues: v36 (copy), v32 (copy)
        debug.profilebegin("this");
        if v36() then
            debug.profileend();
            return v36().src .. v32();
        else
            debug.profileend();
            return v32();
        end;
    end);
    local v39 = l_derive_0(function() --[[ Line: 90 ]]
        -- upvalues: v3 (ref), v37 (copy)
        local v38 = v3.parse(v37());
        if v38.status == "error" then
            return v38.why;
        else
            return nil;
        end;
    end);
    local v40 = l_source_0(v3.analyze("", 0));
    local v41 = l_source_0(1);
    l_effect_0(function() --[[ Line: 99 ]]
        -- upvalues: v41 (copy), v40 (copy)
        v41((math.clamp(v41(), 1, (math.max(1, #v40().suggestions)))));
    end);
    local v42 = false;
    l_effect_0(function() --[[ Line: 111 ]]
        -- upvalues: v32 (copy), v34 (copy), v42 (ref), v40 (copy), v3 (ref)
        v32();
        v34();
        if v42 then
            return;
        else
            v42 = true;
            task.defer(function() --[[ Line: 116 ]]
                -- upvalues: v42 (ref), v40 (ref), v3 (ref), v32 (ref), v34 (ref)
                v42 = false;
                v40(v3.analyze(v32(), v34() - 1));
            end);
            return;
        end;
    end);
    local v43 = l_derive_0(function() --[[ Line: 123 ]]
        -- upvalues: v32 (copy), v34 (copy)
        return (string.sub(v32(), 1, v34() - 1));
    end);
    local v44 = l_source_0((Vector3.new(0, 0, 0, 0)));
    local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
    l_GetTextBoundsParams_0.Font = v14.font();
    l_GetTextBoundsParams_0.RichText = false;
    l_GetTextBoundsParams_0.Size = 20;
    l_GetTextBoundsParams_0.Width = 100000;
    l_effect_0(function() --[[ Line: 134 ]]
        -- upvalues: v43 (copy), l_GetTextBoundsParams_0 (copy), l_TextService_0 (ref), v44 (copy)
        local v46 = v43();
        l_GetTextBoundsParams_0.Text = v46;
        task.spawn(function() --[[ Line: 137 ]]
            -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_0 (ref), v46 (copy), v43 (ref), v44 (ref)
            local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
            if v46 ~= v43() then
                return;
            else
                v44(l_l_TextService_0_TextBoundsAsync_0);
                return;
            end;
        end);
    end);
    local function _(v48, v49, v50) --[[ Line: 144 ]] --[[ Name: autofill ]]
        -- upvalues: v34 (copy)
        local v51 = string.sub(v48, 1, v49.x);
        local v52 = string.sub(v48, v49.y + 1, -1);
        task.defer(v34, v49.x + #v50 + 2);
        return v51 .. v50 .. " " .. v52;
    end;
    l_cleanup_0(l_UserInputService_0.InputBegan:Connect(function(v54) --[[ Line: 152 ]]
        -- upvalues: v40 (copy), v23 (ref), v24 (ref), v32 (copy), v34 (copy), v41 (copy)
        if v54.KeyCode == Enum.KeyCode.Down then
            if #v40().suggestions == 0 then
                if v23 == 0 then
                    v24[v23] = v32();
                end;
                v23 = math.clamp(v23 - 1, 0, #v24);
                v32(v24[v23] or "");
                v34(#v32() + 1);
                return;
            else
                v41((math.min(v41() + 1, #v40().suggestions)));
                return;
            end;
        else
            if v54.KeyCode == Enum.KeyCode.Up then
                if #v40().suggestions == 0 then
                    if v23 == 0 then
                        v24[v23] = v32();
                    end;
                    v23 = math.clamp(v23 + 1, 0, #v24);
                    v32(v24[v23] or "");
                    v34(#v32() + 1);
                    return;
                else
                    v41((math.max(1, v41() - 1)));
                end;
            end;
            return;
        end;
    end));
    local v55 = false;
    return v9({
        name = "Command Executor", 
        display_order = 100000, 
        enabled = v10.opened; 
        v5():fill("horizontal"):vertical("bottom"), 
        v8({
            padding = 12
        }), 
        l_show_0(v40, function() --[[ Line: 187 ]]
            -- upvalues: v15 (ref), v11 (ref), v43 (copy), v44 (copy), v35 (copy), v41 (copy), v40 (copy)
            return v15.create("Folder")({
                v11({
                    x = function() --[[ Line: 190 ]] --[[ Name: x ]]
                        -- upvalues: v43 (ref)
                        local v56 = string.split(v43(), "\n");
                        return #v56[#v56] * 10 + 10;
                    end, 
                    y = function() --[[ Line: 194 ]] --[[ Name: y ]]
                        -- upvalues: v44 (ref), v35 (ref)
                        return v44().Y + v35().Y - 20;
                    end, 
                    selected = v41, 
                    analyzing = function() --[[ Line: 201 ]] --[[ Name: analyzing ]]
                        -- upvalues: v40 (ref)
                        return v40().analyzing;
                    end, 
                    suggestions = function() --[[ Line: 202 ]] --[[ Name: suggestions ]]
                        -- upvalues: v40 (ref)
                        return v40().suggestions;
                    end
                })
            });
        end), 
        v2({
            auto = "Y"; 
            v5(), 
            v4(4), 
            v8({
                y = 4
            }), 
            l_indexes_0(function() --[[ Line: 214 ]]
                -- upvalues: v39 (copy), v40 (copy)
                local v57 = v39();
                local v58 = table.clone(v40() and v40().logs or {});
                if v57 then
                    table.insert(v58, {
                        kind = "error", 
                        text = v57
                    });
                end;
                return v58;
            end, function(v59, v60) --[[ Line: 221 ]]
                -- upvalues: v12 (ref), v8 (ref)
                return v12({
                    order = 0 - v60 + 100, 
                    height = 20, 
                    text = function() --[[ Line: 226 ]] --[[ Name: text ]]
                        -- upvalues: v59 (copy)
                        return v59().text;
                    end, 
                    text_size = 16, 
                    text_style = function() --[[ Line: 228 ]] --[[ Name: text_style ]]
                        -- upvalues: v59 (copy)
                        return v59().kind;
                    end, 
                    xalignment = Enum.TextXAlignment.Left; 
                    v8({
                        x = 8
                    })
                });
            end), 
            l_indexes_0(v10.logs, function(v61, v62) --[[ Line: 235 ]]
                -- upvalues: v12 (ref), v8 (ref)
                return v12({
                    height = 20, 
                    order = -v62 - 1, 
                    text = function() --[[ Line: 240 ]] --[[ Name: text ]]
                        -- upvalues: v61 (copy)
                        return v61().text;
                    end, 
                    text_size = 16, 
                    text_style = function() --[[ Line: 242 ]] --[[ Name: text_style ]]
                        -- upvalues: v61 (copy)
                        return v61().kind;
                    end, 
                    xalignment = Enum.TextXAlignment.Left; 
                    v8({
                        x = 8
                    })
                });
            end)
        }), 
        v6({
            height = 4
        }), 
        v2({
            auto = Enum.AutomaticSize.Y; 
            v4(4), 
            l_show_0(v33, function() --[[ Line: 258 ]]
                -- upvalues: v7 (ref)
                return v7({
                    height = 18, 
                    speed = 6, 
                    text_size = 18, 
                    xalignment = Enum.TextXAlignment.Left
                });
            end, function() --[[ Line: 266 ]]
                -- upvalues: v13 (ref), v32 (copy), v55 (ref), v34 (copy), v40 (copy), v41 (copy), v36 (copy), v3 (ref), v23 (ref), v24 (ref), v10 (ref), v33 (copy), l_changed_0 (ref)
                return v13({
                    text = v32, 
                    update_text = function(v63) --[[ Line: 269 ]] --[[ Name: update_text ]]
                        -- upvalues: v55 (ref), v34 (ref), v40 (ref), v32 (ref), v41 (ref)
                        local v64 = v55 or v34();
                        local v65 = string.sub(v63, v64 - 1, v64 - 1);
                        local l_suggestions_0 = v40().suggestions;
                        if v65 == "\t" and l_suggestions_0[1] then
                            local v67 = v32();
                            local l_replace_0 = l_suggestions_0[v41()].replace;
                            local l_with_0 = l_suggestions_0[v41()].with;
                            local v70 = string.sub(v67, 1, l_replace_0.x);
                            local v71 = string.sub(v67, l_replace_0.y + 1, -1);
                            task.defer(v34, l_replace_0.x + #l_with_0 + 2);
                            v63 = v70 .. l_with_0 .. " " .. v71;
                        end;
                        v32(v63);
                    end, 
                    placeholder = "Enter your command", 
                    text_size = 18, 
                    xalignment = Enum.TextXAlignment.Left, 
                    multiline = function() --[[ Line: 289 ]] --[[ Name: multiline ]]
                        -- upvalues: v36 (ref), v3 (ref), v32 (ref)
                        if v36() then
                            return v3.parse(v36().src .. v32(), "yield").status == "pending";
                        else
                            return v3.parse(v32(), "yield").status == "pending";
                        end;
                    end, 
                    enter = function(v72) --[[ Line: 302 ]] --[[ Name: enter ]]
                        -- upvalues: v23 (ref), v24 (ref), v32 (ref), v10 (ref), v36 (ref), v3 (ref), v33 (ref)
                        v23 = 0;
                        table.insert(v24, 1, v72);
                        v32("");
                        v10.focused(true);
                        if v36() then
                            v36(v36().append(v72));
                        else
                            v36(v3.parse(v72, true));
                        end;
                        if v36().status ~= "pending" then
                            v33(true);
                            v36(nil);
                            v3.execute(v72);
                            v33(false);
                        end;
                    end, 
                    focused = v10.focused, 
                    update_focused = v10.focused; 
                    {
                        CursorPosition = v34; 
                        l_changed_0("CursorPosition", function(v73) --[[ Line: 327 ]]
                            -- upvalues: v55 (ref), v34 (ref)
                            if v55 then
                                v55 = v73;
                                return;
                            else
                                v55 = v73;
                                task.defer(function() --[[ Line: 335 ]]
                                    -- upvalues: v34 (ref), v55 (ref)
                                    v34(v55);
                                    v55 = false;
                                end);
                                return;
                            end;
                        end)
                    }
                });
            end), 
            v8({
                x = 8, 
                y = 8
            }), 
            v5():fill():vertical("center"):horizontal("left"), 
            l_changed_0("AbsolutePosition", v35)
        })
    });
end;