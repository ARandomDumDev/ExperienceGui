-- ExperienceGui LocalScript
-- Place this as a LocalScript in StarterPlayerScripts or use an executor

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ExperienceGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Main Frame (Fancy with gradient and rounded corners)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Rounded corners for mainFrame
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Gradient for mainFrame
local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
}
mainGradient.Rotation = 45
mainGradient.Parent = mainFrame

-- Password Frame (initially visible)
local passwordFrame = Instance.new("Frame")
passwordFrame.Name = "PasswordFrame"
passwordFrame.Size = UDim2.new(1, 0, 1, 0)
passwordFrame.Position = UDim2.new(0, 0, 0, 0)
passwordFrame.BackgroundTransparency = 1
passwordFrame.Parent = mainFrame

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 20)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Enter Password to Unlock"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = passwordFrame

-- Password TextBox
local passwordBox = Instance.new("TextBox")
passwordBox.Name = "PasswordBox"
passwordBox.Size = UDim2.new(0.8, 0, 0, 40)
passwordBox.Position = UDim2.new(0.1, 0, 0, 80)
passwordBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
passwordBox.BorderSizePixel = 0
passwordBox.Text = ""
passwordBox.PlaceholderText = "Password..."
passwordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
passwordBox.TextScaled = true
passwordBox.Font = Enum.Font.Gotham
passwordBox.Parent = passwordFrame

local passwordCorner = Instance.new("UICorner")
passwordCorner.CornerRadius = UDim.new(0, 8)
passwordCorner.Parent = passwordBox

-- Unlock Button
local unlockButton = Instance.new("TextButton")
unlockButton.Name = "UnlockButton"
unlockButton.Size = UDim2.new(0.8, 0, 0, 40)
unlockButton.Position = UDim2.new(0.1, 0, 0, 140)
unlockButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
unlockButton.BorderSizePixel = 0
unlockButton.Text = "Unlock"
unlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
unlockButton.TextScaled = true
unlockButton.Font = Enum.Font.GothamBold
unlockButton.Parent = passwordFrame

local unlockCorner = Instance.new("UICorner")
unlockCorner.CornerRadius = UDim.new(0, 8)
unlockCorner.Parent = unlockButton

-- Button hover effect
local buttonTween = TweenService:Create(unlockButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 120, 200)})
unlockButton.MouseEnter:Connect(function()
    buttonTween:Play()
end)
unlockButton.MouseLeave:Connect(function()
    buttonTween = TweenService:Create(unlockButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 162, 255)})
    buttonTween:Play()
end)

-- Tabs Frame (initially invisible)
local tabsFrame = Instance.new("Frame")
tabsFrame.Name = "TabsFrame"
tabsFrame.Size = UDim2.new(1, 0, 1, 0)
tabsFrame.Position = UDim2.new(0, 0, 0, 0)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = mainFrame
tabsFrame.Visible = false

-- Tab Buttons Frame
local tabButtons = Instance.new("Frame")
tabButtons.Name = "TabButtons"
tabButtons.Size = UDim2.new(1, 0, 0, 40)
tabButtons.Position = UDim2.new(0, 0, 0, 0)
tabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabButtons.BorderSizePixel = 0
tabButtons.Parent = tabsFrame

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 12)
tabCorner.Parent = tabButtons

-- Loader Tab Button
local loaderTab = Instance.new("TextButton")
loaderTab.Name = "LoaderTab"
loaderTab.Size = UDim2.new(0.5, 0, 1, 0)
loaderTab.Position = UDim2.new(0, 0, 0, 0)
loaderTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
loaderTab.BorderSizePixel = 0
loaderTab.Text = "Loader"
loaderTab.TextColor3 = Color3.fromRGB(255, 255, 255)
loaderTab.TextScaled = true
loaderTab.Font = Enum.Font.Gotham
loaderTab.Parent = tabButtons

-- Basic Needs Tab Button
local basicTab = Instance.new("TextButton")
basicTab.Name = "BasicTab"
basicTab.Size = UDim2.new(0.5, 0, 1, 0)
basicTab.Position = UDim2.new(0.5, 0, 0, 0)
basicTab.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
basicTab.BorderSizePixel = 0
basicTab.Text = "Basic Needs"
basicTab.TextColor3 = Color3.fromRGB(255, 255, 255)
basicTab.TextScaled = true
basicTab.Font = Enum.Font.Gotham
basicTab.Parent = tabButtons

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 1, -40)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = tabsFrame

-- Loader Content
local loaderContent = Instance.new("Frame")
loaderContent.Name = "LoaderContent"
loaderContent.Size = UDim2.new(1, 0, 1, 0)
loaderContent.BackgroundTransparency = 1
loaderContent.Visible = true
loaderContent.Parent = contentFrame

local loaderLabel = Instance.new("TextLabel")
loaderLabel.Size = UDim2.new(1, 0, 1, 0)
loaderLabel.BackgroundTransparency = 1
loaderLabel.Text = "Loader Activated!"
loaderLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
loaderLabel.TextScaled = true
loaderLabel.Font = Enum.Font.GothamBold
loaderLabel.Parent = loaderContent

