local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local camera = Workspace.CurrentCamera

-- 🔔 THÔNG BÁO KIỂM TRA
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "DUC ANH HUB v2.0",
        Text = "Skibidi!",
        Duration = 5
    })
end)

-- Xóa GUI cũ nếu có
pcall(function()
    if CoreGui:FindFirstChild("NguoiNgoaiHanhTinh") then 
        CoreGui.NguoiNgoaiHanhTinh:Destroy() 
    end
    if player.PlayerGui:FindFirstChild("NguoiNgoaiHanhTinh") then 
        player.PlayerGui.NguoiNgoaiHanhTinh:Destroy() 
    end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NguoiNgoaiHanhTinh"
gui.ResetOnSpawn = false
pcall(function() gui.Parent = CoreGui end)
if not gui.Parent then gui.Parent = player:WaitForChild("PlayerGui") end

-- 1. NÚT TRÒN BẬT/TẮT MENU (Góc trái màn hình: X=50, Y=150)
local CircleBtn = Instance.new("ImageButton")
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0, 50, 0, 150)
CircleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CircleBtn.BackgroundTransparency = 0
CircleBtn.Image = "rbxassetid://93721397090642"
CircleBtn.Active = true
CircleBtn.Parent = gui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(1, 0)
Corner.Parent = CircleBtn

local Stroke = Instance.new("UIStroke", CircleBtn)
Stroke.Thickness = 3

local rainbowConnection
rainbowConnection = RunService.RenderStepped:Connect(function()
    if not CircleBtn or not CircleBtn.Parent then
        if rainbowConnection then rainbowConnection:Disconnect() end
        return
    end
    local hue = (tick() % 5) / 5
    Stroke.Color = Color3.fromHSV(hue, 1, 1)
end)

-- 2. VÒNG TRÒN FOV (Hiển thị tầm ngắm trên màn hình)
-- Dùng Drawing API nếu executor hỗ trợ, hoặc vẽ Frame ẩn trên GUI. Dưới đây dùng Frame giao diện chuẩn cho an toàn mọi executor:
local FOVCircleFrame = Instance.new("Frame")
FOVCircleFrame.Size = UDim2.new(0, 150, 0, 150) -- Bán kính vòng tròn (đường kính 150px)
FOVCircleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVCircleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVCircleFrame.BackgroundTransparency = 1
FOVCircleFrame.Visible = false
FOVCircleFrame.Parent = gui

local FOVStroke = Instance.new("UIStroke")
FOVStroke.Thickness = 2
FOVStroke.Color = Color3.fromRGB(0, 255, 255) -- Viền xanh ngọc ngầu lòi
FOVStroke.Parent = FOVCircleFrame

local FOVCircleCorner = Instance.new("UICorner")
FOVCircleCorner.CornerRadius = UDim.new(1, 0)
FOVCircleCorner.Parent = FOVCircleFrame


-- 3. KHUNG MENU CHÍNH (Nằm chính giữa màn hình)
local MainWindow = Instance.new("Frame")
MainWindow.Size = UDim2.new(0, 380, 0, 240)
MainWindow.Position = UDim2.new(0.5, -190, 0.5, -120)
MainWindow.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainWindow.BorderSizePixel = 0
MainWindow.Visible = true
MainWindow.Parent = gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainWindow

-- 4. THANH TAB BÊN TRÁI (Sidebar)
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(0, 110, 1, 0)
TabBar.Position = UDim2.new(0, 0, 0, 0)
TabBar.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainWindow

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 10)
TabBarCorner.Parent = TabBar

-- Đường kẻ phân cách
local Line = Instance.new("Frame")
Line.Size = UDim2.new(0, 1, 1, 0)
Line.Position = UDim2.new(1, 0, 0, 0)
Line.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Line.BorderSizePixel = 0
Line.Parent = TabBar

-- Nút Tab 1: Main
local Tab1Btn = Instance.new("TextButton")
Tab1Btn.Size = UDim2.new(1, -16, 0, 32)
Tab1Btn.Position = UDim2.new(0, 8, 0, 15)
Tab1Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Tab1Btn.BorderSizePixel = 0
Tab1Btn.Font = Enum.Font.GothamBold
Tab1Btn.Text = "Main"
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Btn.TextSize = 13
Tab1Btn.Parent = TabBar

local Tab1BtnCorner = Instance.new("UICorner")
Tab1BtnCorner.CornerRadius = UDim.new(0, 6)
Tab1BtnCorner.Parent = Tab1Btn

-- 5. KHUNG HIỂN THỊ NỘI DUNG TAB 1
local Tab1Content = Instance.new("ScrollingFrame")
Tab1Content.Size = UDim2.new(1, -125, 1, -20)
Tab1Content.Position = UDim2.new(0, 118, 0, 10)
Tab1Content.BackgroundTransparency = 1
Tab1Content.BorderSizePixel = 0
Tab1Content.CanvasSize = UDim2.new(0, 0, 0, 200)
Tab1Content.ScrollBarThickness = 4
Tab1Content.Visible = true
Tab1Content.Parent = MainWindow

