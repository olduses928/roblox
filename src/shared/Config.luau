-- Game settings shared by the server and the client.
local Config = {
	StartingCoins = 0,
	CoinValue = 1,
	CoinSpawnInterval = 3, -- seconds between coin spawns
	MaxCoins = 20, -- max coins in the world at once
	CoinSpawnRadius = 40, -- studs from the world origin
}

return Config
