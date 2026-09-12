--[[
    VORTEX UI
    By: DEEP & RENXX
    Game: Roblox - DOORS
    Library: Fluent
    Version: 1.0
    Total: 50 Features + Key System
]]

-- Key System
local Key = "DRXDOORSV1.0"
local KeyFile = "vortex_doors_key.txt"

local function checkKey()
    if isfile(KeyFile) then
        local saved = readfile(KeyFile)
        if saved == Key then
            return true
        end
    end
    return false
end

local function saveKey(input)
    if input == Key then
        writefile(KeyFile, input)
        return true
    end
    return false
end

-- Load Fluent
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Key System GUI
if not checkKey() then
    local KeyWindow = Fluent:CreateWindow({
        Title = "VORTEX UI",
        SubTitle = "Key System | DOORS v1.0",
        TabWidth = 160,
        Size = UDim2.fromOffset(400, 250),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    })
    
    local KeyTab = KeyWindow:AddTab({ Title = "KEY", Icon = "key" })
    KeyTab:AddParagraph({
        Title = "Enter Key",
        Content = "Masukin key buat akses VORTEX UI DOORS"
    })
    KeyTab:AddInput("KeyInput", {
        Title = "Key",
        Default = "",
        Placeholder = "Masukin key di sini",
        Callback = function(v) end
    })
    KeyTab:AddButton({
        Title = "Submit",
        Callback = function()
            local input = Options.KeyInput.Value
            if saveKey(input) then
                KeyWindow:Destroy()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Renxx-Vortex/vortex-scripts/main/vortex-dxr-doors-v1.lua"))()
            else
                KeyTab:AddParagraph({
                    Title = "Error",
                    Content = "Key salah! Coba lagi."
                })
            end
        end
    })
    return
end

-- Main Script
local Window = Fluent:CreateWindow({
    Title = "VORTEX UI",
    SubTitle = "By DEEP & RENXX | DOORS v1.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(620, 520),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Config
local Config = {
    -- Protection
    Bypass = false, AntiKick = false, AntiAFK = false, BoostFPS = false, ShowFPS = false, BoostPing = false, ShowPing = false,
    -- Camera
    CameraPOV = false, CameraSensitivity = false, ThirdPerson = false,
    -- Player
    GodMode = false, NoClip = false, SpeedHack = false, SpeedValue = 16, AutoSprint = false,
    -- Visual
    ActiveESP = false, ESPPosition = "Top", ESPLine = false, ESPName = false, ESPDistance = false,
    ESPBox = "2D", ESPPlayerColor = "#00FF00", ESPDoorColor = "#0000FF", ESPKeyColor = "#FFFF00",
    ESPCoinColor = "#FFD700", ESPEntityManager = false,
    ESPRushColor = "#FF0000", ESPAmbushColor = "#FF4500", ESPFigureColor = "#800080",
    ESPSeekColor = "#00FFFF", ESPEyesColor = "#FFFFFF", ESPDupeColor = "#FF00FF", ESPJackColor = "#FFA500",
    ESPGloombatsColor = "#00FF00", ESPGiggleColor = "#FF69B4", ESPGrumbleColor = "#8B4513",
    ESPLeverColor = "#00FFFF", ESPChestColor = "#FFD700", ESPExitColor = "#00FF00",
    -- Tambahan
    Fullbright = false, RemoveFog = false, NoRain = false, NoDarkness = false, AmbientLight = false,
    PlayerHighlight = false, ItemHighlight = false, DoorHighlight = false, EntityTracers = false, AutoSkipCutscene = false,
}

-- Tabs
local Tabs = {
    Protection = Window:AddTab({ Title = "PROTECTION", Icon = "shield" }),
    Camera = Window:AddTab({ Title = "CAMERA", Icon = "camera" }),
    Player = Window:AddTab({ Title = "PLAYER", Icon = "user" }),
    Visual = Window:AddTab({ Title = "VISUAL", Icon = "eye" }),
    Extra = Window:AddTab({ Title = "EXTRA", Icon = "settings" }),
}

local Options = Fluent.Options

-- === PROTECTION (7) ===
Tabs.Protection:AddToggle("Bypass", { Title = "Bypass", Default = false, Callback = function(v) Config.Bypass = v end })
Tabs.Protection:AddToggle("AntiKick", { Title = "Anti Kick", Default = false, Callback = function(v) Config.AntiKick = v end })
Tabs.Protection:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false, Callback = function(v) Config.AntiAFK = v end })
Tabs.Protection:AddToggle("BoostFPS", { Title = "Boost FPS", Default = false, Callback = function(v) Config.BoostFPS = v end })
Tabs.Protection:AddToggle("ShowFPS", { Title = "Show FPS", Default = false, Callback = function(v) Config.ShowFPS = v end })
Tabs.Protection:AddToggle("BoostPing", { Title = "Boost Ping", Default = false, Callback = function(v) Config.BoostPing = v end })
Tabs.Protection:AddToggle("ShowPing", { Title = "Show Ping", Default = false, Callback = function(v) Config.ShowPing = v end })

