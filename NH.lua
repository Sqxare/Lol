local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local MainWindow = Rayfield:CreateWindow({
    Name = "Nameless Hub",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "By Sqxare and Olurgs",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "NamlessHub", -- Create a custom folder for your hub/game
       FileName = "Nameless Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "McDonalds Hub",
       Subtitle = "Key System",
       Note = "Key: McDonalds",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "McDonalds"
    }
 })


 local MainTab = MainWindow:CreateTab("Main", 4483362458) -- Title, Image

local AimTab = MainWindow:CreateTab("Aimbot", 4483362458)

local ExpTab = MainWindow:CreateTab("Exploits", 4483362458)

local MiscTab = MainWindow:CreateTab("Miscellaneous", 4483362458)

_G.InGame = false
_G.silent = false

local Button = MiscTab:CreateButton({
   Name = "Forget Match",
   Callback = function()
   game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.ForgetFrame.Visible = true
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Allow Viewstats",
   Callback = function()
     local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

RunService.RenderStepped:Connect(function()
    for _, Player in next, Players:GetPlayers() do
        local Config = Player:WaitForChild("Configuration", 9e9)
        
        Config:WaitForChild("AllowViewCard", 9e9).Value = true
    end
end)
   end,
})


local Button = ExpTab:CreateButton({
   Name = "Anti Drop",
   Callback = function()
   local hum = game:GetService("Players").LocalPlayer.Character.Humanoid

    hum:GetPropertyChangedSignal("PlatformStand"):Connect(function()
        if hum.PlatformStand then
            hum.PlatformStand = false
        end
    end)
   end,
})

local Button = ExpTab:CreateButton({
   Name = "Anti Travel",
   Callback = function()
   local mt = getrawmetatable(game)
make_writeable(mt)

local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...} --gets all arguments

    if method == "FireServer" and args[1] == "xd" then --check if the method firing is FireSerer (aka remote event) and if the first argument is Kick
        return wait(9e9)
    end
    return namecall(self, ...)
end)
   end,
})

local Toggle = MiscTab:CreateToggle({
   Name = "Colorful Name",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value) 
   
   if Value == true then
   getgenv().Enabled = true
   elseif Value == false then
   getgenv().Enabled = false
   end 
    

local Toggle = game:GetService("ReplicatedStorage"):WaitForChild("toggleEvent")

while task.wait(0.03) and getgenv().Enabled == true do
    local Color = Color3.fromHSV(tick() % 1, 1, 1)
    local Color2 = Color3.fromHSV((tick() % 1) / 2, 1, 1)
    
    Toggle:InvokeServer("Color", Color, Color2)
end

Toggle:InvokeServer("Color", Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0))
   end,
})



local Button = ExpTab:CreateButton({
   Name = "Anti Out of bounds",
   Callback = function()
     
local oob 

for i, v in pairs(workspace.Courts:GetDescendants()) do
 if v.Name == "OOB" then
     local clone = v:Clone()
     clone.Parent = workspace
    v:Destroy()
    end
end

for i, v in pairs(workspace.Courts:GetDescendants()) do
 if v.Name == "OOBLines" then
     local clone = v:Clone()
     clone.Parent = workspace
     v:Destroy()
    end
end

for i, v in pairs(workspace.Courts:GetDescendants()) do
 if v.Name == "WALLS"  then
    v:Destroy()
    end
end
   end,
})




 local Button = MainTab:CreateButton({
    Name = "Serverhop",
    Callback = function(v)
        
Time = 1 -- seconds
repeat wait() until game:IsLoaded()
wait(Time)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
function TPReturner()
   local Site;
   if foundAnything == "" then
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
   else
       Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
   end
   local ID = ""
   if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
       foundAnything = Site.nextPageCursor
   end
   local num = 0;
   for i,v in pairs(Site.data) do
       local Possible = true
       ID = tostring(v.id)
       if tonumber(v.maxPlayers) > tonumber(v.playing) then
           for _,Existing in pairs(AllIDs) do
               if num ~= 0 then
                   if ID == tostring(Existing) then
                       Possible = false
                   end
               else
                   if tonumber(actualHour) ~= tonumber(Existing) then
                       local delFile = pcall(function()
                           delfile("NotSameServers.json")
                           AllIDs = {}
                           table.insert(AllIDs, actualHour)
                       end)
                   end
               end
               num = num + 1
           end
           if Possible == true then
               table.insert(AllIDs, ID)
               wait()
               pcall(function()
                   writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                   wait()
                   game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
               end)
               wait(4)
           end
       end
   end
end

function Teleport()
   while wait() do
       pcall(function()
           TPReturner()
           if foundAnything ~= "" then
               TPReturner()
           end
       end)
   end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport()

    end,
 })




