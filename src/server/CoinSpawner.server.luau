-- Spawns collectible coins around the map. Touching one adds to the player's Coins.
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage.Shared.Config)

local coinFolder = Instance.new("Folder")
coinFolder.Name = "Coins"
coinFolder.Parent = workspace

local function spawnCoin()
	local coin = Instance.new("Part")
	coin.Name = "Coin"
	coin.Shape = Enum.PartType.Cylinder
	coin.Size = Vector3.new(0.4, 2, 2)
	coin.Color = Color3.fromRGB(255, 200, 0)
	coin.Material = Enum.Material.Neon
	coin.Anchored = true
	coin.CanCollide = false

	local radius = Config.CoinSpawnRadius
	local x = math.random(-radius, radius)
	local z = math.random(-radius, radius)
	coin.CFrame = CFrame.new(x, 3, z) * CFrame.Angles(0, 0, math.rad(90))

	local collected = false
	coin.Touched:Connect(function(hit)
		if collected then
			return
		end
		local player = Players:GetPlayerFromCharacter(hit.Parent)
		if not player then
			return
		end
		local leaderstats = player:FindFirstChild("leaderstats")
		local coins = leaderstats and leaderstats:FindFirstChild("Coins")
		if coins then
			collected = true
			coins.Value += Config.CoinValue
			coin:Destroy()
		end
	end)

	coin.Parent = coinFolder
end

while true do
	if #coinFolder:GetChildren() < Config.MaxCoins then
		spawnCoin()
	end
	task.wait(Config.CoinSpawnInterval)
end