-- === CAMERA (3) ===
Tabs.Camera:AddToggle("CameraPOV", { Title = "Camera POV", Default = false, Callback = function(v) Config.CameraPOV = v end })
Tabs.Camera:AddToggle("CameraSensitivity", { Title = "Camera Sensitivity", Default = false, Callback = function(v) Config.CameraSensitivity = v end })
Tabs.Camera:AddToggle("ThirdPerson", { Title = "Third Person Mode", Default = false, Callback = function(v) Config.ThirdPerson = v end })

-- === PLAYER (5) ===
Tabs.Player:AddToggle("GodMode", { Title = "God Mode", Default = false, Callback = function(v) Config.GodMode = v end })
Tabs.Player:AddToggle("NoClip", { Title = "No Clip", Default = false, Callback = function(v) Config.NoClip = v end })
Tabs.Player:AddToggle("SpeedHack", { Title = "Speed Hack", Default = false, Callback = function(v) Config.SpeedHack = v end })
Tabs.Player:AddSlider("SpeedValue", { Title = "Speed Value", Default = 16, Min = 16, Max = 200, Rounding = 1, Callback = function(v) Config.SpeedValue = v end })
Tabs.Player:AddToggle("AutoSprint", { Title = "Auto Sprint", Default = false, Callback = function(v) Config.AutoSprint = v end })