-- Tiêu đề Tab 1
local Tab1Title = Instance.new("TextLabel")
Tab1Title.Size = UDim2.new(1, 0, 0, 25)
Tab1Title.Position = UDim2.new(0, 0, 0, 0)
Tab1Title.BackgroundTransparency = 1
Tab1Title.Font = Enum.Font.GothamBold
Tab1Title.Text = "Main Features"
Tab1Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Title.TextSize = 14
Tab1Title.TextXAlignment = Enum.TextXAlignment.Left
Tab1Title.Parent = Tab1Content

-- Tính năng 1: WalkSpeed
local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Size = UDim2.new(1, -5, 0, 32)
SpeedToggle.Position = UDim2.new(0, 0, 0, 35)
SpeedToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
SpeedToggle.BorderSizePixel = 0
SpeedToggle.Font = Enum.Font.Gotham
SpeedToggle.Text = "  Toc do chay: Tat"
SpeedToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedToggle.TextSize = 12
SpeedToggle.TextXAlignment = Enum.TextXAlignment.Left
SpeedToggle.Parent = Tab1Content

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0, 6)
SpeedCorner.Parent = SpeedToggle

local speedEnabled = false
local speedConnection
SpeedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    if speedEnabled then
        SpeedToggle.Text = "  Toc do chay: Bat"
        SpeedToggle.BackgroundColor3 = Color3.fromRGB(0, 120, 60)
        SpeedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        speedConnection = RunService.RenderStepped:Connect(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 50
            end
        end)
    else
        SpeedToggle.Text = "  Toc do chay: Tat"
        SpeedToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        SpeedToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
        if speedConnection then speedConnection:Disconnect() end
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end
end)

-- Tính năng 2: Aim Lock với FOV Circle (Khóa vào đầu ai nằm trong vòng tròn)
local AimToggle = Instance.new("TextButton")
AimToggle.Size = UDim2.new(1, -5, 0, 32)
AimToggle.Position = UDim2.new(0, 0, 0, 75)
AimToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
AimToggle.BorderSizePixel = 0
AimToggle.Font = Enum.Font.Gotham
AimToggle.Text = "  Aim Lock FOV: Tat"
AimToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
AimToggle.TextSize = 12
AimToggle.TextXAlignment = Enum.TextXAlignment.Left
AimToggle.Parent = Tab1Content

local AimCorner = Instance.new("UICorner")
AimCorner.CornerRadius = UDim.new(0, 6)
AimCorner.Parent = AimToggle

local aimEnabled = false
local aimConnection

local function getTargetInFOV()
    local target = nil
    local shortestDist = 75 -- Bán kính FOV tính bằng pixel (150 / 2)
    
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player and p.Character then
            -- Ưu tiên khóa vào Đầu (Head), nếu không có thì lấy HumanoidRootPart
            local head = p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")
            local humanoid = p.Character:FindFirstChild("Humanoid")
            
            if head and humanoid and humanoid.Health > 0 then
                local pos, onScreen = camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    -- Tính khoảng cách từ tâm màn hình đến vị trí nhân vật
                    local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                    local dist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                    
                    -- Nếu nằm trong vòng tròn FOV thì chọn làm mục tiêu gần nhất
                    if dist <= shortestDist then
                        shortestDist = dist
                        target = head
                    end
                end
            end
        end
    end
    return target
end

AimToggle.MouseButton1Click:Connect(function()
    aimEnabled = not aimEnabled
    if aimEnabled then
        AimToggle.Text = "  Aim Lock FOV: Bat"
        AimToggle.BackgroundColor3 = Color3.fromRGB(0, 120, 60)
        AimToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
        FOVCircleFrame.Visible = true -- Hiện vòng tròn FOV lên màn hình
        
        aimConnection = RunService.RenderStepped:Connect(function()
            local target = getTargetInFOV()
            if target then
                camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
            end
        end)
    else
        AimToggle.Text = "  Aim Lock FOV: Tat"
        AimToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        AimToggle.TextColor3 = Color3.fromRGB(200, 200, 200)
        FOVCircleFrame.Visible = false -- Tắt vòng tròn FOV đi
        if aimConnection then aimConnection:Disconnect() end
    end
end)

-- 6. HÀM KÉO THẢ CHUNG
local function MakeDraggable(obj)
    local dragging = false
    local dragStart, startPos, dragInput

    obj.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = obj.Position
            dragInput = input
        end
    end)

    obj.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            obj.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input == dragInput then
            dragging = false
        end
    end)
end

MakeDraggable(MainWindow)
MakeDraggable(CircleBtn)

-- 7. SỰ KIỆN BẬT / TẮT MENU
CircleBtn.MouseButton1Click:Connect(function()
    MainWindow.Visible = not MainWindow.Visible
end)
