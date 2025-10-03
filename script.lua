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
            MainFrame.Size = UDim2.new(0, 600, 0, 40)
            MinimizeButton.BackgroundColor3 = Color3.new(0.2, 0.7, 0.2)
        else
            MainFrame.Size = UDim2.new(0, 600, 0, 400)
            MinimizeButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        end
    end)

    -- Кнопки разделов
    local Sections = {"Main", "Visual", "Brainrot", "ESP", "Info"}
    local SectionButtons = {}

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
            
            CreateToggle("Anti AFK", 310, AntiAFKFunc)

        elseif CurrentSection == "Visual" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 200)
            
            CreateToggle("Invisible", 20, InvisibleFunc)
            CreateToggle("Invisible Swap", 60, InvisibleSwapFunc)
            CreateToggle("Glide", 100, GlideFunc)

        elseif CurrentSection == "Brainrot" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 400)
            
            CreateToggle("Auto Farm", 20, AutoFarmFunc)
            CreateToggle("Auto Steal", 60, AutoStealFunc)
            CreateToggle("Auto Steal Brainrot", 100, AutoStealBrainrotFunc)
            CreateToggle("Dupe Drainrot", 140, DupeDrainrotFunc)
            CreateButton("TP to Player", 180, TpToPlayer)
            CreateButton("TP Players Base", 225, TpPlayersBase)
            CreateToggle("Auto Save Base", 270, AutoSaveBaseFunc)
            CreateToggle("Auto Buy", 310, AutoBuyFunc)
            CreateToggle("Anti Ragdoll", 350, AntiRagdollFunc)

        elseif CurrentSection == "ESP" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 200)
            
            CreateToggle("ESP Players", 20, function(toggle)
                if toggle then
                    -- Включение ESP игроков
                    for _, player in pairs(game.Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer then
                            CreatePlayerESP(player)
                        end
                    end
                else
                    -- Выключение ESP игроков
                    for _, obj in pairs(game.Workspace:GetChildren()) do
                        if obj.Name == "PlayerESP_" then
                            obj:Destroy()
                        end
                    end
                end
            end)

            CreateToggle("ESP My Base", 60, function(toggle)
                if toggle then
                    CreateMyBaseESP()
                else
                    -- Выключение ESP своей базы
                    for _, obj in pairs(game.Workspace:GetChildren()) do
                        if obj.Name == "MyBaseESP" then
                            obj:Destroy()
                        end
                    end
                end
            end)

            CreateToggle("ESP Brainrot", 100, function(toggle)
                if toggle then
                    CreateBrainrotESP()
                else
                    -- Выключение ESP брейнротов
                    for _, obj in pairs(game.Workspace:GetChildren()) do
                        if obj.Name == "BrainrotESP" then
                            obj:Destroy()
                        end
                    end
                end
            end)

            CreateToggle("ESP Players Base", 140, function(toggle)
                if toggle then
                    CreatePlayersBaseESP()
                else
                    -- Выключение ESP баз игроков
                    for _, obj in pairs(game.Workspace:GetChildren()) do
                        if obj.Name == "PlayerBaseESP" then
                            obj:Destroy()
                        end
                    end
                end
            end)

        elseif CurrentSection == "Info" then
            ContentPanel.CanvasSize = UDim2.new(0, 0, 0, 300)
            
            local InfoText = Instance.new("TextLabel")
            InfoText.Size = UDim2.new(0, 400, 0, 280)
            InfoText.Position = UDim2.new(0, 25, 0, 20)
            InfoText.BackgroundTransparency = 1
            InfoText.Text = [[FroggiHub - Steal a Brainrot

Version: 1.2
Created for DeltaX Injector

Features:
• Main Utilities
• Visual Mods  
• Brainrot Functions
• ESP System
• Player TP System

Sections:
Main - Основные функции
Visual - Визуальные моды
Brainrot - Функции для игры
ESP - Отображение объектов
Info - Информация

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

    -- Функции ESP (заглушки)
    local function CreatePlayerESP(player)
        -- ESP для игрока с информацией
        local highlight = Instance.new("Highlight")
        highlight.Name = "PlayerESP_" .. player.Name
        highlight.FillColor = Color3.new(1, 0, 0)
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.Parent = player.Character or player.CharacterAdded:Wait()
        
        -- BillboardGui с информацией
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "PlayerInfo"
        billboard.Size = UDim2.new(0, 200, 0, 100)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = player.Character.Head
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.BackgroundTransparency = 0.3
        frame.Parent = billboard
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 4)
        corner.Parent = frame
        
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(1, 0, 1, 0)
        infoLabel.BackgroundTransparency = 1
        infoLabel.Text = player.Name .. "\nHealth: 100\nMoney: $0\nWeapon: None"
        infoLabel.TextColor3 = Color3.new(1, 1, 1)
        infoLabel.TextSize = 12
        infoLabel.Font = Enum.Font.Gotham
        infoLabel.TextWrapped = true
        infoLabel.Parent = frame
    end

    local function CreateMyBaseESP()
        -- ESP для своей базы
        local highlight = Instance.new("Highlight")
        highlight.Name = "MyBaseESP"
        highlight.FillColor = Color3.new(0, 1, 0)
        highlight.OutlineColor = Color3.new(1, 1, 1)
        -- Найти свою базу и прицепить highlight
    end

    local function CreateBrainrotESP()
        -- ESP для брейнротов
        for _, brainrot in pairs(game.Workspace:GetChildren()) do
            if brainrot.Name:find("Brainrot") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "BrainrotESP"
                highlight.FillColor = Color3.new(1, 0.5, 0)
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.Parent = brainrot
                
                -- Информация о брейнроте
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 150, 0, 80)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = brainrot
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.new(0, 0, 0)
                frame.BackgroundTransparency = 0.3
                frame.Parent = billboard
                
                local infoLabel = Instance.new("TextLabel")
                infoLabel.Size = UDim2.new(1, 0, 1, 0)
                infoLabel.BackgroundTransparency = 1
                infoLabel.Text = "Brainrot\nPrice: $100\nProfit: High\nRarity: Rare"
                infoLabel.TextColor3 = Color3.new(1, 1, 1)
                infoLabel.TextSize = 10
                infoLabel.Font = Enum.Font.Gotham
                infoLabel.TextWrapped = true
                infoLabel.Parent = frame
            end
        end
    end

    local function CreatePlayersBaseESP()
        -- ESP для баз игроков
        for _, base in pairs(game.Workspace:GetChildren()) do
            if base.Name:find("Base") then
                local highlight = Instance.new("Highlight")
                highlight.Name = "PlayerBaseESP"
                highlight.FillColor = Color3.new(0, 0, 1)
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.Parent = base
                
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 180, 0, 60)
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = base
                
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.new(0, 0, 0)
                frame.BackgroundTransparency = 0.3
                frame.Parent = billboard
                
                local infoLabel = Instance.new("TextLabel")
                infoLabel.Size = UDim2.new(1, 0, 1, 0)
                infoLabel.BackgroundTransparency = 1
                infoLabel.Text = "Player Base\nOwner: Unknown\nStatus: Open\nBrainrots: 3"
                infoLabel.TextColor3 = Color3.new(1, 1, 1)
                infoLabel.TextSize = 10
                infoLabel.Font = Enum.Font.Gotham
                infoLabel.TextWrapped = true
                infoLabel.Parent = frame
            end
        end
    end

    -- Переменные для функций
    local Noclip = false
    local Flying = false
    local InfiniteJump = false
    local SpeedHack = false
    local SpeedValue = 50
    local JumpHack = false
    local JumpValue = 100
    local FlyConnection

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
            
            FlyConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Space then
                    bodyVelocity.Velocity = Vector3.new(0, 50, 0)
                elseif input.KeyCode == Enum.KeyCode.LeftShift then
                    bodyVelocity.Velocity = Vector3.new(0, -50, 0)
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
        if toggle then
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if InfiniteJump and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
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

    local function AntiAFKFunc(toggle)
        if toggle then
            local VirtualUser = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end

    -- Остальные функции (заглушки)
    local function AntiRagdollFunc(toggle) end
    local function TpToPlayer() print("TP to Player clicked") end
    local function TpPlayersBase() print("TP Players Base clicked") end
    local function AutoFarmFunc(toggle) end
    local function AutoStealFunc(toggle) end
    local function InvisibleFunc(toggle) end
    local function InvisibleSwapFunc(toggle) end
    local function AutoStealBrainrotFunc(toggle) end
    local function GlideFunc(toggle) end
    local function AutoSaveBaseFunc(toggle) end
    local function AutoBuyFunc(toggle) end
    local function DupeDrainrotFunc(toggle) end

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
