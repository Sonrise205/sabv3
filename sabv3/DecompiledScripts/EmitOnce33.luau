--!native
return function(v0) --[[ Line: 20 ]] --[[ Name: EmitOnce ]]
    local l_TimeScale_0 = v0.TimeScale;
    if l_TimeScale_0 <= 0 then
        return 0;
    else
        local l_Rate_0 = v0.Rate;
        local l_v0_Attribute_0 = v0:GetAttribute("EmitCount");
        if type(l_v0_Attribute_0) == "number" then
            l_Rate_0 = l_v0_Attribute_0;
        end;
        local l_l_Rate_0_0 = l_Rate_0;
        l_Rate_0 = math.floor(l_Rate_0);
        l_l_Rate_0_0 = l_l_Rate_0_0 - l_Rate_0;
        if l_l_Rate_0_0 > 0 and math.random() < l_l_Rate_0_0 then
            l_Rate_0 = l_Rate_0 + 1;
        end;
        if l_Rate_0 < 1 then
            return 0;
        else
            local v5 = 0;
            local l_v0_Attribute_1 = v0:GetAttribute("EmitDelay");
            if type(l_v0_Attribute_1) == "number" then
                v5 = l_v0_Attribute_1;
            end;
            if v5 == 1e999 then
                return 0;
            else
                v5 = math.max(v5, 0);
                task.delay(v5, function() --[[ Line: 53 ]]
                    -- upvalues: v0 (copy), l_Rate_0 (ref)
                    v0:Emit(l_Rate_0);
                end);
                return v5 + v0.Lifetime.Max / l_TimeScale_0;
            end;
        end;
    end;
end;