local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()
local player = game:GetService("Players").LocalPlayer
local AimbotTab = Library:CreateTab("Aimbot", "This is where you enable Aimbot", true) 

local function calculateDistance(point1, point2)
    return (point1 - point2).magnitude
end

local swishParents = {}
for _, v in ipairs(workspace:GetDescendants()) do
    if v.Name == "Swish" and v:IsA("Sound") then
        table.insert(swishParents, v.Parent)
    end
end

local aimbotEnabled = false
local aimbotLoop

local function enableAimbot()
    aimbotEnabled = true
    aimbotLoop = coroutine.create(function()
        while aimbotEnabled do
            local character = player.Character
            if character and character:FindFirstChild("Basketball") then
                local characterPosition = character.HumanoidRootPart.Position
                local nearestDistance = math.huge
                local validDistanceFound = false 
                local rDistance = 74
                
                for _, parent in ipairs(swishParents) do
                    local distance = calculateDistance(characterPosition, parent.Position)
                    
                    if distance < nearestDistance then
                        nearestDistance = distance
                        validDistanceFound = true 
                    end
                end

                local NormalTable = {13, 74}
                local LowTable = {13, 72}

                if _G.Normal then
                rDistance = NormalTable[2]
                end

                if _G.lowarc then
                rDistance = LowTable[2]
                end
                
                if validDistanceFound then
                    local circleColor = (nearestDistance >= 13 and nearestDistance <= rDistance) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                    player.PlayerGui.PowerUI.Frame.Circle.BackgroundColor3 = circleColor
                end
            end
            wait()
        end
    end)
    coroutine.resume(aimbotLoop)
end



local function silentAim()
_G.silent = true
_G.Normal = true

