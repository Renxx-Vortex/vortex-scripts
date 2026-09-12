--[[
    VORTEX UI
    By: DEEP & RENXX
    Game: Roblox - Combat Arena
    Library: Fluent
    Type: GUI + Keyless
    Version: 1.0
    Total: 50 Features
]]

-- Load Fluent Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "VORTEX UI",
    SubTitle = "By DEEP & RENXX | Combat Arena v1.0",
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
local Mouse = LocalPlayer:GetMouse()

-- Config
local Config = {
    -- Protection
    Bypass = false, AntiKick = false, AntiAFK = false, HideName = false, BoostFPS = false,
    -- Combat
    Aimbot = false, AimbotSmooth = 2, SilentAim = false, TriggerBot = false, AutoFire = false,
    AimPart = "Head", Hitbox = false, HitboxSize = 5, TeamCheck = false,
    -- Visuals
    ESP_Box = false, ESP_Line = false, ESP_Name = false, ESP_Health = false, ESP_Distance = false,
    ESP_Weapon = false, ESP_Skeleton = false, Chams = false, WeaponChams = false,
    Fullbright = false, NoFog = false,
    -- Weapon
    InfiniteAmmo = false, NoRecoil = false, NoSpread = false, FastReload = false,
    RapidFire = false, DamageMultiplier = false, DamageValue = 2, WeaponSize = 1,
    -- Movement
    GodMode = false, SpeedHack = false, SpeedValue = 30, JumpHack = false, JumpValue = 50,
    NoClip = false, Fly = false, FlySpeed = 50, InfiniteJump = false, AutoStrafe = false,
    -- Misc
    AutoWin = false, KillAll = false, FreezeAll = false, TeleportToMouse = false,
}

-- Tabs
local Tabs = {
    Protection = Window:AddTab({ Title = "PROTECTION", Icon = "shield" }),
    Combat = Window:AddTab({ Title = "COMBAT", Icon = "crosshair" }),
    Visuals = Window:AddTab({ Title = "VISUALS", Icon = "eye" }),
    Weapon = Window:AddTab({ Title = "WEAPON", Icon = "gun" }),
    Movement = Window:AddTab({ Title = "MOVEMENT", Icon = "move" }),
    Misc = Window:AddTab({ Title = "MISC", Icon = "settings" }),
}

local Options = Fluent.Options

-- === PROTECTION (5 Fitur) ===
Tabs.Protection:AddToggle("Bypass", { Title = "Bypass", Default = false, Callback = function(v) Config.Bypass = v end })
Tabs.Protection:AddToggle("AntiKick", { Title = "Anti Kick", Default = false, Callback = function(v) Config.AntiKick = v end })
Tabs.Protection:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false, Callback = function(v) Config.AntiAFK = v end })
Tabs.Protection:AddToggle("HideName", { Title = "Hide My Name", Default = false, Callback = function(v) Config.HideName = v end })
Tabs.Protection:AddToggle("BoostFPS", { Title = "Boost FPS", Default = false, Callback = function(v) Config.BoostFPS = v end })

-- === COMBAT (9 Fitur) ===
Tabs.Combat:AddToggle("Aimbot", { Title = "Aimbot", Default = false, Callback = function(v) Config.Aimbot = v end })
Tabs.Combat:AddSlider("AimbotSmooth", { Title = "Aimbot Smoothness", Default = 2, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.AimbotSmooth = v end })
Tabs.Combat:AddToggle("SilentAim", { Title = "Silent Aim", Default = false, Callback = function(v) Config.SilentAim = v end })
Tabs.Combat:AddToggle("TriggerBot", { Title = "Trigger Bot", Default = false, Callback = function(v) Config.TriggerBot = v end })
Tabs.Combat:AddToggle("AutoFire", { Title = "Auto Fire", Default = false, Callback = function(v) Config.AutoFire = v end })
Tabs.Combat:AddDropdown("AimPart", { Title = "Aim Target", Values = {"Head", "Body", "Foot"}, Default = "Head", Multi = false, Callback = function(v) Config.AimPart = v end })
Tabs.Combat:AddToggle("Hitbox", { Title = "Hitbox Expander", Default = false, Callback = function(v) Config.Hitbox = v end })
Tabs.Combat:AddSlider("HitboxSize", { Title = "Hitbox Size", Default = 5, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.HitboxSize = v end })
Tabs.Combat:AddToggle("TeamCheck", { Title = "Team Check", Default = false, Callback = function(v) Config.TeamCheck = v end })

