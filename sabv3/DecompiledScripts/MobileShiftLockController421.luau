local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_UserInputService_0 = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local v4 = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local v5 = require(l_ReplicatedStorage_0.Packages.Observers);
local v6 = require(l_ReplicatedStorage_0.Packages.Trove);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
return {
    Start = function(_) --[[ Line: 15 ]] --[[ Name: Start ]]
        -- upvalues: l_LocalPlayer_0 (copy), v6 (copy), v4 (copy), l_UserInputService_0 (copy), v5 (copy)
        local l_MobileShiftLock_0 = l_LocalPlayer_0.PlayerGui:WaitForChild("RightBottom"):WaitForChild("MobileShiftLock");
        local l_PlayerScripts_0 = l_LocalPlayer_0.PlayerScripts;
        local l_CameraModule_0 = require(l_PlayerScripts_0:WaitForChild("PlayerModule"):WaitForChild("CameraModule"));
        l_MobileShiftLock_0.Activated:Connect(function() --[[ Line: 21 ]]
            -- upvalues: l_CameraModule_0 (copy)
            if l_CameraModule_0.activeMouseLockController then
                l_CameraModule_0.activeMouseLockController:OnMouseLockToggled();
            end;
        end);
        local v12 = v6.new();
        local v13 = nil;
        local function v24() --[[ Line: 30 ]] --[[ Name: updateVisibility ]]
            -- upvalues: v4 (ref), l_LocalPlayer_0 (ref), l_UserInputService_0 (ref), v13 (ref), v12 (copy), l_MobileShiftLock_0 (copy), v5 (ref), l_CameraModule_0 (copy)
            local v14 = v4:Get(l_LocalPlayer_0);
            if not v14 then
                return;
            else
                local v15 = false;
                if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch then
                    v15 = v14:Get("Settings.Mobile Shift Lock");
                end;
                if v13 == v15 then
                    return;
                else
                    v13 = v15;
                    v12:Clean();
                    l_MobileShiftLock_0.Visible = v15;
                    if v15 then
                        v12:Add(v5.observeTag("JumpButton", function(v16) --[[ Line: 47 ]]
                            -- upvalues: l_MobileShiftLock_0 (ref)
                            local function v19() --[[ Line: 48 ]] --[[ Name: update ]]
                                -- upvalues: v16 (copy), l_MobileShiftLock_0 (ref)
                                local l_AbsoluteSize_0 = v16.AbsoluteSize;
                                local l_AbsolutePosition_0 = v16.AbsolutePosition;
                                l_MobileShiftLock_0.Size = UDim2.fromOffset(l_AbsoluteSize_0.X * 0.5, l_AbsoluteSize_0.Y * 0.5);
                                l_MobileShiftLock_0.Position = UDim2.fromOffset(l_AbsolutePosition_0.X - l_AbsoluteSize_0.X * 0.4, l_AbsolutePosition_0.Y - l_AbsoluteSize_0.Y * 0.4 * 0.5);
                            end;
                            local v20 = v16:GetPropertyChangedSignal("AbsolutePosition"):Connect(v19);
                            local _ = v16:GetPropertyChangedSignal("AbsoluteSize"):Connect(v19);
                            local l_AbsoluteSize_1 = v16.AbsoluteSize;
                            local l_AbsolutePosition_1 = v16.AbsolutePosition;
                            l_MobileShiftLock_0.Size = UDim2.fromOffset(l_AbsoluteSize_1.X * 0.5, l_AbsoluteSize_1.Y * 0.5);
                            l_MobileShiftLock_0.Position = UDim2.fromOffset(l_AbsolutePosition_1.X - l_AbsoluteSize_1.X * 0.4, l_AbsolutePosition_1.Y - l_AbsoluteSize_1.Y * 0.4 * 0.5);
                            return function() --[[ Line: 59 ]]
                                -- upvalues: v20 (copy)
                                v20:Disconnect();
                            end;
                        end));
                        return;
                    else
                        if l_UserInputService_0.PreferredInput == Enum.PreferredInput.Touch and l_CameraModule_0.activeMouseLockController and l_CameraModule_0.activeMouseLockController.isMouseLocked then
                            l_CameraModule_0.activeMouseLockController:OnMouseLockToggled();
                        end;
                        return;
                    end;
                end;
            end;
        end;
        v4:WaitAndCall(l_LocalPlayer_0, function(v25) --[[ Line: 70 ]]
            -- upvalues: l_UserInputService_0 (ref), v24 (copy)
            l_UserInputService_0:GetPropertyChangedSignal("PreferredInput"):Connect(v24);
            v25:OnChanged("Settings.Mobile Shift Lock", v24);
            task.spawn(v24);
        end);
        if l_CameraModule_0.activeMouseLockController and l_CameraModule_0.activeMouseLockController.mouseLockToggledEvent then
            l_CameraModule_0.activeMouseLockController.mouseLockToggledEvent.Event:Connect(function() --[[ Line: 77 ]] --[[ Name: updateIcon ]]
                -- upvalues: l_MobileShiftLock_0 (copy), l_CameraModule_0 (copy)
                l_MobileShiftLock_0.Image = l_CameraModule_0.activeMouseLockController.isMouseLocked and "rbxasset://textures/ui/mouseLock_on.png" or "rbxasset://textures/ui/mouseLock_off.png";
            end);
            l_MobileShiftLock_0.Image = l_CameraModule_0.activeMouseLockController.isMouseLocked and "rbxasset://textures/ui/mouseLock_on.png" or "rbxasset://textures/ui/mouseLock_off.png";
        end;
    end
};