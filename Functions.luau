local Functions = {}
local Services = {
	InputService = game:GetService("UserInputService");
	Players = game:GetService("Players");
	RunService = game:GetService("RunService");
	ReplicatedStorage = game:GetService("ReplicatedStorage");
	CollectionService = game:GetService("CollectionService");
	StarterGui = game:GetService("StarterGui");
}

local Data = {
	Quests = {
		Target = nil;
		Active = false;
		List = {
			"Storyline",
			"Abbachio's Partner [Lvl 15+]",
			"Diddy",
			"Asura",
			"Licker, The Shoper",
			"Boxing Gloves",
			"Dante",
			"Deputy Bertrude [Lvl. 10+]",
			"Dio [Lvl. 35+]",
			"Doog_Teg",
			"Doppio [Lvl. 30+]",
			"Dracula [Lvl. 20+]",
			"Davy, The Showoff",
			"Gilgamesh",
			"Abraham",
			"Guido Mista",
			"Guts",
			"Itachi",
			"Itadori",
			"Wobble",
			"Jonathan Joestar",
			"Kiryu Kazuma",
			"Kizaru",
			"Ecco2k",
			"DIO GREATEST HIGH",
			"Luca",
			"Mysterious Man",
			"uggspleb292",
			"Sans",
			"Nexus",
			"Nexus, Money Shot",
			"Noctizide, The Gambler",
			"Ocean, The Umbrella Seller",
			"Officer Sam [Lvl. 1+]",
			"PEPSI",
			"Plastic Chair",
			"Pluck",
			"Post",
			"Quinton",
			"Ragash Al'vul",
			"Seino, The Wandering Merchant",
			"The One with the Wind",
			"Thiago",
			"Timothy",
			"True Vampire",
			"Uzurashi",
			"Van, The Taco Seller",
			"Wooden Chair",
			"Amaterasu [Lvl. 55+]",
			"hiymt",
			"agilia",
			"Lemon Girl",
			"JetStream Sam",
			"Renzer",
			"Buddy",
			"Dragon Sage Master",
			"Mysterious Man",
			"Big Hoss",
			"Roblox_Egor",
			"Big [Lvl. 45+]",
			"Zenitsu",
			"Roblox_Begor",
			"Lucci",
			"Mihawk"
		};
		
	};
	Combat = {
		Movestack = false;
		AntiStun = false;
		Invisible = false;
	};
	InvisibleSeat = nil;
	LastCFrame = nil;
}


export type Notification = {
	Title : string;
	Text : string;
	Icon : string;
	Duration : number;
	Callback : () -> ()	
}

function Functions.Notification(...)
	local args = ... :: Notification
	Services.StarterGui:SetCore("SendNotification", args)
end

function Functions.ReturnPlr() : Player
	return Services.Players.LocalPlayer
end

function Functions.ReturnCharacter() : Model
	return Functions.ReturnPlr().Character or Functions.ReturnPlr().CharacterAdded:Wait()
end

function Functions.ReturnInstance(instance : string | Instance | any) : Instance
	return Functions.ReturnCharacter():FindFirstChild(instance, 15)
end

function Functions.Humanoid() : Humanoid
	return Functions.ReturnInstance("Humanoid")
end

function Functions.RootPart() : BasePart
	return Functions.ReturnInstance("HumanoidRootPart")
end

function Functions.ReturnData()
	return Data
end

function Functions.FireServer(...)
	local args = {...}
	local func, info, info2 = unpack(args)
	
	Functions.ReturnInstance("RemoteEvent"):FireServer(func, info, info2)
end

function Functions.InvokeServer(...)
	local args = {...}
	local func, info, info2 = unpack(args)
	
	Functions.ReturnInstance("RemoteFunction"):InvokeServer(func, info, info2)
end

function Functions.Storyline()
	local AllQuests = {
		{
			"Storyline #1",
			"Dialogue2",
			"Option1"
		};
		{
			"Storyline #1",
			"Dialogue6",
			"Option1"
		},
		{
			"Storyline #2",
			"Dialogue3",
			"Option1"
		},
		{
			"Storyline #3",
			"Dialogue3",
			"Option1"
		},
		{
			"Storyline #3",
			"Dialogue6",
			"Option1"
		},
		{
			"Storyline #4",
			"Dialogue3",
			"Option1"
		},
		{
			"Storyline #5",
			"Dialogue5",
			"Option1"
		},
		{
			"Storyline #6",
			"Dialogue5",
			"Option1"
		},
		{
			"Storyline #7",
			"Dialogue5",
			"Option1"
		},
		{
			"Storyline #8",
			"Dialogue4",
			"Option1"
		},
		{
			"Storyline #9",
			"Dialogue4",
			"Option1"
		},
		{
			"Storyline #10",
			"Dialogue4",
			"Option1"
		},
		{
			"Storyline #10",
			"Dialogue6",
			"Option1"
		},
	}

	for _, args in pairs(AllQuests) do
		Functions.FireServer("DialogueInteracted",{
			DialogueName = args[1],
			Speaker = "Storyline"
		})
		Functions.FireServer("EndDialogue",{
			NPC = args[1],
			Dialogue = args[2],
			Option = args[3]
		})
	end
