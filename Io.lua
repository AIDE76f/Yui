-- Grow a Crypto Farm
-- Auto Collect GUI

local delayTime = 1
local running = false

local CoreGui = game:GetService("CoreGui")

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = CoreGui
gui.Name = "CryptoCollector"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,200,0,110)
frame.Position = UDim2.new(0.4,0,0.4,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "Crypto Farm"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8,0,0,40)
button.Position = UDim2.new(0.1,0,0.4,0)
button.BackgroundColor3 = Color3.fromRGB(50,50,50)
button.TextColor3 = Color3.new(1,1,1)
button.TextScaled = true
button.Text = "Start Auto Collect"
button.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,0.8,0)
status.BackgroundTransparency = 1
status.Text = "Status: OFF"
status.TextColor3 = Color3.new(1,1,1)
status.TextScaled = true
status.Parent = frame


-- وظيفة الجمع
local function collect()

    for _,v in pairs(workspace:GetDescendants()) do
        
        if v:IsA("ProximityPrompt") then
            
            if string.find(string.lower(v.Parent.Name),"computer") then
                
                pcall(function()
                    fireproximityprompt(v)
                end)
                
            end
            
        end
        
    end

end


-- الحلقة
task.spawn(function()

    while true do
        task.wait(delayTime)

        if running then
            collect()
        end

    end

end)


-- زر التشغيل
button.MouseButton1Click:Connect(function()

    running = not running

    if running then
        button.Text = "Stop Auto Collect"
        status.Text = "Status: ON"
    else
        button.Text = "Start Auto Collect"
        status.Text = "Status: OFF"
    end

end)
