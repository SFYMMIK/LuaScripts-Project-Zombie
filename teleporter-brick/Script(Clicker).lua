local teleportFrom = script.Parent
local clickDetector = teleportFrom:WaitForChild("clickDetector")
local teleportTo = workspace:WaitForChild("ClickedTeleportTo")

clickDetector.MouseClick:Connect(function(player)
	local character = player.Character
	local hrp = character and character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		hrp.CFrame = teleportTo.CFrame + Vector3.new(0, 3, 0)
	end
end)