-- Basic Needs Content
local basicContent = Instance.new("Frame")
basicContent.Name = "BasicContent"
basicContent.Size = UDim2.new(1, 0, 1, 0)
basicContent.BackgroundTransparency = 1
basicContent.Visible = false
basicContent.Parent = contentFrame

-- Fly Toggle Button
local flyButton = Instance.new("TextButton")
flyButton.Name = "FlyButton"
flyButton.Size = UDim2.new(0.8, 0, 0, 50)
flyButton.Position = UDim2.new(0.1, 0, 0, 20)
flyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
flyButton.BorderSizePixel = 0
flyButton.Text = "Fly: OFF"
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.TextScaled = true
flyButton.Font = Enum.Font.GothamBold
flyButton.Parent = basicContent

local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 8)
flyCorner.Parent = flyButton

-- Speed Slider Frame
local speedFrame = Instance.new("Frame")
speedFrame.Name = "SpeedFrame"
speedFrame.Size = UDim2.new(0.8, 0, 0, 60)
speedFrame.Position = UDim2.new(0.1, 0, 0, 90)
speedFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedFrame.BorderSizePixel = 0
speedFrame.Parent = basicContent

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0, 8)
speedCorner.Parent = speedFrame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0.5, 0)
speedLabel.Position = UDim2.new(0, 0, 0, 0)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Walk Speed"
speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
speedLabel.TextScaled = true
speedLabel.Font = Enum.Font.Gotham
speedLabel.Parent = speedFrame

-- Simple Slider (TextBox for input, mobile-friendly large touch area)
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(1, 0, 0.5, 0)
speedInput.Position = UDim2.new(0, 0, 0.5, 0)
speedInput.BackgroundTransparency = 1
speedInput.Text = "16"
speedInput.PlaceholderText = "Speed (16 default)"
speedInput.TextColor3 = Color3.fromRGB(255, 255, 255)
speedInput.TextScaled = true
speedInput.Font = Enum.Font.Gotham
speedInput.Parent = speedFrame

-- Fly variables
local flying = false
local flySpeed = 50
local bodyVelocity = nil
local bodyAngularVelocity = nil

local function startFly()
    local character = player.Character
    if not character then return end
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    flying = true
    flyButton.Text = "Fly: ON"
    flyButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = humanoidRootPart
    
    bodyAngularVelocity = Instance.new("BodyAngularVelocity")
    bodyAngularVelocity.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
    bodyAngularVelocity.Parent = humanoidRootPart
    
    -- Fly control loop (keyboard for PC, note: for mobile, use external controls or gamepad)
    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not flying or not character or not humanoidRootPart then
            connection:Disconnect()
            return
        end
        
        local camera = workspace.CurrentCamera
        local moveVector = Vector3.new(0, 0, 0)
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveVector = moveVector + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveVector = moveVector - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveVector = moveVector - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveVector = moveVector + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveVector = moveVector + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
            moveVector = moveVector - Vector3.new(0, 1, 0)
        end
        
        bodyVelocity.Velocity = moveVector * flySpeed
    end)
end

local function stopFly()
    flying = false
    flyButton.Text = "Fly: OFF"
    flyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    if bodyAngularVelocity then
        bodyAngularVelocity:Destroy()
        bodyAngularVelocity = nil
    end
end

flyButton.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
    else
        startFly()
    end
end)

-- Speed change
speedInput.FocusLost:Connect(function()
    local speed = tonumber(speedInput.Text) or 16
    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end)

-- Tab switching
local function switchTab(tabName)
    loaderContent.Visible = (tabName == "Loader")
    basicContent.Visible = (tabName == "Basic")
    
    loaderTab.BackgroundColor3 = (tabName == "Loader") and Color3.fromRGB(0, 162, 255) or Color3.fromRGB(60, 60, 60)
    basicTab.BackgroundColor3 = (tabName == "Basic") and Color3.fromRGB(0, 162, 255) or Color3.fromRGB(60, 60, 60)
end

loaderTab.MouseButton1Click:Connect(function()
    switchTab("Loader")
end)

basicTab.MouseButton1Click:Connect(function()
    switchTab("Basic")
end)

-- Unlock logic
unlockButton.MouseButton1Click:Connect(function()
    if passwordBox.Text == "CoolDownExperience" then
        -- Run the loader
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader.lua", true))()
        
        -- Switch to tabs
        passwordFrame.Visible = false
        tabsFrame.Visible = true
        switchTab("Loader")
        
        -- Fancy unlock animation
        local tween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 450, 0, 350)})
        tween:Play()
    else
        -- Wrong password shake
        local shake = TweenService:Create(passwordBox, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, 0, true), {Position = UDim2.new(0.1, 10, 0, 80)})
        shake:Play()
    end
end)

-- Initial size tween for fancy entrance
local entranceTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0, 400, 0, 300)})
entranceTween:Play()
