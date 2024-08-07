--[[ haiku :: an immediate, highly configurable, bloat free user interface. ]]

--[[

    == GOALS ==
    An interface which resembles ImGui, while still being completely different.
    A large set of beautifully designed components, while being configurable.
    Being easily embeddable.

    == STYLE ==
    Being able to fully describe your layout will improve readability and brevity.

    == EXAMPLE == 

    local haiku = require(...) or loadstring(...)
    local target = ...

    local function app()
        haiku:NewFrame()

        haiku:Begin("My Window", 100, 100, 300, 200)

        haiku:text("This is some userful text")
        haiku:checkbox("bool", haiku:create_value("bool1", false));
        haiku:checkbox("foo", haiku:create_value("bool2", true));

        haiku:sliderf("float", haiku:create_value("float", 0.0), 0.0, 1.0)
        haiku:color3("color", haiku:create_color3("color", 255)) -- 255 will set R, G , B to 255

        if haiku:button("button") then
            print("hello, world!")
        end

        haiku:End()
    end

    haiku:mount(app, target)

    == END OF EXAMPLE ==

    Now for functionality like this, with the if statement for the button, we need to use a loop.
    Obviously creating instances on every frame is incredibly bad, we need a solution, this is where a context
    comes in handy, we can check the state of the program, window stack and other states.

    == VARIABLES ==
    `Haiku` acts as a wrapper for the whole library.
]]

local types = require(script.types)
local elements = require(script.elements)
local state = require(script.state)

local Haiku = { }

function Haiku:CreateContext()
    if state.get("CURRENT_CTX") then
        warn("Haiku context has already been created.")
        return
    end

    state.set("CURRENT_CTX", {
        window_stack = {},
        current_window = nil,
        used_instances = {},
        run_render = false,
        id_stack = {},
        next_item_pos = Vector2.new(0, 0),
        values = {},
        current_view = nil,
        current_line_height = 0,
        cursor_pos = nil,
        line_height = nil,
        same_line = nil,
        last_item_width = 0,
    })

    elements.init(state.get("CURRENT_CTX"))
    elements:CreateView()
end

function Haiku:NewFrame()
    state.update("CURRENT_CTX", function(ctx)
        for _, window in ipairs(ctx.window_stack) do
            window.completed = false
        end

        ctx.next_item_pos = Vector2.new(0, 0)
        return ctx
    end)
end

function Haiku:Begin(title: string, x: number?, y: number?, width: number?, height: number?)
    return elements:Begin(title, x, y, width, height)
end

function Haiku:SameLine()
    return elements:SameLine()
end

function Haiku:Label(label: string)
    return elements:Label(label)
end

function Haiku:Button(label: string)
    return elements:Button(label)
end

function Haiku:CheckBox(label: string, default: boolean?)
    return elements:CheckBox(label, default)
end

function Haiku:End()
    elements:End()
end

function Haiku:Render(app)
    local function render()
        state.update("CURRENT_CTX", function(ctx)
            ctx.run_render = true
            return ctx
        end)

        app()

        state.update("CURRENT_CTX", function(ctx)
            ctx.run_render = true
            return ctx
        end)

        elements:EndFrame()
    end
    
    game:GetService("RunService").RenderStepped:Connect(render)
end

return Haiku
