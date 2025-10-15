-- ExperienceF3X GUI
-- By: [Your Name]
-- Version: 1.0

local ExperienceF3X = {}

-- Create main screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ExperienceF3X"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Main container frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "main"
MainFrame.Size = UDim2.new(0, 500, 0, 600)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -300)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- UI Styling
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 100, 255)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Header with drag functionality
local Header = Instance.new("Frame")
Header.Name = "header"
Header.Size = UDim2.new(1, 0, 0, 60)
Header.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 8)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Name = "title"
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "ExperienceF3X"
Title.TextColor3 = Color3.fromRGB(100, 150, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Header

-- Minimize button
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "minimize"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(0.85, 0, 0.15, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 16
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Parent = Header

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeButton

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "close"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(0.92, 0, 0.15, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Search Box
local SearchBox = Instance.new("TextBox")
SearchBox.Name = "search"
SearchBox.Size = UDim2.new(0.9, 0, 0, 40)
SearchBox.Position = UDim2.new(0.05, 0, 0, 70)
SearchBox.PlaceholderText = "Search tools..."
SearchBox.Text = ""
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 180)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 16
SearchBox.Parent = MainFrame

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchBox

local SearchStroke = Instance.new("UIStroke")
SearchStroke.Color = Color3.fromRGB(0, 100, 255)
SearchStroke.Thickness = 1
SearchStroke.Parent = SearchBox

-- Tools Container
local ToolsContainer = Instance.new("ScrollingFrame")
ToolsContainer.Name = "toolsContainer"
ToolsContainer.Size = UDim2.new(0.9, 0, 0, 480)
ToolsContainer.Position = UDim2.new(0.05, 0, 0, 120)
ToolsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
ToolsContainer.BackgroundTransparency = 0.1
ToolsContainer.BorderSizePixel = 0
ToolsContainer.ScrollBarThickness = 6
ToolsContainer.Parent = MainFrame

local ToolsCorner = Instance.new("UICorner")
ToolsCorner.CornerRadius = UDim.new(0, 8)
ToolsCorner.Parent = ToolsContainer

-- Tools Layout
local ToolsLayout = Instance.new("UIGridLayout")
ToolsLayout.CellPadding = UDim2.new(0, 10, 0, 10)
ToolsLayout.CellSize = UDim2.new(0, 140, 0, 40)
ToolsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ToolsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ToolsLayout.Parent = ToolsContainer

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "toggle"
ToggleButton.Size = UDim2.new(0, 60, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
ToggleButton.Text = "F3X"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 30)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(255, 255, 255)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleButton

-- Music Player
local MusicPlayer = Instance.new("Frame")
MusicPlayer.Name = "musicPlayer"
MusicPlayer.Size = UDim2.new(0, 200, 0, 80)
MusicPlayer.Position = UDim2.new(0, 20, 0, 90)
MusicPlayer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MusicPlayer.BackgroundTransparency = 0.1
MusicPlayer.Visible = false
MusicPlayer.Parent = ScreenGui

local MusicCorner = Instance.new("UICorner")
MusicCorner.CornerRadius = UDim.new(0, 8)
MusicCorner.Parent = MusicPlayer

local MusicStroke = Instance.new("UIStroke")
MusicStroke.Color = Color3.fromRGB(0, 100, 255)
MusicStroke.Thickness = 2
MusicStroke.Parent = MusicPlayer

local PlayButton = Instance.new("TextButton")
PlayButton.Name = "play"
PlayButton.Size = UDim2.new(0, 60, 0, 30)
PlayButton.Position = UDim2.new(0.1, 0, 0.3, 0)
PlayButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
PlayButton.Text = "Play"
PlayButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayButton.TextSize = 14
PlayButton.Font = Enum.Font.Gotham
PlayButton.Parent = MusicPlayer

local StopButton = Instance.new("TextButton")
StopButton.Name = "stop"
StopButton.Size = UDim2.new(0, 60, 0, 30)
StopButton.Position = UDim2.new(0.55, 0, 0.3, 0)
StopButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
StopButton.Text = "Stop"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.TextSize = 14
StopButton.Font = Enum.Font.Gotham
StopButton.Parent = MusicPlayer

-- Define tools (only music and visual tools that work)
local Tools = {
    Music = {
        {Name = "Play Music", Function = function() PlayBackgroundMusic() end},
        {Name = "Stop Music", Function = function() StopBackgroundMusic() end},
        {Name = "Sound Effects", Function = function() PlaySoundEffect() end}
    },
    Visual = {
        {Name = "Change Sky", Function = function() ChangeSkybox() end},
        {Name = "Color Parts", Function = function() ColorParts() end},
        {Name = "Add Sparkles", Function = function() AddSparklesVisual() end},
        {Name = "Rainbow Effect", Function = function() RainbowEffect() end},
        {Name = "Create Base", Function = function() CreateBaseVisual() end},
        {Name = "Spawn Blocks", Function = function() SpawnBlocks() end}
    },
    Fun = {
        {Name = "Dance Party", Function = function() DanceParty() end},
        {Name = "Light Show", Function = function() LightShow() end},
        {Name = "Fireworks", Function = function() Fireworks() end},
        {Name = "Floating Text", Function = function() FloatingText() end}
    }
}

-- Create tool buttons
local function CreateToolButtons()
    for category, tools in pairs(Tools) do
        -- Add category label
        local CategoryLabel = Instance.new("TextLabel")
        CategoryLabel.Name = category .. "Label"
        CategoryLabel.Size = UDim2.new(1, 0, 0, 30)
        CategoryLabel.BackgroundTransparency = 1
        CategoryLabel.Text = category
        CategoryLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
        CategoryLabel.TextSize = 18
        CategoryLabel.Font = Enum.Font.GothamBold
        CategoryLabel.TextXAlignment = Enum.TextXAlignment.Left
        CategoryLabel.LayoutOrder = -1
        CategoryLabel.Parent = ToolsContainer
        
        -- Create buttons for each tool
        for _, tool in pairs(tools) do
            local ToolButton = Instance.new("TextButton")
            ToolButton.Name = tool.Name
            ToolButton.Size = UDim2.new(0, 140, 0, 40)
            ToolButton.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
            ToolButton.Text = tool.Name
            ToolButton.TextColor3 = Color3.fromRGB(200, 200, 255)
            ToolButton.TextSize = 12
            ToolButton.Font = Enum.Font.Gotham
            ToolButton.Parent = ToolsContainer
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Parent = ToolButton
            
            local ButtonStroke = Instance.new("UIStroke")
            ButtonStroke.Color = Color3.fromRGB(0, 100, 255)
            ButtonStroke.Thickness = 1
            ButtonStroke.Parent = ToolButton
            
            -- Connect click event
            ToolButton.MouseButton1Click:Connect(function()
                PlaySound()
                tool.Function()
            end)
        end
    end
end

-- Draggable functionality
local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos
    
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, 
                startPos.X.Offset + delta.X,
                startPos.Y.Scale, 
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Real-time search functionality
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local searchText = string.lower(SearchBox.Text)
    
    for _, child in pairs(ToolsContainer:GetChildren()) do
        if child:IsA("TextButton") then
            local toolName = string.lower(child.Text)
            if searchText == "" or string.find(toolName, searchText) then
                child.Visible = true
            else
                child.Visible = false
            end
        elseif child:IsA("TextLabel") then
            -- Hide category labels if all tools in category are hidden
            local categoryToolsVisible = false
            for _, toolChild in pairs(ToolsContainer:GetChildren()) do
                if toolChild:IsA("TextButton") and toolChild.Visible then
                    categoryToolsVisible = true
                    break
                end
            end
            child.Visible = categoryToolsVisible
        end
    end
end)

-- Toggle GUI visibility
ToggleButton.MouseButton1Click:Connect(function()
    PlaySound()
    MainFrame.Visible = not MainFrame.Visible
    if MainFrame.Visible then
        MainFrame.Size = UDim2.new(0, 500, 0, 600)
        ToolsContainer.Visible = true
        SearchBox.Visible = true
    end
end)

-- Minimize functionality
local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    PlaySound()
    isMinimized = not isMinimized
    if isMinimized then
        MainFrame.Size = UDim2.new(0, 500, 0, 60) -- Only show header
        ToolsContainer.Visible = false
        SearchBox.Visible = false
    else
        MainFrame.Size = UDim2.new(0, 500, 0, 600)
        ToolsContainer.Visible = true
        SearchBox.Visible = true
    end
end)

