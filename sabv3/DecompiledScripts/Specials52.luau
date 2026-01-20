local l_Parent_0 = script.Parent;
local l_RunService_0 = game:GetService("RunService");
local _ = require(l_Parent_0.Types);
local v3 = {};
local v4 = {
    Camera = {
        AttachToPart = true, 
        LookAtPart = true
    }, 
    Humanoid = {
        AddAccessory = true, 
        ChangeState = true, 
        EquipTool = true, 
        MoveTo = true, 
        Move = true, 
        PlayEmote = true, 
        RemoveAccessories = true, 
        TakeDamage = true, 
        UnequipTools = true
    }, 
    ParticleEmitter = {
        Emit = true, 
        Clear = true
    }, 
    Sound = {
        PlayOnce = true, 
        SetTime = true, 
        Play = true, 
        Resume = true, 
        Pause = true, 
        Stop = true
    }
};
local function _(v5, v6, v7) --[[ Line: 70 ]] --[[ Name: getValue ]]
    return v5:GetAttribute((("__moonlite_%*"):format(v6))) or v7;
end;
local function _(v9, v10, v11, v12) --[[ Line: 74 ]] --[[ Name: setValue ]]
    v9:SetAttribute(("__moonlite_%*"):format(v10), if v11 == v12 then nil else v11);
end;
local function _(v14) --[[ Line: 78 ]] --[[ Name: BoundProp ]]
    return function(v15, v16) --[[ Line: 79 ]]
        -- upvalues: v14 (copy)
        assert(v14.Get);
        return {
            Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
                -- upvalues: v14 (ref), v15 (copy), v16 (copy)
                return v14.Get(v15, v16);
            end, 
            Set = function(v17) --[[ Line: 87 ]] --[[ Name: Set ]]
                -- upvalues: v14 (ref), v15 (copy), v16 (copy)
                v14.Set(v17, v15, v16);
            end
        };
    end;
end;
local function _(v19) --[[ Line: 94 ]] --[[ Name: LazyAction ]]
    return function(v20) --[[ Line: 95 ]]
        -- upvalues: v19 (copy)
        return {
            Default = false, 
            Set = function(v21) --[[ Line: 99 ]] --[[ Name: Set ]]
                -- upvalues: v19 (ref), v20 (copy)
                if v21 then
                    v19(v20);
                end;
            end
        };
    end;
end;
local function _(v23, v24, v25) --[[ Line: 114 ]] --[[ Name: setCameraActive ]]
    -- upvalues: l_RunService_0 (copy)
    if v25 and not v23._cameraRenderBound then
        l_RunService_0:BindToRenderStep("MoonliteRenderCamera", 1000, function() --[[ Line: 116 ]] --[[ Name: updateCamera ]]
            -- upvalues: v23 (copy), v24 (copy)
            local l__cameraAttachToPart_0 = v23._cameraAttachToPart;
            local l__cameraLookAtPart_0 = v23._cameraLookAtPart;
            if l__cameraAttachToPart_0 then
                local l_CFrame_0 = l__cameraAttachToPart_0.CFrame;
                if l__cameraLookAtPart_0 then
                    l_CFrame_0 = CFrame.new(l_CFrame_0.Position, l__cameraLookAtPart_0.Position);
                end;
                v24.CFrame = l_CFrame_0;
            end;
        end);
        v23._cameraRenderBound = true;
        local l__cameraAttachToPart_1 = v23._cameraAttachToPart;
        local l__cameraLookAtPart_1 = v23._cameraLookAtPart;
        if l__cameraAttachToPart_1 then
            local l_CFrame_1 = l__cameraAttachToPart_1.CFrame;
            if l__cameraLookAtPart_1 then
                l_CFrame_1 = CFrame.new(l_CFrame_1.Position, l__cameraLookAtPart_1.Position);
            end;
            v24.CFrame = l_CFrame_1;
        end;
        if not v23.KeepCameraType then
            v24.CameraType = Enum.CameraType.Scriptable;
            return;
        end;
    elseif not v25 and v23._cameraRenderBound then
        l_RunService_0:UnbindFromRenderStep("MoonliteRenderCamera");
        if not v23.KeepCameraType then
            v24.CameraType = Enum.CameraType.Custom;
        end;
        v23._cameraRenderBound = false;
    end;
