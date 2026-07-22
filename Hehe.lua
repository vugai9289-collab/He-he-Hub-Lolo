local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer

-- 🔊 ÂM THANH XIN CHÀO (CHỈ PHÁT 1 LẦN KHI LOAD)
pcall(function()
    local introSound = Instance.new("Sound")
    introSound.SoundId = "rbxassetid://9060817403"
    introSound.Volume = 1
    introSound.Parent = SoundService
    introSound:Play()
    introSound.Ended:Connect(function()
        introSound:Destroy()
    end)
end)

-- 🔊 HÀM ÂM THANH BẤM NÚT
local function playClickSound()
    pcall(function()
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://9060817403"
        sound.Volume = 0.5
        sound.Parent = SoundService
        sound:Play()
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
    end)
end

pcall(function()
    if CoreGui:FindFirstChild("NutTronAnhV2") then
        CoreGui.NutTronAnhV2:Destroy()
    end
    if player.PlayerGui:FindFirstChild("NutTronAnhV2") then
        player.PlayerGui.NutTronAnhV2:Destroy()
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NutTronAnhV2"
gui.ResetOnSpawn = false

local success = pcall(function()
    gui.Parent = CoreGui
end)
if not success then
    gui.Parent = player:WaitForChild("PlayerGui")
end

-- ==========================================
-- 🟢 NÚT TRÒN DI ĐỘNG
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 50, 0, 50)
MainFrame.Position = UDim2.new(0.1, 0, 0.5, -25)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BackgroundTransparency = 0.3
MainFrame.Active = true
MainFrame.Visible = false
MainFrame.Parent = gui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(1, 0)

local ActionButton = Instance.new("ImageButton")
ActionButton.Name = "ActionButton"
ActionButton.Size = UDim2.new(0.85, 0, 0.85, 0)
ActionButton.Position = UDim2.new(0.075, 0, 0.075, 0)
ActionButton.BackgroundTransparency = 1
ActionButton.Image = "rbxassetid://130940118"
ActionButton.Active = true
ActionButton.Parent = MainFrame

Instance.new("UICorner", ActionButton).CornerRadius = UDim.new(1, 0)

local FrameStroke = Instance.new("UIStroke", MainFrame)
FrameStroke.Thickness = 3

RunService.RenderStepped:Connect(function()
    if MainFrame and MainFrame.Parent then
        local hue = (os.clock() % 4) / 4
        FrameStroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

-- ==========================================
-- ⏳ MÀN HÌNH LOADING
-- ==========================================
local LoadScreen = Instance.new("Frame")
LoadScreen.Name = "LoadScreen"
LoadScreen.Size = UDim2.new(0, 300, 0, 150)
LoadScreen.Position = UDim2.new(0.5, -150, 0.5, -75)
LoadScreen.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoadScreen.BackgroundTransparency = 0.1
LoadScreen.Parent = gui

Instance.new("UICorner", LoadScreen).CornerRadius = UDim.new(0, 16)

local LoadStroke = Instance.new("UIStroke", LoadScreen)
LoadStroke.Thickness = 2

RunService.RenderStepped:Connect(function()
    if LoadScreen and LoadScreen.Parent then
        local hue = (os.clock() % 4) / 4
        LoadStroke.Color = Color3.fromHSV(hue, 1, 1)
    end
end)

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 40)
LoadTitle.Position = UDim2.new(0, 0, 0, 20)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DucAnhHub"
LoadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.TextSize = 20
LoadTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
LoadTitle.Parent = LoadScreen

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0.85, 0, 0, 10)
BarBg.Position = UDim2.new(0.075, 0, 0, 75)
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
BarBg.BorderSizePixel = 0
BarBg.Parent = LoadScreen
Instance.new("UICorner", BarBg).CornerRadius = UDim.new(1, 0)

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg
Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1, 0)

local PercentLabel = Instance.new("TextLabel")
PercentLabel.Size = UDim2.new(1, 0, 0, 30)
PercentLabel.Position = UDim2.new(0, 0, 0, 95)
PercentLabel.BackgroundTransparency = 1
PercentLabel.Text = "Loading 0%"
PercentLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
PercentLabel.TextSize = 12
PercentLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
PercentLabel.Parent = LoadScreen

-- ==========================================
-- 📂 GIAO DIỆN MENU & TAB
-- ==========================================
local MenuFrame = Instance.new("Frame")
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 340, 0, 320)
MenuFrame.Position = UDim2.new(0.5, -170, 0.5, -160)
MenuFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MenuFrame.BackgroundTransparency = 0.1
MenuFrame.Visible = false
MenuFrame.Active = true
MenuFrame.Draggable = true
MenuFrame.Parent = gui

Instance.new("UICorner", MenuFrame).CornerRadius = UDim.new(0, 18)

local MenuStroke = Instance.new("UIStroke", MenuFrame)
MenuStroke.Thickness = 2
MenuStroke.Color = Color3.fromRGB(70, 130, 255)