-- Close functionality
CloseButton.MouseButton1Click:Connect(function()
    PlaySound()
    MainFrame.Visible = false
end)

-- Sound function
function PlaySound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1838666492"
    sound.Volume = 0.3
    sound.Parent = game.Workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 2)
end

-- Background music
local backgroundMusic = nil
function PlayBackgroundMusic()
    if backgroundMusic then
        backgroundMusic:Stop()
    end
    
    backgroundMusic = Instance.new("Sound")
    backgroundMusic.SoundId = "rbxassetid://1838666492"
    backgroundMusic.Looped = true
    backgroundMusic.Volume = 0.5
    backgroundMusic.Parent = game.Workspace
    backgroundMusic:Play()
    
    -- Show music player
    MusicPlayer.Visible = true
end

function StopBackgroundMusic()
    if backgroundMusic then
        backgroundMusic:Stop()
        backgroundMusic = nil
    end
    MusicPlayer.Visible = false
end

function PlaySoundEffect()
    PlaySound()
end

-- Visual effects that actually work
function ChangeSkybox()
    local lighting = game:GetService("Lighting")
    
    -- Create a basic skybox using your image
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://72963082476059"
    sky.SkyboxDn = "rbxassetid://72963082476059"
    sky.SkyboxFt = "rbxassetid://72963082476059"
    sky.SkyboxLf = "rbxassetid://72963082476059"
    sky.SkyboxRt = "rbxassetid://72963082476059"
    sky.SkyboxUp = "rbxassetid://72963082476059"
    
    -- Clear existing sky
    for _, child in pairs(lighting:GetChildren()) do
        if child:IsA("Sky") then
            child:Destroy()
        end
    end
    
    sky.Parent = lighting
    PlaySound()
