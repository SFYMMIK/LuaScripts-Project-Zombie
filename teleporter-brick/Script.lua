local teleportFrom = script.Parent
local teleportTo = workspace:WaitForChild("TeleportTo")

teleportFrom.Touched:Connect(function(hit)
	local character = hit.Parent
	local hrp = character:FindFirstChild("HumanoidRootPart")
	
	if hrp then
		hrp.CFrame = teleportTo.CFrame + Vector3.new(0, 3, 0)
	end
end)