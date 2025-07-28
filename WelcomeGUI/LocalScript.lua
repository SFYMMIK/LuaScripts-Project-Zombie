local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- blur
local blur = Instance.new("BlurEffect")
blur.Name = "WelcomeBlur"
blur.Size = 24
blur.Parent = Lighting

-- delay zanim gui sie wpierdoli w droge
task.wait(2.5)

-- zrob te jebane w dupe chujowe moze GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WelcomeGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- guzik
local playButton = Instance.new("TextButton")
playButton.Size = UDim2.new(0, 200, 0, 60)
playButton.Position = UDim2.new(0.5, 0, 0.5, 0)
playButton.AnchorPoint = Vector2.new(0.5, 0.5)
playButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
playButton.Text = "Play"
playButton.Font = Enum.Font.GothamBold
playButton.TextSize = 28
playButton.TextColor3 = Color3.new(1, 1, 1)
playButton.Parent = screenGui

-- zjebany fade out blur
local function tweenBlurOut(blurObj, duration)
	local tween = TweenService:Create(blurObj, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = 0
	})
	tween:Play()
	tween.Completed:Wait()
	blurObj:Destroy()
end

-- klikniecie tego kurwa gowna jebanego lol
playButton.MouseButton1Click:Connect(function()
	playButton:TweenPosition(UDim2.new(0.5, 0, -1, 0), "Out", "Quad", 1.2, true)
	task.wait(1.3)
	screenGui:Destroy()
	tweenBlurOut(blur, 1.2)
end)