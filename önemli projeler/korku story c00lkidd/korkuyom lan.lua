-- LocalScript (executor için)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")

-- ========== KOYU FOG ==========
Lighting.FogStart = 0
Lighting.FogEnd = 40
Lighting.FogColor = Color3.fromRGB(10, 10, 10)

local atm = Instance.new("Atmosphere")
atm.Density = 0.7
atm.Color = Color3.fromRGB(10,10,10)
atm.Decay = Color3.fromRGB(0,0,0)
atm.Parent = Lighting

-- ========== KARAKTER SİLME ==========
local function handleCharacter(plr)
	if plr ~= LocalPlayer and plr.Name ~= "c00lkidd" then
		local char = plr.Character
		if char then
			char:Destroy()
		end
		-- Karakter tekrar spawn olursa yine sil
		plr.CharacterAdded:Connect(function(newChar)
			task.wait(0.1)
			if plr ~= LocalPlayer and plr.Name ~= "c00lkidd" then
				newChar:Destroy()
			end
		end)
	end
end

-- İlkten bütün oyuncuları kontrol et
for _, plr in ipairs(Players:GetPlayers()) do
	handleCharacter(plr)
end

-- Yeni giren oyuncuları da kontrol et
Players.PlayerAdded:Connect(function(plr)
	handleCharacter(plr)
end)
