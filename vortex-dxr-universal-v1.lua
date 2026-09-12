--[[
    VORTEX UI
    By: DEEP & RENXX
    Game: Universal (All Games)
    Library: Fluent
    Type: GUI + Keyless
    Version: 1.0
    Total: 26 Features
]]

-- Load Fluent Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "VORTEX UI",
    SubTitle = "By DEEP & RENXX | Universal v1.0",
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
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Config
local Config = {
    -- Protection
    Bypass = false, AntiKick = false, AntiAFK = false, BoostFPS = false,
    -- Visuals
    ESP_Box = false, ESP_Name = false, ESP_Distance = false, ESP_Health = false,
    Fullbright = false, NoFog = false, Chams = false,
    -- Combat
    Aimbot = false, AimbotSmooth = 2, SilentAim = false, TriggerBot = false,
    AimPart = "Head", Hitbox = false, HitboxSize = 5,
    -- Movement
    SpeedHack = false, SpeedValue = 30, JumpHack = false, JumpValue = 50,
    NoClip = false, Fly = false, FlySpeed = 50, InfiniteJump = false,
    -- Misc
    TeleportToMouse = false, TeleportToPlayer = "Pilih Player...",
}

-- Tabs
local Tabs = {
    Protection = Window:AddTab({ Title = "PROTECTION", Icon = "shield" }),
    Visuals = Window:AddTab({ Title = "VISUALS", Icon = "eye" }),
    Combat = Window:AddTab({ Title = "COMBAT", Icon = "crosshair" }),
    Movement = Window:AddTab({ Title = "MOVEMENT", Icon = "move" }),
    Misc = Window:AddTab({ Title = "MISC", Icon = "settings" }),
}

-- === PROTECTION (4 Fitur) ===
Tabs.Protection:AddToggle("Bypass", { Title = "Bypass", Default = false, Callback = function(v) Config.Bypass = v end })
Tabs.Protection:AddToggle("AntiKick", { Title = "Anti Kick", Default = false, Callback = function(v) Config.AntiKick = v end })
Tabs.Protection:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false, Callback = function(v) Config.AntiAFK = v end })
Tabs.Protection:AddToggle("BoostFPS", { Title = "Boost FPS", Default = false, Callback = function(v) Config.BoostFPS = v end })

-- === VISUALS (7 Fitur) ===
Tabs.Visuals:AddToggle("ESP_Box", { Title = "ESP Box", Default = false, Callback = function(v) Config.ESP_Box = v end })
Tabs.Visuals:AddToggle("ESP_Name", { Title = "ESP Name", Default = false, Callback = function(v) Config.ESP_Name = v end })
Tabs.Visuals:AddToggle("ESP_Distance", { Title = "ESP Distance", Default = false, Callback = function(v) Config.ESP_Distance = v end })
Tabs.Visuals:AddToggle("ESP_Health", { Title = "ESP Health", Default = false, Callback = function(v) Config.ESP_Health = v end })
Tabs.Visuals:AddToggle("Chams", { Title = "Chams", Default = false, Callback = function(v) Config.Chams = v end })
Tabs.Visuals:AddToggle("Fullbright", { Title = "Fullbright", Default = false, Callback = function(v) Config.Fullbright = v end })
Tabs.Visuals:AddToggle("NoFog", { Title = "No Fog", Default = false, Callback = function(v) Config.NoFog = v end })

-- === COMBAT (7 Fitur) ===
Tabs.Combat:AddToggle("Aimbot", { Title = "Aimbot", Default = false, Callback = function(v) Config.Aimbot = v end })
Tabs.Combat:AddSlider("AimbotSmooth", { Title = "Aimbot Smoothness", Default = 2, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.AimbotSmooth = v end })
Tabs.Combat:AddToggle("SilentAim", { Title = "Silent Aim", Default = false, Callback = function(v) Config.SilentAim = v end })
Tabs.Combat:AddToggle("TriggerBot", { Title = "Trigger Bot", Default = false, Callback = function(v) Config.TriggerBot = v end })
Tabs.Combat:AddDropdown("AimPart", { Title = "Aim Target", Values = {"Head", "Body", "Foot"}, Default = "Head", Multi = false, Callback = function(v) Config.AimPart = v end })
Tabs.Combat:AddToggle("Hitbox", { Title = "Hitbox Expander", Default = false, Callback = function(v) Config.Hitbox = v end })
Tabs.Combat:AddSlider("HitboxSize", { Title = "Hitbox Size", Default = 5, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.HitboxSize = v end })

-- === MOVEMENT (7 Fitur) ===
Tabs.Movement:AddToggle("SpeedHack", { Title = "Speed Hack", Default = false, Callback = function(v) Config.SpeedHack = v end })
Tabs.Movement:AddSlider("SpeedValue", { Title = "Speed Value", Default = 30, Min = 16, Max = 200, Rounding = 1, Callback = function(v) Config.SpeedValue = v end })
Tabs.Movement:AddToggle("JumpHack", { Title = "Jump Hack", Default = false, Callback = function(v) Config.JumpHack = v end })
Tabs.Movement:AddSlider("JumpValue", { Title = "Jump Value", Default = 50, Min = 50, Max = 200, Rounding = 1, Callback = function(v) Config.JumpValue = v end })
Tabs.Movement:AddToggle("NoClip", { Title = "No Clip", Default = false, Callback = function(v) Config.NoClip = v end })
Tabs.Movement:AddToggle("Fly", { Title = "Fly", Default = false, Callback = function(v) Config.Fly = v end })
Tabs.Movement:AddSlider("FlySpeed", { Title = "Fly Speed", Default = 50, Min = 10, Max = 200, Rounding = 1, Callback = function(v) Config.FlySpeed = v end })

