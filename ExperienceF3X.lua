-- ExperienceF3X GUI - SERVER-SIDE VERSION
-- By: [Your Name]
-- Version: 1.0 - Server-Side

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

-- ==================== F3X SERVER-SIDE INTEGRATION ====================
local player = game.Players.LocalPlayer
local char = player.Character
local backpack = player.Backpack

-- Function to get F3X tool (same as OG code)
local function getf3x()
    for _, v in ipairs(backpack:GetChildren()) do
        if v:FindFirstChild("SyncAPI") then
            return v
        end
    end
    for _, v in ipairs(char:GetChildren()) do
        if v:FindFirstChild("SyncAPI") then
            return v
        end
    end
    return nil
end

-- Get F3X SyncAPI
local f3x = getf3x()
if not f3x then
    warn("F3X tool not found! Make sure you have F3X building tools.")
end

local syncapi = f3x and f3x.SyncAPI
local serverendpoint = syncapi and syncapi.ServerEndpoint

-- Server-side helper functions (from OG code)
local function name(part, stringa)
    if not serverendpoint then return end
    local args = {
        [1] = "SetName",
        [2] = {
            [1] = part
        },
        [3] = stringa
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function setcollision(part, booleana)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncCollision",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["CanCollide"] = booleana
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function lock(part, boolean)
    if not serverendpoint then return end
    local args = {
        [1] = "SetLocked",
        [2] = {
            [1] = part
        },
        [3] = boolean
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function setanchor(part, boolean)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncAnchor",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Anchored"] = boolean
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function color(part, color3)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncColor",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Color"] = color3,
                ["UnionColoring"] = false
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function syncmaterial(part, material)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncMaterial",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Material"] = material
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function resize(part, size, cf)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncResize",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["CFrame"] = cf,
                ["Size"] = size
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function delete(part)
    if not serverendpoint then return end
    local args = {
        [1] = "Remove",
        [2] = {
            [1] = part
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function addsparkles(part)
    if not serverendpoint then return end
    local args = {
        [1] = "CreateDecorations",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Sparkles"
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function addfire(part)
    if not serverendpoint then return end
    local args = {
        [1] = "CreateDecorations",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Fire"
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function syncfire(part)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncDecorate",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["DecorationType"] = "Fire",
                ["Size"] = 10,
                ["Heat"] = 15
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function makemesh(part)
    if not serverendpoint then return end
    local args = {
        [1] = "CreateMeshes",
        [2] = {
            [1] = {
                ["Part"] = part
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function syncmeshid(part, id)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncMesh",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["MeshId"] = "rbxassetid://"..id
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function syncmeshsize(part, vectora)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncMesh",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["Scale"] = vectora
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

local function syncmeshtexture(part, id)
    if not serverendpoint then return end
    local args = {
        [1] = "SyncMesh",
        [2] = {
            [1] = {
                ["Part"] = part,
                ["TextureId"] = "rbxassetid://"..id
            }
        }
    }
    serverendpoint:InvokeServer(unpack(args))
end

-- ==================== SERVER-SIDE TOOLS ====================
local Tools = {
    Building = {
        {Name = "Create Part", Function = function() CreatePart() end},
        {Name = "Create Sphere", Function = function() CreateSphere() end},
        {Name = "Create Brick", Function = function() CreateBrick() end},
        {Name = "Spawn Blocks", Function = function() SpawnBlocks() end},
        {Name = "Create Base", Function = function() CreateBase() end},
        {Name = "Delete All", Function = function() DeleteAllParts() end}
    },
    Visual = {
        {Name = "Change Sky", Function = function() ChangeSkybox() end},
        {Name = "Color Parts", Function = function() ColorParts() end},
        {Name = "Add Sparkles", Function = function() AddSparkles() end},
        {Name = "Add Fire", Function = function() AddFire() end},
        {Name = "Rainbow Effect", Function = function() RainbowEffect() end},
        {Name = "Grass Block All", Function = function() GrassBlockAll() end}
    },
    Destruction = {
        {Name = "Unanchor All", Function = function() UnanchorAll() end},
        {Name = "Kill All", Function = function() KillAll() end},
        {Name = "Remove Spawns", Function = function() RemoveSpawns() end},
        {Name = "666 Mode", Function = function() SixSixSix() end},
        {Name = "Black & White", Function = function() BlackAndWhite() end},
        {Name = "Material All", Function = function() MaterialAll() end}
    },
    Fun = {
        {Name = "Rain Parts", Function = function() RainParts() end},
        {Name = "Fireworks", Function = function() Fireworks() end},
        {Name = "Light Show", Function = function() LightShow() end},
        {Name = "Dance Party", Function = function() DanceParty() end},
        {Name = "Explosion", Function = function() CreateExplosion() end},
        {Name = "Teleport Random", Function = function() TeleportRandom() end}
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

-- ==================== SERVER-SIDE BUILDING FUNCTIONS ====================
function CreatePart()
    if not serverendpoint then return end
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    local part = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position), workspace)
    color(part, Color3.new(math.random(), math.random(), math.random()))
    PlaySound()
end

function CreateSphere()
    if not serverendpoint then return end
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    local part = serverendpoint:InvokeServer("CreatePart", "Ball", CFrame.new(position), workspace)
    color(part, Color3.new(0, 0, 1))
    syncmaterial(part, Enum.Material.Neon)
    PlaySound()
end

function CreateBrick()
    if not serverendpoint then return end
    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
    local part = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position), workspace)
    resize(part, Vector3.new(4, 2, 8), CFrame.new(position))
    color(part, Color3.new(1, 0, 0))
    PlaySound()
end

function SpawnBlocks()
    if not serverendpoint then return end
    for i = 1, 10 do
        spawn(function()
            local position = Vector3.new(
                math.random(-20, 20),
                math.random(10, 20),
                math.random(-20, 20)
            )
            local part = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position), workspace)
            color(part, Color3.new(math.random(), math.random(), math.random()))
            setanchor(part, false)
        end)
    end
    PlaySound()
end

function CreateBase()
    if not serverendpoint then return end
    local position = Vector3.new(0, 0, 0)
    local base = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position), workspace)
    resize(base, Vector3.new(200, 5, 200), CFrame.new(position))
    syncmaterial(base, Enum.Material.Grass)
    color(base, Color3.new(0.45098, 0.647059, 0.0823529))
    name(base, "ExperienceF3X Base")
    PlaySound()
end

function DeleteAllParts()
    if not serverendpoint then return end
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") and part ~= game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            spawn(function()
                delete(part)
            end)
        end
    end
    PlaySound()
