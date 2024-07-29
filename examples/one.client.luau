local RepStorage = game:GetService("ReplicatedStorage")

local Haiku = require(RepStorage.Haiku)

local Context = Haiku:CreateContext()
Haiku:SetContext(Context)

local function render() 
    Haiku:BeginFrame()

    do 
        Haiku:BeginWindow("My Window", 100, 100, 300, 200)

        if Haiku:Button("Click me!") then 
            print("Button was clicked!")
        end

        Haiku:EndWindow()
    end

    Haiku:EndFrame()
end

while task.wait(0.1) do render() end