local aimTog = script.Parent
local toggled = false
local onColor = Color3.fromRGB(52, 253, 21)
local offColor = Color3.fromRGB(253, 253, 253)
local rs = game:GetService("RunService")



    local courts = workspace.Courts 
    local lp = game.Players.LocalPlayer.Character
    local pla = game.Players.LocalPlayer



    local reset = false

    pcall(function()
        if _G.stepped ~= nil or _G.input ~= nil or _G.charAdded ~= nil or _G.stepped6 ~= nil then
            reset = true
            _G.stepped:Disconnect()
            _G.stepped6:Disconnect()
            _G.input:Disconnect()
            _G.charAdded:Disconnect()
            _G.charAdded = nil
            _G.stepped = nil
            _G.stepped6 = nil
            _G.input = nil

        end
        if not reset then

        end
    end)

    local rs = game:GetService("RunService")
    local plr = game.Players.LocalPlayer
    local uis = game:GetService("UserInputService")


    local shootingEvent = game:GetService("ReplicatedStorage").shootingEvent

    if workspace:FindFirstChild("PracticeArea") then
        workspace.PracticeArea.Parent = workspace.Courts
    end

    local jumping = false


    local player = game.Players.LocalPlayer
    local func 

    for i, v in pairs(getgc(true)) do
        if type(v) == "function" and debug.getinfo(v).name == "e" then
            local consts = debug.getconstants(v)
            if consts[2] == "HumanoidRootPart" then
                func = v
            end
        end
    end
    

    for i, v in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
        for z, x in pairs(getupvalues(v.Function)) do
            if z == 9 then
                _G.key = x
            end
            if type(x) == "table" and rawget(x, 1) then
            end
        end
    end


    for i, v in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
        for z, x in pairs(getupvalues(v.Function)) do
            if type(x) == "table" and rawget(x, 1) then
                _G.method = x
            elseif z == 10 then
            end
        end
    end
    
    shootingEvent.OnClientEvent:Connect(
        function(newKey)
            _G.key = newKey
        end
    )



    for i,v in pairs(getconnections(plr.Character.HumanoidRootPart:GetPropertyChangedSignal("Size"))) do
        v:Disable()
    end


    function setup()
        local dist, goal = 9e9, nil
             local v = workspace:FindFirstChild("Goal")
                local mag = (plr.Character.Torso.Position - v.Position).Magnitude
                if dist > mag then
                    dist = mag; goal = v
            
        end
        return dist, goal
    end

    function power()
        return plr.Power
    end

    function changePower(goal)
        power().Value = goal
    end

    function table(a, b)
        local args = {
            X1 = a.X, 
            Y1 = a.Y, 
            Z1 = a.Z, 
            X2 = b.X, 
            Y2 = b.Y, 
            Z2 = b.Z
        };

        return {args[_G.method[1]], args[_G.method[2]], args[_G.method[3]], args[_G.method[4]], args[_G.method[5]], args[_G.method[6]]}
    end

    function arc()
        local dist, goal = setup()

        dist = math.floor(dist)

        if _G.Normal then
        if dist == 12 or dist == 13 then
            return 16
        elseif dist == 14 or dist == 15 then
            return 22
        elseif dist == 16 or dist == 17 then
            return 20
        elseif dist == 18 then
            return 25
        elseif dist == 19 then
            return 20
        elseif dist == 20 or dist == 21 then
            return 20
        elseif dist == 22 or dist == 23 then
            return 25
        elseif dist == 24 or dist == 25 then
            return 20
        elseif dist == 26 then
            return 15
        elseif dist == 27 or dist == 28 then
            return 25
        elseif dist == 29 or dist == 30 then
            return 19
        elseif dist == 31 then
            return 15
        elseif dist == 32 or dist == 33 then
            return 29
        elseif dist == 34 or dist == 35 then
            return 25
        elseif dist == 36 or dist == 37 or dist == 38 then
            return 28
        elseif dist == 39 or dist == 40 then
            return 30
        elseif dist == 41 then
            return 25
        elseif dist == 42 or dist == 43 then
            return 37
        elseif dist == 44 then
            return 35
        elseif dist == 45 then
            return 30
        elseif dist == 46 or dist == 47 or dist == 48 then
            return 45
        elseif dist == 49 then
            return 38
        elseif dist == 50 then
            return 35
        elseif dist == 51 then
            return 50
        elseif dist == 52 then
            return 54
        elseif dist == 53 or dist == 54 then
            return 48
        elseif dist == 55 or dist == 56 then
            return 41
        elseif dist == 57 or dist == 58 then
            return 53
        elseif dist == 59 or dist == 60 then
            return 50
        elseif dist == 61 or dist == 62 or dist == 63 then
            return 65
        elseif dist == 64 then
            return 58
        elseif dist == 65 then
            return 57
        elseif dist == 66 or dist == 67 then
            return 56
        elseif dist == 68 or dist == 69 then
            return 70
        elseif dist == 70 then
            return 67
        elseif dist == 71 then
            return 65
        elseif dist == 72 then
            return 61
        elseif dist == 73 then
            return 55
        elseif dist == 74 then
            return 46
        elseif jumping then
            if dist == 9 or dist == 10 then
                return 17
            elseif dist == 11 or dist == 12 then
                return 17
            end
        end
    end

    if _G.lowarc then
        if dist == 12 or dist == 13 then
			return 16
		elseif dist == 14 or dist == 15 then
			return 22
		elseif dist == 16 or dist == 17 then
			return 20
		elseif dist == 18 then
			return 25
		elseif dist == 19 then
			return 20
		elseif dist == 20 or dist == 21 then
			return 20
		elseif dist == 22 or dist == 23 then
			return 25
		elseif dist == 24 or dist == 25 then
			return 20
		elseif dist == 26 then
			return 15
		elseif dist == 27 or dist == 28 then
			return 25
		elseif dist == 29 or dist == 30 then
			return 19
		elseif dist == 31 then
			return 15
		elseif dist == 32 or dist == 33 then
			return 29
		elseif dist == 34 or dist == 35 then
			return 25
		elseif dist == 36 or dist == 37 or dist == 38 then
			return 28
		elseif dist == 39 or dist == 40 then
			return 30
		elseif dist == 41 then
			return 25
		elseif dist == 42 or dist == 43 then
			return 37
		elseif dist == 44 then
			return 35
		elseif dist == 45 then
			return 30
		elseif dist == 46 or dist == 47 or dist == 48 then
			return 45
		elseif dist == 49 then
			return 38
		elseif dist == 50 then
			return 35
		elseif dist == 51 then
			return 50
		elseif dist == 52 then
			return 54
		elseif dist == 53 or dist == 54 then
			return 48
		elseif dist == 55 or dist == 56 then
			return 41
		elseif dist == 57 or dist == 58 then
			return 53
		elseif dist == 59 then
			return 30
		elseif dist == 60 then
			return 32.5
		elseif dist == 61 then
			return 35
		elseif dist == 62 then
			return 25
		elseif dist == 63 then
			return 27
		elseif dist == 64 then
			return 30
		elseif dist == 65 then
			return 32
		elseif dist == 66 then
			return 34
		elseif dist == 67 then
			return 23
		elseif dist == 68 then
			return 27
		elseif dist == 69 then
			return 30
		elseif dist == 70 then
			return 32
		elseif dist == 71 then
			return 38
		elseif dist == 72 then
			return 40
		elseif jumping then
			if dist == 9 or dist == 10 then
				return 17
			elseif dist == 11 or dist == 12 then
				return 17
			end
		end
    end

    if _G.HighArc then
        if dist == 12 then
			return 105
		elseif dist == 13 then
			return 105
		elseif dist == 14 then
			return 106
		elseif dist == 15 then
			return 106
		elseif dist == 16 then
			return 107
		elseif dist == 17 then
			return 107
		elseif dist == 18 then
			return 108
		elseif dist == 19 then
			return 108
		elseif dist == 20 then
			return 109
		elseif dist == 21 then
			return 109
		elseif dist == 22 then
			return 110
		elseif dist == 23 then
			return 110
		elseif dist == 24 then
			return 111
		elseif dist == 25 then
			return 111
		elseif dist == 26 then
			return 112
		elseif dist == 27 then
			return 112
		elseif dist == 28 then
			return 113
		elseif dist == 29 then
			return 113
		elseif dist == 30 then
			return 114
		elseif dist == 31 then
			return 114
		elseif dist == 32 then
			return 115
		elseif dist == 33 then
			return 115
		elseif dist == 34 then
			return 113
		elseif dist == 35 then
			return 113
		elseif dist == 36 then
			return 111
		elseif dist == 37 then
			return 111
		elseif dist == 38 then
			return 110
		elseif dist == 39 then
			return 110
		elseif dist == 40 then
			return 109
		elseif dist == 41 then
			return 109
		elseif dist == 42 then
			return 108
		elseif dist == 43 then
			return 107
		elseif dist == 44 then
			return 106
		elseif dist == 45 then
			return 106
		elseif dist == 46 then
			return 105
		elseif dist == 47 then
			return 104
		elseif dist == 48 then
			return 102
		elseif dist == 49 then
			return 102
		elseif dist == 50 then
			return 101
		elseif dist == 51 then
			return 100
		elseif dist == 52 then
			return 99
		elseif dist == 53 then
			return 98
		elseif dist == 54 then
			return 97	
		elseif dist == 55 then
			return 95
		elseif dist == 56 then
			return 95
		elseif dist == 57 then
			return 94
		elseif dist == 58 then
			return 93
		elseif dist == 59 then
			return 91
		elseif dist == 60 then
			return 89
		elseif dist == 61 then
			return 87
		elseif dist == 62 then
			return 85
		elseif dist == 63 then
			return 83
		elseif dist == 64 then
			return 77
		elseif dist == 65 then
			return 75
		elseif dist == 66 or dist == 67 then
			return 72
		elseif dist == 68 or dist == 69 then
			return 70
		elseif dist == 70 then
			return 67
		elseif dist == 71 then
			return 65
		elseif dist == 72 then
			return 61
		elseif dist == 73 then
			return 55
		elseif dist == 74 then
			return 46
		elseif jumping then
			if dist == 9 or dist == 10 then
				return 105
			elseif dist == 11 or dist == 12 then
				return 105
			end
		end
    end

    end

    function stepped()
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local pwr = power()
            local dist, goal = setup()


        
            dist = math.floor(dist)

            if _G.Normal then
            if plr.Character:FindFirstChild("Basketball") then


                if dist >= 13 and dist <= 16 then
                    changePower(30)

                elseif dist >= 17 and dist <= 21 then
                    changePower(35)

                elseif dist >= 22 and dist <= 26 then
                    changePower(40)

                elseif dist >= 27 and dist <= 31 then
                    changePower(45)

                elseif dist >= 32 and dist <= 36 then
                    changePower(50)

                elseif dist >= 37 and dist <= 41 then
                    changePower(55)

                elseif dist >= 42 and dist <= 46 then
                    changePower(60)

                elseif dist >= 47 and dist <= 51 then
                    changePower(65)

                elseif dist >= 52 and dist <= 56 then
                    changePower(70)

                elseif dist >= 57 and dist <= 60 then
                    changePower(75)

                elseif dist >= 61 and dist <= 67 then
                    changePower(80)

                elseif dist >= 68 and dist <= 74 then
                    changePower(85)

                elseif jumping and dist == 9 or dist == 10 or dist == 11 or dist == 12 then
                    changePower(25)

                else

                end
            end
            end

                if _G.lowarc then
                    if plr.Character:FindFirstChild("Basketball") then


                        if dist >= 13 and dist <= 16 then
                            changePower(30)
                    
                        elseif dist >= 17 and dist <= 21 then
                            changePower(35)
                    
                        elseif dist >= 22 and dist <= 26 then
                            changePower(40)
                    
                        elseif dist >= 27 and dist <= 31 then
                            changePower(45)
                    
                        elseif dist >= 32 and dist <= 36 then
                            changePower(50)
                    
                        elseif dist >= 37 and dist <= 41 then
                            changePower(55)
                    
                        elseif dist >= 42 and dist <= 46 then
                            changePower(60)
                    
                        elseif dist >= 47 and dist <= 51 then
                            changePower(65)
                    
                        elseif dist >= 52 and dist <= 56 then
                            changePower(70)
                    
                        elseif dist >= 57 and dist <= 61 then
                            changePower(75)
                    
                        elseif dist >= 62 and dist <= 66 then
                            changePower(80)
                    
                        elseif dist >= 67 and dist <= 72 then
                            changePower(85)
                    
                        elseif jumping and dist == 9 or dist == 10 or dist == 11 or dist == 12 then
                            changePower(25)

                    
                        else
                    
                        end
                    end
                    end

            if _G.HighArc then
                if plr.Character:FindFirstChild("Basketball") then


                    if dist >= 13 and dist <= 16 then
                        changePower(85)
    
                    elseif dist >= 17 and dist <= 21 then
                        changePower(85)
    
                    elseif dist >= 22 and dist <= 26 then
                        changePower(85)
    
                    elseif dist >= 27 and dist <= 31 then
                        changePower(85)
    
                    elseif dist >= 32 and dist <= 36 then
                        changePower(85)
    
                    elseif dist >= 37 and dist <= 41 then
                        changePower(85)
    
                    elseif dist >= 42 and dist <= 46 then
                        changePower(85)
    
                    elseif dist >= 47 and dist <= 51 then
                        changePower(85)
    
                    elseif dist >= 52 and dist <= 56 then
                        changePower(85)
    
                    elseif dist >= 57 and dist <= 60 then
                        changePower(85)
    
                    elseif dist >= 61 and dist <= 67 then
                        changePower(85)
    
                    elseif dist >= 68 and dist <= 74 then
                        changePower(85)
    
                    elseif jumping and dist == 9 or dist == 10 or dist == 11 or dist == 12 then
                        changePower(85)
    
                    else
                    end
                end
                end

        end
    end

    function shoot()
        local dist, goal = setup()
        local pwr = power()
        local arc = arc()

        if arc ~= nil and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local x, z = 0, plr.Character.Humanoid.MoveDirection.Z

            if dist > 61 then
                x = plr.Character.Humanoid.MoveDirection.X 
            else
                x = 0
            end

            local args = table(plr.Character.Torso.Position, (goal.Position + Vector3.new(0, arc, 0) - plr.Character.HumanoidRootPart.Position + (Vector3.new(x, 0, z))).Unit)

            shootingEvent:FireServer(
                plr.Character.Basketball,
                pwr.Value,
                args,
                _G.key
            )
        end
    end

    function jumped()
        if plr.Character and plr.Character:FindFirstChild("Basketball") and _G.silent then
            jumping = true
            task.wait(0.325)
            shoot()
            task.wait(1)
            jumping = false
        end
    end

    _G.input = plr.Character.Humanoid.Jumping:Connect(jumped)
    _G.stepped = rs.Stepped:Connect(stepped)

    _G.charAdded = plr.CharacterAdded:Connect(function(ch)
        ch:WaitForChild("Humanoid").Jumping:Connect(jumped)
        for i,v in pairs(getconnections(ch:WaitForChild("HumanoidRootPart"):GetPropertyChangedSignal("Size"))) do
            v:Disable()
        end
    end)