local LeftBar = Instance.new("Frame")
LeftBar.Size = UDim2.new(0.22, 0, 1, 0)
LeftBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
LeftBar.BorderSizePixel = 0
LeftBar.Parent = MenuFrame

Instance.new("UICorner", LeftBar).CornerRadius = UDim.new(0, 18)

local UIListLayoutTab = Instance.new("UIListLayout")
UIListLayoutTab.Padding = UDim.new(0, 8)
UIListLayoutTab.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutTab.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayoutTab.Parent = LeftBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0.75, 0, 0, 50)
TitleLabel.Position = UDim2.new(0.24, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡ DUC ANH HUB ⚡"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
TitleLabel.Parent = MenuFrame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -36, 0, 11)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 13
CloseButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
CloseButton.Parent = MenuFrame
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(1, 0)

CloseButton.MouseButton1Click:Connect(function()
    playClickSound()
    MenuFrame.Visible = false
end)

local ContainerHolder = Instance.new("Folder")
ContainerHolder.Parent = MenuFrame

local function createTabContainer()
    local sf = Instance.new("ScrollingFrame")
    sf.Size = UDim2.new(0.75, -10, 1, -65)
    sf.Position = UDim2.new(0.24, 10, 0, 55)
    sf.BackgroundTransparency = 1
    sf.CanvasSize = UDim2.new(0, 0, 0, 320)
    sf.ScrollBarThickness = 3
    sf.Visible = false
    sf.Parent = ContainerHolder

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Parent = sf
    return sf
end

local Tab1Container = createTabContainer()
local Tab2Container = createTabContainer()
local Tab3Container = createTabContainer()
Tab1Container.Visible = true

local function createTabButton(name, targetContainer)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.85, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 11
    btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    btn.Parent = LeftBar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        playClickSound()
        Tab1Container.Visible = false
        Tab2Container.Visible = false
        Tab3Container.Visible = false
        targetContainer.Visible = true
    end)
end

createTabButton("Info", Tab1Container)
createTabButton("Slap Tower", Tab2Container)
createTabButton("Bản Vip", Tab3Container)

-- TAB 1
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 0, 220)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "Script Việt Nam Lấy Cảm Hứng Từ Slap Tower.\n\nTiktok:Yuya_Lwo"
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextSize = 13
InfoLabel.TextWrapped = true
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top
InfoLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
InfoLabel.Parent = Tab1Container

-- TAB 2
local function createMenuButton(name, parentContainer, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.TextSize = 13
    btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
    btn.Parent = parentContainer
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    local activeState = false
    btn.MouseButton1Click:Connect(function()
        playClickSound()
        activeState = not activeState
        btn.BackgroundColor3 = activeState and Color3.fromRGB(70, 130, 255) or Color3.fromRGB(35, 35, 42)
        if callback then callback(activeState, btn) end
    end)
    return btn
end

createMenuButton("Anti Slap", Tab2Container, function(state)
    if state then
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/amdzy088/Immune-slap-tower-/refs/heads/main/Immune%20slap%20tower%20work"))()
        end)
    end
end)

createMenuButton("Auto Wallhop", Tab2Container, function(state)
    if state then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Wallhop-Script-123263"))()
        end)
    end
end)

createMenuButton("Speed x2", Tab2Container, function(state)
    pcall(function()
        player.Character.Humanoid.WalkSpeed = state and 32 or 16
    end)
end)

-- TAB 3
local VipLabel = Instance.new("TextLabel")
VipLabel.Size = UDim2.new(1, 0, 0, 50)
VipLabel.BackgroundTransparency = 1
VipLabel.Text = "Muốn mua vip ib"
VipLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
VipLabel.TextSize = 16
VipLabel.TextWrapped = true
VipLabel.TextXAlignment = Enum.TextXAlignment.Center
VipLabel.TextYAlignment = Enum.TextYAlignment.Center
VipLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
VipLabel.Parent = Tab3Container

-- CHẠY LOADING
task.spawn(function()
    task.wait(0.3)
    TweenService:Create(BarFill, TweenInfo.new(0.4), {Size = UDim2.new(0.3, 0, 1, 0)}):Play()
    PercentLabel.Text = "Loading 30%"
    task.wait(0.5)
    
    TweenService:Create(BarFill, TweenInfo.new(0.4), {Size = UDim2.new(0.7, 0, 1, 0)}):Play()
    PercentLabel.Text = "Loading 70%"
    task.wait(0.5)
    
    TweenService:Create(BarFill, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    PercentLabel.Text = "Loading 100%"
    task.wait(0.4)
    
    LoadScreen:Destroy()
    MainFrame.Visible = true
end)

ActionButton.MouseButton1Click:Connect(function()
    playClickSound()
    MenuFrame.Visible = not MenuFrame.Visible
end)
