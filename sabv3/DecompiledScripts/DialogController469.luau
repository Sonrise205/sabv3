local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TweenService_0 = game:GetService("TweenService");
local l_ProximityPromptService_0 = game:GetService("ProximityPromptService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Packages_0 = l_ReplicatedStorage_0:WaitForChild("Packages");
local v6 = require(l_Packages_0.Trove);
local l_Utils_0 = l_ReplicatedStorage_0:WaitForChild("Utils");
local v8 = require(l_Utils_0.CharacterUtils);
local l_Classes_0 = l_ReplicatedStorage_0:WaitForChild("Classes");
local v10 = require(l_Classes_0.AnimatedButton);
local l_Datas_0 = l_ReplicatedStorage_0:WaitForChild("Datas");
local v12 = require(l_Datas_0.Dialogues);
local l_Controllers_0 = l_ReplicatedStorage_0:WaitForChild("Controllers");
local v14 = require(l_Controllers_0.SoundController);
local v15 = v6.new();
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_DialogAnswers_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("DialogAnswers");
local v18 = false;
local v19 = {};
local function v27(v20, v21) --[[ Line: 34 ]] --[[ Name: TypeEffect ]]
    -- upvalues: v14 (copy), l_TweenService_0 (copy)
    local v22 = coroutine.running();
    local v23 = TweenInfo.new(v21 or 1, Enum.EasingStyle.Linear);
    local v24 = v20:GetPropertyChangedSignal("MaxVisibleGraphemes"):Connect(function() --[[ Line: 39 ]]
        -- upvalues: v14 (ref)
        v14:PlaySound("Sounds.Sfx.Type");
    end);
    local v25 = #v20.Text:gsub("<.->", "");
    local v26 = l_TweenService_0:Create(v20, v23, {
        MaxVisibleGraphemes = v25
    });
    v26.Completed:Once(function() --[[ Line: 47 ]]
        -- upvalues: v24 (copy), v22 (copy)
        v24:Disconnect();
        coroutine.resume(v22);
    end);
    v26:Play();
    return coroutine.yield();
end;
local function _(v28) --[[ Line: 57 ]] --[[ Name: SetInDialogue ]]
    -- upvalues: l_ProximityPromptService_0 (copy), v18 (ref)
    l_ProximityPromptService_0.Enabled = not v28;
    v18 = v28;
end;
local function _(v30, v31) --[[ Line: 62 ]] --[[ Name: FadeOutAndDestroy ]]
    -- upvalues: l_TweenService_0 (copy)
    task.spawn(function() --[[ Line: 64 ]]
        -- upvalues: v31 (copy), l_TweenService_0 (ref), v30 (copy)
        if v31 then
            task.wait(v31);
        end;
        local v32 = TweenInfo.new(2, Enum.EasingStyle.Linear);
        local v33 = l_TweenService_0:Create(v30, v32, {
            TextTransparency = 1
        });
        local v34 = nil;
        local l_UIStroke_0 = v30:FindFirstChildOfClass("UIStroke");
        if l_UIStroke_0 then
            v34 = l_TweenService_0:Create(l_UIStroke_0, v32, {
                Transparency = 1
            });
        end;
        v33:Play();
        if v34 then
            v34:Play();
        end;
        v33.Completed:Once(function() --[[ Line: 84 ]]
            -- upvalues: v30 (ref)
            v30:Destroy();
        end);
    end);
end;
v19.GetDialogText = function(_) --[[ Line: 94 ]] --[[ Name: GetDialogText ]]
    return script.DialogText:Clone();
end;
v19.StartDialog = function(_, v39, v40, v41, ...) --[[ Line: 98 ]] --[[ Name: StartDialog ]]
    -- upvalues: v18 (ref), v12 (copy), l_ProximityPromptService_0 (copy), v14 (copy), v27 (copy), l_TweenService_0 (copy), v19 (copy)
    if v18 == true then
        return;
    else
        local v42 = {
            ...
        };
        local v43 = v12[v39];
        if not v43 then
            return;
        else
            local v44 = v43.Dialogs[v40 or 1];
            if not v44 then
                return;
            else
                l_ProximityPromptService_0.Enabled = false;
                v18 = true;
                local l_Text_0 = v44.Text;
                for v46 = 1, #v42 do
                    local v47 = v42[v46];
                    if v47 then
                        local v48 = "%%param" .. tostring(v46);
                        l_Text_0 = string.gsub(l_Text_0, v48, v47);
                    end;
                end;
                local v49 = script.DialogText.Main:Clone();
                v49.Parent = v41;
                v49.Text = l_Text_0;
                v49.MaxVisibleGraphemes = 0;
                v49.Visible = true;
                if v44.Sound then
                    v14:PlaySound(v44.Sound);
                end;
                v27(v49, v44.Duration or 1);
                if v44.Wait then
                    task.wait(v44.Wait);
                end;
                if v44.Next then
                    local l_spawn_0 = task.spawn;
                    local v51 = nil;
                    l_spawn_0(function() --[[ Line: 64 ]]
                        -- upvalues: v51 (copy), l_TweenService_0 (ref), v49 (copy)
                        if v51 then
                            task.wait(v51);
                        end;
                        local v52 = TweenInfo.new(2, Enum.EasingStyle.Linear);
                        local v53 = l_TweenService_0:Create(v49, v52, {
                            TextTransparency = 1
                        });
                        local v54 = nil;
                        local l_UIStroke_1 = v49:FindFirstChildOfClass("UIStroke");
                        if l_UIStroke_1 then
                            v54 = l_TweenService_0:Create(l_UIStroke_1, v52, {
                                Transparency = 1
                            });
                        end;
                        v53:Play();
                        if v54 then
                            v54:Play();
                        end;
                        v53.Completed:Once(function() --[[ Line: 84 ]]
                            -- upvalues: v49 (ref)
                            v49:Destroy();
                        end);
                    end);
                    l_ProximityPromptService_0.Enabled = true;
                    v18 = false;
                    return v19:StartDialog(v39, v44.Next, v41, ...);
                elseif not v44.Answers then
                    l_ProximityPromptService_0.Enabled = true;
                    v18 = false;
                    local l_spawn_1 = task.spawn;
                    local v57 = nil;
                    l_spawn_1(function() --[[ Line: 64 ]]
                        -- upvalues: v57 (copy), l_TweenService_0 (ref), v49 (copy)
                        if v57 then
                            task.wait(v57);
                        end;
                        local v58 = TweenInfo.new(2, Enum.EasingStyle.Linear);
                        local v59 = l_TweenService_0:Create(v49, v58, {
                            TextTransparency = 1
                        });
                        local v60 = nil;
                        local l_UIStroke_2 = v49:FindFirstChildOfClass("UIStroke");
                        if l_UIStroke_2 then
                            v60 = l_TweenService_0:Create(l_UIStroke_2, v58, {
                                Transparency = 1
                            });
                        end;
                        v59:Play();
                        if v60 then
                            v60:Play();
                        end;
                        v59.Completed:Once(function() --[[ Line: 84 ]]
                            -- upvalues: v49 (ref)
                            v49:Destroy();
                        end);
                    end);
                    return;
                else
                    local v62 = v19:ShowOptions(v44.Answers);
                    local l_spawn_2 = task.spawn;
                    local v64 = nil;
                    local l_v64_0 = v64 --[[ copy: 12 -> 15 ]];
                    l_spawn_2(function() --[[ Line: 64 ]]
                        -- upvalues: l_v64_0 (copy), l_TweenService_0 (ref), v49 (copy)
                        if l_v64_0 then
                            task.wait(l_v64_0);
                        end;
                        local v66 = TweenInfo.new(2, Enum.EasingStyle.Linear);
                        local v67 = l_TweenService_0:Create(v49, v66, {
                            TextTransparency = 1
                        });
                        local v68 = nil;
                        local l_UIStroke_3 = v49:FindFirstChildOfClass("UIStroke");
                        if l_UIStroke_3 then
                            v68 = l_TweenService_0:Create(l_UIStroke_3, v66, {
                                Transparency = 1
                            });
                        end;
                        v67:Play();
                        if v68 then
                            v68:Play();
                        end;
                        v67.Completed:Once(function() --[[ Line: 84 ]]
                            -- upvalues: v49 (ref)
                            v49:Destroy();
                        end);
                    end);
                    if v62 == nil then
                        l_ProximityPromptService_0.Enabled = true;
                        v18 = false;
                        return;
                    else
                        l_spawn_2 = v44.Answers[v62];
                        if l_spawn_2.Function then
                            local v70, v71, v72;
                            v70, v64, v71, v72 = l_spawn_2.Function();
                            if l_spawn_2.FunctionResponse then
                                task.defer(v19.StartDialog, v19, v39, l_spawn_2.FunctionResponse[v70], v41, v64, v71, v72);
                            elseif l_spawn_2.Next then
                                l_ProximityPromptService_0.Enabled = true;
                                v18 = false;
                                v19:StartDialog(v39, l_spawn_2.Next, v41);
                                return;
                            end;
                        elseif l_spawn_2.Next then
                            l_ProximityPromptService_0.Enabled = true;
                            v18 = false;
                            v19:StartDialog(v39, l_spawn_2.Next, v41);
                            return;
                        end;
                        l_ProximityPromptService_0.Enabled = true;
                        v18 = false;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v19.SetupDialogBillboard = function(_, v74) --[[ Line: 187 ]] --[[ Name: SetupDialogBillboard ]]
    -- upvalues: l_DialogAnswers_0 (copy)
    local v75 = v74:WaitForChild("HumanoidRootPart", 25);
    if not v75 then
        return;
    else
        l_DialogAnswers_0.Adornee = v75;
        return;
    end;
end;
v19.ShowOptions = function(_, v77) --[[ Line: 196 ]] --[[ Name: ShowOptions ]]
    -- upvalues: v8 (copy), v15 (copy), l_DialogAnswers_0 (copy), v10 (copy), l_UserInputService_0 (copy)
    local v78 = coroutine.running();
    local l_v8_Character_0, _, v81 = v8:GetCharacter();
    if not l_v8_Character_0 then
        return;
    else
        v15:Clean();
        for v82 = 1, #v77 do
            local v83 = v77[v82];
            local v84 = l_DialogAnswers_0.Main.Template:Clone();
            local v85 = v10.new(v84);
            v85:Animate();
            v15:Add(v85, "Destroy");
            v15:Add(v84, "Destroy");
            v15:Add(v84.MouseButton1Click:Connect(function() --[[ Line: 213 ]]
                -- upvalues: v15 (ref), v78 (copy), v82 (copy)
                v15:Clean();
                coroutine.resume(v78, v82);
            end));
            v84.Text = ("<font color=\"#FFECA1\">%*.</font> %*"):format(v82, v83.Text);
            v84.Parent = l_DialogAnswers_0.Main;
            v84.Visible = true;
        end;
        v15:Add(l_UserInputService_0.InputEnded:Connect(function(v86, v87) --[[ Line: 224 ]]
            -- upvalues: v15 (ref), v78 (copy)
            if v87 == true then
                return;
            else
                if v86.KeyCode == Enum.KeyCode.ButtonB then
                    v15:Clean();
                    coroutine.resume(v78, nil);
                end;
                return;
            end;
        end));
        v15:Add(v81.Died:Connect(function() --[[ Line: 232 ]]
            -- upvalues: v15 (ref), v78 (copy)
            v15:Clean();
            coroutine.resume(v78, nil);
        end));
        return coroutine.yield();
    end;
end;
v19.Start = function(_) --[[ Line: 241 ]] --[[ Name: Start ]]
    -- upvalues: l_LocalPlayer_0 (copy), v19 (copy)
    l_LocalPlayer_0.CharacterAdded:Connect(function(v89) --[[ Line: 243 ]]
        -- upvalues: v19 (ref)
        v19:SetupDialogBillboard(v89);
    end);
    if l_LocalPlayer_0.Character then
        v19:SetupDialogBillboard(l_LocalPlayer_0.Character);
    end;
end;
return v19;