end

local function disableSilent()
    _G.silent = false
end

local function disableAimbot()
    aimbotEnabled = false
    player.PlayerGui.PowerUI.Frame.Circle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
end



AimbotTab:CreateToggle("Silent Aim", function(enabled)
    if enabled then
        silentAim()
    else
        disableSilent()
    end
end)


AimbotTab:CreateToggle("Low Arc", function(enabled)
    if enabled then
        _G.lowarc = true
        _G.HighArc = false
        _G.Normal = false
    else
        _G.Normal = true
        _G.HighArc = false
        _G.lowarc = false

    end
end)

AimbotTab:CreateToggle("High Arc", function(enabled)
    if enabled then
        _G.HighArc = true
        _G.lowarc = false
        _G.Normal = false
    else
        _G.HighArc = false
        _G.lowarc = false
        _G.Normal = true
    end
end)

AimbotTab:CreateToggle("Inrange Indicator", function(enabled)
    if enabled then
        enableAimbot()
    else
        disableAimbot()
    end
end)
local lastClickTime = tick() -- Initialize the last click time
local cooldown = 10 -- Cooldown duration in seconds

AimbotTab:CreateButton("Select Hoop", function()
    local currentTime = tick() -- Get the current time
    if currentTime - lastClickTime >= cooldown then -- Check if enough time has passed since the last click
        lastClickTime = currentTime -- Update the last click time

        local hoops = Instance.new("Folder", workspace)
        hoops.Name = "Hoops"

        local notificationMessage = "Select a Net!"

        if workspace:FindFirstChild("Goal") then
           workspace.Goal.Name = "OldGoal"
        end

        local function showHint(parent, message)
            local hint = Instance.new("Hint", parent)
            hint.Text = message
            return hint
        end

        local function removeHint(hint)
            if hint and hint.Parent then
                hint:Destroy()
            end
        end

        local function waitForNetSelection()
            local netSelected = false
            local selectedHint

            for i, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Swish" and v:IsA("Sound") then
                    local parent = v.Parent
                    if parent then
                        parent.Size = Vector3.new(3.5, 3.5, 3.5)
                        local CD = parent:FindFirstChildOfClass("ClickDetector") or Instance.new("ClickDetector", parent)
                        CD.MaxActivationDistance = math.huge

                        CD.MouseClick:Connect(function(player)
                            parent.Parent = workspace
                            parent.Name = "Goal"
                            CD:Destroy()
                            if selectedHint then
                                removeHint(selectedHint)
                            end
                            selectedHint = showHint(hoops, "Net has been selected!")
                            netSelected = true 
                            wait(3)
                            removeHint(selectedHint)
                        end)
                    end
                end
            end

            while not netSelected do
                local hint = showHint(hoops, notificationMessage)
                wait(2)
                removeHint(hint)
                wait(1)
            end
        end

        waitForNetSelection()
    end
end)