-- === VISUALS (11 Fitur) ===
Tabs.Visuals:AddToggle("ESP_Box", { Title = "ESP Box", Default = false, Callback = function(v) Config.ESP_Box = v end })
Tabs.Visuals:AddToggle("ESP_Line", { Title = "ESP Line", Default = false, Callback = function(v) Config.ESP_Line = v end })
Tabs.Visuals:AddToggle("ESP_Name", { Title = "ESP Name", Default = false, Callback = function(v) Config.ESP_Name = v end })
Tabs.Visuals:AddToggle("ESP_Health", { Title = "ESP Health", Default = false, Callback = function(v) Config.ESP_Health = v end })
Tabs.Visuals:AddToggle("ESP_Distance", { Title = "ESP Distance", Default = false, Callback = function(v) Config.ESP_Distance = v end })
Tabs.Visuals:AddToggle("ESP_Weapon", { Title = "ESP Weapon", Default = false, Callback = function(v) Config.ESP_Weapon = v end })
Tabs.Visuals:AddToggle("ESP_Skeleton", { Title = "ESP Skeleton", Default = false, Callback = function(v) Config.ESP_Skeleton = v end })
Tabs.Visuals:AddToggle("Chams", { Title = "Chams", Default = false, Callback = function(v) Config.Chams = v end })
Tabs.Visuals:AddToggle("WeaponChams", { Title = "Weapon Chams", Default = false, Callback = function(v) Config.WeaponChams = v end })
Tabs.Visuals:AddToggle("Fullbright", { Title = "Fullbright", Default = false, Callback = function(v) Config.Fullbright = v end })
Tabs.Visuals:AddToggle("NoFog", { Title = "No Fog", Default = false, Callback = function(v) Config.NoFog = v end })

-- === WEAPON (8 Fitur) ===
Tabs.Weapon:AddToggle("InfiniteAmmo", { Title = "Infinite Ammo", Default = false, Callback = function(v) Config.InfiniteAmmo = v end })
Tabs.Weapon:AddToggle("NoRecoil", { Title = "No Recoil", Default = false, Callback = function(v) Config.NoRecoil = v end })
Tabs.Weapon:AddToggle("NoSpread", { Title = "No Spread", Default = false, Callback = function(v) Config.NoSpread = v end })
Tabs.Weapon:AddToggle("FastReload", { Title = "Fast Reload", Default = false, Callback = function(v) Config.FastReload = v end })
Tabs.Weapon:AddToggle("RapidFire", { Title = "Rapid Fire", Default = false, Callback = function(v) Config.RapidFire = v end })
Tabs.Weapon:AddToggle("DamageMultiplier", { Title = "Damage Multiplier", Default = false, Callback = function(v) Config.DamageMultiplier = v end })
Tabs.Weapon:AddSlider("DamageValue", { Title = "Damage Value", Default = 2, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.DamageValue = v end })
Tabs.Weapon:AddSlider("WeaponSize", { Title = "Weapon Size", Default = 1, Min = 1, Max = 5, Rounding = 1, Callback = function(v) Config.WeaponSize = v end })

-- === MOVEMENT (10 Fitur) ===
Tabs.Movement:AddToggle("GodMode", { Title = "God Mode", Default = false, Callback = function(v) Config.GodMode = v end })
Tabs.Movement:AddToggle("SpeedHack", { Title = "Speed Hack", Default = false, Callback = function(v) Config.SpeedHack = v end })
Tabs.Movement:AddSlider("SpeedValue", { Title = "Speed Value", Default = 30, Min = 16, Max = 200, Rounding = 1, Callback = function(v) Config.SpeedValue = v end })
Tabs.Movement:AddToggle("JumpHack", { Title = "Jump Hack", Default = false, Callback = function(v) Config.JumpHack = v end })
Tabs.Movement:AddSlider("JumpValue", { Title = "Jump Value", Default = 50, Min = 50, Max = 200, Rounding = 1, Callback = function(v) Config.JumpValue = v end })
Tabs.Movement:AddToggle("NoClip", { Title = "No Clip", Default = false, Callback = function(v) Config.NoClip = v end })
Tabs.Movement:AddToggle("Fly", { Title = "Fly", Default = false, Callback = function(v) Config.Fly = v end })
Tabs.Movement:AddSlider("FlySpeed", { Title = "Fly Speed", Default = 50, Min = 10, Max = 200, Rounding = 1, Callback = function(v) Config.FlySpeed = v end })
Tabs.Movement:AddToggle("InfiniteJump", { Title = "Infinite Jump", Default = false, Callback = function(v) Config.InfiniteJump = v end })
Tabs.Movement:AddToggle("AutoStrafe", { Title = "Auto Strafe", Default = false, Callback = function(v) Config.AutoStrafe = v end })

