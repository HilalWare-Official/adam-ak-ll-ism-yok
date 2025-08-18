-- Local teleport script (exploit için)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Spawn Part bulucu
local function findSpawnPart()
    local spawn = nil
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Spawn /2321" then
            spawn = obj
            break
        end
    end
    return spawn
end

local spawnPart = findSpawnPart()

if not spawnPart then
    warn("[HATA] Spawn /2321 bulunamadı! Oyunda yok.")
    return
else
    print("[OK] Spawn bulundu:", spawnPart:GetFullName())
end

-- Işınlama fonksiyonu
local function teleportCharacter(char)
    local root = char:WaitForChild("HumanoidRootPart", 5)
    if root then
        root.CFrame = spawnPart.CFrame + Vector3.new(0, 5, 0) -- biraz yukarı koy
        print("[TP] Karakter ışınlandı:", LocalPlayer.Name)
    else
        warn("[HATA] HumanoidRootPart bulunamadı!")
    end
end

-- Respawn olunca tp
LocalPlayer.CharacterAdded:Connect(function(char)
    teleportCharacter(char)
end)

-- İlk spawn’da tp
if LocalPlayer.Character then
    teleportCharacter(LocalPlayer.Character)
end
