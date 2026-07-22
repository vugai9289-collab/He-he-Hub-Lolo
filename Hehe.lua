local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer

pcall(function()
    local snd = Instance.new("Sound")
    snd.SoundId = "rbxassetid://9060817403"
    snd.Volume = 1
    snd.Parent = SoundService
    snd:Play()
    snd.Ended:Connect(function() snd:Destroy() end)
end)

local function playClickSound()
    pcall(function()
        local snd = Instance.new("Sound")
        snd.SoundId = "rbxassetid://9060817403"
        snd.Volume = 0.5
        snd.Parent = SoundService
        snd:Play()
        snd.Ended:Connect(function() snd:Destroy() end)
    end)
end

pcall(function()
    if CoreGui:FindFirstChild("NutTronAnhV2") then CoreGui.NutTronAnhV2:Destroy() end
    if player.PlayerGui:FindFirstChild("NutTronAnhV2") then player.PlayerGui.NutTronAnhV2:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NutTronAnhV2"
gui.ResetOnSpawn = false
pcall(function() gui.Parent = CoreGui end)
if not gui.Parent then gui.Parent = player:WaitForChild("PlayerGui") end

-- NÚT TRÒN
local MainFrame = Instance.new("Frame", gui)
MainFrame.Size = UDim2.new(0, 50, 0, 50)
MainFrame.Position = UDim2.new(0.1, 0, 0.5, -25)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BackgroundTransparency = 0.3
MainFrame.Active = true
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(1, 0)

local ActionButton = Instance.new("ImageButton", MainFrame)
ActionButton.Size = UDim2.new(0.85, 0, 0.85, 0)
ActionButton.Position = UDim2.new(0.075, 0, 0.075, 0)
ActionButton.BackgroundTransparency = 1
ActionButton.Image = "rbxassetid://130940118"
Instance.new("UICorner", ActionButton).CornerRadius = UDim.new(1, 0)

local FrameStroke = Instance.new("UIStroke", MainFrame)
FrameStroke.Thickness = 3
RunService.RenderStepped:Connect(function()
    if MainFrame and MainFrame.Parent then
        FrameStroke.Color = Color3.fromHSV((os.clock() % 4) / 4, 1, 1)
    end
end)

-- LOADING
local LoadScreen = Instance.new("Frame", gui)
LoadScreen.Size = UDim2.new(0, 300, 0, 150)
LoadScreen.Position = UDim2.new(0.5, -150, 0.5, -75)
LoadScreen.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoadScreen.BackgroundTransparency = 0.1
Instance.new("UICorner", LoadScreen).CornerRadius = UDim.new(0, 16)

local LoadStroke = Instance.new("UIStroke", LoadScreen)
LoadStroke.Thickness = 2
RunService.RenderStepped:Connect(function()
    if LoadScreen and LoadScreen.Parent then
        LoadStroke.Color = Color3.fromHSV((os.clock() % 4) / 4, 1, 1)
    end
end)

local LoadTitle = Instance.new("TextLabel", LoadScreen)
LoadTitle.Size = UDim2.new(1, 0, 0, 40)
LoadTitle.Position = UDim2.new(0, 0, 0, 20)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DucAnhHub"
LoadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.TextSize = 20
LoadTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)

local BarBg = Instance.new("Frame", LoadScreen)
BarBg.Size = UDim2.new(0.85, 0, 0, 10)
BarBg.Position = UDim2.new(0.075, 0, 0, 75)
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
BarBg.BorderSizePixel = 0
Instance.new("UICorner", BarBg).CornerRadius = UDim.new(1, 0)

local BarFill = Instance.new("Frame", BarBg)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
BarFill.BorderSizePixel = 0
Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1, 0)

local PercentLabel = Instance.new("TextLabel", LoadScreen)
PercentLabel.Size = UDim2.new(1, 0, 0, 30)
PercentLabel.Position = UDim2.new(0, 0, 0, 95)
PercentLabel.BackgroundTransparency = 1
PercentLabel.Text = "Loading 0%"
PercentLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
PercentLabel.TextSize = 12
PercentLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)

