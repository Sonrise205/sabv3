local v0 = require("./background");
local v1 = require("./container");
local v2 = require("./flex");
local v3 = require("./padding");
local v4 = require("./text");
local v5 = require("../../roblox_packages/vide");
local l_show_0 = v5.show;
local l_indexes_0 = v5.indexes;
local l_source_0 = v5.source;
local l_effect_0 = v5.effect;
return function(v10) --[[ Line: 49 ]]
    -- upvalues: l_source_0 (copy), l_effect_0 (copy), v1 (copy), v2 (copy), l_show_0 (copy), v0 (copy), v3 (copy), v4 (copy), l_indexes_0 (copy)
    local v11 = l_source_0(v10.selected());
    l_effect_0(function() --[[ Line: 52 ]]
        -- upvalues: v10 (copy), v11 (copy)
        local v12 = v10.selected();
        local v13 = v11();
        local v14 = v11() + 10 - 1;
        if v14 < v12 then
            local v15 = v12 - v14;
            v11(v11() + v15);
            return;
        else
            if v12 < v13 then
                local v16 = v12 - v13;
                v11(v11() + v16);
            end;
            return;
        end;
    end);
    return v1({
        x = v10.x, 
        y = v10.y, 
        width = 300, 
        auto = "Y", 
        anchor = {
            0, 
            1
        }, 
        zindex = 10000; 
        v2():column():gap(4):vertical("bottom"), 
        l_show_0(v10.analyzing, function() --[[ Line: 77 ]]
            -- upvalues: v10 (copy), v0 (ref), v2 (ref), v3 (ref), v4 (ref)
            local function _() --[[ Line: 78 ]]
                -- upvalues: v10 (ref)
                return v10.analyzing() or {
                    kind = "", 
                    name = "", 
                    description = "", 
                    optional = false
                };
            end;
            return v0({
                width = 300, 
                layout = 10, 
                auto = Enum.AutomaticSize.Y; 
                {
                    BackgroundTransparency = 0
                }, 
                v2(), 
                v0({
                    height = 24, 
                    width = 300; 
                    v2():column():between("horizontal"):vertical("center"), 
                    v3({
                        x = 4
                    }), 
                    v4({
                        text = function() --[[ Line: 104 ]] --[[ Name: text ]]
                            -- upvalues: v10 (ref)
                            if (v10.analyzing() or {
                                kind = "", 
                                name = "", 
                                description = "", 
                                optional = false
                            }).kind == "variadic" then
                                return "...";
                            else
                                return (v10.analyzing() or {
                                    kind = "", 
                                    name = "", 
                                    description = "", 
                                    optional = false
                                }).name or "";
                            end;
                        end, 
                        text_size = 20, 
                        weight = Enum.FontWeight.Bold
                    }), 
                    v4({
                        text = function() --[[ Line: 114 ]] --[[ Name: text ]]
                            -- upvalues: v10 (ref)
                            return ("%*%*"):format((v10.analyzing() or {
                                kind = "", 
                                name = "", 
                                description = "", 
                                optional = false
                            }).type, (v10.analyzing() or {
                                kind = "", 
                                name = "", 
                                description = "", 
                                optional = false
                            }).optional and "?" or "") or "";
                        end, 
                        text_size = 18, 
                        weight = Enum.FontWeight.Light
                    })
                }), 
                v4({
                    v3({
                        padding = 4
                    }); 
                    width = 300, 
                    wrapped = true, 
                    text_size = 16, 
                    xalignment = Enum.TextXAlignment.Left, 
                    text = function() --[[ Line: 130 ]] --[[ Name: text ]]
                        -- upvalues: v10 (ref)
                        return (v10.analyzing() or {
                            kind = "", 
                            name = "", 
                            description = "", 
                            optional = false
                        }).description or "";
                    end
                })
            });
        end), 
        l_show_0(function() --[[ Line: 135 ]]
            -- upvalues: v10 (copy)
            return v10.suggestions()[1] ~= nil;
        end, function() --[[ Line: 135 ]]
            -- upvalues: v0 (ref), v2 (ref), l_indexes_0 (ref), v10 (copy), v11 (copy), v4 (ref), v3 (ref)
            return v0({
                ys = 1, 
                width = 200, 
                height = 0, 
                anchor = {
                    0, 
                    1
                }, 
                auto = Enum.AutomaticSize.Y; 
                {
                    BackgroundTransparency = 0
                }, 
                v2():vertical("bottom"), 
                l_indexes_0(function() --[[ Line: 148 ]]
                    -- upvalues: v10 (ref), v11 (ref)
                    local v18 = v10.suggestions();
                    table.sort(v18, function(v19, v20) --[[ Line: 153 ]]
                        return v19.name < v20.name;
                    end);
                    local v21 = {};
                    for v22 = v11(), v11() + 10 - 1 do
                        v21[v22 - v11() + 1] = v18[v22];
                    end;
                    return v21;
                end, function(v23, v24) --[[ Line: 162 ]]
                    -- upvalues: v4 (ref), v10 (ref), v11 (ref), v3 (ref)
                    return v4({
                        width = 200, 
                        height = 20, 
                        order = v24, 
                        text_size = 16, 
                        xalignment = Enum.TextXAlignment.Left, 
                        text = function() --[[ Line: 170 ]] --[[ Name: text ]]
                            -- upvalues: v23 (copy)
                            return v23().name;
                        end, 
                        text_style = function() --[[ Line: 171 ]] --[[ Name: text_style ]]
                            -- upvalues: v24 (copy), v10 (ref), v11 (ref)
                            if v24 == v10.selected() - v11() + 1 then
                                return "info";
                            else
                                return "normal";
                            end;
                        end; 
                        v3({
                            left = 4
                        })
                    });
                end)
            });
        end)
    });
end;