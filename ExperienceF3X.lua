-- ExperienceF3X GUI
-- By: Cooldownexperience
-- Version: 2.0

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

-- Define ALL tools including destructive commands
local Tools = {
    Destruction = {
        {Name = "Delete All", Function = function() DeleteAll() end},
        {Name = "Kill All", Function = function() KillAll() end},
        {Name = "Clear Map", Function = function() ClearMap() end},
        {Name = "Unanchor All", Function = function() UnanchorAll() end},
        {Name = "Remove Spawns", Function = function() RemoveSpawns() end},
        {Name = "Break Tools", Function = function() BreakTools() end},
        {Name = "Destroy GUI", Function = function() DestroyGUI() end},
        {Name = "Wipe Baseplate", Function = function() WipeBaseplate() end}
    },
    Building = {
        {Name = "BTools", Function = function() GiveBTools() end},
        {Name = "F3X Tools", Function = function() GiveF3X() end},
        {Name = "Build Tools", Function = function() GiveBuildTools() end},
        {Name = "Material Tool", Function = function() GiveMaterialTool() end},
        {Name = "Clone Tool", Function = function() GiveCloneTool() end},
        {Name = "Delete Tool", Function = function() GiveDeleteTool() end}
    },
    Admin = {
        {Name = "Kick All", Function = function() KickAll() end},
        {Name = "Ban All", Function = function() BanAll() end},
        {Name = "Shutdown", Function = function() ShutdownServer() end},
        {Name = "Freeze All", Function = function() FreezeAll() end},
        {Name = "Thaw All", Function = function() ThawAll() end},
        {Name = "God Mode", Function = function() GodMode() end},
        {Name = "Invisible", Function = function() Invisible() end},
        {Name = "Fly", Function = function() Fly() end},
        {Name = "Speed", Function = function() Speed() end},
        {Name = "Jump", Function = function() HighJump() end}
    },
    Fun = {
        {Name = "Sky Changer", Function = function() ChangeSkybox() end},
        {Name = "666 Mode", Function = function() SixSixSixMode() end},
        {Name = "Decal Spam", Function = function() DecalSpam() end},
        {Name = "Random Colors", Function = function() RandomColors() end},
        {Name = "Sparkles", Function = function() AddSparkles() end},
        {Name = "Baseplate", Function = function() CreateBaseplate() end},
        {Name = "Spawn Parts", Function = function() SpawnParts() end},
        {Name = "Rain Parts", Function = function() RainParts() end},
        {Name = "Create Realm", Function = function() CreateRealm() end},
        {Name = "Random Meshes", Function = function() RandomMeshes() end},
        {Name = "Black White", Function = function() BlackWhite() end},
        {Name = "Grass Block", Function = function() GrassBlock() end},
        {Name = "Change Material", Function = function() ChangeMaterial() end}
    },
    Music = {
        {Name = "Play Music", Function = function() PlayBackgroundMusic() end},
        {Name = "Stop Music", Function = function() StopBackgroundMusic() end},
        {Name = "Sound Effects", Function = function() PlaySoundEffect() end}
    },
    Tools = {
        {Name = "Eraser Tool", Function = function() CreateEraser() end},
        {Name = "Draw Tool", Function = function() CreateDrawTool() end},
        {Name = "Stoneify Tool", Function = function() CreateStoneify() end},
        {Name = "John Doe Trail", Function = function() CreateTrail() end},
        {Name = "Money Bag", Function = function() CreateMoneyBag() end},
        {Name = "Thomas Train", Function = function() CreateTrain() end}
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
                if toolChild:IsA("TextButton") and toolChild.Visible and toolChild.Parent == ToolsContainer then
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
end

function StopBackgroundMusic()
    if backgroundMusic then
        backgroundMusic:Stop()
        backgroundMusic = nil
    end
end

function PlaySoundEffect()
    PlaySound()
end

-- DESTRUCTIVE COMMANDS (Fixed)
function DeleteAll()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("BasePart") and obj ~= workspace.Terrain then
            obj:Destroy()
        end
    end
    PlaySound()
end

function KillAll()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
    end
    PlaySound()
end

function ClearMap()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj ~= game.Players.LocalPlayer.Character then
            obj:Destroy()
        end
    end
    PlaySound()
end

function UnanchorAll()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") then
            obj.Anchored = false
        end
    end
    PlaySound()
end

function RemoveSpawns()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("SpawnLocation") then
            obj:Destroy()
        end
    end
    PlaySound()
end

function BreakTools()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            player.Backpack:ClearAllChildren()
            if player.Character then
                for _, tool in pairs(player.Character:GetChildren()) do
                    if tool:IsA("Tool") then
                        tool:Destroy()
                    end
                end
            end
        end
    end
    PlaySound()
end

function DestroyGUI()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local playerGui = player:FindFirstChild("PlayerGui")
            if playerGui then
                playerGui:ClearAllChildren()
            end
        end
    end
    PlaySound()
end

function WipeBaseplate()
    local terrain = workspace:FindFirstChildOfClass("Terrain")
    if terrain then
        workspace.Terrain:Clear()
    end
    PlaySound()
end

-- BUILDING TOOLS (Fixed)
function GiveBTools()
    local tools = {"Hammer", "Clone", "Grab"}
    for _, toolName in pairs(tools) do
        local tool = Instance.new("Tool")
        tool.Name = toolName
        tool.RequiresHandle = false
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
    PlaySound()
end

function GiveF3X()
    -- This would require the actual F3X model, but we can create basic building tools
    local f3x = Instance.new("Tool")
    f3x.Name = "F3X"
    f3x.RequiresHandle = false
    f3x.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function GiveBuildTools()
    GiveBTools()
    PlaySound()
end

function GiveMaterialTool()
    local tool = Instance.new("Tool")
    tool.Name = "Material"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function GiveCloneTool()
    local tool = Instance.new("Tool")
    tool.Name = "Clone"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function GiveDeleteTool()
    local tool = Instance.new("Tool")
    tool.Name = "Delete"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

-- ADMIN COMMANDS (Fixed)
function KickAll()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            player:Kick("Kicked by ExperienceF3X")
        end
    end
    PlaySound()
end

function BanAll()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            -- Ban implementation would vary by game
            player:Kick("Banned by ExperienceF3X")
        end
    end
    PlaySound()
end

function ShutdownServer()
    game:GetService("TeleportService"):Teleport(game.PlaceId)
    PlaySound()
end

function FreezeAll()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = true
            end
        end
    end
    PlaySound()
end

function ThawAll()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end
    PlaySound()
end

function GodMode()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        end
    end
    PlaySound()
end

function Invisible()
    local character = game.Players.LocalPlayer.Character
    if character then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
            end
        end
    end
    PlaySound()
end

function Fly()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.PlatformStand = true
    local bodyGyro = Instance.new("BodyGyro")
    bodyGyro.Parent = character.HumanoidRootPart
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Parent = character.HumanoidRootPart
    bodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
    
    PlaySound()
end

function Speed()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 100
    end
    PlaySound()
end

function HighJump()
    local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = 200
    end
    PlaySound()
end

-- FUN/VISUAL COMMANDS (Fixed)
function ChangeSkybox()
    local lighting = game:GetService("Lighting")
    for _, child in pairs(lighting:GetChildren()) do
        if child:IsA("Sky") then
            child:Destroy()
        end
    end
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://72963082476059"
    sky.SkyboxDn = "rbxassetid://72963082476059"
    sky.SkyboxFt = "rbxassetid://72963082476059"
    sky.SkyboxLf = "rbxassetid://72963082476059"
    sky.SkyboxRt = "rbxassetid://72963082476059"
    sky.SkyboxUp = "rbxassetid://72963082476059"
    sky.Parent = lighting
    PlaySound()
end

function SixSixSixMode()
    -- Apply dark theme with red accents
    local lighting = game:GetService("Lighting")
    lighting.Ambient = Color3.new(0.1, 0, 0)
    lighting.Brightness = 2
    lighting.FogColor = Color3.new(0.2, 0, 0)
    lighting.FogEnd = 500
    
    -- Add red lighting to all parts
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Color = Color3.new(0.3, 0, 0)
            local pointLight = Instance.new("PointLight")
            pointLight.Color = Color3.new(1, 0, 0)
            pointLight.Brightness = 5
            pointLight.Range = 20
            pointLight.Parent = part
        end
    end
    PlaySound()
end

function DecalSpam()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            for _, face in pairs(Enum.NormalId:GetEnumItems()) do
                local decal = Instance.new("Decal")
                decal.Face = face
                decal.Texture = "rbxassetid://72963082476059"
                decal.Parent = part
            end
        end
    end
    PlaySound()
end

function RandomColors()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.random()
        end
    end
    PlaySound()
end

function AddSparkles()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            local sparkles = Instance.new("Sparkles")
            sparkles.SparkleColor = Color3.new(0, 1, 1)
            sparkles.Parent = part
        end
    end
    PlaySound()
end

function CreateBaseplate()
    local base = Instance.new("Part")
    base.Name = "Baseplate"
    base.Size = Vector3.new(512, 10, 512)
    base.Position = Vector3.new(0, 0, 0)
    base.Anchored = true
    base.BrickColor = BrickColor.new("Bright blue")
    base.Material = Enum.Material.Grass
    base.Parent = workspace
    PlaySound()
end

function SpawnParts()
    for i = 1, 50 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(4, 4, 4)
        part.Position = Vector3.new(math.random(-50, 50), 10, math.random(-50, 50))
        part.BrickColor = BrickColor.random()
        part.Anchored = false
        part.Parent = workspace
    end
    PlaySound()
end

function RainParts()
    spawn(function()
        for i = 1, 100 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(2, 2, 2)
            part.Position = Vector3.new(math.random(-100, 100), 100, math.random(-100, 100))
            part.BrickColor = BrickColor.random()
            part.Anchored = false
            part.Parent = workspace
            task.wait(0.1)
        end
    end)
    PlaySound()
end

function CreateRealm()
    local base = Instance.new("Part")
    base.Size = Vector3.new(200, 5, 200)
    base.Position = Vector3.new(0, 1000, 0)
    base.Anchored = true
    base.BrickColor = BrickColor.new("Bright green")
    base.Parent = workspace
    
    local spawn = Instance.new("SpawnLocation")
    spawn.Size = Vector3.new(10, 5, 10)
    spawn.Position = Vector3.new(0, 1005, 0)
    spawn.Anchored = true
    spawn.Parent = workspace
    PlaySound()
end

function RandomMeshes()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") then
            local mesh = Instance.new("SpecialMesh")
            mesh.Parent = part
            mesh.MeshType = Enum.MeshType[{"Brick", "Cylinder", "Sphere", "Wedge"}[math.random(1,4)]]
        end
    end
    PlaySound()
end

function BlackWhite()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("BasePart") then
            local gray = math.random()
            part.Color = Color3.new(gray, gray, gray)
        end
    end
    PlaySound()
end

function GrassBlock()
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") then
            part.Material = Enum.Material.Grass
            part.BrickColor = BrickColor.new("Bright green")
        end
    end
    PlaySound()
end

function ChangeMaterial()
    local materials = {"Plastic", "Wood", "Slate", "Concrete", "CorrodedMetal", "DiamondPlate", "Foil", "Grass"}
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") then
            part.Material = Enum.Material[materials[math.random(1, #materials)]]
        end
    end
    PlaySound()
end

-- TOOL FUNCTIONS (Fixed)
function CreateEraser()
    local tool = Instance.new("Tool")
    tool.Name = "Eraser"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function CreateDrawTool()
    local tool = Instance.new("Tool")
    tool.Name = "Draw"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function CreateStoneify()
    local tool = Instance.new("Tool")
    tool.Name = "Stoneify"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function CreateTrail()
    local character = game.Players.LocalPlayer.Character
    if character then
        local trail = Instance.new("Trail")
        trail.Parent = character.HumanoidRootPart
    end
    PlaySound()
end

function CreateMoneyBag()
    local tool = Instance.new("Tool")
    tool.Name = "MoneyBag"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

function CreateTrain()
    local tool = Instance.new("Tool")
    tool.Name = "ThomasTrain"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack
    PlaySound()
end

-- Initialize the GUI
CreateToolButtons()
MakeDraggable(MainFrame, Header)

return ExperienceF3X