-- MENU CHÍNH
local MenuFrame = Instance.new("Frame", gui)
MenuFrame.Name = "MenuFrame"
MenuFrame.Size = UDim2.new(0, 340, 0, 320)
MenuFrame.Position = UDim2.new(0.5, -170, 0.5, -160)
MenuFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
MenuFrame.BackgroundTransparency = 0.1
MenuFrame.Visible = false
MenuFrame.Active = true
MenuFrame.Draggable = true
Instance.new("UICorner", MenuFrame).CornerRadius = UDim.new(0, 18)

local MenuStroke = Instance.new("UIStroke", MenuFrame)
MenuStroke.Thickness = 2
MenuStroke.Color = Color3.fromRGB(70, 130, 255)

local LeftBar = Instance.new("Frame", MenuFrame)
LeftBar.Size = UDim2.new(0.22, 0, 1, 0)
LeftBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
LeftBar.BorderSizePixel = 0
Instance.new("UICorner", LeftBar).CornerRadius = UDim.new(0, 18)

local UIListLayoutTab = Instance.new("UIListLayout", LeftBar)
UIListLayoutTab.Padding = UDim.new(0, 8)
UIListLayoutTab.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayoutTab.VerticalAlignment = Enum.VerticalAlignment.Center

local TitleLabel = Instance.new("TextLabel", MenuFrame)
TitleLabel.Size = UDim2.new(0.75, 0, 0, 50)
TitleLabel.Position = UDim2.new(0.24, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡ DUC ANH HUB ⚡"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)

local CloseButton = Instance.new("TextButton", MenuFrame)
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -36, 0, 11)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 13
CloseButton.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
Instance.new("UICorner", CloseButton).CornerRadius = UDim.new(1, 0)

CloseButton.MouseButton1Click:Connect(function()
    playClickSound()
    MenuFrame.Visible = false
end)

local ContainerHolder = Instance.new("Folder", MenuFrame)

local function createTabContainer()
    local sf = Instance.new("ScrollingFrame", ContainerHolder)
    sf.Size = UDim2.new(0.75, -10, 1, -65)
    sf.Position = UDim2.new(0.24, 10, 0, 55)
    sf.BackgroundTransparency = 1
    sf.CanvasSize = UDim2.new(0, 0, 0, 420)
    sf.ScrollBarThickness = 3
    sf.Visible = false
    local layout = Instance.new("UIListLayout", sf)
    layout.Padding = UDim.new(0, 8)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    return sf
end

local Tab1Container = createTabContainer()
local Tab2Container = createTabContainer()
local Tab3Container = createTabContainer()
Tab1Container.Visible = true

local function createTabButton(name, targetContainer)
    local btn = Instance.new("TextButton", LeftBar)
    btn.Size = UDim2.new(0.85, 0, 0, 32)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 11
    btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    btn.MouseButton1Click:Connect(function()
        playClickSound()
        Tab1Container.Visible = false
        Tab2Container.Visible = false
        Tab3Container.Visible = false
        targetContainer.Visible = true
    end)
end

createTabButton("MM2", Tab1Container)
createTabButton("Slap Tower", Tab2Container)
createTabButton("Cài Đặt", Tab3Container)

local function createMenuButton(name, parentContainer, callback)
    local btn = Instance.new("TextButton", parentContainer)
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.TextSize = 13
    btn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
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

-- TAB 1: MM2
local MM2Title = Instance.new("TextLabel", Tab1Container)
MM2Title.Size = UDim2.new(1, 0, 0, 25)
MM2Title.BackgroundTransparency = 1
MM2Title.Text = "⚡ Murder Mystery 2 Features"
MM2Title.TextColor3 = Color3.fromRGB(255, 215, 0)
MM2Title.TextSize = 13
MM2Title.TextXAlignment = Enum.TextXAlignment.Left
MM2Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)