end

-- ==================== SERVER-SIDE VISUAL EFFECTS ====================
function ColorParts()
    if not serverendpoint then return end
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                color(part, Color3.new(math.random(), math.random(), math.random()))
            end)
        end
    end
    PlaySound()
end

function AddSparkles()
    if not serverendpoint then return end
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                addsparkles(part)
            end)
        end
    end
    PlaySound()
end

function AddFire()
    if not serverendpoint then return end
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                addfire(part)
                syncfire(part)
            end)
        end
    end
    PlaySound()
end

function RainbowEffect()
    spawn(function()
        while task.wait(0.2) do
            for _, part in pairs(workspace:GetDescendants()) do
                if part:IsA("Part") and serverendpoint then
                    spawn(function()
                        color(part, Color3.fromHSV(tick() % 5 / 5, 1, 1))
                    end)
                end
            end
        end
    end)
    PlaySound()
end

function GrassBlockAll()
    if not serverendpoint then return end
    
    local decalidtop = "3027402982"
    local decalidother = "3027402330"
    local decalidbottom = "3027464199"
    
    local function createdecal(part, side)
        local args = {
            [1] = "CreateTextures",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Face"] = side,
                    ["TextureType"] = "Decal"
                }
            }
        }
        serverendpoint:InvokeServer(unpack(args))
    end
    
    local function setdecal(part, asset, side)
        local args = {
            [1] = "SyncTexture",
            [2] = {
                [1] = {
                    ["Part"] = part,
                    ["Face"] = side,
                    ["TextureType"] = "Decal",
                    ["Texture"] = "rbxassetid://".. asset
                }
            }
        }
        serverendpoint:InvokeServer(unpack(args))
    end
    
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                createdecal(part, Enum.NormalId.Front)
                createdecal(part, Enum.NormalId.Back)
                createdecal(part, Enum.NormalId.Left)
                createdecal(part, Enum.NormalId.Right)
                createdecal(part, Enum.NormalId.Bottom)
                createdecal(part, Enum.NormalId.Top)

                setdecal(part, decalidother, Enum.NormalId.Front)
                setdecal(part, decalidother, Enum.NormalId.Back)
                setdecal(part, decalidother, Enum.NormalId.Left)
                setdecal(part, decalidother, Enum.NormalId.Right)
                setdecal(part, decalidbottom, Enum.NormalId.Bottom)
                setdecal(part, decalidtop, Enum.NormalId.Top)
            end)
        end
    end
    PlaySound()
