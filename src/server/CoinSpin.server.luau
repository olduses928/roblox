-- Slowly spins every coin so they're easy to spot.
local RunService = game:GetService("RunService")

local SPIN_SPEED = math.rad(90) -- radians per second

RunService.Heartbeat:Connect(function(dt)
	local coinFolder = workspace:FindFirstChild("Coins")
	if not coinFolder then
		return
	end
	for _, coin in coinFolder:GetChildren() do
		if coin:IsA("BasePart") then
			coin.CFrame = CFrame.Angles(0, SPIN_SPEED * dt, 0) * (coin.CFrame - coin.Position) + coin.Position
		end
	end
end)
