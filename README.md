# roblox

A Roblox game synced into Roblox Studio with [Rojo](https://rojo.space).
The code lives in `src/` as `.luau` files, and Rojo copies it into Studio live.

## Starter game

A coin collector:
- Every player gets a **Coins** stat on the leaderboard.
- Spinning gold coins spawn around the map. Touch one to collect it.
- Players see a welcome message when they join.

Change the numbers (spawn rate, coin value, and so on) in `src/shared/Config.luau`.

## Connect to Roblox Studio (one-time setup)

1. **Install Rokit**, which installs Rojo for you:
   - Windows (PowerShell): `Invoke-RestMethod https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.ps1 | Invoke-Expression`
   - macOS/Linux: `curl -sSf https://raw.githubusercontent.com/rojo-rbx/rokit/main/scripts/install.sh | bash`
   - Restart your terminal afterwards.
2. **Clone this repo and install the tools:**
   ```sh
   git clone https://github.com/olduses928/roblox.git
   cd roblox
   rokit install
   ```
3. **Install the Rojo Studio plugin:** run `rojo plugin install`,
   or get it from the [Creator Store](https://create.roblox.com/store/asset/13916111004).
   Restart Studio afterwards.

## Every time you work

1. In the repo folder, run `rojo serve`. Leave the terminal open.
2. Open Roblox Studio and open a place (a new **Baseplate** works).
3. Go to the **Plugins** tab, click **Rojo**, then click **Connect**.
4. Press **Play** to test.

Run `git pull` to get new changes, and Rojo updates Studio automatically.

Note: Rojo only manages the folders listed in `default.project.json`.
Anything you build by hand in Studio (the map, parts, models) stays in your
place file, so **save your place in Studio** as usual.

## Layout

| Folder        | Shows up in Studio as                       | Runs on  |
|---------------|---------------------------------------------|----------|
| `src/server`  | `ServerScriptService.Server`                | Server   |
| `src/client`  | `StarterPlayer.StarterPlayerScripts.Client` | Client   |
| `src/shared`  | `ReplicatedStorage.Shared`                  | Both     |

File names decide the script type:
- `*.server.luau` → Script
- `*.client.luau` → LocalScript
- `*.luau` → ModuleScript

## Build a place file without Studio running

```sh
rojo build -o game.rbxl
```