local Button = MainTab:CreateButton({
    Name = "Rejoin",
    Callback = function(v)
    
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    
    end,
 })

   
 
local Button = MainTab:CreateButton({
   Name = "Destroy UI (Mobile)",
   Callback = function()
   Rayfield:Destroy()
   end,
})

local LKeybind = ExpTab:CreateKeybind({
   Name = "Mag",
   CurrentKeybind = "B",
   HoldToInteract = false,
   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
  
local courts = workspace.Courts 
local lp = game.Players.LocalPlayer.Character
local pla = game.Players.LocalPlayer



for i, v in pairs(courts:GetDescendants()) do
if v.Name == "R1_Player" and v:IsA("ObjectValue") then
if v.Value == pla then
_G.InGame = true
v.Value.Changed:Connect(function(value) 
if value ~= pla then
_G.InGame = false
end
end)
end
end
end

for i, v in pairs(courts:GetDescendants()) do
if v.Name == "B1_Player" and v:IsA("ObjectValue")  then
if v.Value == pla then
_G.InGame = true
v.Value.Changed:Connect(function(value) 
if value ~= pla then
_G.InGame = false
end
end)

end
end
end



function grabTool()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            if not game.Players.LocalPlayer.Character:FindFirstChild("Basketball") then 
            local toolEquipped = character:FindFirstChildOfClass("Tool")
            if not toolEquipped then
                local closestTool = nil
                local closestDistance = math.huge

                for _, tool in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if tool:IsA("Tool") then
                        local toolHandle = tool:FindFirstChild("Ball")
                        local lastPLR = tool:FindFirstChild("[GAME]").LastPLR
                        local shotC = tool:FindFirstChild("[GAME]").Shot
                        if shotC.Value == true then
                        if toolHandle then
                            local toolDistance = (toolHandle.Position - humanoidRootPart.Position).Magnitude
                            if toolDistance < closestDistance then
                                closestTool = tool
                                closestDistance = toolDistance
                                if lastPLR.Value == game.Players.LocalPlayer.Name then
                                    closestTool = nil
                                 end
        
                            end
                        end
                    end
                end
            end 

                if closestTool then
                    character:FindFirstChild("Humanoid"):EquipTool(closestTool)
                end
            else
                local toolHandle = toolEquipped:FindFirstChild("Ball")
                if not toolHandle then
                    toolEquipped.Parent = nil
                end
            end
             
             wait(0.1)
             -- Adjust the delay as needed
        end
       end
    end
  


   
   grabTool()



   end,
})



