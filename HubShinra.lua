local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button1 = Instance.new("TextButton")
local Button2 = Instance.new("TextButton")
local Button3 = Instance.new("TextButton")
local UnlockFrame = Instance.new("Frame")
local UnlockButton = Instance.new("TextButton")
local UnlockTextBox = Instance.new("TextBox")
local UnlockLabel = Instance.new("TextLabel")

-- Função para desbloquear a HUD
local function unlockHUD()
    UnlockFrame.Visible = false
    Frame.Visible = true
end

-- Configurar a GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 200) -- Tamanho do painel
Frame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Posição central
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Cor de fundo
Frame.Visible = false -- Inicialmente bloqueada

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

-- Código para desbloquear a HUD (pode ser alterado conforme necessário)
local unlockCode = "1234"

-- Quando o botão de desbloquear for clicado
UnlockButton.MouseButton1Click:Connect(function()
    if UnlockTextBox.Text == unlockCode then
        unlockHUD() -- Desbloqueia a HUD
    else
        UnlockTextBox.Text = "" -- Limpa o campo se o código estiver errado
    end
end)

-- Configurar Botões da HUD (inicialmente invisível)
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

-- Função para executar o Script 1 (LyzerHub)
Button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Kazeruy/LyzerHub/main/ScriptMain"))()
end)

-- Função para executar o Script 2 (DKHub)
Button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/dkhub/main/Script", true))()
end)

-- Função para executar o Script 3 (Substitua pela URL do terceiro script)
Button3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("URL_DO_SCRIPT_3", true))() -- Substitua com a URL do seu terceiro script
end)