end;
local v33 = {};
local v45 = {
    Get = function(_, v35) --[[ Line: 151 ]] --[[ Name: Get ]]
        return v35._cameraAttachToPart;
    end, 
    Set = function(v36, v37, v38) --[[ Line: 155 ]] --[[ Name: Set ]]
        -- upvalues: l_RunService_0 (copy)
        if v36 then
            v38._activeCamera = v37;
            v38._cameraAttachToPart = v36;
            if not v38._cameraRenderBound then
                l_RunService_0:BindToRenderStep("MoonliteRenderCamera", 1000, function() --[[ Line: 116 ]] --[[ Name: updateCamera ]]
                    -- upvalues: v38 (copy), v37 (copy)
                    local l__cameraAttachToPart_2 = v38._cameraAttachToPart;
                    local l__cameraLookAtPart_2 = v38._cameraLookAtPart;
                    if l__cameraAttachToPart_2 then
                        local l_CFrame_2 = l__cameraAttachToPart_2.CFrame;
                        if l__cameraLookAtPart_2 then
                            l_CFrame_2 = CFrame.new(l_CFrame_2.Position, l__cameraLookAtPart_2.Position);
                        end;
                        v37.CFrame = l_CFrame_2;
                    end;
                end);
                v38._cameraRenderBound = true;
                local l__cameraAttachToPart_3 = v38._cameraAttachToPart;
                local l__cameraLookAtPart_3 = v38._cameraLookAtPart;
                if l__cameraAttachToPart_3 then
                    local l_CFrame_3 = l__cameraAttachToPart_3.CFrame;
                    if l__cameraLookAtPart_3 then
                        l_CFrame_3 = CFrame.new(l_CFrame_3.Position, l__cameraLookAtPart_3.Position);
                    end;
                    v37.CFrame = l_CFrame_3;
                end;
                if not v38.KeepCameraType then
                    v37.CameraType = Enum.CameraType.Scriptable;
                    return;
                end;
            end;
        else
            v38._cameraAttachToPart = nil;
            if v38._cameraRenderBound then
                l_RunService_0:UnbindFromRenderStep("MoonliteRenderCamera");
                if not v38.KeepCameraType then
                    v37.CameraType = Enum.CameraType.Custom;
                end;
                v38._cameraRenderBound = false;
            end;
        end;
    end
};
local l_v45_0 = v45 --[[ copy: 12 -> 20 ]];
v33.AttachToPart = function(v47, v48) --[[ Line: 79 ]]
    -- upvalues: l_v45_0 (copy)
    assert(l_v45_0.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v45_0 (ref), v47 (copy), v48 (copy)
            return l_v45_0.Get(v47, v48);
        end, 
        Set = function(v49) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v45_0 (ref), v47 (copy), v48 (copy)
            l_v45_0.Set(v49, v47, v48);
        end
    };