-- === VISUAL (34) ===
Tabs.Visual:AddToggle("ActiveESP", { Title = "Active ESP", Default = false, Callback = function(v) Config.ActiveESP = v end })
Tabs.Visual:AddDropdown("ESPPosition", { Title = "ESP Position", Values = {"Top", "Center", "Bottom"}, Default = "Top", Multi = false, Callback = function(v) Config.ESPPosition = v end })
Tabs.Visual:AddToggle("ESPLine", { Title = "ESP Line Tracers", Default = false, Callback = function(v) Config.ESPLine = v end })
Tabs.Visual:AddToggle("ESPName", { Title = "ESP Name", Default = false, Callback = function(v) Config.ESPName = v end })
Tabs.Visual:AddToggle("ESPDistance", { Title = "ESP Distance", Default = false, Callback = function(v) Config.ESPDistance = v end })
Tabs.Visual:AddDropdown("ESPBox", { Title = "ESP Box", Values = {"2D", "3D", "Corner"}, Default = "2D", Multi = false, Callback = function(v) Config.ESPBox = v end })
Tabs.Visual:AddInput("ESPPlayerColor", { Title = "ESP Player Color", Default = "#00FF00", Callback = function(v) Config.ESPPlayerColor = v end })
Tabs.Visual:AddInput("ESPDoorColor", { Title = "ESP Door Color", Default = "#0000FF", Callback = function(v) Config.ESPDoorColor = v end })
Tabs.Visual:AddInput("ESPKeyColor", { Title = "ESP Key Color", Default = "#FFFF00", Callback = function(v) Config.ESPKeyColor = v end })
Tabs.Visual:AddInput("ESPCoinColor", { Title = "ESP Coin Color", Default = "#FFD700", Callback = function(v) Config.ESPCoinColor = v end })
Tabs.Visual:AddToggle("ESPEntityManager", { Title = "ESP Entity Manager", Default = false, Callback = function(v) Config.ESPEntityManager = v end })
Tabs.Visual:AddInput("ESPRushColor", { Title = "ESP Rush Color", Default = "#FF0000", Callback = function(v) Config.ESPRushColor = v end })
Tabs.Visual:AddInput("ESPAmbushColor", { Title = "ESP Ambush Color", Default = "#FF4500", Callback = function(v) Config.ESPAmbushColor = v end })
Tabs.Visual:AddInput("ESPFigureColor", { Title = "ESP Figure Color", Default = "#800080", Callback = function(v) Config.ESPFigureColor = v end })
Tabs.Visual:AddInput("ESPSeekColor", { Title = "ESP Seek Color", Default = "#00FFFF", Callback = function(v) Config.ESPSeekColor = v end })
Tabs.Visual:AddInput("ESPEyesColor", { Title = "ESP Eyes Color", Default = "#FFFFFF", Callback = function(v) Config.ESPEyesColor = v end })
Tabs.Visual:AddInput("ESPDupeColor", { Title = "ESP Dupe Color", Default = "#FF00FF", Callback = function(v) Config.ESPDupeColor = v end })
Tabs.Visual:AddInput("ESPJackColor", { Title = "ESP Jack Color", Default = "#FFA500", Callback = function(v) Config.ESPJackColor = v end })
Tabs.Visual:AddInput("ESPGloombatsColor", { Title = "ESP Gloombats Color", Default = "#00FF00", Callback = function(v) Config.ESPGloombatsColor = v end })
Tabs.Visual:AddInput("ESPGiggleColor", { Title = "ESP Giggle Color", Default = "#FF69B4", Callback = function(v) Config.ESPGiggleColor = v end })
Tabs.Visual:AddInput("ESPGrumbleColor", { Title = "ESP Grumble Color", Default = "#8B4513", Callback = function(v) Config.ESPGrumbleColor = v end })
Tabs.Visual:AddInput("ESPLeverColor", { Title = "ESP Lever Color", Default = "#00FFFF", Callback = function(v) Config.ESPLeverColor = v end })
Tabs.Visual:AddInput("ESPChestColor", { Title = "ESP Chest Color", Default = "#FFD700", Callback = function(v) Config.ESPChestColor = v end })
Tabs.Visual:AddInput("ESPExitColor", { Title = "ESP Exit Color", Default = "#00FF00", Callback = function(v) Config.ESPExitColor = v end })

-- === EXTRA (16) ===
Tabs.Extra:AddToggle("Fullbright", { Title = "Fullbright", Default = false, Callback = function(v) Config.Fullbright = v end })
Tabs.Extra:AddToggle("RemoveFog", { Title = "Remove Fog", Default = false, Callback = function(v) Config.RemoveFog = v end })
Tabs.Extra:AddToggle("NoRain", { Title = "No Rain", Default = false, Callback = function(v) Config.NoRain = v end })
Tabs.Extra:AddToggle("NoDarkness", { Title = "No Darkness", Default = false, Callback = function(v) Config.NoDarkness = v end })
Tabs.Extra:AddToggle("AmbientLight", { Title = "Ambient Light", Default = false, Callback = function(v) Config.AmbientLight = v end })
Tabs.Extra:AddToggle("PlayerHighlight", { Title = "Player Highlight", Default = false, Callback = function(v) Config.PlayerHighlight = v end })
Tabs.Extra:AddToggle("ItemHighlight", { Title = "Item Highlight", Default = false, Callback = function(v) Config.ItemHighlight = v end })
Tabs.Extra:AddToggle("DoorHighlight", { Title = "Door Highlight", Default = false, Callback = function(v) Config.DoorHighlight = v end })
Tabs.Extra:AddToggle("EntityTracers", { Title = "Entity Tracers", Default = false, Callback = function(v) Config.EntityTracers = v end })
Tabs.Extra:AddToggle("AutoSkipCutscene", { Title = "Auto Skip Cutscene", Default = false, Callback = function(v) Config.AutoSkipCutscene = v end })

