local char = game:GetService("Players").LocalPlayer.Character

function Invis()
    local Model = Instance.new("Model",char)
    for i,v in pairs(char:GetChildren()) do
    if v.Name == "HumanoidRootPart" or v.Name == "LowerTorso" or v.Name == "UpperTorso" or v.Name == "Head" or v.Name == "Humanoid" then
        local Clone = v:Clone()
        Clone.Parent = Model
    end
end
end

function Uninvis()
char.Model:Destroy()
end
game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
    if msg == "/e invis" then
        if not char:FindFirstChild("Model") then
            Invis()
            else
                Uninvis()
        end
    end
end)