end;
v45 = {
    Get = function(_, v51) --[[ Line: 168 ]] --[[ Name: Get ]]
        return v51._cameraLookAtPart;
    end, 
    Set = function(v52, v53, v54) --[[ Line: 172 ]] --[[ Name: Set ]]
        -- upvalues: l_RunService_0 (copy)
        if v52 then
            v54._activeCamera = v53;
            v54._cameraLookAtPart = v52;
            if not v54._cameraRenderBound then
                l_RunService_0:BindToRenderStep("MoonliteRenderCamera", 1000, function() --[[ Line: 116 ]] --[[ Name: updateCamera ]]
                    -- upvalues: v54 (copy), v53 (copy)
                    local l__cameraAttachToPart_4 = v54._cameraAttachToPart;
                    local l__cameraLookAtPart_4 = v54._cameraLookAtPart;
                    if l__cameraAttachToPart_4 then
                        local l_CFrame_4 = l__cameraAttachToPart_4.CFrame;
                        if l__cameraLookAtPart_4 then
                            l_CFrame_4 = CFrame.new(l_CFrame_4.Position, l__cameraLookAtPart_4.Position);
                        end;
                        v53.CFrame = l_CFrame_4;
                    end;
                end);
                v54._cameraRenderBound = true;
                local l__cameraAttachToPart_5 = v54._cameraAttachToPart;
                local l__cameraLookAtPart_5 = v54._cameraLookAtPart;
                if l__cameraAttachToPart_5 then
                    local l_CFrame_5 = l__cameraAttachToPart_5.CFrame;
                    if l__cameraLookAtPart_5 then
                        l_CFrame_5 = CFrame.new(l_CFrame_5.Position, l__cameraLookAtPart_5.Position);
                    end;
                    v53.CFrame = l_CFrame_5;
                end;
                if not v54.KeepCameraType then
                    v53.CameraType = Enum.CameraType.Scriptable;
                end;
            end;
            if v54._updateCamera then
                v54._updateCamera();
                return;
            end;
        else
            v54._cameraLookAtPart = nil;
            if not v54._cameraAttachToPart and v54._cameraRenderBound then
                l_RunService_0:UnbindFromRenderStep("MoonliteRenderCamera");
                if not v54.KeepCameraType then
                    v53.CameraType = Enum.CameraType.Custom;
                end;
                v54._cameraRenderBound = false;
            end;
        end;
    end
};
local l_v45_1 = v45 --[[ copy: 12 -> 21 ]];
v33.LookAtPart = function(v62, v63) --[[ Line: 79 ]]
    -- upvalues: l_v45_1 (copy)
    assert(l_v45_1.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v45_1 (ref), v62 (copy), v63 (copy)
            return l_v45_1.Get(v62, v63);
        end, 
        Set = function(v64) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v45_1 (ref), v62 (copy), v63 (copy)
            l_v45_1.Set(v64, v62, v63);
        end
    };
end;
v3.Camera = v33;
v3.Terrain = {};
for _, v66 in Enum.Material:GetEnumItems() do
    if pcall(function() --[[ Line: 199 ]]
        -- upvalues: v66 (copy)
        workspace.Terrain:GetMaterialColor(v66);
    end) then
        local l_Terrain_0 = v3.Terrain;
        local v68 = ("MC_%*"):format(v66.Name);
        local v72 = {
            Get = function(v69) --[[ Line: 205 ]] --[[ Name: Get ]]
                -- upvalues: v66 (copy)
                return v69:GetMaterialColor(v66);
            end, 
            Set = function(v70, v71) --[[ Line: 209 ]] --[[ Name: Set ]]
                -- upvalues: v66 (copy)
                v71:SetMaterialColor(v66, v70);
            end
        };
        l_Terrain_0[v68] = function(v73, v74) --[[ Line: 79 ]]
            -- upvalues: v72 (copy)
            assert(v72.Get);
            return {
                Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
                    -- upvalues: v72 (ref), v73 (copy), v74 (copy)
                    return v72.Get(v73, v74);
                end, 
                Set = function(v75) --[[ Line: 87 ]] --[[ Name: Set ]]
                    -- upvalues: v72 (ref), v73 (copy), v74 (copy)
                    v72.Set(v75, v73, v74);
                end
            };
        end;
    end;
end;
v33 = Color3.new(1, 1, 1);
local v76 = {};
local v80 = {
    Get = function(v77) --[[ Line: 224 ]] --[[ Name: Get ]]
        return v77:GetPivot();
    end, 
    Set = function(v78, v79) --[[ Line: 228 ]] --[[ Name: Set ]]
        v79:PivotTo(v78);
    end
};
local l_v80_0 = v80 --[[ copy: 13 -> 22 ]];
v76.CFrame = function(v82, v83) --[[ Line: 79 ]]
    -- upvalues: l_v80_0 (copy)
    assert(l_v80_0.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v80_0 (ref), v82 (copy), v83 (copy)
            return l_v80_0.Get(v82, v83);
        end, 
        Set = function(v84) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_0 (ref), v82 (copy), v83 (copy)
            l_v80_0.Set(v84, v82, v83);
        end
    };
