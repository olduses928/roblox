-- Shows a short welcome message when the player joins.
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "Welcome"
gui.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(0.5, 0.1)
label.Position = UDim2.fromScale(0.25, 0.05)
label.BackgroundTransparency = 0.4
label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
label.TextColor3 = Color3.new(1, 1, 1)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Text = `Welcome, {player.DisplayName}! Collect the gold coins.`
label.Parent = gui

gui.Parent = playerGui

task.delay(5, function()
	gui:Destroy()
end)
