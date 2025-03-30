local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICornerFrame = Instance.new("UICorner")
local Button1 = Instance.new("TextButton")
local Button2 = Instance.new("TextButton")
local Button3 = Instance.new("TextButton")
local Button4 = Instance.new("TextButton")
local Button5 = Instance.new("TextButton")
local ToggleImageButton = Instance.new("ImageButton")
local UICornerToggle = Instance.new("UICorner")
local UnlockFrame = Instance.new("Frame")
local UICornerUnlock = Instance.new("UICorner")
local UnlockButton = Instance.new("TextButton")
local UICornerUnlockButton = Instance.new("UICorner")
local UnlockTextBox = Instance.new("TextBox")
local UnlockLabel = Instance.new("TextLabel")
local CopyLinkButton = Instance.new("TextButton")
local ScrollingFrame = Instance.new("ScrollingFrame")

-- Variáveis de controle de movimento da HUD
local dragging = false
local dragInput
local startPos
local startMousePos

-- Variáveis de controle de movimento para o botão de esconder
local draggingToggle = false
local startPosToggle
local startMousePosToggle

-- Função para desbloquear a HUD
local function unlockHUD()
	UnlockFrame.Visible = false
	Frame.Visible = true
	ToggleImageButton.Visible = true
end

-- Função para alternar a HUD
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
Frame.Active = true  -- Permitindo interação com a Frame
Frame.ClipsDescendants = true  -- Permitir a rolagem dentro da Frame

-- Adicionar cantos arredondados à HUD
UICornerFrame.Parent = Frame
UICornerFrame.CornerRadius = UDim.new(0, 15)

-- Configurar a HUD de Desbloqueio
UnlockFrame.Parent = ScreenGui
UnlockFrame.Size = UDim2.new(0, 250, 0, 230)
UnlockFrame.Position = UDim2.new(0.5, -150, 0.5, -140)
UnlockFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Adicionar cantos arredondados à tela de desbloqueio
UICornerUnlock.Parent = UnlockFrame
UICornerUnlock.CornerRadius = UDim.new(0, 15)

UnlockLabel.Parent = UnlockFrame
UnlockLabel.Size = UDim2.new(0.99, 0, 0, 29.9)
UnlockLabel.Position = UDim2.new(0.005, 0, 0, 15)
UnlockLabel.Text = "Digite a key para desbloquear"
UnlockLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockLabel.Font = Enum.Font.SourceSansBold
UnlockLabel.TextSize = 16

UnlockTextBox.Parent = UnlockFrame
UnlockTextBox.Size = UDim2.new(0, 200, 0, 40)
UnlockTextBox.Position = UDim2.new(0.5, -100, 0, 60)
UnlockTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockTextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

UnlockButton.Parent = UnlockFrame
UnlockButton.Size = UDim2.new(0, 200, 0, 40)
UnlockButton.Position = UDim2.new(0.5, -100, 0, 120)
UnlockButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
UnlockButton.Text = "Desbloquear"
UnlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)

UICornerUnlockButton.Parent = UnlockButton
UICornerUnlockButton.CornerRadius = UDim.new(0, 10)

UnlockButton.MouseButton1Click:Connect(function()
	if UnlockTextBox.Text == "key_82_si_93*" then
		unlockHUD()
	else
		UnlockTextBox.Text = ""
	end
end)

-- Criar botão para copiar link
CopyLinkButton.Parent = UnlockFrame
CopyLinkButton.Size = UDim2.new(0, 200, 0, 40)
CopyLinkButton.Position = UDim2.new(0.5, -100, 0, 170)
CopyLinkButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
CopyLinkButton.Text = "get key"
CopyLinkButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local UICornerCopyLinkButton = Instance.new("UICorner")
UICornerCopyLinkButton.Parent = CopyLinkButton
UICornerCopyLinkButton.CornerRadius = UDim.new(0, 10)

CopyLinkButton.MouseButton1Click:Connect(function()
	setclipboard("https://link-center.net/1332466/key-daily")
end)

-- Configurar a ScrollingFrame
ScrollingFrame.Parent = Frame
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 8
ScrollingFrame.ClipsDescendants = true

-- Configurar Botões da HUD
local function createRoundedButton(button, parent, position, text)
	button.Parent = parent
	button.Size = UDim2.new(1, 0, 0, 50)
	button.Position = position
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.SourceSansBold
	button.TextSize = 20
	button.Text = text

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = button
end

createRoundedButton(Button1, ScrollingFrame, UDim2.new(0, 0, 0, 10), "LyzerHub Script")
createRoundedButton(Button2, ScrollingFrame, UDim2.new(0, 0, 0, 70), "DKHub Script")
createRoundedButton(Button3, ScrollingFrame, UDim2.new(0, 0, 0, 130), "Script 3")
createRoundedButton(Button4, ScrollingFrame, UDim2.new(0, 0, 0, 190), "Script 4")
createRoundedButton(Button5, ScrollingFrame, UDim2.new(0, 0, 0, 250), "Script 5")

-- Criar botão de imagem arredondado
ToggleImageButton.Parent = ScreenGui
ToggleImageButton.Size = UDim2.new(0, 50, 0, 50)
ToggleImageButton.Position = UDim2.new(0.9, 0, 0.1, 0)
ToggleImageButton.BackgroundTransparency = 1
ToggleImageButton.Image = "rbxassetid://135769343978457"
ToggleImageButton.Visible = false

UICornerToggle.Parent = ToggleImageButton
UICornerToggle.CornerRadius = UDim.new(1, 0)

ToggleImageButton.MouseButton1Click:Connect(function()
	toggleHUD()
end)

-- Funções dos botões
Button1.MouseButton1Click:Connect(function() 
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Kazeruy/LyzerHub/main/ScriptMain"))()
	Frame.Visible = false
end)

Button2.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ByNami/dkhub/main/Script", true))()
	Frame.Visible = false
end)

Button3.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("URL_DO_SCRIPT_3", true))()
	Frame.Visible = false
end)

Button4.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("URL_DO_SCRIPT_4", true))()
	Frame.Visible = false
end)

Button5.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("URL_DO_SCRIPT_5", true))()
	Frame.Visible = false
end)

-- Função para mover a HUD
Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		startPos = Frame.Position
		startMousePos = input.Position
	end
end)

Frame.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - startMousePos
		Frame.Position = startPos + UDim2.new(0, delta.X, 0, delta.Y)
	end
end)

Frame.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

-- Função para mover o botão de esconder a HUD
ToggleImageButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingToggle = true
		startPosToggle = ToggleImageButton.Position
		startMousePosToggle = input.Position
	end
end)

ToggleImageButton.InputChanged:Connect(function(input)
	if draggingToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - startMousePosToggle
		ToggleImageButton.Position = startPosToggle + UDim2.new(0, delta.X, 0, delta.Y)
	end
end)

ToggleImageButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		draggingToggle = false
	end
end)