local SpeedBox = Instance.new("TextBox", Tab1Container)
SpeedBox.Size = UDim2.new(1, 0, 0, 36)
SpeedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
SpeedBox.PlaceholderText = "Nhập Speed (1 - 6000)"
SpeedBox.Text = ""
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
SpeedBox.TextSize = 12
SpeedBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 10)

SpeedBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        playClickSound()
        local val = tonumber(SpeedBox.Text)
        if val then
            if val < 1 then val = 1 end
            if val > 6000 then val = 6000 end
            pcall(function() player.Character.Humanoid.WalkSpeed = val end)
        end
    end
end)

local mm2EspConnection
createMenuButton("ESP MM2 (Killer & Police)", Tab1Container, function(state)
    if state then
        mm2EspConnection = RunService.RenderStepped:Connect(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local isKiller = false
                    local isPolice = false
                    
                    local function checkTool(item)
                        if item:IsA("Tool") then
                            local nameLower = string.lower(item.Name)
                            if string.find(nameLower, "knife") or string.find(nameLower, "dao") then
                                isKiller = true
                            elseif string.find(nameLower, "gun") or string.find(nameLower, "revolver") or string.find(nameLower, "súng") then
                                isPolice = true
                            end
                        end
                    end

                    for _, item in ipairs(p.Character:GetChildren()) do checkTool(item) end
                    if p.Backpack then
                        for _, item in ipairs(p.Backpack:GetChildren()) do checkTool(item) end
                    end
                    
                    local head = p.Character:FindFirstChild("Head")
                    
                    if isKiller then
                        if not p.Character:FindFirstChild("MM2_Killer_Highlight") then
                            local hl = Instance.new("Highlight", p.Character)
                            hl.Name = "MM2_Killer_Highlight"
                            hl.Adornee = p.Character
                            hl.FillColor = Color3.fromRGB(255, 0, 0)
                            hl.FillTransparency = 0.4
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        end
                        if head and not head:FindFirstChild("MM2_Killer_Tag") then
                            if head:FindFirstChild("MM2_Police_Tag") then head.MM2_Police_Tag:Destroy() end
                            local bg = Instance.new("BillboardGui", head)
                            bg.Name = "MM2_Killer_Tag"
                            bg.Size = UDim2.new(0, 100, 0, 40)
                            bg.StudsOffset = Vector3.new(0, 2.5, 0)
                            bg.AlwaysOnTop = true
                            
                            local txt = Instance.new("TextLabel", bg)
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.BackgroundTransparency = 1
                            txt.Text = "⚠️ [ KILLER ] ⚠️"
                            txt.TextColor3 = Color3.fromRGB(255, 0, 0)
                            txt.TextSize = 14
                            txt.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
                            txt.TextStrokeTransparency = 0
                            txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        end
                    elseif isPolice then
                        if not p.Character:FindFirstChild("MM2_Police_Highlight") then
                            local hl = Instance.new("Highlight", p.Character)
                            hl.Name = "MM2_Police_Highlight"
                            hl.Adornee = p.Character
                            hl.FillColor = Color3.fromRGB(0, 150, 255)
                            hl.FillTransparency = 0.4
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        end
                        if head and not head:FindFirstChild("MM2_Police_Tag") then
                            if head:FindFirstChild("MM2_Killer_Tag") then head.MM2_Killer_Tag:Destroy() end
                            local bg = Instance.new("BillboardGui", head)
                            bg.Name = "MM2_Police_Tag"
                            bg.Size = UDim2.new(0, 100, 0, 40)
                            bg.StudsOffset = Vector3.new(0, 2.5, 0)
                            bg.AlwaysOnTop = true
                            
                            local txt = Instance.new("TextLabel", bg)
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.BackgroundTransparency = 1
                            txt.Text = "🛡️ [ POLICE ] 🛡️"
                            txt.TextColor3 = Color3.fromRGB(0, 150, 255)
                            txt.TextSize = 14
                            txt.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
                            txt.TextStrokeTransparency = 0
                            txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        end
                    else
                        if p.Character:FindFirstChild("MM2_Killer_Highlight") then p.Character.MM2_Killer_Highlight:Destroy() end
                        if p.Character:FindFirstChild("MM2_Police_Highlight") then p.Character.MM2_Police_Highlight:Destroy() end
                        if head then
                            if head:FindFirstChild("MM2_Killer_Tag") then head.MM2_Killer_Tag:Destroy() end
                            if head:FindFirstChild("MM2_Police_Tag") then head.MM2_Police_Tag:Destroy() end
                        end
                    end
                end
            end
        end)
    else
        if mm2EspConnection then mm2EspConnection:Disconnect() end
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                if p.Character:FindFirstChild("MM2_Killer_Highlight") then p.Character.MM2_Killer_Highlight:Destroy() end
                if p.Character:FindFirstChild("MM2_Police_Highlight") then p.Character.MM2_Police_Highlight:Destroy() end
                local head = p.Character:FindFirstChild("Head")
                if head then
                    if head:FindFirstChild("MM2_Killer_Tag") then head.MM2_Killer_Tag:Destroy() end
                    if head:FindFirstChild("MM2_Police_Tag") then head.MM2_Police_Tag:Destroy() end
                end
            end
        end
    end
end)

