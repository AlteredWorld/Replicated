local Library = {}
_G.KeyCode = Enum.KeyCode.RightControl

function Library.new()
	local InputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local StepChangedFuncs, StepChangedEvent = {}, nil

	local Connections = {}

	local Commandments = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local BG = Instance.new("ImageLabel")
	local TitleBG = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIGridLayout = Instance.new("UIGridLayout")

	Commandments.Name = "Commandments"
	Commandments.Parent = game:FindService("CoreGui") or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	Commandments.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Commandments.IgnoreGuiInset = true

	Frame.Parent = Commandments
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	Frame.Position = UDim2.new(0.523864388, 0, 0.539803505, 0)
	Frame.Size = UDim2.new(0.429329693, 0, 0.497575074, 0)

	BG.Name = "BG"
	BG.Parent = Frame
	BG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	BG.BackgroundTransparency = 1.000
	BG.BorderColor3 = Color3.fromRGB(27, 42, 53)
	BG.Position = UDim2.new(0.00820793584, 0, 0.0694087371, 0)
	BG.Size = UDim2.new(1.00000012, 0, 1, 0)
	BG.Image = "rbxassetid://10746207358"

	TitleBG.Name = "Title BG"
	TitleBG.Parent = Frame
	TitleBG.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleBG.BackgroundTransparency = 1.000
	TitleBG.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TitleBG.Position = UDim2.new(0.0779753774, 0, -0.0719794556, 0)
	TitleBG.Size = UDim2.new(0.860465169, 0, 0.125964016, 0)
	TitleBG.Image = "rbxassetid://10746206969"

	TextLabel.Parent = TitleBG
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = "COMMANDS"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextStrokeTransparency = 0.000
	TextLabel.TextWrapped = true

	ScrollingFrame.Parent = Frame
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ScrollingFrame.Position = UDim2.new(0.121552184, 0, 0.150083765, 0)
	ScrollingFrame.Selectable = false
	ScrollingFrame.Size = UDim2.new(0.816888332, 0, 0.836158931, 0)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 8.5, 0)
	ScrollingFrame.ScrollBarThickness = 3

	UIGridLayout.Parent = ScrollingFrame
	UIGridLayout.FillDirection = Enum.FillDirection.Vertical
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0.00200000009, 0)
	UIGridLayout.CellSize = UDim2.new(1, 0, 0.0399999991, 0)
	UIGridLayout.StartCorner = Enum.StartCorner.TopRight

	local Methods = {}

	function Methods:Button(Name, Text, Callback)
		local TemplateBtn = Instance.new("ImageButton")
		local Frame_2 = Instance.new("ImageLabel")
		local TextLabel_2 = Instance.new("TextLabel")

		TemplateBtn.Name = Name
		TemplateBtn.Parent = ScrollingFrame
		TemplateBtn.Active = false
		TemplateBtn.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
		TemplateBtn.BackgroundTransparency = 1.000
		TemplateBtn.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TemplateBtn.Selectable = false
		TemplateBtn.Size = UDim2.new(0, 100, 0, 100)
		TemplateBtn.Visible = true

		Frame_2.Name = "Frame"
		Frame_2.Parent = TemplateBtn
		Frame_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_2.BackgroundTransparency = 1.000
		Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Frame_2.Size = UDim2.new(0.959999979, 0, 1, 0)
		Frame_2.Image = "rbxassetid://10751289514"

		TextLabel_2.Parent = Frame_2
		TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_2.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		TextLabel_2.Font = Enum.Font.SciFi
		TextLabel_2.Text = Text
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextScaled = true
		TextLabel_2.TextSize = 14.000
		TextLabel_2.TextStrokeTransparency = 0.000
		TextLabel_2.TextWrapped = true

		Connections[#Connections + 1] = TemplateBtn.MouseButton1Click:Connect(Callback)
	end

	function Methods:Textbox(Name, Text, Callback)
		local TemplateBox = Instance.new("ImageButton")
		local Frame_3 = Instance.new("ImageLabel")
		local TextLabel_3 = Instance.new("TextLabel")
		local TextBox = Instance.new("TextBox")

		TemplateBox.Name = Name
		TemplateBox.Parent = ScrollingFrame
		TemplateBox.Active = false
		TemplateBox.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
		TemplateBox.BackgroundTransparency = 1.000
		TemplateBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TemplateBox.Selectable = false
		TemplateBox.Size = UDim2.new(0, 100, 0, 100)
		TemplateBox.Visible = true

		Frame_3.Name = "Frame"
		Frame_3.Parent = TemplateBox
		Frame_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Frame_3.BackgroundTransparency = 1.000
		Frame_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Frame_3.Size = UDim2.new(0.959999979, 0, 1, 0)
		Frame_3.Image = "rbxassetid://10751289514"

		TextLabel_3.Parent = Frame_3
		TextLabel_3.AnchorPoint = Vector2.new(0.5, 1)
		TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.BackgroundTransparency = 1.000
		TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextLabel_3.Size = UDim2.new(0.899999976, 0, 0.5, 0)
		TextLabel_3.Font = Enum.Font.SciFi
		TextLabel_3.Text = Text
		TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.TextScaled = true
		TextLabel_3.TextSize = 14.000
		TextLabel_3.TextStrokeTransparency = 0.000
		TextLabel_3.TextWrapped = true

		TextBox.Parent = Frame_3
		TextBox.Active = false
		TextBox.AnchorPoint = Vector2.new(0.5, 1)
		TextBox.BackgroundColor3 = Color3.fromRGB(248, 248, 248)
		TextBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextBox.Position = UDim2.new(0.5, 0, 0.899999976, 0)
		TextBox.Selectable = false
		TextBox.Size = UDim2.new(0.800000012, 0, 0.300000012, 0)
		TextBox.Font = Enum.Font.Arial
		TextBox.Text = "Type Here"
		TextBox.TextColor3 = Color3.fromRGB(248, 248, 248)
		TextBox.TextScaled = true
		TextBox.TextSize = 14.000
		TextBox.TextStrokeTransparency = 0.000
		TextBox.TextWrapped = true

		if Callback then
			Connections[#Connections + 1] = TextBox.FocusLost:Connect(function(enterPressed)
				Callback(TextBox.Text)
			end)
		end
	end

	function Methods:Slider(Name, Text, Callback)
		local TemplateSlider = Instance.new("ImageLabel")
		local TextLabel = Instance.new("TextLabel")
		local BG = Instance.new("Frame")
		local Bar = Instance.new("Frame")
		local UICorner1 = Instance.new("UICorner")
		local UICorner2 = Instance.new("UICorner")

		local Holding = false

		TemplateSlider.Name = Name
		TemplateSlider.Parent = ScrollingFrame
		TemplateSlider.BackgroundTransparency = 1
		TemplateSlider.Size = UDim2.new(0.96, 0, 1, 0)
		TemplateSlider.Image = "rbxassetid://10751289514"

		TextLabel.Parent = TemplateSlider
		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0.5, 0, 0.35, 0)
		TextLabel.Size = UDim2.new(0.9, 0, 0.4, 0)
		TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		TextLabel.Font = Enum.Font.SciFi
		TextLabel.Text = Text
		TextLabel.TextColor3 = Color3.new(1,1,1)
		TextLabel.TextScaled = true

		BG.Name = "BG"
		BG.Parent = TemplateSlider
		BG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		BG.BorderSizePixel = 0
		BG.Position = UDim2.new(0.07, 0, 0.67, 0)
		BG.Size = UDim2.new(0.86, 0, 0.14, 0)
		UICorner1.Parent = BG

		Bar.Name = "Bar"
		Bar.Parent = BG
		Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 120)
		Bar.BorderSizePixel = 0
		Bar.Size = UDim2.new(0, 0, 1, 0)
		UICorner2.Parent = Bar

		table.insert(Connections, BG.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				Holding = true
			end
		end))

		table.insert(Connections, BG.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				Holding = false
			end
		end))

		if not StepChangedEvent then
			StepChangedEvent = RunService.RenderStepped:Connect(function()
				for _, call in pairs(StepChangedFuncs) do
					call()
				end
			end)
			table.insert(Connections, StepChangedEvent)
		end

		table.insert(StepChangedFuncs, function()
			if Holding then
				local pos = Mouse.X
				local minX = BG.AbsolutePosition.X
				local maxX = BG.AbsolutePosition.X + BG.AbsoluteSize.X

				local percent = math.clamp((pos - minX) / (maxX - minX), 0, 1)

				Bar.Size = UDim2.new(percent, 0, 1, 0)

				if Callback then
					Callback(math.floor(percent * 100))
				end
			end
		end)
	end


	function Methods:Destroy()
		Commandments:Destroy()
		for _,v in pairs(Connections) do
			v:Disconnect()
		end
	end

	local dragging = false
	local dragInput, mousePos, framePos

	local function update(input)
		if dragging then
			local delta = input.Position - mousePos
			Frame.Position = UDim2.new(
				Frame.Position.X.Scale,
				framePos.X.Offset + delta.X,
				Frame.Position.Y.Scale,
				framePos.Y.Offset + delta.Y
			)
		end
	end

	table.insert(Connections, Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragInput = input
			mousePos = input.Position
			framePos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end))

	table.insert(Connections, Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end))

	table.insert(Connections, InputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent then return end
		if input.KeyCode == _G.KeyCode then
			Commandments.Enabled = not Commandments.Enabled
		end
	end))

	table.insert(Connections, InputService.InputChanged:Connect(update))

	return Methods
end

return Library
