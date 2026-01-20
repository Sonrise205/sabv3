local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local _ = game:GetService("UserInputService");
local _ = game:GetService("RunService");
local l_Players_0 = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Controllers.InterfaceController);
local _ = require(l_ReplicatedStorage_0.Classes.AnimatedButton);
local _ = require(l_ReplicatedStorage_0.Shared.AdventCalendar);
local _ = require(l_ReplicatedStorage_0.Shared.Animals);
local _ = require(l_ReplicatedStorage_0.Utils.TimeUtils);
local _ = require(l_ReplicatedStorage_0.Packages.Synchronizer);
local _ = require(l_ReplicatedStorage_0.Packages.Observers);
local _ = require(l_ReplicatedStorage_0.Packages.Signal);
local _ = require(l_ReplicatedStorage_0.Shared.Updates);
local _ = require(l_ReplicatedStorage_0.Packages.Timer);
local v14 = require(l_ReplicatedStorage_0.Packages.Net);
local _ = require(l_ReplicatedStorage_0.Packages.Spr);
local _ = l_Players_0.LocalPlayer.PlayerGui;
local _ = v14:RemoteFunction("AdventService/ClaimReward");
local _ = v14:RemoteEvent("AdventService/Recover");
return {
    Start = function(_) --[[ Line: 34 ]] --[[ Name: Start ]]

    end
};