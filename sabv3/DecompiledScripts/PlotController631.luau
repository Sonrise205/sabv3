local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_TweenService_0 = game:GetService("TweenService");
local l_Players_0 = game:GetService("Players");
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local _ = require(l_Controllers_0.CharacterController);
local v5 = require(l_Controllers_0.SoundController);
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v7 = require(l_Packages_0.Observers);
local v8 = require(l_Packages_0.Trove);
local v9 = require(l_Packages_0.Net);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local v11 = require(l_ReplicatedStorage_0.Shared.VFX);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v13 = require(l_Datas_0.Animals);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v15 = require(l_Classes_0.PlotClient);
local l_Animals_0 = l_ReplicatedStorage_0:WaitForChild("Animations").Animals;
local v17 = require(l_ReplicatedStorage_0.Shared.Animals);
local v18 = require(l_ReplicatedStorage_0.Controllers.AnimationSyncController);
local v19 = v9:RemoteEvent("PlotService/Open");
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local v21 = nil;
local v22 = {};
local function _(v23) --[[ Line: 39 ]] --[[ Name: round ]]
    return math.floor(v23 * 100) / 100;
end;
return {
    GetMyPlot = function(_) --[[ Line: 45 ]] --[[ Name: GetMyPlot ]]
        -- upvalues: v21 (ref)
        return v21;
    end, 
    GetPlots = function(_) --[[ Line: 49 ]] --[[ Name: GetPlots ]]
        -- upvalues: v22 (copy)
        return v22;
    end, 
    Start = function(_) --[[ Line: 53 ]] --[[ Name: Start ]]
        -- upvalues: v19 (copy), v22 (copy), v8 (copy), l_ReplicatedStorage_0 (copy), v17 (copy), v5 (copy), v11 (copy), v13 (copy), l_Animals_0 (copy), v18 (copy), l_TweenService_0 (copy), v7 (copy), v15 (copy), l_LocalPlayer_0 (copy), v21 (ref)
        v19.OnClientEvent:Connect(function(v28, v29, v30, v31, v32, v33) --[[ Line: 54 ]]
            -- upvalues: v22 (ref), v8 (ref), l_ReplicatedStorage_0 (ref), v17 (ref), v5 (ref), v11 (ref), v13 (ref), l_Animals_0 (ref), v18 (ref), l_TweenService_0 (ref)
            local v34 = v22[v28];
            if not v34 then
                return;
            else
                local l_FirstChild_0 = v34.PlotModel.AnimalPodiums:FindFirstChild(v29);
                if not l_FirstChild_0 then
                    return;
                else
                    while l_FirstChild_0:GetAttribute("DeferDisplay") and l_FirstChild_0:IsDescendantOf(workspace) do
                        task.wait(0.1);
                    end;
                    if not l_FirstChild_0:IsDescendantOf(workspace) then
                        return;
                    else
                        l_FirstChild_0:SetAttribute("DeferDisplay", v31);
                        task.spawn(v34.UpdateAnimalPodiums, v34);
                        local l_Spawn_0 = l_FirstChild_0.Base.Spawn;
                        local v37 = v8.new();
                        if v30 == "Coffin Tung Tung Tung Sahur" then
                            local l_FirstChild_1 = l_ReplicatedStorage_0.Models.Animals:FindFirstChild(v30);
                            if not l_FirstChild_1 then
                                return;
                            else
                                local v39 = v37:Clone(l_FirstChild_1);
                                for _, v41 in v39:GetChildren() do
                                    if v41:IsA("MeshPart") and string.find(v41.Name, "Plane.003_col", 1, true) then
                                        v41.Transparency = 1;
                                    end;
                                end;
                                v39.PrimaryPart.Anchored = true;
                                v39.Parent = workspace.CurrentCamera;
                                v39:PivotTo(l_Spawn_0:GetPivot());
                                if v32 then
                                    v37:Add(v17:ApplyMutation(v39, v30, v32));
                                end;
                                if v33 then
                                    v37:Add(v17:ApplyTraits(v39, v30, v33));
                                end;
                                for _, v43 in v39:GetDescendants() do
                                    if v43:IsA("Trail") then
                                        v43:Destroy();
                                    end;
                                end;
                                local v44 = v39:FindFirstChildOfClass("AnimationController") or v37:Add(Instance.new("AnimationController", v39));
                                local v45 = (v44:FindFirstChildOfClass("Animator") or v37:Add(Instance.new("Animator", v44))):LoadAnimation(l_ReplicatedStorage_0.Controllers.CoffinDanceTungTungTungSahurController.Unbox);
                                v45.Looped = false;
                                v45:Play(0);
                                v5:PlaySound("Sounds.Sfx.Tung Tung Coffin", l_Spawn_0.CFrame.Position + Vector3.new(0, 3, 0, 0), false);
                                v37:Add(function() --[[ Line: 122 ]]
                                    -- upvalues: v45 (copy)
                                    v45:Stop(0);
                                    v45:Destroy();
                                end);
                                local v46 = false;
                                local v47 = coroutine.running();
                                do
                                    local l_v46_0 = v46;
                                    local function v49() --[[ Line: 130 ]] --[[ Name: resume ]]
                                        -- upvalues: l_v46_0 (ref), v47 (copy)
                                        l_v46_0 = true;
                                        if coroutine.status(v47) == "suspended" then
                                            task.spawn(v47);
                                        end;
                                    end;
                                    v45.Stopped:Once(v49);
                                    local v50 = task.delay(15, v49);
                                    if not l_v46_0 then
                                        coroutine.yield();
                                    end;
                                    if coroutine.status(v50) == "suspended" then
                                        pcall(task.cancel, v50);
                                    end;
                                    local v51 = v11.copy(v11.Library.Misc.Smoke, l_Spawn_0.CFrame + Vector3.new(0, 3, 0, 0));
                                    v11.rescale(v51, 3);
                                    v11.emit(v51);
                                    task.delay(5, function() --[[ Line: 151 ]]
                                        -- upvalues: v51 (copy)
                                        v51:Destroy();
                                    end);
                                    v5:PlaySound("Sounds.Sfx.Lucky Blocks.SpinEnd", l_Spawn_0.CFrame.Position + Vector3.new(0, 3, 0, 0), false);
                                end;
                            end;
                        else
                            local v52 = v13[v30];
                            if not v52 or not v52.LuckyBlock then
                                return;
                            else
                                v5:PlaySound("Sounds.Sfx.Lucky Blocks.SpinStart", l_Spawn_0.CFrame.Position + Vector3.new(0, 3, 0, 0));
                                local v53 = v37:Add(v11.copy(v11.Library.Misc.LuckyBlockUnbox, l_Spawn_0.CFrame + Vector3.new(0, 3, 0, 0)));
                                v11.emit(v53);
                                local l_Animals_1 = v52.LuckyBlock.Animals;
                                local v55 = {};
                                local v56 = 0;
                                for _, v58 in l_Animals_1 do
                                    if not v58.IsEnabled or v58.IsEnabled() then
                                        local l_Name_0 = v58.Name;
                                        local l_FirstChild_2 = l_ReplicatedStorage_0.Models.Animals:FindFirstChild(l_Name_0);
                                        if l_FirstChild_2 then
                                            local v61 = v37:Clone(l_FirstChild_2);
                                            v61.PrimaryPart.Anchored = true;
                                            v61.Parent = workspace.CurrentCamera;
                                            for _, v63 in v61:GetDescendants() do
                                                if v63:IsA("ParticleEmitter") then
                                                    v63:Destroy();
                                                end;
                                            end;
                                            if v32 then
                                                v37:Add(v17:ApplyMutation(v61, l_Name_0, v32));
                                            end;
                                            if v33 then
                                                v37:Add(v17:ApplyTraits(v61, l_Name_0, v33));
                                            end;
                                            for _, v65 in v61:GetDescendants() do
                                                if v65:IsA("Trail") then
                                                    v65:Destroy();
                                                end;
                                            end;
                                            local v66 = v61:FindFirstChildOfClass("AnimationController") or v37:Add(Instance.new("AnimationController", v61));
                                            local v67 = v66:FindFirstChildOfClass("Animator") or v37:Add(Instance.new("Animator", v66));
                                            local l_l_Animals_0_FirstChild_0 = l_Animals_0:FindFirstChild(l_Name_0);
                                            local v69 = l_l_Animals_0_FirstChild_0 and l_l_Animals_0_FirstChild_0:FindFirstChild("Idle");
                                            if v69 and v67 then
                                                local v70 = v67:LoadAnimation(v69);
                                                v70.Looped = true;
                                                v70:Play();
                                                local v71 = v18:Add(v70);
                                                v37:Add(function() --[[ Line: 221 ]]
                                                    -- upvalues: v71 (copy), v70 (copy)
                                                    v71();
                                                    v70:Stop(0);
                                                    v70:Destroy();
                                                end);
                                            end;
                                            table.insert(v55, v61);
                                            if l_Name_0 == v31 then
                                                v56 = #v55;
                                            end;
                                        end;
                                    end;
                                end;
                                local v72 = v37:Add(Instance.new("NumberValue"));
                                v72.Value = 0;
                                v37:Add(v72.Changed:Connect(function(v73) --[[ Line: 237 ]]
                                    -- upvalues: l_Spawn_0 (copy), v55 (copy)
                                    local l_l_Spawn_0_Pivot_0 = l_Spawn_0:GetPivot();
                                    for v75, v76 in v55 do
                                        local v77 = math.sin(math.clamp((v73 - (v75 - 1)) % #v55 * 0.5, 0, 1) * 3.141592653589793);
                                        local l_v76_Attribute_0 = v76:GetAttribute("DefaultScale");
                                        if l_v76_Attribute_0 == nil then
                                            l_v76_Attribute_0 = v76:GetScale();
                                            v76:SetAttribute("DefaultScale", l_v76_Attribute_0);
                                        end;
                                        v76:PivotTo(l_l_Spawn_0_Pivot_0);
                                        v76:ScaleTo((math.clamp(l_v76_Attribute_0 * v77 * 1.01, 0.001, l_v76_Attribute_0)));
                                    end;
                                end));
                                local v79 = #v55 * 12 + v56;
                                local v80 = v37:Add(l_TweenService_0:Create(v72, TweenInfo.new(6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                                    Value = v79
                                }));
                                v80:Play();
                                task.wait(v80.TweenInfo.Time * 0.82);
                                v72.Value = v79;
                                v80:Cancel();
                                v5:PlaySound("Sounds.Sfx.Lucky Blocks.SpinEnd", l_Spawn_0.CFrame.Position + Vector3.new(0, 3, 0, 0));
                            end;
                        end;
                        v37:Clean();
                        l_FirstChild_0:SetAttribute("DeferDisplay", nil);
                        v34:UpdateAnimalPodiums();
                        return;
                    end;
                end;
            end;
        end);
        v7.observeTag("Plot", function(v81) --[[ Line: 275 ]]
            -- upvalues: v8 (ref), v15 (ref), v22 (ref), l_LocalPlayer_0 (ref), v21 (ref)
            local v82 = v8.new();
            v82:Add(task.spawn(function() --[[ Line: 278 ]]
                -- upvalues: v81 (copy), v15 (ref), v22 (ref), l_LocalPlayer_0 (ref), v21 (ref), v82 (copy)
                while not v81:GetAttribute("Loaded") do
                    task.wait();
                end;
                local v83 = v15.new(v81);
                local l_v83_UID_0 = v83:GetUID();
                v22[l_v83_UID_0] = v83;
                if v83:GetOwner() == l_LocalPlayer_0 then
                    v21 = v83;
                end;
                v82:Add(v83);
                v82:Add(function() --[[ Line: 292 ]]
                    -- upvalues: v22 (ref), l_v83_UID_0 (copy)
                    v22[l_v83_UID_0] = nil;
                end);
            end));
            return v82:WrapClean();
        end);
    end
};