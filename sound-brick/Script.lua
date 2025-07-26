local part = script.Parent
local sound = part:FindFirstChildOfClass("Sound")

-- dojebac jak trzeba
local radius = 300

-- caly dzwiek gotowy
sound.Looped = true
sound.Volume = 1
sound.MaxDistance = radius + 50 -- powinno byc > radius
sound.RollOffMode = Enum.RollOffMode.Linear
sound.Playing = false

while true do
	task.wait(0.5)

	local playerInRange = false

	for _, player in pairs(game.Players:GetPlayers()) do
		local char = player.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")

		if hrp then
			local dist = (hrp.Position - part.Position).Magnitude

			if dist <= radius then
				playerInRange = true
				break
			end
		end
	end

	if playerInRange then
		if not sound.IsPlaying then
			sound:Play()
		end
	else
		if sound.IsPlaying then
			sound:Stop()
		end
	end
end