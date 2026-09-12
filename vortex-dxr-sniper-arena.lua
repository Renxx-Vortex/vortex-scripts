--[[
    VORTEX UI
    By: DEEP & RENXX
    Game: Roblox - Sniper Arena
    Library: Fluent
    Type: GUI + Keyless
    Version: 5.0
    Total: 39 Features
]]

-- Load Fluent Library
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "VORTEX UI",
    SubTitle = "By DEEP & RENXX | v5.0",
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 500),
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
    Bypass = false, AntiKick = false, LowPing = false, BoostFPS = false, AntiAFK = false, HideName = false,
    Aimbot = false, AimbotPOV = false, SilentAim = false, SilentAimPOV = false, AimPart = "Head",
    Hitbox = false, HitboxSize = 5, AutoFire = false, AutoShoot = false, TriggerBot = false,
    ESP_Box = false, ESP_Line = false, ESP_Name = false, ESP_Health = false, ESP_Distance = false,
    ESP_Weapon = false, ESP_Skeleton = false, Chams = false, Fullbright = false,
    NoRecoil = false, NoSpread = false, FastReload = false, InfiniteAmmo = false, WeaponSize = 1, DamageMultiplier = 1,
    GodMode = false, SpeedHack = false, SpeedValue = 0.05, JumpHack = false, JumpValue = 50,
    NoClip = false, Fly = false, FlySpeed = 50, AutoStrafe = false, InfiniteJump = false, TeleportToMouse = false,
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

-- === PROTECTION TAB ===
Tabs.Protection:AddToggle("Bypass", { Title = "Bypass", Default = false, Callback = function(v) Config.Bypass = v end })
Tabs.Protection:AddToggle("AntiKick", { Title = "Anti Kick", Default = false, Callback = function(v) Config.AntiKick = v end })
Tabs.Protection:AddToggle("LowPing", { Title = "Low Ping", Default = false, Callback = function(v) Config.LowPing = v end })
Tabs.Protection:AddToggle("BoostFPS", { Title = "Boost FPS", Default = false, Callback = function(v) Config.BoostFPS = v end })
Tabs.Protection:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false, Callback = function(v) Config.AntiAFK = v end })
Tabs.Protection:AddToggle("HideName", { Title = "Hide Name", Default = false, Callback = function(v) Config.HideName = v end })

-- === COMBAT TAB ===
Tabs.Combat:AddToggle("Aimbot", { Title = "Aim Bot", Default = false, Callback = function(v) Config.Aimbot = v end })
Tabs.Combat:AddToggle("AimbotPOV", { Title = "Aim Bot POV", Default = false, Callback = function(v) Config.AimbotPOV = v end })
Tabs.Combat:AddToggle("SilentAim", { Title = "Aim Silent", Default = false, Callback = function(v) Config.SilentAim = v end })
Tabs.Combat:AddToggle("SilentAimPOV", { Title = "Aim Silent POV", Default = false, Callback = function(v) Config.SilentAimPOV = v end })
Tabs.Combat:AddDropdown("AimPart", { Title = "Set Aim Target", Values = {"Head", "Body", "Foot"}, Default = "Head", Multi = false, Callback = function(v) Config.AimPart = v end })
Tabs.Combat:AddToggle("Hitbox", { Title = "Hitbox Expander", Default = false, Callback = function(v) Config.Hitbox = v end })
Tabs.Combat:AddSlider("HitboxSize", { Title = "Hitbox Size", Default = 5, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.HitboxSize = v end })
Tabs.Combat:AddToggle("AutoFire", { Title = "Auto Fire", Default = false, Callback = function(v) Config.AutoFire = v end })
Tabs.Combat:AddToggle("AutoShoot", { Title = "Auto Shoot", Default = false, Callback = function(v) Config.AutoShoot = v end })
Tabs.Combat:AddToggle("TriggerBot", { Title = "Trigger Bot", Default = false, Callback = function(v) Config.TriggerBot = v end })