end

-- ==================== SERVER-SIDE DESTRUCTION FUNCTIONS ====================
function UnanchorAll()
    if not serverendpoint then return end
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                setanchor(part, false)
            end)
        end
    end
    PlaySound()
end

function KillAll()
    if not serverendpoint then return end
    for _, v in pairs(workspace:GetDescendants()) do
        if v.Parent:FindFirstChildOfClass("Humanoid") then
            spawn(function()
                delete(v.Parent.Head)
            end)
        end
    end
    PlaySound()
end

function RemoveSpawns()
    if not serverendpoint then return end
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("SpawnLocation") then
            spawn(function()
                delete(v)
            end)
        end
    end
    PlaySound()
end

function SixSixSix()
    if not serverendpoint then return end
    
    -- Add fire to everything
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                addfire(part)
                syncfire(part)
            end)
        end
    end
    
    -- Create dark sky
    local position = game.Players.LocalPlayer.Character.Head.Position
    local sky = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position + Vector3.new(0, 2, 0)), workspace)
    makemesh(sky)
    syncmeshid(sky, "8006679977")
    syncmeshsize(sky, Vector3.new(90, 90, 90))
    syncmeshtexture(sky, "15849970412")
    name(sky, "Sky")
    lock(sky, true)
    setcollision(sky, false)
    
    -- Color everything dark
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                color(part, Color3.new(0.0666667, 0.0666667, 0.0666667))
            end)
        end
    end
    
    PlaySound()
end

function BlackAndWhite()
    if not serverendpoint then return end
    
    -- Create white sky
    local position = game.Players.LocalPlayer.Character.Head.Position
    local sky = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position + Vector3.new(0, 2, 0)), workspace)
    makemesh(sky)
    syncmeshid(sky, "8006679977")
    syncmeshsize(sky, Vector3.new(90, 90, 90))
    syncmeshtexture(sky, "10995799876")
    name(sky, "Sky")
    lock(sky, true)
    setcollision(sky, false)
    
    -- Color everything gray
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                color(part, Color3.new(0.196078, 0.196078, 0.196078))
            end)
        end
    end
    
    PlaySound()
end

function MaterialAll()
    if not serverendpoint then return end
    for _, part in pairs(workspace:GetDescendants()) do
        if part:IsA("Part") or part:IsA("UnionOperation") then
            spawn(function()
                syncmaterial(part, Enum.Material.Neon)
            end)
        end
    end
    PlaySound()
end

