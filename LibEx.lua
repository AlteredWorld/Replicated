local Library = {}

function Library.new(Name)
	local ScreenGui = Instance.new("ScreenGui")
	local Background = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Tab_2 = Instance.new("ScrollingFrame")
	local UIListLayout_2 = Instance.new("UIListLayout")

	ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Background.Name = "Background"
	Background.Parent = ScreenGui
	Background.Active = true
	Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Background.BorderSizePixel = 0
	Background.Position = UDim2.new(0.270394742, 0, 0.158949986, 0)
	Background.Size = UDim2.new(0.538537562, 0, 0.626524389, 0)

	local UserInputService = game:GetService("UserInputService")

	local gui = Background

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	task.spawn(function()
		local Changing = false
		while true do
			task.wait()
			if not Changing then
				Changing=true
				game:GetService("TweenService"):Create(Background,TweenInfo.new(.5),{BackgroundColor3=Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))}):Play()
				task.delay(.5,function()
					Changing=false
				end)
			end
		end
	end)

	UICorner.Parent = Background

	Frame.Parent = Background
	Frame.Active = true
	Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.0143784266, 0, -0.00163391558, 0)
	Frame.Size = UDim2.new(0.97156322, 0, 1.00163388, 0)

	Title.Name = Name or "New Window"
	Title.Parent = Frame
	Title.Active = true
	Title.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.0207742378, 0, 0.0364368148, 0)
	Title.Size = UDim2.new(0.272556424, 0, 0.0877817497, 0)
	Title.Font = Enum.Font.SourceSans
	Title.TextColor3 = Color3.fromRGB(227, 227, 227)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.Text = Name or "New Window"

	Container.Name = "Container"
	Container.Parent = Frame
	Container.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.319548875, 0, 0, 0)
	Container.Size = UDim2.new(0.680451155, 0, 1, 0)

	UICorner_2.Parent = Container

	Tab_2.Name = "Tab"
	Tab_2.Parent = Frame
	Tab_2.Active = true
	Tab_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab_2.BorderSizePixel = 0
	Tab_2.Position = UDim2.new(0.035811834, 0, 0.222645596, 0)
	Tab_2.Size = UDim2.new(0.246240601, 0, 0.737226248, 0)
	Tab_2.CanvasSize = UDim2.new(0, 0, 1, 0)
	Tab_2.ScrollBarThickness = 0
	Tab_2.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

	UIListLayout_2.Parent = Tab_2
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder

	local self = {}
	self.Window = ScreenGui

	function self:Tab(Name)
		local Tab = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local TabButton = Instance.new("TextButton")
		local UICorner_9 = Instance.new("UICorner")

		Tab.Name = Name or "Tab"
		Tab.Parent = Container
		Tab.Active = true
		Tab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.0610227287, 0, 0.0364963487, 0)
		Tab.Size = UDim2.new(0.875690579, 0, 0.927007318, 0)
		Tab.CanvasSize = UDim2.new(0, 0, 1, 0)
		Tab.ScrollBarThickness = 0
		Tab.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

		UIListLayout.Parent = Tab
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 2)

		TabButton.Name = Name or "TabButton"
		TabButton.Parent = Tab_2
		TabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabButton.BorderSizePixel = 0
		TabButton.Position = UDim2.new(0.0648854971, 0, 0, 0)
		TabButton.Size = UDim2.new(0, 122, 0, 39)
		TabButton.Font = Enum.Font.SourceSans
		TabButton.TextColor3 = Color3.fromRGB(238, 238, 238)
		TabButton.TextSize = 20.000
		TabButton.TextWrapped = true
		TabButton.Text = Name or "TabButton"

		TabButton.MouseButton1Click:Connect(function()
			for i,v in pairs(Container:GetChildren()) do
				if v:isA("ScrollingFrame") then
					v.Visible = false
				end
			end
			Tab.Visible=true
		end)

		UICorner_9.Parent = TabButton

		local self_2 = {}

		function self_2:Toggle(Name,Callback)

			local Value = false

			local name = Name or "Toggle"
			local callback = Callback or function() end

			local Toggle = Instance.new("TextButton")
			local UICorner_4 = Instance.new("UICorner")
			local Toggle_2 = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")

			Toggle.Name = name
			Toggle.Parent = Tab
			Toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Toggle.BorderColor3 = Color3.fromRGB(35, 35, 35)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(-0.298107266, 0, 0, 0)
			Toggle.Size = UDim2.new(0, 314, 0, 39)
			Toggle.Font = Enum.Font.SourceSans
			Toggle.TextColor3 = Color3.fromRGB(238, 238, 238)
			Toggle.TextSize = 20.000
			Toggle.TextWrapped = true
			Toggle.Text=name

			UICorner_4.Parent = Toggle

			Toggle_2.Name = "Toggle"
			Toggle_2.Parent = Toggle
			Toggle_2.Active = true
			Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 43, 43)
			Toggle_2.BorderColor3 = Color3.fromRGB(35, 35, 35)
			Toggle_2.BorderSizePixel = 0
			Toggle_2.Position = UDim2.new(0.901273847, 0, 0.179487199, 0)
			Toggle_2.Size = UDim2.new(0.0796178356, 0, 0.641025662, 0)

			Toggle.MouseButton1Click:Connect(function()
				Value = not Value
				if Value == false then
					game:GetService("TweenService"):Create(Toggle_2,TweenInfo.new(.5),{BackgroundColor3 = Color3.fromRGB(255, 43, 43)}):Play()
				end
				if Value == true then
					game:GetService("TweenService"):Create(Toggle_2,TweenInfo.new(.5),{BackgroundColor3 = Color3.fromRGB(92, 255, 125)}):Play()
				end
				callback(Value)
			end)

			UICorner_5.Parent = Toggle_2

			local Funcs = {}
			function Funcs:SetValue(t)
				Value=t
			end

			return Funcs
		end

		function self_2:Button(Name,Callback)
			local callback = Callback or function() end
			local name = Name or "Button"

			local Button = Instance.new("TextButton")
			local UICorner_3 = Instance.new("UICorner")

			Button.Name = name or "Button"
			Button.Parent = Tab
			Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Button.BorderColor3 = Color3.fromRGB(35, 35, 35)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(-0.298107266, 0, 0, 0)
			Button.Size = UDim2.new(0, 314, 0, 39)
			Button.Font = Enum.Font.SourceSans
			Button.TextColor3 = Color3.fromRGB(238, 238, 238)
			Button.TextSize = 20.000
			Button.Text = name
			Button.TextWrapped = true
			Button.MouseButton1Click:Connect(callback)

			UICorner_3.Parent = Button
		end

		function self_2:Dropdown(Name,List,Callback)
			local name = Name or "Dropdown"
			local list = List or {"Button"}
			local callback = Callback or function() end
			local selected = ""

			-- Gui to Lua
			-- Version: 3.2

			-- Instances:

			local Dropdown = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local ScrollingFrame = Instance.new("ScrollingFrame")
			local UICorner_2 = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")

			--Properties:

			Dropdown.Name = name
			Dropdown.Parent = Tab
			Dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Dropdown.BorderColor3 = Color3.fromRGB(35, 35, 35)
			Dropdown.BorderSizePixel = 0
			Dropdown.Position = UDim2.new(-0.298107266, 0, 0, 0)
			Dropdown.Size = UDim2.new(0, 314, 0, 39)
			Dropdown.Font = Enum.Font.SourceSans
			Dropdown.TextColor3 = Color3.fromRGB(238, 238, 238)
			Dropdown.TextSize = 20.000
			Dropdown.TextWrapped = true
			Dropdown.MouseButton1Click:Connect(function()
				ScrollingFrame.Visible=not ScrollingFrame.Visible
				for i,v in pairs(Tab:GetChildren()) do
					if v:isA("TextButton") and v ~= Dropdown then
						if ScrollingFrame.Visible then
							v.ZIndex = 0
						else
							v.ZIndex = 1
						end
					end
				end
			end)

			UICorner.Parent = Dropdown

			local ScrollingFrameSiz

			ScrollingFrame.Parent = Dropdown
			ScrollingFrame.Active = true
			ScrollingFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ScrollingFrame.BorderSizePixel = 0
			ScrollingFrame.Position = UDim2.new(0.0477705076, 0, 1.17948723, 0)
			ScrollingFrame.Size = UDim2.new(0, 283, 0, 71)
			ScrollingFrameSiz=ScrollingFrame.Size
			ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1, 0)
			ScrollingFrame.ScrollBarThickness = 5
			ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
			ScrollingFrame.Visible=false
			ScrollingFrame.ZIndex=5

			UICorner_2.Parent = ScrollingFrame

			UIListLayout.Parent = ScrollingFrame
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

			for i,v in pairs(list) do
				local Button = Instance.new("TextButton")
				local UICorner_3 = Instance.new("UICorner")
				Button.Name = v
				Button.Parent = ScrollingFrame
				Button.BackgroundColor3 = Color3.fromRGB(104, 104, 104)
				Button.BackgroundTransparency = 1.000
				Button.BorderColor3 = Color3.fromRGB(35, 35, 35)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, 0.225352108, 0)
				Button.Size = UDim2.new(0, 283, 0, 17)
				Button.Font = Enum.Font.SourceSans
				Button.TextColor3 = Color3.fromRGB(238, 238, 238)
				Button.TextSize = 20.000
				Button.TextWrapped = true
				Button.Text = v
				Button.ZIndex=2
				Button.MouseButton1Click:Connect(function()
					callback(v)
					local t=game:GetService("TweenService"):Create(Button,TweenInfo.new(.5),{BackgroundTransparency = 0})
					t:Play()
					t.Completed:Connect(function()
						task.wait(.1)
						game:GetService("TweenService"):Create(Button,TweenInfo.new(.5),{BackgroundTransparency = 1}):Play()
					end)
				end)

				UICorner_3.Parent = Button
			end

			local Funcs = {}
			function Funcs:SetValue(t)
				selected=t
			end

			return Funcs
		end

		function self_2:Textbox(Name,Callback)
			local name = Name or "Textbox"
			local callback = Callback or function(input) end

			local input = ""

			local TextBox = Instance.new("TextButton")
			local UICorner_6 = Instance.new("UICorner")
			local Input = Instance.new("TextBox")
			local UICorner_7 = Instance.new("UICorner")

			TextBox.Name = name
			TextBox.Parent = Tab
			TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			TextBox.BorderColor3 = Color3.fromRGB(35, 35, 35)
			TextBox.BorderSizePixel = 0
			TextBox.Position = UDim2.new(-0.298107266, 0, 0, 0)
			TextBox.Size = UDim2.new(0, 314, 0, 39)
			TextBox.Font = Enum.Font.SourceSans
			TextBox.TextColor3 = Color3.fromRGB(238, 238, 238)
			TextBox.TextSize = 20.000
			TextBox.TextWrapped = true
			TextBox.Text=name

			UICorner_6.Parent = TextBox

			Input.Name = name
			Input.Parent = TextBox
			Input.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Input.BorderSizePixel = 0
			Input.Position = UDim2.new(0.745222926, 0, 0.15384616, 0)
			Input.Size = UDim2.new(0.235668793, 0, 0.666666687, 0)
			Input.Font = Enum.Font.SourceSans
			Input.Text = input
			Input.TextColor3 = Color3.fromRGB(202, 210, 255)
			Input.TextScaled = true
			Input.TextSize = 14.000
			Input.TextWrapped = true

			Input:GetPropertyChangedSignal("Text"):Connect(function()
				input = Input.Text
			end)

			TextBox.MouseButton1Click:Connect(function()
				callback(input)
			end)

			UICorner_7.Parent = Input

			local Funcs = {}
			function Funcs:SetValue(t)
				input = t
			end

			return Funcs
		end

		return self_2
	end

	function self:Destroy()
		ScreenGui:Destroy()
		if getfenv().Connections~=nil then
			for i,v in pairs(getfenv().Connections) do
				v:Disconnect()
			end
		end
	end

	return self
end

return Library