end

-- < Combat > --

function Functions.Knock(Duration)
	Functions.FireServer("Knock", Duration)
end

-- [ Invisiblity ] --

function Functions.Invisible()
	if Data.InvisibleSeat then
		Data.InvisibleSeat:Destroy()
	end
	
	local RootPart = Functions.RootPart()
	Data.InvisibleSeat = Instance.new("VehicleSeat", workspace.Terrain) :: VehicleSeat
	Data.InvisibleSeat.Transparency = 1
	Data.InvisibleSeat.Anchored = false
	Data.InvisibleSeat.CFrame = RootPart.CFrame
	
	local Weld = Instance.new("WeldConstraint")
	Weld.Part0 = RootPart
	Weld.Part1 = Data.InvisibleSeat
	Weld.Parent = Data.InvisibleSeat
	
	Data.LastCFrame = RootPart.CFrame
end

function Functions.Uninvisible()
	if not Data.InvisibleSeat then
		return
	end
	
	Functions.Knock(1)
	
	local RootPart = Functions.RootPart()
	RootPart.CFrame = Data.LastCFrame
	Data.InvisibleSeat:Destroy()
end

function Functions.ToggleInvisibility()
	if not Data.Combat.Invisible then
		Data.Combat.Invisible = true
		Functions.Notification({
			Title = "Enabled Invisibility",
			Duration = 2
		})
		Functions.Invisible()
	else
		Data.Combat.Invisible = false
		Functions.Notification({
			Title = "Disabled Invisiblity",
			Duration = 2
		})
		Functions.Uninvisible()
	end
end

-- [ Movestack ] --

function Functions.Movestack()
	if Data.Combat.Movestack then
		return
	end
	Data.Combat.Movestack = true
	local Humanoid = Functions.Humanoid()
	while Data.Combat.Movestack and wait() do
		if Humanoid.Health < 5 then
			Data.Combat.Movestack = false
			break
		end
		Functions.FireServer("DialogueInteracted",{DialogueName = "Prestige", Speaker = "Will_v"})
		Functions.FireServer("EndDialogue",{NPC = "Prestige", Dialogue = "Dialogue1", Option = "1"})
		Functions.FireServer("StartSprinting")
	end
end

function Functions.Unmovestack()
	if not Data.Combat.Movestack then
		return
	end
	Data.Combat.Movestack = false
end

function Functions.ToggleMovestack()
	if Data.Combat.Movestack then
		Functions.Notification({
			Title = "Enabled Movestack",
			Duration = 2
		})
		Functions.Movestack()
	else
		Functions.Notification({
			Title = "Disabled Movestack",
			Duration = 2
		})
		Functions.Unmovestack()
	end
end

-- [ Anti Stun ] --

function Functions.ToggleAntiStun()
	if Data.Combat.AntiStun then
		Functions.Notification({
			Title = "Disabled Anti Stun",
			Duration = 2
		})
		Data.Combat.AntiStun = false
	else
		Functions.Notification({
			Title = "Enabled Anti Stun",
			Text = "Enjoy ;D",
			Duration = 2
		})
		Data.Combat.AntiStun = true
		local Humanoid = Functions.Humanoid()
		while Data.Combat.AntiStun and wait() do
			if Humanoid.Health < 5 then
				break
			end
			local Response = Functions.InvokeServer("ReturnStuns")
			if Response then
				for _, v in Response do
					Functions.FireServer("RemoveStun",v)
					Functions.FireServer("UpdateHumanoid")
				end
			end
		end
		Data.Combat.AntiStun = false
	end
end

-- [ Teleport ] --

function Functions.Teleport(Cframe)
	Functions.Knock(0.8)
	task.wait(0.3)
	Functions.RootPart().CFrame = Cframe
end

-- [ Toggle Cooldowns ] --
function Functions.ToggleCooldowns()
	local args : Notification = {
		Title = "Toggled Cooldowns",
		Text = "Enjoy ;D",
		Duration = 2
	}
	Functions.Notification(args)
	Functions.FireServer("NOCDSETUP")
end

return Functions