end;
v80 = {
    Get = function(v85) --[[ Line: 234 ]] --[[ Name: Get ]]
        -- upvalues: v33 (copy)
        local l_v33_0 = v33;
        return v85:GetAttribute("__moonlite_Color") or l_v33_0;
    end, 
    Set = function(v87, v88) --[[ Line: 238 ]] --[[ Name: Set ]]
        -- upvalues: v33 (copy)
        for _, v90 in v88:GetDescendants() do
            if v90:IsA("BasePart") then
                local l_Color_0 = v90.Color;
                local v92 = v90:GetAttribute("__moonlite_Color") or l_Color_0;
                if v92 ~= v87 then
                    v90:SetAttribute("__moonlite_Color", if v87 == v92 then nil else v87);
                    v90.Color = v87;
                end;
            end;
        end;
        v88:SetAttribute("__moonlite_Color", if v87 == v33 then nil else v87);
    end
};
local l_v80_1 = v80 --[[ copy: 13 -> 23 ]];
v76.Color = function(v94, v95) --[[ Line: 79 ]]
    -- upvalues: l_v80_1 (copy)
    assert(l_v80_1.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v80_1 (ref), v94 (copy), v95 (copy)
            return l_v80_1.Get(v94, v95);
        end, 
        Set = function(v96) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_1 (ref), v94 (copy), v95 (copy)
            l_v80_1.Set(v96, v94, v95);
        end
    };
end;
v80 = {
    Get = function(v97) --[[ Line: 255 ]] --[[ Name: Get ]]
        return v97:GetScale();
    end, 
    Set = function(v98, v99) --[[ Line: 259 ]] --[[ Name: Set ]]
        v99:ScaleTo(v98);
    end
};
local l_v80_2 = v80 --[[ copy: 13 -> 24 ]];
v76.Scale = function(v101, v102) --[[ Line: 79 ]]
    -- upvalues: l_v80_2 (copy)
    assert(l_v80_2.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v80_2 (ref), v101 (copy), v102 (copy)
            return l_v80_2.Get(v101, v102);
        end, 
        Set = function(v103) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_2 (ref), v101 (copy), v102 (copy)
            l_v80_2.Set(v103, v101, v102);
        end
    };
end;
v80 = {
    Get = function(v104) --[[ Line: 265 ]] --[[ Name: Get ]]
        return v104:GetAttribute("__moonlite_Reflectance") or 0;
    end, 
    Set = function(v105, v106) --[[ Line: 269 ]] --[[ Name: Set ]]
        if (v106:GetAttribute("__moonlite_Reflectance") or 0) ~= v105 then
            for _, v108 in v106:GetDescendants() do
                if v108:IsA("BasePart") then
                    local l_Reflectance_0 = v108.Reflectance;
                    local v110 = v108:GetAttribute("__moonlite_BaseReflectance") or l_Reflectance_0;
                    v108.Reflectance = v110 + (1 - v110) * v105;
                end;
            end;
            v106:SetAttribute("__moonlite_Reflectance", if v105 == 0 then nil else v105);
        end;
    end
};
local l_v80_3 = v80 --[[ copy: 13 -> 25 ]];
v76.Reflectance = function(v112, v113) --[[ Line: 79 ]]
    -- upvalues: l_v80_3 (copy)
    assert(l_v80_3.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v80_3 (ref), v112 (copy), v113 (copy)
            return l_v80_3.Get(v112, v113);
        end, 
        Set = function(v114) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_3 (ref), v112 (copy), v113 (copy)
            l_v80_3.Set(v114, v112, v113);
        end
    };
