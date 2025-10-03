-- FroggiHub - Steal a Brainrot
-- Created for DeltaX Injector

local FroggiHub = {}

-- Анимация загрузки
local function LoadingAnimation()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FroggiHubLoading"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = game.CoreGui

    -- Фон с размытием
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BackgroundTransparency = 0.7
    background.BorderSizePixel = 0
    background.Parent = screenGui

    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Size = 10
    blurEffect.Parent = screenGui

    -- Основной контейнер
    local container = Instance.new("Frame")
    container.Size = UDim2.new(0, 400, 0, 200)
    container.Position = UDim2.new(0.5, -200, 0.5, -100)
    container.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    container.BackgroundTransparency = 0.2
    container.BorderSizePixel = 0
    container.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(0, 0.4, 0.8)
    stroke.Thickness = 3
    stroke.Parent = container

    -- Анимированный заголовок
    local titleText = "FroggiHub"
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 60)
    titleLabel.Position = UDim2.new(0, 0, 0.3, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = ""
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 28
    titleLabel.Font = Enum.Font.GothamBlack
    titleLabel.TextStrokeTransparency = 0.5
    titleLabel.TextStrokeColor3 = Color3.new(0, 0.3, 0.6)
    titleLabel.Parent = container

    -- Подзаголовок
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 30)
    subtitle.Position = UDim2.new(0, 0, 0.6, 0)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Steal a Brainrot"
    subtitle.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    subtitle.TextSize = 16
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextTransparency = 1
    subtitle.Parent = container

    -- Анимация появления букв
    spawn(function()
        for i = 1, #titleText do
            titleLabel.Text = string.sub(titleText, 1, i)
            wait(0.1)
        end
        
        -- Появление подзаголовка
        for i = 0, 1, 0.1 do
            subtitle.TextTransparency = 1 - i
            wait(0.03)
        end
        
        wait(1)
        
        -- Исчезновение
        for i = 0, 1, 0.05 do
            container.BackgroundTransparency = 0.2 + i * 0.8
            titleLabel.TextTransparency = i
            subtitle.TextTransparency = i
            stroke.Transparency = i
            wait(0.03)
        end
        
        screenGui:Destroy()
    end)

    return screenGui
end

-- Запуск анимации
spawn(LoadingAnimation)
wait(2)

