local Haiku = require(game:GetService("ReplicatedStorage").Haiku)

Haiku:CreateContext()

local function App()
    Haiku:NewFrame()

    Haiku:Begin("Hello, world!") -- title, x, y, width, height

    do
        Haiku:Label("hewo :3")

        if Haiku:Button("Click me!") then
            print("You clicked me")
        end

        if Haiku:Button("Click me please :3") then
            print(":3")
        end
    end

    Haiku:End()
end

Haiku:Render(App)


