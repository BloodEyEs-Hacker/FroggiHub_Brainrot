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
    container.Size = UDim2.new(0, 350, 0, 180)
    container.Position = UDim2.new(0.5, -175, 0.5, -90)
    container.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    container.BackgroundTransparency = 0.2
    container.BorderSizePixel = 0
    container.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = container

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.new(0, 0.4, 0.8)
    stroke.Thickness = 2
    stroke.Parent = container

    -- Анимированный заголовок
    local titleText = "FroggiHub"
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 50)
    titleLabel.Position = UDim2.new(0, 0, 0.3, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = ""
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 24
    titleLabel.Font = Enum.Font.GothamBlack
    titleLabel.TextStrokeTransparency = 0.5
    titleLabel.TextStrokeColor3 = Color3.new(0, 0.3, 0.6)
    titleLabel.Parent = container

    -- Подзаголовок
    local subtitle = Instance.new("TextLabel")
    subtitle.Size = UDim2.new(1, 0, 0, 25)
    subtitle.Position = UDim2.new(0, 0, 0.6, 0)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Steal a Brainrot"
    subtitle.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    subtitle.TextSize = 14
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
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = MainFrame

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.new(0.3, 0.3, 0.3)
    Stroke.Thickness = 2
    Stroke.Parent = MainFrame

    -- Заголовок для перемещения
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 35)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    Title.Text = "FroggiHub - Steal a Brainrot"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.TextSize = 14
    Title.Font = Enum.Font.GothamBold
    Title.Parent = MainFrame

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 10)
    TitleCorner.Parent = Title

    -- Кнопки управления
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Position = UDim2.new(1, -30, 0, 5)
    CloseButton.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.TextSize = 12
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Parent = Title

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 5)
    CloseCorner.Parent = CloseButton

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 25, 0, 25)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 5)
    MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
    MinimizeButton.TextSize = 12
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.Parent = Title

    local MinimizeCorner = Instance.new("UICorner")
    MinimizeCorner.CornerRadius = UDim.new(0, 5)
    MinimizeCorner.Parent = MinimizeButton

    -- Боковая панель
    local SidePanel = Instance.new("Frame")
    SidePanel.Size = UDim2.new(0, 120, 0, 315)
    SidePanel.Position = UDim2.new(0, 0, 0, 35)
    SidePanel.BackgroundColor3 = Color3.new(0.12, 0.12, 0.12)
    SidePanel.BorderSizePixel = 0
    SidePanel.Parent = MainFrame

    local SideCorner = Instance.new("UICorner")
    SideCorner.CornerRadius = UDim.new(0, 10)
    SideCorner.Parent = SidePanel

    -- Контент панель с скроллом
    local ContentPanel = Instance.new("ScrollingFrame")
    ContentPanel.Size = UDim2.new(0, 380, 0, 315)
    ContentPanel.Position = UDim2.new(0, 120, 0, 35)
    ContentPanel.BackgroundColor3 = Color3.new(0.18, 0.18, 0.18)
    ContentPanel.BorderSizePixel = 0
    ContentPanel.ScrollBarThickness = 6
    ContentPanel.ScrollBarImageColor3 = Color3.new(0.3, 0.3, 0.3)
    ContentPanel.VerticalScrollBarInset = Enum.ScrollBarInset.Always
    ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 500)
    ContentPanel.Parent = MainFrame

    local ContentCorner = Instance.new("UICorner")
    ContentCorner.CornerRadius = UDim.new(0, 10)
    ContentCorner.Parent = ContentPanel

    -- Переменные для управления
    local CurrentSection = "Main"
    local isMinimized = false
    local isDragging = false
    local dragStart, frameStart

    -- Глобальные переменные для состояний функций
    local ToggleStates = {
        Noclip = false,
        Flying = false,
        InfiniteJump = false,
        SpeedHack = false,
        JumpHack = false,
        Gliding = false,
        Invisible = false,
        AntiRagdollEnabled = false,
        AntiAFKEnabled = false,
        AutoSaveBaseEnabled = false,
        ESPPlayersEnabled = false,
        InvisibleSwap = false,
        AutoFarm = false,
        AutoSteal = false,
        DupeBrainrot = false,
        AutoBuy = false,
        ESPMyBase = false,
        ESPBrainrot = false,
        ESPPlayersBase = false
    }

    local FlyConnection
    local FlySpeed = 50
    local SpeedValue = 50
    local JumpValue = 100
    local SaveBasePosition = nil
    local AutoSaveBaseInterval = 30
    local ToggleButtons = {} -- Хранит ссылки на кнопки переключателей
    local AutoSaveBaseConnection

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

    -- Кнопка сворачивания
    MinimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            SidePanel.Visible = false
            ContentPanel.Visible = false
            MainFrame.Size = UDim2.new(0, 500, 0, 35)
            MinimizeButton.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
        else
            SidePanel.Visible = true
            ContentPanel.Visible = true
            MainFrame.Size = UDim2.new(0, 500, 0, 350)
            MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        end
    end)

    -- Кнопки разделов
    local Sections = {"Main", "Visual", "Brainrot", "ESP", "Info"}
    local SectionButtons = {}

    -- Функции
    local function FlyFunc(toggle)
        ToggleStates.Flying = toggle
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
                if ToggleStates.Flying and character and character.HumanoidRootPart then
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
        ToggleStates.InfiniteJump = toggle
        local connection
        if toggle then
            connection = game:GetService("UserInputService").JumpRequest:Connect(function()
                if ToggleStates.InfiniteJump and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
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
        ToggleStates.SpeedHack = toggle
        if toggle then
            spawn(function()
                while ToggleStates.SpeedHack and game.Players.LocalPlayer.Character do
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
        ToggleStates.JumpHack = toggle
        if toggle then
            spawn(function()
                while ToggleStates.JumpHack and game.Players.LocalPlayer.Character do
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
        ToggleStates.Gliding = toggle
        if toggle then
            spawn(function()
                while ToggleStates.Gliding and game.Players.LocalPlayer.Character do
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
        ToggleStates.Invisible = toggle
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
        ToggleStates.AntiAFKEnabled = toggle
        if toggle then
            local VirtualUser = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end

    local function AntiRagdollFunc(toggle)
        ToggleStates.AntiRagdollEnabled = toggle
        if toggle then
            local player = game.Players.LocalPlayer
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                end
            end
        else
            local player = game.Players.LocalPlayer
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
                end
            end
        end
    end

    local function NoClipFunc(toggle)
        ToggleStates.Noclip = toggle
        if toggle then
            spawn(function()
                while ToggleStates.Noclip and game.Players.LocalPlayer.Character do
                    wait()
                    for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end

    local function TpToPlayer()
        local playerMenu = Instance.new("Frame")
        playerMenu.Size = UDim2.new(0, 250, 0, 350)
        playerMenu.Position = UDim2.new(0.5, -125, 0.5, -175)
        playerMenu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        playerMenu.Parent = ScreenGui

        local scrollFrame = Instance.new("ScrollingFrame")
        scrollFrame.Size = UDim2.new(1, -10, 1, -40)
        scrollFrame.Position = UDim2.new(0, 5, 0, 35)
        scrollFrame.BackgroundTransparency = 1
        scrollFrame.ScrollBarThickness = 6
        scrollFrame.Parent = playerMenu

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Text = "Select Player to TP"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        title.Parent = playerMenu

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 20, 0, 20)
        closeBtn.Position = UDim2.new(1, -25, 0, 5)
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
                btn.Size = UDim2.new(1, -10, 0, 25)
                btn.Position = UDim2.new(0, 5, 0, yPos)
                btn.Text = player.Name
                btn.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
                btn.TextColor3 = Color3.new(1, 1, 1)
                btn.TextSize = 11
                btn.Parent = scrollFrame
                btn.MouseButton1Click:Connect(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    end
                    playerMenu:Destroy()
                end)
                yPos = yPos + 30
            end
        end
        scrollFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
    end

    local function TpPlayersBase()
        local baseMenu = Instance.new("Frame")
        baseMenu.Size = UDim2.new(0, 250, 0, 180)
        baseMenu.Position = UDim2.new(0.5, -125, 0.5, -90)
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
        message.TextSize = 11
        message.TextWrapped = true
        message.BackgroundTransparency = 1
        message.Parent = baseMenu

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 80, 0, 25)
        closeBtn.Position = UDim2.new(0.5, -40, 1, -35)
        closeBtn.Text = "Закрыть"
        closeBtn.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
        closeBtn.Parent = baseMenu
        closeBtn.MouseButton1Click:Connect(function()
            baseMenu:Destroy()
        end)
    end

    local function ShowAutoSaveBaseMenu()
        local saveMenu = Instance.new("Frame")
        saveMenu.Size = UDim2.new(0, 250, 0, 200)
        saveMenu.Position = UDim2.new(0.5, -125, 0.5, -100)
        saveMenu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
        saveMenu.Parent = ScreenGui

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 30)
        title.Text = "Auto Save Base Settings"
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        title.Parent = saveMenu

        local setPointBtn = Instance.new("TextButton")
        setPointBtn.Size = UDim2.new(0, 180, 0, 30)
        setPointBtn.Position = UDim2.new(0.5, -90, 0, 40)
        setPointBtn.Text = "Set Save Point"
        setPointBtn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        setPointBtn.TextColor3 = Color3.new(1, 1, 1)
        setPointBtn.TextSize = 11
        setPointBtn.Parent = saveMenu

        setPointBtn.MouseButton1Click:Connect(function()
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                SaveBasePosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                setPointBtn.Text = "Point Saved!"
                wait(1)
                setPointBtn.Text = "Set Save Point"
            end
        end)

        local intervalLabel = Instance.new("TextLabel")
        intervalLabel.Size = UDim2.new(0, 180, 0, 20)
        intervalLabel.Position = UDim2.new(0.5, -90, 0, 80)
        intervalLabel.Text = "Teleport Interval (seconds):"
        intervalLabel.TextColor3 = Color3.new(1, 1, 1)
        intervalLabel.BackgroundTransparency = 1
        intervalLabel.TextSize = 11
        intervalLabel.Parent = saveMenu

        local intervalBox = Instance.new("TextBox")
        intervalBox.Size = UDim2.new(0, 180, 0, 25)
        intervalBox.Position = UDim2.new(0.5, -90, 0, 100)
        intervalBox.Text = tostring(AutoSaveBaseInterval)
        intervalBox.PlaceholderText = "Enter seconds"
        intervalBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        intervalBox.TextColor3 = Color3.new(1, 1, 1)
        intervalBox.TextSize = 11
        intervalBox.Parent = saveMenu

        local acceptBtn = Instance.new("TextButton")
        acceptBtn.Size = UDim2.new(0, 180, 0, 30)
        acceptBtn.Position = UDim2.new(0.5, -90, 0, 135)
        acceptBtn.Text = "Accept"
        acceptBtn.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
        acceptBtn.TextColor3 = Color3.new(1, 1, 1)
        acceptBtn.TextSize = 11
        acceptBtn.Parent = saveMenu

        local closeBtn = Instance.new("TextButton")
        closeBtn.Size = UDim2.new(0, 20, 0, 20)
        closeBtn.Position = UDim2.new(1, -25, 0, 5)
        closeBtn.Text = "X"
        closeBtn.BackgroundColor3 = Color3.new(1, 0.3, 0.3)
        closeBtn.Parent = saveMenu
        closeBtn.MouseButton1Click:Connect(function()
            saveMenu:Destroy()
        end)

        acceptBtn.MouseButton1Click:Connect(function()
            local newInterval = tonumber(intervalBox.Text)
            if newInterval and newInterval > 0 then
                AutoSaveBaseInterval = newInterval
                saveMenu:Destroy()
            else
                intervalBox.Text = "Invalid"
            end
        end)
    end

    local function AutoSaveBaseFunc(toggle)
        ToggleStates.AutoSaveBaseEnabled = toggle
        if toggle then
            if not SaveBasePosition then
                ShowAutoSaveBaseMenu()
            else
                if AutoSaveBaseConnection then
                    AutoSaveBaseConnection:Disconnect()
                end
                AutoSaveBaseConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if ToggleStates.AutoSaveBaseEnabled and SaveBasePosition then
                        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SaveBasePosition
                        end
                    end
                end)
            end
        else
            if AutoSaveBaseConnection then
                AutoSaveBaseConnection:Disconnect()
            end
        end
    end

    -- Функции ESP
    local function CreatePlayerESP(player)
        if player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Name = "PlayerESP_" .. player.Name
            highlight.FillColor = Color3.new(1, 0, 0)
            highlight.OutlineColor = Color3.new(1, 1, 1)
            highlight.Parent = player.Character
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "PlayerInfo"
            billboard.Size = UDim2.new(0, 150, 0, 80)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            
            local infoLabel = Instance.new("TextLabel")
            infoLabel.Size = UDim2.new(1, 0, 1, 0)
            infoLabel.BackgroundTransparency = 1
            infoLabel.Text = player.Name .. "\nHealth: 100\nMoney: $0"
            infoLabel.TextColor3 = Color3.new(1, 1, 1)
            infoLabel.TextSize = 10
            infoLabel.Font = Enum.Font.GothamBold
            infoLabel.TextWrapped = true
            infoLabel.TextStrokeTransparency = 0
            infoLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
            infoLabel.Parent = billboard
            
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

    local function ESPPlayersFunc(toggle)
        ToggleStates.ESPPlayersEnabled = toggle
        if toggle then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    CreatePlayerESP(player)
                end
            end
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                RemovePlayerESP(player)
            end
        end
    end

    local function UpdateContent()
        for _, child in pairs(ContentPanel:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("TextLabel") then
                child:Destroy()
            end
        end

        ToggleButtons = {}

        for sectionName, btn in pairs(SectionButtons) do
            if sectionName == CurrentSection then
                btn.BackgroundColor3 = Color3.new(0, 0.5, 1)
            else
                btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            end
        end

        local function CreateToggle(name, position, stateKey, callback)
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(0, 170, 0, 25)
            ToggleFrame.Position = UDim2.new(0, 15, 0, position)
            ToggleFrame.BackgroundTransparency = 1
            ToggleFrame.Parent = ContentPanel

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 25, 0, 25)
            ToggleButton.Position = UDim2.new(0, 0, 0, 0)
            ToggleButton.BackgroundColor3 = ToggleStates[stateKey] and Color3.new(0, 0.5, 1) or Color3.new(0.3, 0.3, 0.3)
            ToggleButton.Text = ""
            ToggleButton.Parent = ToggleFrame

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 5)
            ToggleCorner.Parent = ToggleButton

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(0, 140, 0, 25)
            ToggleLabel.Position = UDim2.new(0, 30, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = name
            ToggleLabel.TextColor3 = Color3.new(1, 1, 1)
            ToggleLabel.TextSize = 12
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Parent = ToggleFrame

            ToggleButtons[stateKey] = ToggleButton

            ToggleButton.MouseButton1Click:Connect(function()
                ToggleStates[stateKey] = not ToggleStates[stateKey]
                if ToggleStates[stateKey] then
                    ToggleButton.BackgroundColor3 = Color3.new(0, 0.5, 1)
                else
                    ToggleButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
                end
                if callback then
                    callback(ToggleStates[stateKey])
                end
            end)

            return ToggleFrame
        end

        local function CreateButton(name, position, callback)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 170, 0, 30)
            Button.Position = UDim2.new(0, 15, 0, position)
            Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            Button.Text = name
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.TextSize = 12
            Button.Font = Enum.Font.Gotham
            Button.Parent = ContentPanel

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
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
            ValueFrame.Size = UDim2.new(0, 170, 0, 30)
            ValueFrame.Position = UDim2.new(0, 15, 0, position)
            ValueFrame.BackgroundTransparency = 1
            ValueFrame.Parent = ContentPanel

            local ValueButton = Instance.new("TextButton")
            ValueButton.Size = UDim2.new(0, 170, 0, 30)
            ValueButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
            ValueButton.Text = name .. ": " .. tostring(values[currentIndex])
            ValueButton.TextColor3 = Color3.new(1, 1, 1)
            ValueButton.TextSize = 12
            ValueButton.Font = Enum.Font.Gotham
            ValueButton.Parent = ValueFrame

            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 6)
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

        if CurrentSection == "Main" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 350)
            
            CreateToggle("NoClip", 15, "Noclip", NoClipFunc)
            CreateToggle("Fly", 45, "Flying", FlyFunc)
            CreateToggle("Infinite Jump", 75, "InfiniteJump", InfiniteJumpFunc)
            CreateToggle("Speed Hack", 105, "SpeedHack", SpeedHackFunc)
            
            CreateValueButton("Speed Value", 135, {16, 25, 50, 75, 100}, 3, function(value)
                SpeedValue = value
                if ToggleStates.SpeedHack then
                    SpeedHackFunc(true)
                end
            end)
            
            CreateToggle("Jump Hack", 170, "JumpHack", JumpHackFunc)
            
            CreateValueButton("Jump Value", 200, {50, 75, 100, 150, 200}, 3, function(value)
                JumpValue = value
                if ToggleStates.JumpHack then
                    JumpHackFunc(true)
                end
            end)
            
            CreateToggle("Glide", 235, "Gliding", GlideFunc)
            CreateToggle("Anti AFK", 265, "AntiAFKEnabled", AntiAFKFunc)
            CreateToggle("Anti Ragdoll", 295, "AntiRagdollEnabled", AntiRagdollFunc)

        elseif CurrentSection == "Visual" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 80)
            
            CreateToggle("Invisible", 15, "Invisible", InvisibleFunc)
            CreateToggle("Invisible Swap - НЕРАБОЧАЯ", 45, "InvisibleSwap", function(toggle)
                print("Invisible Swap: " .. tostring(toggle))
            end)

        elseif CurrentSection == "Brainrot" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 280)
            
            CreateToggle("Auto Farm - НЕРАБОЧАЯ", 15, "AutoFarm", function(toggle)
                print("Auto Farm: " .. tostring(toggle))
            end)
            CreateToggle("Auto Steal - НЕРАБОЧАЯ", 45, "AutoSteal", function(toggle)
                print("Auto Steal: " .. tostring(toggle))
            end)
            CreateToggle("Dupe Brainrot - НЕРАБОЧАЯ", 75, "DupeBrainrot", function(toggle)
                print("Dupe Brainrot: " .. tostring(toggle))
            end)
            CreateButton("TP to Player", 105, TpToPlayer)
            CreateButton("TP Players Base - НЕРАБОЧАЯ", 140, TpPlayersBase)
            CreateToggle("Auto Save Base", 175, "AutoSaveBaseEnabled", AutoSaveBaseFunc)
            CreateToggle("Auto Buy - НЕРАБОЧАЯ", 205, "AutoBuy", function(toggle)
                print("Auto Buy: " .. tostring(toggle))
            end)

        elseif CurrentSection == "ESP" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 160)
            
            CreateToggle("ESP Players", 15, "ESPPlayersEnabled", ESPPlayersFunc)
            CreateToggle("ESP My Base - НЕРАБОЧАЯ", 45, "ESPMyBase", function(toggle)
                print("ESP My Base: " .. tostring(toggle))
            end)
            CreateToggle("ESP Brainrot - НЕРАБОЧАЯ", 75, "ESPBrainrot", function(toggle)
                print("ESP Brainrot: " .. tostring(toggle))
            end)
            CreateToggle("ESP Players Base - НЕРАБОЧАЯ", 105, "ESPPlayersBase", function(toggle)
                print("ESP Players Base: " .. tostring(toggle))
            end)

        elseif CurrentSection == "Info" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 300)
            
            local InfoText = Instance.new("TextLabel")
            InfoText.Size = UDim2.new(0, 350, 0, 280)
            InfoText.Position = UDim2.new(0, 15, 0, 15)
            InfoText.BackgroundTransparency = 1
            InfoText.Text = [[FroggiHub - Steal a Brainrot

Version: 1.4
Created for DeltaX Injector

РАБОЧИЕ ФУНКЦИИ:
• NoClip
• Fly (WASD + Space/Shift)
• Infinite Jump
• Speed Hack
• Jump Hack
• Glide
• Anti AFK
• Anti Ragdoll
• Invisible
• TP to Player
• ESP Players
• Auto Save Base

НЕРАБОЧИЕ ФУНКЦИИ:
(требуют настройки под игру)

Creator: FroggiTeam
Place: Steal a Brainrot

Thanks for using FroggiHub!]]
            InfoText.TextColor3 = Color3.new(1, 1, 1)
            InfoText.TextSize = 12
            InfoText.TextXAlignment = Enum.TextXAlignment.Left
            InfoText.TextYAlignment = Enum.TextYAlignment.Top
            InfoText.Font = Enum.Font.Gotham
            InfoText.TextWrapped = true
            InfoText.Parent = ContentPanel
        end
    end

    local function CreateSectionButton(name, position)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0, 110, 0, 30)
        Button.Position = UDim2.new(0, 5, 0, position)
        Button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        Button.Text = name
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.TextSize = 12
        Button.Font = Enum.Font.Gotham
        Button.Parent = SidePanel

        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 6)
        ButtonCorner.Parent = Button

        SectionButtons[name] = Button

        Button.MouseButton1Click:Connect(function()
            CurrentSection = name
            UpdateContent()
        end)

        return Button
    end

    for i, section in ipairs(Sections) do
        CreateSectionButton(section, 10 + (i-1)*35)
    end

    UpdateContent()
    SectionButtons["Main"].BackgroundColor3 = Color3.new(0, 0.5, 1)
    ScreenGui.Parent = game.CoreGui

    return ScreenGui
end

CreateGUI()
print("FroggiHub - Steal a Brainrot loaded successfully!")
