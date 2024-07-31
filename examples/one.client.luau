local Haiku = require(game:GetService("ReplicatedStorage").Haiku)

Haiku:CreateContext()

local function app()
    Haiku:NewFrame()
    
    Haiku:Begin("My window", 90, 100)

    if Haiku:Button("Click me!") then
        print("hello!")
    end

    if Haiku:Button("Click me please!") then
        print("hello button!")
    end

    Haiku:End()
end

Haiku:Render(app)