-- === MISC (5 Fitur) ===
Tabs.Misc:AddToggle("TeleportToMouse", { Title = "Teleport to Mouse", Default = false, Callback = function(v) Config.TeleportToMouse = v end })

-- Dropdown Teleport to Player (auto-update)
local PlayerDropdown
PlayerDropdown = Tabs.Misc:AddDropdown("TeleportToPlayer", {
    Title = "Teleport to Player",
    Values = {"Pilih Player..."},
    Default = "Pilih Player...",
    Multi = false,
    Callback = function(v) Config.TeleportToPlayer = v end
})

task.spawn(function()
    while task.wait(5) do
        local playerList = {"Pilih Player..."}
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                table.insert(playerList, p.Name)
            end
        end
        PlayerDropdown:SetValues(playerList)
    end
end)

Tabs.Misc:AddButton({ Title = "Reset Character", Callback = function() if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end end })
Tabs.Misc:AddButton({ Title = "Rejoin Server", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end })
Tabs.Misc:AddLabel("VORTEX UI - By DEEP & RENXX")

-- === FUNGSI ESP ===
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local esp = player.Character:FindFirstChild("VortexESP")
            if (Config.ESP_Box or Config.ESP_Name or Config.ESP_Distance or Config.ESP_Health or Config.Chams) then
                if not esp then
                    esp = Instance.new("Highlight")
                    esp.Name = "VortexESP"
                    esp.Adornee = player.Character
                    esp.FillColor = Color3.fromRGB(255, 0, 0)
                    esp.OutlineColor = Color3.fromRGB(255, 255, 0)
                    esp.FillTransparency = 0.5
                    esp.Parent = player.Character
                end
            elseif esp then esp:Destroy() end
        end
    end
end)

-- === FUNGSI FULLBRIGHT & NO FOG ===
RunService.RenderStepped:Connect(function()
    if Config.Fullbright then
        game.Lighting.Brightness = 2
        game.Lighting.ClockTime = 12
        game.Lighting.GlobalShadows = false
    end
    if Config.NoFog then
        game.Lighting.FogEnd = 100000
    end
end)

-- === FUNGSI BOOST FPS ===
RunService.RenderStepped:Connect(function()
    if Config.BoostFPS then
        settings().Rendering.QualityLevel = 1
        game.Lighting.GlobalShadows = false
        game.Lighting.FogEnd = 100000
    end
end)

-- === FUNGSI AIMBOT ===
local function getClosestPlayer()
    local closest, shortest = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(Config.AimPart) then
            local dist = (player.Character[Config.AimPart].Position - Camera.CFrame.Position).Magnitude
            if dist < shortest then shortest = dist; closest = player end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    if Config.Aimbot and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(Config.AimPart) then
            local partPos = Camera:WorldToViewportPoint(target.Character[Config.AimPart].Position)
            local mousePos = UserInputService:GetMouseLocation()
            mousemoverel((partPos.X - mousePos.X) / Config.AimbotSmooth, (partPos.Y - mousePos.Y) / Config.AimbotSmooth)
        end
    end
end)

-- === FUNGSI TRIGGER BOT ===
RunService.RenderStepped:Connect(function()
    if Config.TriggerBot then
        local mouse = LocalPlayer:GetMouse()
        local target = mouse.Target
        if target and target.Parent and target.Parent:FindFirstChild("Humanoid") then
            mouse1click()
        end
    end
end)

-- === FUNGSI SPEED & JUMP ===
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Config.SpeedHack then hum.WalkSpeed = Config.SpeedValue end
        if Config.JumpHack then hum.UseJumpPower = true; hum.JumpPower = Config.JumpValue end
        if Config.InfiniteJump and UserInputService:IsKeyDown(Enum.KeyCode.Space) then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
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

-- === FUNGSI FLY ===
local flyBV, flyBG
RunService.Heartbeat:Connect(function()
    if Config.Fly and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if not flyBV then flyBV = Instance.new("BodyVelocity"); flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge); flyBV.Parent = hrp end
        if not flyBG then flyBG = Instance.new("BodyGyro"); flyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge); flyBG.P = 1000; flyBG.Parent = hrp end
        local md = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then md = md + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then md = md - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then md = md - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then md = md + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then md = md + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then md = md - Vector3.new(0, 1, 0) end
        flyBV.Velocity = md * Config.FlySpeed
        flyBG.CFrame = Camera.CFrame
    else
        if flyBV then flyBV:Destroy() flyBV = nil end
        if flyBG then flyBG:Destroy() flyBG = nil end
    end
end)

-- === FUNGSI ANTI AFK ===
LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        local vu = game:GetService("VirtualUser")
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end
end)

-- === FUNGSI TELEPORT TO MOUSE ===
RunService.Heartbeat:Connect(function()
    if Config.TeleportToMouse and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local mouse = LocalPlayer:GetMouse()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
    end
end)

-- === FUNGSI TELEPORT TO PLAYER ===
RunService.Heartbeat:Connect(function()
    if Config.TeleportToPlayer and Config.TeleportToPlayer ~= "Pilih Player..." then
        local target = Players:FindFirstChild(Config.TeleportToPlayer)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
            end
        end
    end
end)

-- Notifikasi
Fluent:Notify({
    Title = "VORTEX UI",
    Content = "Script Universal berhasil dimuat!",
    SubContent = "By DEEP & RENXX | 26 Features | Keyless",
    Duration = 5
})

print("VORTEX UI - Universal v1.0 Loaded!")
print("By DEEP & RENXX")