local Toggle = ExpTab:CreateToggle({
   Name = "Loop Mag",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value) 
  
local courts = workspace.Courts 
local lp = game.Players.LocalPlayer.Character
local pla = game.Players.LocalPlayer



for i, v in pairs(courts:GetDescendants()) do
if v.Name == "R1_Player" and v:IsA("ObjectValue") then
if v.Value == pla then
_G.InGame = true
v.Value.Changed:Connect(function(value) 
if value ~= pla then
_G.InGame = false
end
end)
end
end
end

for i, v in pairs(courts:GetDescendants()) do
if v.Name == "B1_Player" and v:IsA("ObjectValue")  then
if v.Value == pla then
_G.InGame = true
v.Value.Changed:Connect(function(value) 
if value ~= pla then
_G.InGame = false
end
end)

end
end
end



function grabTool()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character
    if character and character:FindFirstChild("Humanoid") then
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            if not game.Players.LocalPlayer.Character:FindFirstChild("Basketball") then 
            local toolEquipped = character:FindFirstChildOfClass("Tool")
            if not toolEquipped then
                local closestTool = nil
                local closestDistance = math.huge

                for _, tool in pairs(game:GetService("Workspace"):GetDescendants()) do
                    if tool:IsA("Tool") then
                        local toolHandle = tool:FindFirstChild("Ball")
                        local lastPLR = tool:FindFirstChild("[GAME]").LastPLR
                        local shotC = tool:FindFirstChild("[GAME]").Shot
                        if shotC.Value == true then
                        if toolHandle then
                            local toolDistance = (toolHandle.Position - humanoidRootPart.Position).Magnitude
                            if toolDistance < closestDistance then
                                closestTool = tool
                                closestDistance = toolDistance
                                if lastPLR.Value == game.Players.LocalPlayer.Name then
                                    closestTool = nil
                                 end
        
                            end
                        end
                    end
                end
            end 

                if closestTool then
                    character:FindFirstChild("Humanoid"):EquipTool(closestTool)
                end
            else
                local toolHandle = toolEquipped:FindFirstChild("Ball")
                if not toolHandle then
                    toolEquipped.Parent = nil
                end
            end
             
             wait(0.1)
             -- Adjust the delay as needed
        end
       end
    end
  

   while _G.InGame == true do 
            wait(0.001)
   grabTool()
  end 



end,

})

local LKeybind = ExpTab:CreateKeybind({
   Name = "Auto Guard",
   CurrentKeybind = "N",
   HoldToInteract = true,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
  
  local tr = false
  
  if Keybind == true then
      tr = true
  elseif Keybind == false then
      tr = false
  end  

if not Keybind then return end
local Mouse = game.Players.LocalPlayer:GetMouse()



           for i, v in pairs(game.Players:GetPlayers()) do
               local char = game.Players.LocalPlayer.Character
               if v.Name ~= char.Name and (v.Character.Torso.CFrame.p - char.Torso.CFrame.p).Magnitude < 25 then
                       if v.Character.Torso.Velocity.magnitude > 0.5 and v.Character:FindFirstChild("Basketball") then
                           char.Humanoid:MoveTo(v.Character.Torso.CFrame.p + v.Character.Torso.Velocity.unit * 7)
                       elseif v.Character.Torso.Velocity.magnitude < 0.5 and v.Character:FindFirstChild("Basketball") then 
                           char.Humanoid:MoveTo(v.Character.Torso.CFrame.p)
                       elseif not v.Character:FindFirstChild("Basketball") then
                           tr = false
                       end
                        task.wait()
                   end
               end






   end,
})