local policeEspConnection
createMenuButton("ESP Police (Chỉ hiện Cảnh sát)", Tab1Container, function(state)
    if state then
        policeEspConnection = RunService.RenderStepped:Connect(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character then
                    local isPolice = false
                    local function checkTool(item)
                        if item:IsA("Tool") then
                            local nameLower = string.lower(item.Name)
                            if string.find(nameLower, "gun") or string.find(nameLower, "revolver") or string.find(nameLower, "súng") then
                                isPolice = true
                            end
                        end
                    end
                    for _, item in ipairs(p.Character:GetChildren()) do checkTool(item) end
                    if p.Backpack then
                        for _, item in ipairs(p.Backpack:GetChildren()) do checkTool(item) end
                    end
                    
                    local head = p.Character:FindFirstChild("Head")
                    if isPolice then
                        if not p.Character:FindFirstChild("Only_Police_Highlight") then
                            local hl = Instance.new("Highlight", p.Character)
                            hl.Name = "Only_Police_Highlight"
                            hl.Adornee = p.Character
                            hl.FillColor = Color3.fromRGB(0, 150, 255)
                            hl.FillTransparency = 0.4
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        end
                        if head and not head:FindFirstChild("Only_Police_Tag") then
                            local bg = Instance.new("BillboardGui", head)
                            bg.Name = "Only_Police_Tag"
                            bg.Size = UDim2.new(0, 100, 0, 40)
                            bg.StudsOffset = Vector3.new(0, 2.5, 0)
                            bg.AlwaysOnTop = true
                            
                            local txt = Instance.new("TextLabel", bg)
                            txt.Size = UDim2.new(1, 0, 1, 0)
                            txt.BackgroundTransparency = 1
                            txt.Text = "🛡️ [ POLICE ] 🛡️"
                            txt.TextColor3 = Color3.fromRGB(0, 150, 255)
                            txt.TextSize = 14
                            txt.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
                            txt.TextStrokeTransparency = 0
                            txt.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        end
                    else
                        if p.Character:FindFirstChild("Only_Police_Highlight") then p.Character.Only_Police_Highlight:Destroy() end
                        if head and head:FindFirstChild("Only_Police_Tag") then head.Only_Police_Tag:Destroy() end
                    end
                end
            end
        end)
    else
        if policeEspConnection then policeEspConnection:Disconnect() end
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character then
                if p.Character:FindFirstChild("Only_Police_Highlight") then p.Character.Only_Police_Highlight:Destroy() end
                local head = p.Character:FindFirstChild("Head")
                if head and head:FindFirstChild("Only_Police_Tag") then head.Only_Police_Tag:Destroy() end
            end
        end
    end
end)

