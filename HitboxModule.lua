local Hitbox = {}
Hitbox.mt = {__index = Hitbox}

function Hitbox.new(Root,Offset,Size,Params)
	local Part = Instance.new("Part")
	Part.Transparency = 1
	Part.CFrame = Root.CFrame + Offset or Vector3.new(0,0,0)
	Part.Size = Size
	Part.Anchored = true
	Part.CanCollide = false
	Part.Material = Enum.Material.ForceField
	Part.Color = Color3.fromRGB(255,0,0)
	
	local Info = {}
	Info.Hitbox = Part
	Info.Root = Root
	Info.Parameters = Params
	Info.Stepped = nil
	
	return setmetatable(Info,Hitbox.mt)
end

function Hitbox:Start()
	self.Stepped = game:GetService("RunService").RenderStepped:Connect(function()
		local Hitbox = self.Hitbox
		Hitbox.CFrame = self.Root.CFrame + self.Offset
		return Hitbox:GetTouchingParts()
	end)
end

function Hitbox:Stop()
	self.Stepped:Disconnect()
	self.Hitbox:Destroy()
	self = nil
end

return Hitbox