local Toggle = AimTab:CreateToggle({
   Name = "Silent Aim",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value) 
  
local courts = workspace.Courts 
local lp = game.Players.LocalPlayer.Character
local pla = game.Players.LocalPlayer

if Value == true then
_G.silent = true 
if Value == false then
_G.silent = false
end
end

for i, v in pairs(courts:GetDescendants()) do
if v.Name == "R1_Player" and v:IsA("ObjectValue") then
if v.Value == pla then
_G.InGame = true
v.Value.Changed:Connect(function(value) 
if value ~= pla then
_G.InGame = false
end
end)
end
end
end

for i, v in pairs(courts:GetDescendants()) do
if v.Name == "B1_Player" and v:IsA("ObjectValue")  then
if v.Value == pla then
_G.InGame = true
v.Value.Changed:Connect(function(value) 
if value ~= pla then
_G.InGame = false
end
end)

end
end
end



local Player = game:GetService("Players").LocalPlayer

if workspace:FindFirstChild("PracticeArea") then
    workspace.PracticeArea.Parent = workspace.Courts
end

local GetGoal = function()
    local Distance, Goal = 9e9;
    
    for _, Obj in next, workspace.Courts:GetDescendants() do
        if Obj.Name == "Swish" and Obj.Parent:FindFirstChildOfClass("TouchTransmitter") then
            local Magnitude = (Player.Character.Torso.Position - Obj.Parent.Position).Magnitude
        
            if Distance > Magnitude then
                Distance = Magnitude
                Goal = Obj.Parent
            end
        end
    end
    
    return Goal
end




Player.Character.Humanoid.Jumping:Connect(function() 
if Player.Character:FindFirstChild("Basketball") then
    if _G.silent == true then
   local goal = GetGoal()
_G.vector = 45

         local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 11.2 then
           _G.vector = 63
           if pvm <=13.2 then
               game.Players.LocalPlayer.Power.Value = 50
              _G.vector = 61
       
         end
       end


          local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 13.3 then
             _G.vector = 59
           if pvm <=15.3 then
               game.Players.LocalPlayer.Power.Value = 50
              _G.vector = 57
       
         end
       end



       local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 16.5 then
            _G.vector = 55
           if pvm <=19.5 then
               game.Players.LocalPlayer.Power.Value = 50
               _G.vector = 53
       
         end
       end


    local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 19.5 then
            _G.vector = 51
           if pvm <=22.4 then
               game.Players.LocalPlayer.Power.Value = 50
               _G.vector = 49
        
         end
       end

      local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 22.5 then
            _G.vector = 47
           if pvm <=28.5 then
               game.Players.LocalPlayer.Power.Value = 50
              
          _G.vector = 45
         end
       end


   local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 29.3 then
            _G.vector = 44
           if pvm <=31.3 then
               game.Players.LocalPlayer.Power.Value = 50
              _G.vector = 42
       
         end
       end


   local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 31.4 then
           game.Players.LocalPlayer.Power.Value = 50
            _G.vector = 38.5
           if pvm <=32.9 then
               game.Players.LocalPlayer.Power.Value = 50
              _G.vector = 38.5
       
         end
       end



       local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 33 then
           _G.vector = 44
           game.Players.LocalPlayer.Power.Value = 55
           if pvm <=36 then
               game.Players.LocalPlayer.Power.Value = 55
              _G.vector = 45
       
         end
       end


       local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 36.1 then
           _G.vector = 42.5
           game.Players.LocalPlayer.Power.Value = 60
           if pvm <=42.9 then
               game.Players.LocalPlayer.Power.Value = 60
              _G.vector = 45
       
         end
       end


      local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 43 then
           _G.vector = 43.5
           if pvm >= 44.1 then
           _G.vector = 44
           game.Players.LocalPlayer.Power.Value = 65
           if pvm <=49.9 then
               game.Players.LocalPlayer.Power.Value = 65
              
             _G.vector = 45
         end
       end
end 



    local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
        if pvm >= 50 then
           _G.vector = 42.5
            game.Players.LocalPlayer.Power.Value = 70
       if pvm >= 51 then
            game.Players.LocalPlayer.Power.Value = 70
           _G.vector = 42.7
              if pvm >= 52 then
           _G.vector = 43.5
            game.Players.LocalPlayer.Power.Value = 70
             if pvm >= 57 then
           _G.vector = 43
            game.Players.LocalPlayer.Power.Value = 70
           if pvm <=57.9 then
               game.Players.LocalPlayer.Power.Value = 70
              _G.vector = 45
       
         end
       end
    end
    end 
end

   local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 58  then
            game.Players.LocalPlayer.Power.Value = 75
           _G.vector = 41.5
         if pvm >= 58.5  then
           _G.vector = 43.5
           game.Players.LocalPlayer.Power.Value = 75
           if pvm <=62.8 then
            game.Players.LocalPlayer.Power.Value = 75
              _G.vector = 45
           end
         end
       end

	   	   local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 62.9 then
           _G.vector = 41.5
            game.Players.LocalPlayer.Power.Value = 80
           if pvm <= 68  then
            game.Players.LocalPlayer.Power.Value = 80
            _G.vector = 44
         end
       end


	    local lookthat = goal
       local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
       if pvm >= 68.2  then
           _G.vector = 42.5
           game.Players.LocalPlayer.Power.Value = 85
		    if pvm <= 71.4  then
           game.Players.LocalPlayer.Power.Value = 85
              _G.vector = 43
               if pvm <= 75  then
           game.Players.LocalPlayer.Power.Value = 85
              _G.vector = 45
             if pvm <= 76 then
           game.Players.LocalPlayer.Power.Value = 85
              _G.vector = 48
                 
                 
             end
         end
	   end
    end
end


local Hook do
local Goal = GetGoal()
    Hook = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
        local Arguments = {...}
        local NCM = getnamecallmethod()


        if Self == workspace and NCM == "FindPartOnRayWithIgnoreList" and not game:IsAncestorOf(getcallingscript())  then
          
    
            return Goal, Goal.Position + Vector3.new(0, _G.vector, 0)
        end
    
        return Hook(Self, ...)
    end))
