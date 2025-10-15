-- ExperienceF3X GUI
-- made by CoolDownExperience
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

-- Header
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
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "ExperienceF3X"
Title.TextColor3 = Color3.fromRGB(100, 150, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Header

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

-- Define tools with categories
local Tools = {
    Destruction = {
        {Name = "Sky Changer", Function = function() ChangeSkybox() end},
        {Name = "Decal Spam", Function = function() DecalSpam() end},
        {Name = "666 Mode", Function = function() SixSixSixMode() end},
        {Name = "Random Colors", Function = function() RandomColors() end},
        {Name = "Unanchor All", Function = function() UnanchorAll() end},
        {Name = "Delete All", Function = function() DeleteAll() end},
        {Name = "Kill All", Function = function() KillAll() end},
        {Name = "Sparkles", Function = function() AddSparkles() end},
        {Name = "Baseplate", Function = function() CreateBaseplate() end},
        {Name = "Spawn Parts", Function = function() SpawnParts() end}
    },
    Building = {
        {Name = "Rain Parts", Function = function() RainParts() end},
        {Name = "Create Realm", Function = function() CreateRealm() end},
        {Name = "Remove Spawns", Function = function() RemoveSpawns() end},
        {Name = "Random Meshes", Function = function() RandomMeshes() end},
        {Name = "Black White", Function = function() BlackWhite() end},
        {Name = "Grass Block", Function = function() GrassBlock() end},
        {Name = "Change Material", Function = function() ChangeMaterial() end}
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
            local category = child.Name:gsub("Label", "")
            local hasVisibleTools = false
            
            for _, toolChild in pairs(ToolsContainer:GetChildren()) do
                if toolChild:IsA("TextButton") and toolChild.Visible then
                    hasVisibleTools = true
                    break
                end
            end
            
            child.Visible = hasVisibleTools
        end
    end
end)

-- Toggle GUI visibility
ToggleButton.MouseButton1Click:Connect(function()
    PlaySound()
    MainFrame.Visible = not MainFrame.Visible
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

-- Tool Functions (Placeholders - you'll need to implement these)
function ChangeSkybox()
    -- Implementation for changing skybox using image ID 72963082476059
    print("Changing skybox to custom image...")
end

function DecalSpam()
    print("Applying decals to all parts...")
end

function SixSixSixMode()
    print("Activating 666 mode...")
end

function RandomColors()
    print("Randomizing colors...")
end

function UnanchorAll()
    print("Unanchoring all parts...")
end

function DeleteAll()
    print("Deleting all parts...")
end

function KillAll()
    print("Killing all players...")
end

function AddSparkles()
    print("Adding sparkles...")
end

function CreateBaseplate()
    print("Creating baseplate...")
end

function SpawnParts()
    print("Spawning parts...")
end

function RainParts()
    print("Starting part rain...")
end

function CreateRealm()
    print("Creating realm...")
end

function RemoveSpawns()
    print("Removing spawns...")
end

function RandomMeshes()
    print("Applying random meshes...")
end

function BlackWhite()
    print("Making everything black and white...")
end

function GrassBlock()
    print("Applying grass block textures...")
end

function ChangeMaterial()
    print("Changing materials...")
end

function CreateEraser()
    print("Creating eraser tool...")
end

function CreateDrawTool()
    print("Creating draw tool...")
end

function CreateStoneify()
    print("Creating stoneify tool...")
end

function CreateTrail()
    print("Creating trail...")
end

function CreateMoneyBag()
    print("Creating money bag tool...")
end

function CreateTrain()
    print("Creating Thomas train...")
end

-- Initialize the GUI
CreateToolButtons()

return ExperienceF3X
