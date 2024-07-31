# Dear Haiku

![Group 2](https://github.com/user-attachments/assets/be696693-05e9-439c-ae43-d834a37af422)

## Why

I decided to start this project as a way to change UI libraries in Roblox. Almost every UI library consists of `Callbacks`. Now there isn't anything wrong with this, but it's repetitive, and you can't be *dynamic* with it.
With Haiku, you can describe your layout of your interface as you write, being more descriptive, and ditching the use of `callbacks`.

That's Haikus aim, to add a fully featured UI library 1:1 with ImGui, while still being sleak and lightweight as it was designed to be.

## Example

```lua
local Haiku = require(...) or loadstring(...)

Haiku:CreateContext()

local function App()
    Haiku:NewFrame()

    Haiku:Begin("My window") -- title, x, y, width, height

    if Haiku:Button("Click me!") then
        print("You clicked me")
    end

    if Haiku:Button("Click me please :3") then
        print(":3")
    end

    Haiku:End()
end

Haiku:Render(App)
```

Looks very similar to ImGui right? That's what Haiku is.