end;
v80 = {
    Get = function(v115) --[[ Line: 287 ]] --[[ Name: Get ]]
        return v115:GetAttribute("__moonlite_Transparency") or 0;
    end, 
    Set = function(v116, v117) --[[ Line: 291 ]] --[[ Name: Set ]]
        if (v117:GetAttribute("__moonlite_Transparency") or 0) ~= v116 then
            for _, v119 in v117:GetDescendants() do
                if v119:IsA("BasePart") then
                    v119.LocalTransparencyModifier = v116;
                end;
            end;
            v117:SetAttribute("__moonlite_Transparency", if v116 == 0 then nil else v116);
        end;
    end
};
local l_v80_4 = v80 --[[ copy: 13 -> 26 ]];
v76.Transparency = function(v121, v122) --[[ Line: 79 ]]
    -- upvalues: l_v80_4 (copy)
    assert(l_v80_4.Get);
    return {
        Get = function() --[[ Line: 83 ]] --[[ Name: Get ]]
            -- upvalues: l_v80_4 (ref), v121 (copy), v122 (copy)
            return l_v80_4.Get(v121, v122);
        end, 
        Set = function(v123) --[[ Line: 87 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_4 (ref), v121 (copy), v122 (copy)
            l_v80_4.Set(v123, v121, v122);
        end
    };
end;
v3.Model = v76;
v76 = {
    AddAccessory = function(v124) --[[ Line: 313 ]] --[[ Name: AddAccessory ]]
        return {
            Default = nil, 
            Set = function(v125) --[[ Line: 319 ]] --[[ Name: Set ]]
                -- upvalues: v124 (copy)
                if v125 then
                    pcall(v124.AddAccessory, v124, v125);
                end;
            end
        };
    end, 
    ChangeState = function(v126) --[[ Line: 327 ]] --[[ Name: ChangeState ]]
        return {
            Default = Enum.HumanoidStateType.None, 
            Set = function(v127) --[[ Line: 331 ]] --[[ Name: Set ]]
                -- upvalues: v126 (copy)
                v126:ChangeState(v127);
            end
        };
    end, 
    EquipTool = function(v128) --[[ Line: 337 ]] --[[ Name: EquipTool ]]
        return {
            Default = nil, 
            Set = function(v129) --[[ Line: 343 ]] --[[ Name: Set ]]
                -- upvalues: v128 (copy)
                if v129 then
                    pcall(v128.EquipTool, v128, v129);
                end;
            end
        };
    end
};
v80 = function(v130) --[[ Line: 351 ]]
    v130.Jump = true;
end;
local l_v80_5 = v80 --[[ copy: 13 -> 27 ]];
v76.Jump = function(v132) --[[ Line: 95 ]]
    -- upvalues: l_v80_5 (copy)
    return {
        Default = false, 
        Set = function(v133) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_5 (ref), v132 (copy)
            if v133 then
                l_v80_5(v132);
            end;
        end
    };
end;
v76.MoveTo = function(v134) --[[ Line: 355 ]] --[[ Name: MoveTo ]]
    local l_v134_Attribute_0 = v134:GetAttribute("MoveToDefault");
    if typeof(l_v134_Attribute_0) ~= "Vector3" then
        local l_RootPart_0 = v134.RootPart;
        l_v134_Attribute_0 = if l_RootPart_0 then l_RootPart_0.Position else Vector3.new(0, 0, 0, 0);
        v134:SetAttribute("MoveToDefault", l_v134_Attribute_0);
    end;
    return {
        Default = l_v134_Attribute_0, 
        Set = function(v137) --[[ Line: 373 ]] --[[ Name: Set ]]
            -- upvalues: v134 (copy)
            v134:MoveTo(v137);
        end
    };
end;
v76.Move = function(v138) --[[ Line: 379 ]] --[[ Name: Move ]]
    local l_v138_Attribute_0 = v138:GetAttribute("MoveDefault");
    if typeof(l_v138_Attribute_0) ~= "Vector3" then
        local l_RootPart_1 = v138.RootPart;
        l_v138_Attribute_0 = if l_RootPart_1 then l_RootPart_1.CFrame.LookVector else Vector3.new(0, 0, 0, 0);
        v138:SetAttribute("MoveDefault", l_v138_Attribute_0);
    end;
    return {
        Default = l_v138_Attribute_0, 
        Set = function(v141) --[[ Line: 397 ]] --[[ Name: Set ]]
            -- upvalues: v138 (copy)
            v138:Move(v141);
        end
    };
end;
v76.PlayEmote = function(v142) --[[ Line: 403 ]] --[[ Name: PlayEmote ]]
    return {
        Default = "", 
        Set = function(v143) --[[ Line: 407 ]] --[[ Name: Set ]]
            -- upvalues: v142 (copy)
            v142:PlayEmote(v143);
        end
    };
end;
v80 = function(v144) --[[ Line: 413 ]]
    v144:RemoveAccessories();
end;
local l_v80_6 = v80 --[[ copy: 13 -> 28 ]];
v76.RemoveAccessories = function(v146) --[[ Line: 95 ]]
    -- upvalues: l_v80_6 (copy)
    return {
        Default = false, 
        Set = function(v147) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_6 (ref), v146 (copy)
            if v147 then
                l_v80_6(v146);
            end;
        end
    };
end;
v76.Sit = function(v148) --[[ Line: 417 ]] --[[ Name: Sit ]]
    return {
        Set = function(v149) --[[ Line: 419 ]] --[[ Name: Set ]]
            -- upvalues: v148 (copy)
            v148.Sit = v149;
        end
    };
end;
v76.TakeDamage = function(v150) --[[ Line: 425 ]] --[[ Name: TakeDamage ]]
    return {
        Set = function(v151) --[[ Line: 427 ]] --[[ Name: Set ]]
            -- upvalues: v150 (copy)
            v150:TakeDamage(v151);
        end
    };
end;
v80 = function(v152) --[[ Line: 433 ]]
    v152:UnequipTools();
end;
local l_v80_7 = v80 --[[ copy: 13 -> 29 ]];
v76.UnequipTools = function(v154) --[[ Line: 95 ]]
    -- upvalues: l_v80_7 (copy)
    return {
        Default = false, 
        Set = function(v155) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_7 (ref), v154 (copy)
            if v155 then
                l_v80_7(v154);
            end;
        end
    };
end;
v3.Humanoid = v76;
v76 = {};
v80 = function(v156) --[[ Line: 443 ]]
    v156:Clear();
end;
local l_v80_8 = v80 --[[ copy: 13 -> 30 ]];
v76.Clear = function(v158) --[[ Line: 95 ]]
    -- upvalues: l_v80_8 (copy)
    return {
        Default = false, 
        Set = function(v159) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_8 (ref), v158 (copy)
            if v159 then
                l_v80_8(v158);
            end;
        end
    };
end;
v76.Emit = function(v160) --[[ Line: 447 ]] --[[ Name: Emit ]]
    local l_v160_Attribute_0 = v160:GetAttribute("EmitCount");
    if type(l_v160_Attribute_0) ~= "number" then
        l_v160_Attribute_0 = 0;
    end;
    return {
        Default = l_v160_Attribute_0, 
        Set = function(v162) --[[ Line: 457 ]] --[[ Name: Set ]]
            -- upvalues: v160 (copy)
            if v162 > 0 then
                v160:Emit(v162);
            end;
        end
    };
end;
v3.ParticleEmitter = v76;
v76 = {};
v80 = function(v163) --[[ Line: 471 ]]
    local v164 = v163:Clone();
    v164.Parent = v163.Parent;
    v164.PlayOnRemove = true;
    v164:Destroy();
end;
local l_v80_9 = v80 --[[ copy: 13 -> 31 ]];
v76.PlayOnce = function(v166) --[[ Line: 95 ]]
    -- upvalues: l_v80_9 (copy)
    return {
        Default = false, 
        Set = function(v167) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_9 (ref), v166 (copy)
            if v167 then
                l_v80_9(v166);
            end;
        end
    };
end;
v76.SetTime = function(v168) --[[ Line: 478 ]] --[[ Name: SetTime ]]
    return {
        Default = 0, 
        Set = function(v169) --[[ Line: 482 ]] --[[ Name: Set ]]
            -- upvalues: v168 (copy)
            v168.TimePosition = v169;
        end
    };
end;
v80 = function(v170) --[[ Line: 488 ]]
    v170:Play();
end;
local l_v80_10 = v80 --[[ copy: 13 -> 32 ]];
v76.Play = function(v172) --[[ Line: 95 ]]
    -- upvalues: l_v80_10 (copy)
    return {
        Default = false, 
        Set = function(v173) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_10 (ref), v172 (copy)
            if v173 then
                l_v80_10(v172);
            end;
        end
    };
end;
v80 = function(v174) --[[ Line: 492 ]]
    v174:Resume();
end;
local l_v80_11 = v80 --[[ copy: 13 -> 33 ]];
v76.Resume = function(v176) --[[ Line: 95 ]]
    -- upvalues: l_v80_11 (copy)
    return {
        Default = false, 
        Set = function(v177) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_11 (ref), v176 (copy)
            if v177 then
                l_v80_11(v176);
            end;
        end
    };
end;
v80 = function(v178) --[[ Line: 496 ]]
    v178:Pause();
end;
local l_v80_12 = v80 --[[ copy: 13 -> 34 ]];
v76.Pause = function(v180) --[[ Line: 95 ]]
    -- upvalues: l_v80_12 (copy)
    return {
        Default = false, 
        Set = function(v181) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_12 (ref), v180 (copy)
            if v181 then
                l_v80_12(v180);
            end;
        end
    };
end;
v80 = function(v182) --[[ Line: 500 ]]
    v182:Stop();
end;
local l_v80_13 = v80 --[[ copy: 13 -> 35 ]];
v76.Stop = function(v184) --[[ Line: 95 ]]
    -- upvalues: l_v80_13 (copy)
    return {
        Default = false, 
        Set = function(v185) --[[ Line: 99 ]] --[[ Name: Set ]]
            -- upvalues: l_v80_13 (ref), v184 (copy)
            if v185 then
                l_v80_13(v184);
            end;
        end
    };
end;
v3.Sound = v76;
v76 = {};
v45 = {};
v80 = {};
local v197 = {
    __index = function(v186, v187) --[[ Line: 524 ]] --[[ Name: __index ]]
        -- upvalues: v45 (copy), v3 (copy)
        local l__target_0 = v186._target;
        local l_ClassName_0 = l__target_0.ClassName;
        local v190 = v45[l_ClassName_0];
        if v190 == nil then
            v190 = {};
            for v191, v192 in v3 do
                if l__target_0:IsA(v191) then
                    for v193, v194 in v192 do
                        v190[v193] = v194;
                    end;
                end;
            end;
            v45[l_ClassName_0] = v190;
        end;
        local v195 = v190[v187];
        local v196 = nil;
        if v195 then
            v196 = v195(l__target_0, v186._work);
            rawset(v186, v187, v196);
        end;
        return v196;
    end
};
return {
    Get = function(v198, v199, v200) --[[ Line: 562 ]] --[[ Name: get ]]
        -- upvalues: v80 (copy), v197 (copy)
        local v201 = v80[v199];
        if not v201 then
            v201 = setmetatable({
                _target = v199, 
                _work = v198
            }, v197);
            v199.Destroying:Connect(function() --[[ Line: 572 ]]
                -- upvalues: v80 (ref), v199 (copy), v201 (ref)
                if v80[v199] == v201 then
                    v80[v199] = nil;
                end;
            end);
            v80[v199] = assert(v201);
        end;
        return v201[v200];
    end, 
    Static = function(v202, v203) --[[ Line: 586 ]] --[[ Name: static ]]
        -- upvalues: v76 (copy), v4 (copy)
        local l_ClassName_1 = v202.ClassName;
        if not v76[l_ClassName_1] then
            local v205 = {};
            for v206, v207 in pairs(v4) do
                if v202:IsA(v206) then
                    for v208, v209 in v207 do
                        v205[v208] = v209;
                    end;
                end;
            end;
            v76[l_ClassName_1] = v205;
        end;
        return v76[l_ClassName_1][v203] == true;
    end, 
    Index = v3
};