end

wait(0.2)
mouse1click()

end
end)

end,

})
    
_G.AutoGuard = false

local Toggle = ExpTab:CreateToggle({
   Name = "Loop Auto Guard",
   CurrentValue = false,
   Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value) 
   
if Value == true then
_G.AutoGuard = true
elseif Value == false then
_G.AutoGuard = false
end

local tr = false
local Mouse = game.Players.LocalPlayer:GetMouse()

while wait() do
if not _G.AutoGuard then return end
if _G.AutoGuard == true then

           tr = true
           for i, v in pairs(game.Players:GetPlayers()) do
               local char = game.Players.LocalPlayer.Character
               if v.Name ~= char.Name and (v.Character.Torso.CFrame.p - char.Torso.CFrame.p).Magnitude < 25 then
     
                       if v.Character.Torso.Velocity.magnitude > 0.5 and v.Character:FindFirstChild("Basketball") then
                           char.Humanoid:MoveTo(v.Character.Torso.CFrame.p + v.Character.Torso.Velocity.unit * 7)
                       elseif v.Character.Torso.Velocity.magnitude < 0.5 and v.Character:FindFirstChild("Basketball") then 
                           char.Humanoid:MoveTo(v.Character.Torso.CFrame.p)
                       elseif not v.Character:FindFirstChild("Basketball") then
                           tr = false
                       end
                        task.wait()
                   end
               end

           tr = false
end     
end

end,

})
    
local Toggle = AimTab:CreateToggle({
   Name = "In Range",
   CurrentValue = false,
   Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value) 
  



local Player = game:GetService("Players").LocalPlayer

if workspace:FindFirstChild("PracticeArea") then
    workspace.PracticeArea.Parent = workspace.Courts
end

local GetGoal = function()
    local Distance, Goal = 9e9;
    
    for _, Obj in next, workspace.Courts:GetDescendants() do
        if Obj.Name == "Swish" and Obj.Parent:FindFirstChildOfClass("TouchTransmitter") then
            local Magnitude = (Player.Character.Torso.Position - Obj.Parent.Position).Magnitude
        
            if Distance > Magnitude then
                Distance = Magnitude
                Goal = Obj.Parent
            end
        end
    end
    
    return Goal
end
  
   local goal = GetGoal()
   local lookthat = goal
   local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
   local humanoid = game.Players.LocalPlayer.Character.Humanoid
   local hasPart = false
    
local InRangePart = function()
for i,v  in pairs(workspace:GetDescendants()) do
if v:IsA('Part') and v.Name == "ThreeDTextBoundingBox" and v.Parent.Name == "CityText" then 
local rc = v:Clone()
rc.Anchored = false
rc.Transparency = 1
rc.Parent = workspace
rc.Name = "InRange"
local weld = Instance.new("Weld", rc)
weld.Part0 = game.Players.LocalPlayer.Character.HumanoidRootPart
weld.Part1 = rc
rc.Size = Vector3.new(2.1, 2.1, 1.1)
rc.Name = "InRange"
rc.Material = "Neon"
rc.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

end
end
end

local OutRangePart = function()
for i,v  in pairs(workspace:GetDescendants()) do
if v:IsA('Part') and v.Name == "ThreeDTextBoundingBox" and v.Parent.Name == "TownText" then 
local rc = v:Clone()
rc.Anchored = false
rc.Transparency = 1
rc.Parent = workspace
rc.Name = "OutRange"
local weld = Instance.new("Weld", rc)
weld.Part0 = game.Players.LocalPlayer.Character.HumanoidRootPart
weld.Part1 = rc
rc.Size = Vector3.new(2.1, 2.1, 1.1)
rc.Name = "OutRange"
rc.Material = "Neon"
rc.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

end
end
end


   InRangePart()
   OutRangePart()

    local lastpos = game.Players.LocalPlayer.LastPos
 
 if Value == true then
 _G.Range = true
 elseif Value == false then
 _G.Range = false
 end


while wait() do
   wait()
   if Value == false and not _G.Range then 
       workspace.InRange.Transparency = 1
       workspace.OutRange.Transparency = 1
     end
    if Value == true and _G.Range then   
    if not game.Players.LocalPlayer.Character:FindFirstChild("Basketball") then
    workspace.InRange.Transparency = 1
    workspace.OutRange.Transparency = 1
    end   
    if game.Players.LocalPlayer.Character:FindFirstChild("Basketball") then
   local goal = GetGoal()
   local lookthat = goal
   local pvm = (lookthat.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
         if pvm < 76 then
           if workspace:FindFirstChild("OutRange") then
             workspace.InRange.Transparency = 0
             workspace.OutRange.Transparency = 1
                end
        end  
             if pvm > 76.1 then
             if workspace:FindFirstChild("InRange") then
             workspace.InRange.Transparency = 1
             workspace.OutRange.Transparency = 0
             end
        end 
     end
  end 
end



end,

})