-- ==================== FUN EFFECTS (Client-side only) ====================
function RainParts()
    spawn(function()
        for i = 1, 30 do
            if serverendpoint then
                spawn(function()
                    local position = Vector3.new(
                        math.random(-40, 40),
                        50,
                        math.random(-40, 40)
                    )
                    local raindrop = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position), workspace)
                    resize(raindrop, Vector3.new(1, 3, 1), CFrame.new(position))
                    color(raindrop, Color3.new(0, 0, 1))
                    setanchor(raindrop, false)
                    setcollision(raindrop, false)
                    
                    -- Auto delete after 5 seconds
                    delay(5, function()
                        if raindrop then
                            delete(raindrop)
                        end
                    end)
                end)
            end
            task.wait(0.1)
        end
    end)
    PlaySound()
end

function Fireworks()
    for i = 1, 8 do
        if serverendpoint then
            spawn(function()
                local position = Vector3.new(math.random(-25, 25), 0, math.random(-25, 25))
                local firework = serverendpoint:InvokeServer("CreatePart", "Normal", CFrame.new(position), workspace)
                color(firework, Color3.new(math.random(), math.random(), math.random()))
                syncmaterial(firework, Enum.Material.Neon)
                setanchor(firework, false)
                
                -- Add velocity for launch
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 80, 0)
                bodyVelocity.Parent = firework
                
                -- Explosion effect after 2 seconds
                delay(2, function()
                    if firework then
                        local explosion = Instance.new("Explosion")
                        explosion.Position = firework.Position
                        explosion.BlastPressure = 0
                        explosion.BlastRadius = 12
                        explosion.Parent = workspace
                        delete(firework)
                    end
                end)
            end)
        end
    end
    PlaySound()
end

function LightShow()
    local lighting = game:GetService("Lighting")
    spawn(function()
        for i = 1, 30 do
            lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
            lighting.Brightness = math.random(5, 12)
            task.wait(0.2)
        end
        lighting.Brightness = 3
    end)
    PlaySound()
end

function DanceParty()
    local lighting = game:GetService("Lighting")
    spawn(function()
        for i = 1, 20 do
            lighting.Ambient = Color3.new(math.random(), math.random(), math.random())
            task.wait(0.3)
        end
    end)
    PlaySound()
end

function CreateExplosion()
    local explosion = Instance.new("Explosion")
    explosion.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 10)
    explosion.BlastPressure = 500000
    explosion.BlastRadius = 15
    explosion.Parent = workspace
    PlaySound()
end

function TeleportRandom()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.Position = Vector3.new(
            math.random(-100, 100),
            25,
            math.random(-100, 100)
        )
    end
    PlaySound()
end

function ChangeSkybox()
    local lighting = game:GetService("Lighting")
    
    -- Clear existing sky
    for _, child in pairs(lighting:GetChildren()) do
        if child:IsA("Sky") then
            child:Destroy()
        end
    end
    
    -- Create new sky
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://7105277985"
    sky.SkyboxDn = "rbxassetid://7105280520"
    sky.SkyboxFt = "rbxassetid://7105277985"
    sky.SkyboxLf = "rbxassetid://7105277985"
    sky.SkyboxRt = "rbxassetid://7105277985"
    sky.SkyboxUp = "rbxassetid://7105280520"
    sky.Parent = lighting
    
    PlaySound()
end

-- ==================== GUI FUNCTIONALITY ====================
-- Sound function
function PlaySound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://3578448090"
    sound.Volume = 0.3
    sound.Parent = game.Workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 2)
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
        MainFrame.Size = UDim2.new(0, 500, 0, 60)
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

-- Initialize the GUI
CreateToolButtons()
MakeDraggable(MainFrame, Header)

-- Check for F3X tool on startup
if not f3x then
    warn("ExperienceF3X: F3X Building Tools not found! Some features may not work.")
else
    print("ExperienceF3X: F3X Tools detected! Server-side features enabled.")
end

return ExperienceF3X