-- Основной GUI
local function CreateGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "FroggiHub"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = MainFrame

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.new(0.3, 0.3, 0.3)
    Stroke.Thickness = 2
    Stroke.Parent = MainFrame

    -- Заголовок для перемещения
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Title.Text = "FroggiHub - Steal a Brainrot"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 16
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 12)
    TitleCorner.Parent = Title

    -- Кнопки управления
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -35, 0, 5)
    CloseButton.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.TextSize = 14
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = Title

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
    MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
    MinimizeButton.TextSize = 14
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = Title

    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 6)
    MinimizeCorner.Parent = MinimizeButton

    -- Боковая панель
    local SidePanel = Instance.new("Frame")
    SidePanel.Size = UDim2.new(0, 150, 0, 360)
    SidePanel.Position = UDim2.new(0, 0, 0, 40)
    SidePanel.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
    SidePanel.BorderSizePixel = 0
    SidePanel.Parent = MainFrame

    local SideCorner = Instance.new("UICorner")
    SideCorner.CornerRadius = UDim.new(0, 12)
    SideCorner.Parent = SidePanel

    -- Контент панель с скроллом
    local ContentPanel = Instance.new("ScrollingFrame")
    ContentPanel.Size = UDim2.new(0, 450, 0, 360)
    ContentPanel.Position = UDim2.new(0, 150, 0, 40)
    ContentPanel.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    ContentPanel.BorderSizePixel = 0
    ContentPanel.ScrollBarThickness = 8
    ContentPanel.ScrollBarImageColor3 = Color3.new(0.3, 0.3, 0.3)
    ContentPanel.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 500)
    ContentPanel.Parent = MainFrame

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 12)
    ContentCorner.Parent = ContentPanel

    -- Переменные для управления
    local CurrentSection = "Main"
    local isMinimized = false
    local isDragging = false
    local dragStart, frameStart

    -- Переменные для функций
    local Noclip = false
    local Flying = false
    local InfiniteJump = false
    local SpeedHack = false
    local SpeedValue = 50
    local JumpHack = false
    local JumpValue = 100
    local Gliding = false
    local Invisible = false
    local FlyConnection
    local FlySpeed = 50

    -- Функция перемещения
    Title.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = true
            dragStart = input.Position
            frameStart = MainFrame.Position
        end
    end)

    Title.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isDragging = false
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if isDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(frameStart.X.Scale, frameStart.X.Offset + delta.X, frameStart.Y.Scale, frameStart.Y.Offset + delta.Y)
        end
    end)

    -- Кнопка закрытия
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Кнопка сворачивания (исправленная)
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            SidePanel.Visible = false
            ContentPanel.Visible = false
            MainFrame.Size = UDim2.new(0, 600, 0, 40)
            MinimizeButton.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
        else
            SidePanel.Visible = true
            ContentPanel.Visible = true
            MainFrame.Size = UDim2.new(0, 600, 0, 400)
            MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        end
    end)

    -- Кнопки разделов
    local Sections = {"Main", "Visual", "Brainrot", "ESP", "Info"}
    local SectionButtons = {}

    -- Функции
    local function FlyFunc(toggle)
        Flying = toggle
        local player = game.Players.LocalPlayer
        
        if toggle then
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.PlatformStand = true
            
            local bodyGyro = Instance.new("BodyGyro")
            bodyGyro.P = 1000
            bodyGyro.D = 50
            bodyGyro.MaxTorque = Vector3.new(10000, 10000, 10000)
            bodyGyro.CFrame = character.HumanoidRootPart.CFrame
            bodyGyro.Parent = character.HumanoidRootPart
            
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
            bodyVelocity.Parent = character.HumanoidRootPart
            
            FlyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                if Flying and character and character.HumanoidRootPart then
                    local camera = workspace.CurrentCamera
                    local direction = camera.CFrame.LookVector
                    
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                        bodyVelocity.Velocity = direction * FlySpeed
                    elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                        bodyVelocity.Velocity = -direction * FlySpeed
                    elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                        bodyVelocity.Velocity = -camera.CFrame.RightVector * FlySpeed
                    elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                        bodyVelocity.Velocity = camera.CFrame.RightVector * FlySpeed
                    else
                        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    end
                    
                    -- Вертикальное движение
                    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                        bodyVelocity.Velocity = bodyVelocity.Velocity + Vector3.new(0, FlySpeed, 0)
                    elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                        bodyVelocity.Velocity = bodyVelocity.Velocity + Vector3.new(0, -FlySpeed, 0)
                    end
                end
            end)
        else
            if FlyConnection then
                FlyConnection:Disconnect()
            end
            if player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.PlatformStand = false
                end
                local bodyGyro = player.Character.HumanoidRootPart:FindFirstChild("BodyGyro")
                local bodyVelocity = player.Character.HumanoidRootPart:FindFirstChild("BodyVelocity")
                if bodyGyro then bodyGyro:Destroy() end
                if bodyVelocity then bodyVelocity:Destroy() end
            end
        end
    end

    local function InfiniteJumpFunc(toggle)
        InfiniteJump = toggle
        local connection
        if toggle then
            connection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if InfiniteJump and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
        else
            if connection then
                connection:Disconnect()
            end
        end
    end

    local function SpeedHackFunc(toggle)
        SpeedHack = toggle
        if toggle then
            spawn(function()
                while SpeedHack and game.Players.LocalPlayer.Character do
                    wait()
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = SpeedValue
                    end
                end
            end)
        else
            if game.Players.LocalPlayer.Character then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end

    local function JumpHackFunc(toggle)
        JumpHack = toggle
        if toggle then
            spawn(function()
                while JumpHack and game.Players.LocalPlayer.Character do
                    wait()
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.JumpPower = JumpValue
                    end
                end
            end)
        else
            if game.Players.LocalPlayer.Character then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.JumpPower = 50
                end
            end
        end
    end

    local function GlideFunc(toggle)
        Gliding = toggle
        if toggle then
            spawn(function()
                while Gliding and game.Players.LocalPlayer.Character do
                    wait()
                    local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    local rootPart = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if humanoid and rootPart and humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                        rootPart.Velocity = Vector3.new(rootPart.Velocity.X, -10, rootPart.Velocity.Z)
                    end
                end
            end)
        end
    end

    local function InvisibleFunc(toggle)
        Invisible = toggle
        if toggle then
            if game.Players.LocalPlayer.Character then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 1
                    end
                end
            end
        else
            if game.Players.LocalPlayer.Character then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Transparency = 0
                    end
                end
            end
        end
    end

    local function AntiAFKFunc(toggle)
        if toggle then
            local VirtualUser = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end

    local function TpToPlayer()
        -- Меню выбора игрока для телепортации
        local playerMenu = Instance.new("Frame")
        playerMenu.Size = UDim2.new(0, 300, 0, 400)
        playerMenu.Position = UDim2.new(0.5, -150, 0.5, -200)
        playerMenu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        playerMenu.Parent = ScreenGui

        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, -10, 1, -40)
        scrollFrame.Position = UDim2.new(0, 5, 0, 35)
        scrollFrame.BackgroundTransparency = 1
        scrollFrame.ScrollBarThickness = 8
        scrollFrame.Parent = playerMenu

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Text = "Select Player to TP"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        title.Parent = playerMenu

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 25, 0, 25)
        closeBtn.Position = UDim2.new(1, -30, 0, 5)
        closeBtn.Text = "X"
        closeBtn.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
        closeBtn.Parent = playerMenu
        closeBtn.MouseButton1Click:Connect(function()
            playerMenu:Destroy()
        end)

        local yPos = 0
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.Position = UDim2.new(0, 5, 0, yPos)
                btn.Text = player.Name
                btn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
                btn.Parent = scrollFrame
                btn.MouseButton1Click:Connect(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    end
                    playerMenu:Destroy()
                end)
                yPos = yPos + 35
            end
        end
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end

    local function TpPlayersBase()
        -- Меню выбора базы для телепортации (НЕРАБОЧАЯ)
        local baseMenu = Instance.new("Frame")
        baseMenu.Size = UDim2.new(0, 300, 0, 200)
        baseMenu.Position = UDim2.new(0.5, -150, 0.5, -100)
        baseMenu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        baseMenu.Parent = ScreenGui

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Text = "TP Players Base - НЕРАБОЧАЯ"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        title.Parent = baseMenu

        local message = Instance.new("TextLabel")
        message.Size = UDim2.new(1, -20, 0, 100)
        message.Position = UDim2.new(0, 10, 0, 40)
        message.Text = "Эта функция требует настройки под конкретную игру.\n\nНужно найти названия баз игроков в Explorer."
        message.TextColor3 = Color3.new(1, 1, 1)
        message.TextSize = 12
        message.TextWrapped = true
        message.BackgroundTransparency = 1
        message.Parent = baseMenu

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 100, 0, 30)
        closeBtn.Position = UDim2.new(0.5, -50, 1, -40)
        closeBtn.Text = "Закрыть"
        closeBtn.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
        closeBtn.Parent = baseMenu
        closeBtn.MouseButton1Click:Connect(function()
            baseMenu:Destroy()
        end)
    end

    local function DupeBrainrotFunc(toggle)
        if toggle then
            -- НЕРАБОЧАЯ - нужны реальные названия предметов
            local player = game.Players.LocalPlayer
            if player.Character then
                local tool = player.Character:FindFirstChildOfClass("Tool")
                if tool then
                    -- Дюп предмета в руках (заглушка)
                    print("Dupe Brainrot - НЕРАБОЧАЯ")
                    print("Нужно настроить дюп для конкретных предметов игры")
                else
                    print("Нет предмета в руках для дюпа")
                end
            end
        end
    end

    local function CreateBrainrotSelector(titleText, callback)
        -- Меню выбора брейнротов (НЕРАБОЧАЯ)
        local selectorMenu = Instance.new("Frame")
        selectorMenu.Size = UDim2.new(0, 300, 0, 200)
        selectorMenu.Position = UDim2.new(0.5, -150, 0.5, -100)
        selectorMenu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        selectorMenu.Parent = ScreenGui

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Text = titleText .. " - НЕРАБОЧАЯ"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        title.Parent = selectorMenu

        local message = Instance.new("TextLabel")
        message.Size = UDim2.new(1, -20, 0, 100)
        message.Position = UDim2.new(0, 10, 0, 40)
        message.Text = "Эта функция требует настройки.\n\nНужно найти реальные названия Brainrot предметов в игре через Explorer."
        message.TextColor3 = Color3.new(1, 1, 1)
        message.TextSize = 12
        message.TextWrapped = true
        message.BackgroundTransparency = 1
        message.Parent = selectorMenu

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 100, 0, 30)
        closeBtn.Position = UDim2.new(0.5, -50, 1, -40)
        closeBtn.Text = "Закрыть"
        closeBtn.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
        closeBtn.Parent = selectorMenu
        closeBtn.MouseButton1Click:Connect(function()
            selectorMenu:Destroy()
        end)
    end

    -- НЕРАБОЧИЕ функции
    local function AntiRagdollFunc(toggle) 
        print("Anti Ragdoll - НЕРАБОЧАЯ")
    end

    local function AutoFarmFunc(toggle) 
        print("Auto Farm - НЕРАБОЧАЯ")
    end

    local function InvisibleSwapFunc(toggle) 
        print("Invisible Swap - НЕРАБОЧАЯ")
    end

    local function AutoSaveBaseFunc(toggle) 
        print("Auto Save Base - НЕРАБОЧАЯ")
    end

    local selectedBrainrots = {}
    local function AutoStealFunc(toggle)
        if toggle then
            CreateBrainrotSelector("Select Brainrots to Auto Steal", function(brainrot)
                selectedBrainrots[brainrot] = true
                print("Auto Steal: " .. brainrot)
            end)
        else
            selectedBrainrots = {}
        end
    end

    local function AutoBuyFunc(toggle)
        if toggle then
            CreateBrainrotSelector("Select Brainrots to Auto Buy", function(brainrot)
                selectedBrainrots[brainrot] = true
                print("Auto Buy: " .. brainrot)
            end)
        else
            selectedBrainrots = {}
        end
    end

    -- Функции ESP
    local function CreatePlayerESP(player)
        -- ESP для игрока
        if player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Name = "PlayerESP_" .. player.Name
            highlight.FillColor = Color3.new(1, 0, 0)
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.Parent = player.Character
            
            -- Информация над игроком
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "PlayerInfo"
            billboard.Size = UDim2.new(0, 200, 0, 100)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.new(0, 0, 0)
            frame.BackgroundTransparency = 0.3
            frame.Parent = billboard
            
            local infoLabel = Instance.new("TextLabel")
            infoLabel.Size = UDim2.new(1, 0, 1, 0)
            infoLabel.BackgroundTransparency = 1
            infoLabel.Text = player.Name .. "\nHealth: 100\nMoney: $0"
            infoLabel.TextColor3 = Color3.new(1, 1, 1)
            infoLabel.TextSize = 12
            infoLabel.Font = Enum.Font.Gotham
            infoLabel.TextWrapped = true
            infoLabel.Parent = frame
            
            if player.Character:FindFirstChild("Head") then
                billboard.Parent = player.Character.Head
            end
        end
    end

    local function RemovePlayerESP(player)
        if player.Character then
            local highlight = player.Character:FindFirstChild("PlayerESP_" .. player.Name)
            if highlight then
                highlight:Destroy()
            end
            local billboard = player.Character:FindFirstChild("PlayerInfo")
            if billboard then
                billboard:Destroy()
            end
        end
    end

    local ESPPlayersEnabled = false
    local function ESPPlayersFunc(toggle)
        ESPPlayersEnabled = toggle
        if toggle then
            -- Включение ESP игроков
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    CreatePlayerESP(player)
                end
            end
        else
            -- Выключение ESP игроков
            for _, player in pairs(game.Players:GetPlayers()) do
                RemovePlayerESP(player)
            end
        end
    end

    local function UpdateContent()
        -- Очистка контента
        for _, child in pairs(ContentPanel:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("TextLabel") then
                child:Destroy()
            end
        end

        -- Обновление цвета активной кнопки
        for sectionName, btn in pairs(SectionButtons) do
            if sectionName == CurrentSection then
                btn.BackgroundColor3 = Color3.new(0, 0.5, 1)
            else
                btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            end
        end

        -- Функции для создания элементов
        local function CreateToggle(name, position, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(0, 200, 0, 30)
            ToggleFrame.Position = UDim2.new(0, 20, 0, position)
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Parent = ContentPanel

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 30, 0, 30)
            ToggleButton.Position = UDim2.new(0, 0, 0, 0)
            ToggleButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 6)
            ToggleCorner.Parent = ToggleButton

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(0, 160, 0, 30)
            ToggleLabel.Position = UDim2.new(0, 40, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = name
            ToggleLabel.TextColor3 = Color3.new(1, 1, 1)
            ToggleLabel.TextSize = 14
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Parent = ToggleFrame

            local isToggled = false

            ToggleButton.MouseButton1Click:Connect(function()
                isToggled = not isToggled
                if isToggled then
                    ToggleButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
                else
                    ToggleButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
                end
                if callback then
                    callback(isToggled)
                end
            end)

            return ToggleFrame
        end

        local function CreateButton(name, position, callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 200, 0, 35)
            Button.Position = UDim2.new(0, 20, 0, position)
            Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            Button.Text = name
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.TextSize = 14
            Button.Font = Enum.Font.Gotham
            Button.Parent = ContentPanel

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = Button

            Button.MouseButton1Click:Connect(function()
                if callback then
                    callback()
                end
            end)

            return Button
        end

        local function CreateValueButton(name, position, values, currentIndex, callback)
            local ValueFrame = Instance.new("Frame")
            ValueFrame.Size = UDim2.new(0, 200, 0, 35)
            ValueFrame.Position = UDim2.new(0, 20, 0, position)
            ValueFrame.BackgroundTransparency = 1
            ValueFrame.Parent = ContentPanel

            local ValueButton = Instance.new("TextButton")
            ValueButton.Size = UDim2.new(0, 200, 0, 35)
            ValueButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            ValueButton.Text = name .. ": " .. tostring(values[currentIndex])
            ValueButton.TextColor3 = Color3.new(1, 1, 1)
            ValueButton.TextSize = 14
            ValueButton.Font = Enum.Font.Gotham
            ValueButton.Parent = ValueFrame

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = ValueButton

            ValueButton.MouseButton1Click:Connect(function()
                currentIndex = currentIndex % #values + 1
                ValueButton.Text = name .. ": " .. tostring(values[currentIndex])
                if callback then
                    callback(values[currentIndex])
                end
            end)

            return ValueFrame
        end

        -- Содержимое разделов
        if CurrentSection == "Main" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 400)
            
            CreateToggle("NoClip", 20, function(toggle)
                Noclip = toggle
                if toggle then
                    spawn(function()
                        while Noclip and game.Players.LocalPlayer.Character do
                            wait()
                            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end)
                end
            end)

            CreateToggle("Fly", 60, FlyFunc)
            CreateToggle("Infinite Jump", 100, InfiniteJumpFunc)
            CreateToggle("Speed Hack", 140, SpeedHackFunc)
            
            CreateValueButton("Speed Value", 180, {16, 25, 50, 75, 100}, 3, function(value)
                SpeedValue = value
                if SpeedHack then
                    SpeedHackFunc(true)
                end
            end)
            
            CreateToggle("Jump Hack", 225, JumpHackFunc)
            
            CreateValueButton("Jump Value", 265, {50, 75, 100, 150, 200}, 3, function(value)
                JumpValue = value
                if JumpHack then
                    JumpHackFunc(true)
                end
            end)
            
            CreateToggle("Glide", 310, GlideFunc)
            CreateToggle("Anti AFK", 350, AntiAFKFunc)

        elseif CurrentSection == "Visual" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 100)
            
            CreateToggle("Invisible", 20, InvisibleFunc)
            CreateToggle("Invisible Swap - НЕРАБОЧАЯ", 60, InvisibleSwapFunc)

        elseif CurrentSection == "Brainrot" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 350)
            
            CreateToggle("Auto Farm - НЕРАБОЧАЯ", 20, AutoFarmFunc)
            CreateToggle("Auto Steal - НЕРАБОЧАЯ", 60, AutoStealFunc)
            CreateToggle("Dupe Brainrot - НЕРАБОЧАЯ", 100, DupeBrainrotFunc)
            CreateButton("TP to Player", 140, TpToPlayer)
            CreateButton("TP Players Base - НЕРАБОЧАЯ", 185, TpPlayersBase)
            CreateToggle("Auto Save Base - НЕРАБОЧАЯ", 230, AutoSaveBaseFunc)
            CreateToggle("Auto Buy - НЕРАБОЧАЯ", 270, AutoBuyFunc)
            CreateToggle("Anti Ragdoll - НЕРАБОЧАЯ", 310, AntiRagdollFunc)

        elseif CurrentSection == "ESP" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 200)
            
            CreateToggle("ESP Players", 20, ESPPlayersFunc)
            CreateToggle("ESP My Base - НЕРАБОЧАЯ", 60, function(toggle)
                print("ESP My Base: " .. tostring(toggle))
            end)

            CreateToggle("ESP Brainrot - НЕРАБОЧАЯ", 100, function(toggle)
                print("ESP Brainrot: " .. tostring(toggle))
            end)

            CreateToggle("ESP Players Base - НЕРАБОЧАЯ", 140, function(toggle)
                print("ESP Players Base: " .. tostring(toggle))
            end)

        elseif CurrentSection == "Info" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 350)
            
            local InfoText = Instance.new("TextLabel")
            InfoText.Size = UDim2.new(0, 400, 0, 330)
            InfoText.Position = UDim2.new(0, 25, 0, 20)
            InfoText.BackgroundTransparency = 1
            InfoText.Text = [[FroggiHub - Steal a Brainrot

Version: 1.3
Created for DeltaX Injector

РАБОЧИЕ ФУНКЦИИ:
• NoClip
• Fly (WASD + Space/Shift)
• Infinite Jump
• Speed Hack
• Jump Hack
• Glide
• Anti AFK
• Invisible
• TP to Player
• ESP Players

НЕРАБОЧИЕ ФУНКЦИИ:
(требуют настройки под игру)

Для настройки нужно:
1. Открыть Developer Console (F9)
2. Найти названия объектов в Explorer
3. Заменить заглушки в коде

Creator: FroggiTeam
Place: Steal a Brainrot

Thanks for using FroggiHub!]]
            InfoText.TextColor3 = Color3.new(1, 1, 1)
            InfoText.TextSize = 14
            InfoText.TextXAlignment = Enum.TextXAlignment.Left
            InfoText.TextYAlignment = Enum.TextYAlignment.Top
            InfoText.Font = Enum.Font.Gotham
            InfoText.TextWrapped = true
            InfoText.Parent = ContentPanel
        end
    end

    -- Создание кнопок разделов
    local function CreateSectionButton(name, position)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 140, 0, 35)
        Button.Position = UDim2.new(0, 5, 0, position)
        Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        Button.Text = name
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.TextSize = 14
        Button.Font = Enum.Font.Gotham
        Button.Parent = SidePanel

        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 8)
        ButtonCorner.Parent = Button

        SectionButtons[name] = Button

        Button.MouseButton1Click:Connect(function()
            CurrentSection = name
            UpdateContent()
        end)

        return Button
    end

    -- Создание всех кнопок разделов
    for i, section in ipairs(Sections) do
        CreateSectionButton(section, 10 + (i-1)*45)
    end

    -- Инициализация
    UpdateContent()
    SectionButtons["Main"].BackgroundColor3 = Color3.new(0, 0.5, 1) -- Активная кнопка
    ScreenGui.Parent = game.CoreGui

    return ScreenGui
end

-- Запуск GUI
CreateGUI()

print("FroggiHub - Steal a Brainrot loaded successfully!")