local Toggle = MiscTab:CreateToggle({
   Name = "Click Fling/Kill (Click a player to fling/kill)",
   CurrentValue = false,
   Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)

  
    local Players = game:GetService("Players")
	 local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
	 
	 Mouse.Button1Down:Connect(function()
       if Value == false then return end
       if Value == true then
		 local Target = Mouse.Target
		 if Target and Target.Parent and Target.Parent:IsA("Model") and Players:GetPlayerFromCharacter(Target.Parent) then
			 local PlayerName = Players:GetPlayerFromCharacter(Target.Parent).Name
	 local player = game.Players.LocalPlayer
	 local Targets = {PlayerName}
	 
	 local Players = game:GetService("Players")
	 local Player = Players.LocalPlayer
	 
	 local AllBool = false
	 
	 local GetPlayer = function(Name)
		Name = Name:lower()
		if Name == "all" or Name == "others" then
			AllBool = true
			return
		elseif Name == "random" then
			local GetPlayers = Players:GetPlayers()
			if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
			return GetPlayers[math.random(#GetPlayers)]
		elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
			for _,x in next, Players:GetPlayers() do
				if x ~= Player then
					if x.Name:lower():match("^"..Name) then
						return x;
					elseif x.DisplayName:lower():match("^"..Name) then
						return x;
					end
				end
			end
		else
			return
		end
	 end
	 
	 local Message = function(_Title, _Text, Time)
print(_Title)
print(_Text)
print(Time)
	 end
	 
	 local SkidFling = function(TargetPlayer)
		local Character = Player.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
		local RootPart = Humanoid and Humanoid.RootPart
	 
		local TCharacter = TargetPlayer.Character
		local THumanoid
		local TRootPart
		local THead
		local Accessory
		local Handle
	 
		if TCharacter:FindFirstChildOfClass("Humanoid") then
			THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
		end
		if THumanoid and THumanoid.RootPart then
			TRootPart = THumanoid.RootPart
		end
		if TCharacter:FindFirstChild("Head") then
			THead = TCharacter.Head
		end
		if TCharacter:FindFirstChildOfClass("Accessory") then
			Accessory = TCharacter:FindFirstChildOfClass("Accessory")
		end
		if Accessoy and Accessory:FindFirstChild("Handle") then
			Handle = Accessory.Handle
		end
	 
		if Character and Humanoid and RootPart then
			if RootPart.Velocity.Magnitude < 50 then
				getgenv().OldPos = RootPart.CFrame
			end
			if THumanoid and THumanoid.Sit and not AllBool then
			end
			if THead then
				workspace.CurrentCamera.CameraSubject = THead
			elseif not THead and Handle then
				workspace.CurrentCamera.CameraSubject = Handle
			elseif THumanoid and TRootPart then
				workspace.CurrentCamera.CameraSubject = THumanoid
			end
			if not TCharacter:FindFirstChildWhichIsA("BasePart") then
				return
			end
			
			local FPos = function(BasePart, Pos, Ang)
				RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
				Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
				RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
				RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			end
			
			local SFBasePart = function(BasePart)
				local TimeToWait = 1
				local Time = tick()
				local Angle = 0
	 
				repeat
					if RootPart and THumanoid then
						if BasePart.Velocity.Magnitude < 50 then
							Angle = Angle + 100
	 
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
							task.wait()
						else
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
							
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
							task.wait()
	 
							FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
							task.wait()
						end
					else
						break
					end
				until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
			end
			
			workspace.FallenPartsDestroyHeight = 0/0
			
			local BV = Instance.new("BodyVelocity")
			BV.Name = "EpixVel"
			BV.Parent = RootPart
			BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
			BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
			
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
			
			if TRootPart and THead then
				if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
					SFBasePart(THead)
				else
					SFBasePart(TRootPart)
				end
			elseif TRootPart and not THead then
				SFBasePart(TRootPart)
			elseif not TRootPart and THead then
				SFBasePart(THead)
			elseif not TRootPart and not THead and Accessory and Handle then
				SFBasePart(Handle)
			else
			end
			
			BV:Destroy()
			Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
			workspace.CurrentCamera.CameraSubject = Humanoid
			
			repeat
				RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
				Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
				Humanoid:ChangeState("GettingUp")
				table.foreach(Character:GetChildren(), function(_, x)
					if x:IsA("BasePart") then
						x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
					end
				end)
				task.wait()
			until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
			workspace.FallenPartsDestroyHeight = getgenv().FPDH
		else
		end
	 end
	 
	 getgenv().Welcome = true
	 if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
	 
	 if AllBool then
		for _,x in next, Players:GetPlayers() do
			SkidFling(x)
		end
	 end
	 
	 for _,x in next, Targets do
		if GetPlayer(x) and GetPlayer(x) ~= Player then
			if GetPlayer(x).UserId ~= 1414978355 then
				local TPlayer = GetPlayer(x)
				if TPlayer then
					SkidFling(TPlayer)
				end
			else
			end
		elseif not GetPlayer(x) and not AllBool then
		end
	 end
           end
         end
	 end)

   end,
})
 local Slider = ExpTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 250},
    Increment = 10,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end,
 })



 local Slider = ExpTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 500},
    Increment = 10,
    Suffix = "JumpPower",
    CurrentValue = 50,
    Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end,
 })

 local Toggle = MiscTab:CreateToggle({
   Name = "Lag Game",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   -- // Press P to toggle

if Value == true then
getgenv().Enabled = true
elseif Value == false then
getgenv().Enabled = false
end   

local Network = game:GetService("NetworkClient")
local UIS = game:GetService("UserInputService")
local Update = game:GetService("RobloxReplicatedStorage").UpdatePlayerBlockList

local Lag = function()
    local Main = {}
    local Spammed = {}
    
    local Table = {}
    table.insert(Spammed, Table)
    
    for _ = 1, 250 do
        local TableToInsert = {}
        
        table.insert(Table, TableToInsert)
        Table = TableToInsert
    end
    
    local Max = (499999 / (255))
    
    for _ = 1, Max do
        table.insert(Main, Spammed)
    end
    
    Update:FireServer(Main)
end



task.spawn(function()
    while task.wait(1) do
        if getgenv().Enabled == true then
            task.spawn(Lag)
        end
    end
end)
   end,
})

Rayfield:LoadConfiguration()