end

function ColorParts()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.random()
        end
    end
    PlaySound()
end

function AddSparklesVisual()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") and not part:FindFirstChild("Sparkles") then
            local sparkles = Instance.new("Sparkles")
            sparkles.Parent = part
        end
    end
    PlaySound()
end

function RainbowEffect()
    spawn(function()
        while task.wait(0.1) do
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                end
            end
        end
    end)
    PlaySound()
end

function CreateBaseVisual()
    local base = Instance.new("Part")
    base.Size = Vector3.new(100, 5, 100)
    base.Position = Vector3.new(0, 0, 0)
    base.Anchored = true
    base.BrickColor = BrickColor.new("Bright blue")
    base.Parent = workspace
    PlaySound()
end

function SpawnBlocks()
    for i = 1, 10 do
        local block = Instance.new("Part")
        block.Size = Vector3.new(4, 4, 4)
        block.Position = Vector3.new(math.random(-20, 20), 10, math.random(-20, 20))
        block.BrickColor = BrickColor.random()
        block.Parent = workspace
    end
    PlaySound()
end

function DanceParty()
    -- Simple dance party with colored lights
    local lighting = game:GetService("Lighting")
    
    spawn(function()
        while task.wait(0.5) do
            lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
            lighting.Brightness = math.random(1, 3)
        end
    end)
    PlaySound()
end

function LightShow()
    for i = 1, 20 do
        local light = Instance.new("PointLight")
        light.Brightness = 5
        light.Range = 20
        light.Color = Color3.new(math.random(), math.random(), math.random())
        
        local part = Instance.new("Part")
        part.Size = Vector3.new(1, 1, 1)
        part.Position = Vector3.new(math.random(-30, 30), math.random(5, 20), math.random(-30, 30))
        part.Anchored = true
        part.CanCollide = false
        part.Material = Enum.Material.Neon
        light.Parent = part
        part.Parent = workspace
    end
    PlaySound()
end

function Fireworks()
    for i = 1, 15 do
        spawn(function()
            local firework = Instance.new("Part")
            firework.Size = Vector3.new(1, 1, 1)
            firework.Position = Vector3.new(math.random(-20, 20), 0, math.random(-20, 20))
            firework.Anchored = false
            firework.BrickColor = BrickColor.random()
            firework.Parent = workspace
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 50, 0)
            bodyVelocity.Parent = firework
            
            game:GetService("Debris"):AddItem(firework, 3)
        end)
    end
    PlaySound()
end

function FloatingText()
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "ExperienceF3X!"
    textLabel.TextColor3 = Color3.new(0, 1, 1)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Parent = billboard
    
    billboard.Parent = game.Players.LocalPlayer.Character.Head
    PlaySound()
end

-- Music player controls
PlayButton.MouseButton1Click:Connect(function()
    PlayBackgroundMusic()
end)

StopButton.MouseButton1Click:Connect(function()
    StopBackgroundMusic()
end)

-- Initialize the GUI
CreateToolButtons()
MakeDraggable(MainFrame, Header)
MakeDraggable(MusicPlayer, MusicPlayer)

return ExperienceF3X