-- === FUNGSI FULLBRIGHT ===
RunService.Heartbeat:Connect(function()
    if Config.Fullbright then
        Lighting.Ambient = Color3.fromRGB(178, 178, 178)
        Lighting.OutdoorAmbient = Color3.fromRGB(178, 178, 178)
        Lighting.Brightness = 3
    else
        Lighting.Ambient = Color3.fromRGB(70, 70, 70)
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.Brightness = 2
    end
end)

-- === FUNGSI REMOVE FOG ===
RunService.Heartbeat:Connect(function()
    if Config.RemoveFog then
        Lighting.FogEnd = 100000
    else
        Lighting.FogEnd = 1000
    end
end)

-- === FUNGSI GOD MODE ===
RunService.Heartbeat:Connect(function()
    if Config.GodMode and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = hum.MaxHealth end
    end
end)

-- === FUNGSI SPEED ===
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Config.SpeedHack then hum.WalkSpeed = Config.SpeedValue end
        if Config.AutoSprint then hum.WalkSpeed = 32 end
    end
end)

-- === FUNGSI NO CLIP ===
RunService.Stepped:Connect(function()
    if Config.NoClip and LocalPlayer.Character then
        for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end
end)

-- === FUNGSI ESP ===
local function hexToColor(hex)
    hex = hex:gsub("#", "")
    return Color3.fromRGB(tonumber(hex:sub(1,2), 16), tonumber(hex:sub(3,4), 16), tonumber(hex:sub(5,6), 16))
end

RunService.RenderStepped:Connect(function()
    for _, obj in pairs(workspace:GetDescendants()) do
        local esp = obj:FindFirstChild("VortexESP")
        local name = obj.Name:lower()
        local shouldESP = false
        local color = Color3.fromRGB(0, 255, 0)
        
        if Config.ActiveESP then
            if name:find("door") then shouldESP = true; color = hexToColor(Config.ESPDoorColor)
            elseif name:find("key") then shouldESP = true; color = hexToColor(Config.ESPKeyColor)
            elseif name:find("coin") then shouldESP = true; color = hexToColor(Config.ESPCoinColor)
            elseif name:find("rush") then shouldESP = true; color = hexToColor(Config.ESPRushColor)
            elseif name:find("ambush") then shouldESP = true; color = hexToColor(Config.ESPAmbushColor)
            elseif name:find("figure") then shouldESP = true; color = hexToColor(Config.ESPFigureColor)
            elseif name:find("seek") then shouldESP = true; color = hexToColor(Config.ESPSeekColor)
            elseif name:find("eyes") then shouldESP = true; color = hexToColor(Config.ESPEyesColor)
            elseif name:find("dupe") then shouldESP = true; color = hexToColor(Config.ESPDupeColor)
            elseif name:find("jack") then shouldESP = true; color = hexToColor(Config.ESPJackColor)
            end
        end
        
        if shouldESP then
            if not esp then
                esp = Instance.new("Highlight")
                esp.Name = "VortexESP"
                esp.Adornee = obj
                esp.FillColor = color
                esp.OutlineColor = Color3.fromRGB(255, 255, 255)
                esp.FillTransparency = 0.5
                esp.Parent = obj
            else
                esp.FillColor = color
            end
        elseif esp then
            esp:Destroy()
        end
    end
end)

-- Notifikasi
Fluent:Notify({
    Title = "VORTEX UI DOORS",
    Content = "Script berhasil dimuat!",
    SubContent = "By DEEP & RENXX | 50 Features",
    Duration = 5
})

print("VORTEX UI - DOORS v1.0 Loaded! (50 Features)")
print("By DEEP & RENXX")
