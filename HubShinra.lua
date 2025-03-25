local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button1 = Instance.new("TextButton")
local Button2 = Instance.new("TextButton")
local Button3 = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton") -- Botão de alternância
local UnlockFrame = Instance.new("Frame")
local UnlockButton = Instance.new("TextButton")
local UnlockTextBox = Instance.new("TextBox")
local UnlockLabel = Instance.new("TextLabel")

-- Função para desbloquear a HUD
local function unlockHUD()
    UnlockFrame.Visible = false
    Frame.Visible = true
    ToggleButton.Visible = true -- Torna o ToggleButton visível após o código ser inserido
end

-- Função para esconder a HUD
local function hideHUD()
    Frame.Visible = false
end

-- Função para alternar a visibilidade da HUD
local function toggleHUD()
    Frame.Visible = not Frame.Visible
end

-- Configurar a GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Visible = false

-- Configurar a HUD de Desbloqueio
UnlockFrame.Parent = ScreenGui
UnlockFrame.Size = UDim2.new(0, 300, 0, 200)
UnlockFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
UnlockFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

UnlockLabel.Parent = UnlockFrame
UnlockLabel.Size = UDim2.new(1, 0, 0, 40)
UnlockLabel.Position = UDim2.new(0, 0, 0, 10)
UnlockLabel.Text = "Digite o código para desbloquear"
UnlockLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockLabel.Font = Enum.Font.SourceSansBold
UnlockLabel.TextSize = 18

UnlockTextBox.Parent = UnlockFrame
UnlockTextBox.Size = UDim2.new(0, 200, 0, 40)
UnlockTextBox.Position = UDim2.new(0.5, -100, 0, 60)
UnlockTextBox.ClearTextOnFocus = false
UnlockTextBox.Text = ""
UnlockTextBox.PlaceholderText = "Código"
UnlockTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

UnlockButton.Parent = UnlockFrame
UnlockButton.Size = UDim2.new(0, 200, 0, 40)
UnlockButton.Position = UDim2.new(0.5, -100, 0, 120)
UnlockButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
UnlockButton.Text = "Desbloquear"
UnlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Código para desbloquear a HUD
local unlockCode = "1234"

UnlockButton.MouseButton1Click:Connect(function()
    if UnlockTextBox.Text == unlockCode then
        unlockHUD()
    else
        UnlockTextBox.Text = "" -- Limpa o campo se o código estiver errado
    end
end)

-- Configurar Botões da HUD
Button1.Parent = Frame
Button1.Size = UDim2.new(1, 0, 0, 50)
Button1.Position = UDim2.new(0, 0, 0, 10)
Button1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
Button1.Font = Enum.Font.SourceSansBold
Button1.TextSize = 20
Button1.Text = "LyzerHub Script"

Button2.Parent = Frame
Button2.Size = UDim2.new(1, 0, 0, 50)
Button2.Position = UDim2.new(0, 0, 0, 70)
Button2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
Button2.Font = Enum.Font.SourceSansBold
Button2.TextSize = 20
Button2.Text = "DKHub Script"

Button3.Parent = Frame
Button3.Size = UDim2.new(1, 0, 0, 50)
Button3.Position = UDim2.new(0, 0, 0, 130)
Button3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button3.TextColor3 = Color3.fromRGB(255, 255, 255)
Button3.Font = Enum.Font.SourceSansBold
Button3.TextSize = 20
Button3.Text = "Script 3"

-- Novo botão para ativar/desativar a HUD
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 200, 0, 50)
ToggleButton.Position = UDim2.new(0.5, -100, 0, 200)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 20
ToggleButton.Text = "Ativar/Desativar HUD"
ToggleButton.Visible = false -- Inicialmente invisível

-- Tornar o botão movível
local dragging = false
local dragInput, dragStart, startPos

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position
        input.Consumed = true
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

ToggleButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Tornar a HUD movível
local draggingHUD = false
local dragStartHUD, startPosHUD

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingHUD = true
        dragStartHUD = input.Position
        startPosHUD = Frame.Position
        input.Consumed = true
    end
end)

Frame.InputChanged:Connect(function(input)
    if draggingHUD and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStartHUD
        Frame.Position = UDim2.new(startPosHUD.X.Scale, startPosHUD.X.Offset + delta.X, startPosHUD.Y.Scale, startPosHUD.Y.Offset + delta.Y)
    end
end)

Frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingHUD = false
    end
end)

-- Quando o botão de alternar for clicado
ToggleButton.MouseButton1Click:Connect(function()
    toggleHUD() -- Alterna a visibilidade da HUD
end)

-- Função para executar o Script 1 (LyzerHub)
Button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kazeruy/LyzerHub/main/ScriptMain"))()
    hideHUD()  -- Esconde a HUD após ativar o script
end)

-- Função para executar o Script 2 (DKHub)
Button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/dkhub/main/Script", true))()
    hideHUD()  -- Esconde a HUD após ativar o script
end)

-- Função para executar o Script 3
Button3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("URL_DO_SCRIPT_3", true))()  -- Substitua com a URL do seu terceiro script
    hideHUD()  -- Esconde a HUD após ativar o script
end)