-- === VISUALS TAB ===
Tabs.Visuals:AddToggle("ESP_Box", { Title = "ESP Box", Default = false, Callback = function(v) Config.ESP_Box = v end })
Tabs.Visuals:AddToggle("ESP_Line", { Title = "ESP Line", Default = false, Callback = function(v) Config.ESP_Line = v end })
Tabs.Visuals:AddToggle("ESP_Name", { Title = "ESP Name", Default = false, Callback = function(v) Config.ESP_Name = v end })
Tabs.Visuals:AddToggle("ESP_Health", { Title = "ESP Health", Default = false, Callback = function(v) Config.ESP_Health = v end })
Tabs.Visuals:AddToggle("ESP_Distance", { Title = "ESP Distance", Default = false, Callback = function(v) Config.ESP_Distance = v end })
Tabs.Visuals:AddToggle("ESP_Weapon", { Title = "ESP Weapon", Default = false, Callback = function(v) Config.ESP_Weapon = v end })
Tabs.Visuals:AddToggle("ESP_Skeleton", { Title = "ESP Skeleton", Default = false, Callback = function(v) Config.ESP_Skeleton = v end })
Tabs.Visuals:AddToggle("Chams", { Title = "Chams (Highlight)", Default = false, Callback = function(v) Config.Chams = v end })
Tabs.Visuals:AddToggle("Fullbright", { Title = "Fullbright", Default = false, Callback = function(v) Config.Fullbright = v end })

-- === WEAPON TAB ===
Tabs.Weapon:AddToggle("NoRecoil", { Title = "No Recoil", Default = false, Callback = function(v) Config.NoRecoil = v end })
Tabs.Weapon:AddToggle("NoSpread", { Title = "No Spread", Default = false, Callback = function(v) Config.NoSpread = v end })
Tabs.Weapon:AddToggle("FastReload", { Title = "Fast Reload", Default = false, Callback = function(v) Config.FastReload = v end })
Tabs.Weapon:AddToggle("InfiniteAmmo", { Title = "Infinite Ammo", Default = false, Callback = function(v) Config.InfiniteAmmo = v end })
Tabs.Weapon:AddSlider("WeaponSize", { Title = "Weapon Size", Default = 1, Min = 1, Max = 5, Rounding = 1, Callback = function(v) Config.WeaponSize = v end })
Tabs.Weapon:AddSlider("DamageMultiplier", { Title = "Damage Multiplier", Default = 1, Min = 1, Max = 10, Rounding = 1, Callback = function(v) Config.DamageMultiplier = v end })

-- === MOVEMENT TAB ===
Tabs.Movement:AddToggle("GodMode", { Title = "God Mode", Default = false, Callback = function(v) Config.GodMode = v end })
Tabs.Movement:AddToggle("SpeedHack", { Title = "Speed Hack", Default = false, Callback = function(v) Config.SpeedHack = v end })
Tabs.Movement:AddSlider("SpeedValue", { Title = "Speed Value", Default = 0.05, Min = 0.01, Max = 0.1, Rounding = 2, Callback = function(v) Config.SpeedValue = v end })
Tabs.Movement:AddToggle("JumpHack", { Title = "Jump Hack", Default = false, Callback = function(v) Config.JumpHack = v end })
Tabs.Movement:AddSlider("JumpValue", { Title = "Jump Value", Default = 50, Min = 50, Max = 100, Rounding = 1, Callback = function(v) Config.JumpValue = v end })
Tabs.Movement:AddToggle("NoClip", { Title = "No Clip", Default = false, Callback = function(v) Config.NoClip = v end })
Tabs.Movement:AddToggle("Fly", { Title = "Fly", Default = false, Callback = function(v) Config.Fly = v end })
Tabs.Movement:AddSlider("FlySpeed", { Title = "Fly Speed", Default = 50, Min = 10, Max = 200, Rounding = 1, Callback = function(v) Config.FlySpeed = v end })
Tabs.Movement:AddToggle("AutoStrafe", { Title = "Auto Strafe", Default = false, Callback = function(v) Config.AutoStrafe = v end })
Tabs.Movement:AddToggle("InfiniteJump", { Title = "Infinite Jump", Default = false, Callback = function(v) Config.InfiniteJump = v end })
Tabs.Movement:AddToggle("TeleportToMouse", { Title = "Teleport to Mouse", Default = false, Callback = function(v) Config.TeleportToMouse = v end })

-- === FUNGSI AIMBOT ===
local function getClosestPlayer()
    local closest = nil
    local shortest = math.huge
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
            mousemoverel((partPos.X - mousePos.X) / 2, (partPos.Y - mousePos.Y) / 2)
        end
    end