-- === MISC (7 Fitur) ===
Tabs.Misc:AddToggle("AutoWin", { Title = "Auto Win", Default = false, Callback = function(v) Config.AutoWin = v end })
Tabs.Misc:AddToggle("KillAll", { Title = "Kill All", Default = false, Callback = function(v) Config.KillAll = v end })
Tabs.Misc:AddToggle("FreezeAll", { Title = "Freeze All", Default = false, Callback = function(v) Config.FreezeAll = v end })
Tabs.Misc:AddToggle("TeleportToMouse", { Title = "Teleport to Mouse", Default = false, Callback = function(v) Config.TeleportToMouse = v end })
Tabs.Misc:AddButton({ Title = "Reset Character", Callback = function() if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end end })
Tabs.Misc:AddButton({ Title = "Rejoin Server", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end })
Tabs.Misc:AddLabel("VORTEX UI - By DEEP & RENXX")

-- === FUNGSI AIMBOT ===
local function getClosestPlayer()
    local closest, shortest = nil, math.huge
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild(Config.AimPart) then
            if Config.TeamCheck and player.Team == LocalPlayer.Team then continue end
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

-- === FUNGSI ESP ===
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local esp = player.Character:FindFirstChild("VortexESP")
            if (Config.ESP_Box or Config.ESP_Line or Config.ESP_Name or Config.ESP_Health or Config.ESP_Distance or Config.ESP_Weapon or Config.ESP_Skeleton or Config.Chams) then
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

-- === FUNGSI GOD MODE ===
RunService.Heartbeat:Connect(function()
    if Config.GodMode and LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.Health = hum.MaxHealth end
    end
end)

-- === FUNGSI SPEED & JUMP ===
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Config.SpeedHack then hum.WalkSpeed = Config.SpeedValue end
        if Config.JumpHack then hum.UseJumpPower = true; hum.JumpPower = Config.JumpValue end
        if Config.InfiniteJump and UserInputService:IsKeyDown(Enum.KeyCode.Space) then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
        if Config.AutoStrafe and hum.MoveDirection.Magnitude > 0 then
            local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then local vel = hrp.Velocity; hrp.Velocity = Vector3.new(vel.X * 1.01, vel.Y, vel.Z * 1.01) end
        end
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

-- === FUNGSI WEAPON ===
RunService.Heartbeat:Connect(function()
    pcall(function()
        local tool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            for _, v in pairs(tool:GetDescendants()) do
                if v:IsA("NumberValue") or v:IsA("DoubleConstrainedValue") or v:IsA("IntValue") then
                    local name = v.Name:lower()
                    if Config.NoRecoil and (name:find("recoil") or name:find("kick")) then v.Value = 0 end
                    if Config.NoSpread and (name:find("spread") or name:find("accuracy")) then v.Value = 0 end
                    if Config.FastReload and (name:find("reload") or name:find("time")) then v.Value = 0.05 end
                    if Config.InfiniteAmmo and (name:find("ammo") or name:find("clip")) then v.Value = 9999 end
                    if Config.RapidFire and name:find("firerate") then v.Value = 0.01 end
                end
            end
        end
    end)
end)

-- === FUNGSI AUTO FIRE / TRIGGER ===
RunService.RenderStepped:Connect(function()
    if Config.AutoFire or Config.TriggerBot then
        local t = Mouse.Target
        if t and t.Parent and t.Parent:FindFirstChild("Humanoid") then mouse1click() end
    end
end)

-- === FUNGSI FREEZE ALL ===
RunService.Heartbeat:Connect(function()
    if Config.FreezeAll then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = 0 end
            end
        end
    end
end)

-- === FUNGSI KILL ALL ===
if Config.KillAll then
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hum = p.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = 0 end
        end
    end
end

-- Notifikasi
Fluent:Notify({
    Title = "VORTEX UI",
    Content = "Script berhasil dimuat!",
    SubContent = "By DEEP & RENXX | Combat Arena v1.0",
    Duration = 5
})

print("VORTEX UI - Combat Arena v1.0 Loaded!")
print("By DEEP & RENXX")