-- TAB 2: SLAP TOWER
local SlapTitle = Instance.new("TextLabel", Tab2Container)
SlapTitle.Size = UDim2.new(1, 0, 0, 25)
SlapTitle.BackgroundTransparency = 1
SlapTitle.Text = "⚡ Slap Tower Features"
SlapTitle.TextColor3 = Color3.fromRGB(70, 130, 255)
SlapTitle.TextSize = 13
SlapTitle.TextXAlignment = Enum.TextXAlignment.Left
SlapTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)

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

local espConnection
createMenuButton("Highlights (ESP Sáng)", Tab2Container, function(state)
    if state then
        espConnection = RunService.RenderStepped:Connect(function()
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= player and p.Character and not p.Character:FindFirstChild("DucAnhHighlight") then
                    local hl = Instance.new("Highlight", p.Character)
                    hl.Name = "DucAnhHighlight"
                    hl.Adornee = p.Character
                    hl.FillColor = Color3.fromRGB(0, 150, 255)
                    hl.FillTransparency = 0.5
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            end
        end)
    else
        if espConnection then espConnection:Disconnect() end
        for _, p in ipairs(Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("DucAnhHighlight") then
                p.Character.DucAnhHighlight:Destroy()
            end
        end
    end
end)

local noclipConnection
createMenuButton("Noclip (Đi xuyên tường)", Tab2Container, function(state)
    if state then
        noclipConnection = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        if noclipConnection then noclipConnection:Disconnect() end
        local char = player.Character
        if char then
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then part.CanCollide = true end
            end
        end
    end
end)

-- TAB 3: CÀI ĐẶT & MÔ TẢ UPDATE V1
local SettingTitle = Instance.new("TextLabel", Tab3Container)
SettingTitle.Size = UDim2.new(1, 0, 0, 25)
SettingTitle.BackgroundTransparency = 1
SettingTitle.Text = "⚡ Cài đặt Script"
SettingTitle.TextColor3 = Color3.fromRGB(255, 100, 100)
SettingTitle.TextSize = 13
SettingTitle.TextXAlignment = Enum.TextXAlignment.Left
SettingTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)

local DescLabel = Instance.new("TextLabel", Tab3Container)
DescLabel.Size = UDim2.new(1, 0, 0, 45)
DescLabel.BackgroundTransparency = 1
DescLabel.Text = "Update Này là V1 Và Mấy update sau sẽ đẹp hơn ✨"
DescLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DescLabel.TextSize = 12
DescLabel.TextWrapped = true
DescLabel.TextXAlignment = Enum.TextXAlignment.Left
DescLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)

local AlphaBox = Instance.new("TextBox", Tab3Container)
AlphaBox.Size = UDim2.new(1, 0, 0, 36)
AlphaBox.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
AlphaBox.PlaceholderText = "Độ trong suốt (0.0 - 0.9)"
AlphaBox.Text = "0.1"
AlphaBox.TextColor3 = Color3.fromRGB(255, 255, 255)
AlphaBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
AlphaBox.TextSize = 12
AlphaBox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium)
Instance.new("UICorner", AlphaBox).CornerRadius = UDim.new(0, 10)

AlphaBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        playClickSound()
        local val = tonumber(AlphaBox.Text)
        if val then
            if val < 0 then val = 0 end
            if val > 0.9 then val = 0.9 end
            MenuFrame.BackgroundTransparency = val
            LeftBar.BackgroundTransparency = val
        end
    end
end)

local ResetGuiBtn = Instance.new("TextButton", Tab3Container)
ResetGuiBtn.Size = UDim2.new(1, 0, 0, 36)
ResetGuiBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ResetGuiBtn.Text = "Đóng Script"
ResetGuiBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ResetGuiBtn.TextSize = 12
ResetGuiBtn.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold)
Instance.new("UICorner", ResetGuiBtn).CornerRadius = UDim.new(0, 10)

ResetGuiBtn.MouseButton1Click:Connect(function()
    playClickSound()
    gui:Destroy()
end)

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