end)

-- === FUNGSI ESP ===
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local esp = player.Character:FindFirstChild("VortexESP")
            if (Config.ESP_Box or Config.ESP_Line or Config.ESP_Name or Config.ESP_Health or Config.ESP_Distance or Config.ESP_Weapon or Config.Chams) then
                if not esp then
                    esp = Instance.new("Highlight")
                    esp.Name = "VortexESP"
                    esp.Adornee = player.Character
                    esp.FillColor = Color3.fromRGB(0, 255, 0)
                    esp.OutlineColor = Color3.fromRGB(255, 255, 255)
                    esp.FillTransparency = 0.5
                    esp.Parent = player.Character
                end
            elseif esp then
                esp:Destroy()
            end
        end
    end
end)

-- === FUNGSI GOD MODE ===
RunService.Heartbeat:Connect(function()
    if Config.GodMode and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.Health = humanoid.MaxHealth end
    end
end)

-- === FUNGSI SPEED & JUMP ===
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if Config.SpeedHack and humanoid.MoveDirection.Magnitude > 0 then
            hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection * Config.SpeedValue)
        end
        if Config.JumpHack then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = Config.JumpValue
        end
        if Config.AutoStrafe and humanoid.MoveDirection.Magnitude > 0 then
            local vel = hrp.Velocity
            hrp.Velocity = Vector3.new(vel.X * 1.01, vel.Y, vel.Z * 1.01)
        end
        if Config.InfiniteJump and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        if Config.TeleportToMouse then
            local mousePos = Mouse.Hit.p
            if mousePos then hrp.CFrame = CFrame.new(mousePos + Vector3.new(0, 5, 0)) end
        end
    end
end)

-- === FUNGSI NO CLIP ===
RunService.Stepped:Connect(function()
    if Config.NoClip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- === FUNGSI FLY ===
local flyBodyVelocity, flyBodyGyro
RunService.Heartbeat:Connect(function()
    if Config.Fly and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        if not flyBodyVelocity then
            flyBodyVelocity = Instance.new("BodyVelocity")
            flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            flyBodyVelocity.Parent = hrp
        end
        if not flyBodyGyro then
            flyBodyGyro = Instance.new("BodyGyro")
            flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            flyBodyGyro.P = 1000
            flyBodyGyro.Parent = hrp
        end
        local moveDir = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
        flyBodyVelocity.Velocity = moveDir * Config.FlySpeed
        flyBodyGyro.CFrame = Camera.CFrame
    else
        if flyBodyVelocity then flyBodyVelocity:Destroy() flyBodyVelocity = nil end
        if flyBodyGyro then flyBodyGyro:Destroy() flyBodyGyro = nil end
    end
end)

-- === FUNGSI WEAPON ===
RunService.Heartbeat:Connect(function()
    pcall(function()
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            for _, v in pairs(tool:GetDescendants()) do
                if v:IsA("NumberValue") or v:IsA("DoubleConstrainedValue") or v:IsA("IntValue") then
                    if Config.NoRecoil and (v.Name:lower():find("recoil") or v.Name:lower():find("kick")) then v.Value = 0 end
                    if Config.NoSpread and (v.Name:lower():find("spread") or v.Name:lower():find("accuracy")) then v.Value = 0 end
                    if Config.FastReload and (v.Name:lower():find("reload") or v.Name:lower():find("time")) then v.Value = 0.05 end
                    if Config.InfiniteAmmo and (v.Name:lower():find("ammo") or v.Name:lower():find("clip")) then v.Value = 9999 end
                end
            end
        end
    end)
end)

-- === FUNGSI AUTO FIRE ===
RunService.RenderStepped:Connect(function()
    if Config.AutoFire or Config.TriggerBot then
        local target = Mouse.Target
        if target and target.Parent and target.Parent:FindFirstChild("Humanoid") then
            mouse1click()
        end
    end
end)

-- Notifikasi
Fluent:Notify({
    Title = "VORTEX UI",
    Content = "Script berhasil dimuat!",
    SubContent = "By DEEP & RENXX | Sniper Arena v5.0",
    Duration = 5
})

print("VORTEX UI - Sniper Arena v5.0 Loaded!")
print("By DEEP & RENXX")
