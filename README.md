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

Some parts of the interface are reactive to the default style, which is what you're seeing here, everything updates in real time.

# Features

I apologize for the misunderstanding. Here's a markdown list of checkboxes representing various UI components and widgets that ImGui currently offers, all unchecked:

- [x] Button
- [ ] Checkbox
- [ ] Radio Button
- [ ] Slider
- [ ] Input Text
- [ ] Combo Box
- [ ] Listbox
- [ ] Tree Node
- [ ] Collapsing Header
- [ ] Progress Bar
- [ ] Image
- [ ] Color Edit/Picker
- [ ] Tab Bar and Tabs
- [ ] Menu
- [ ] Popup
- [ ] Selectable
- [x] Text/Label (with various formatting options)
- [ ] Tooltip
- [x] Window
- [ ] Child Window
- [ ] Group
- [ ] Separator
- [ ] Drag and Drop Source/Target
- [ ] Table
- [ ] Columns
- [ ] Plot (various types like line, histogram, etc.)

- [x] Immediate mode GUI
- [ ] Cross-platform compatibility
- [x] Lightweight and fast
- [x] Easy integration with existing projects
- [x] Customizable styling
- [x] Windowing system
- [ ] Widgets (buttons, sliders, input fields, etc.)
- [ ] Docking support
- [ ] Multi-viewport support
- [ ] Drag and drop functionality
- [ ] Plotting capabilities
- [ ] Text editing and input
- [ ] Color editing
- [ ] Tree nodes and hierarchies
- [ ] Tables
- [ ] Tooltips
- [ ] Menus and context menus
- [ ] Keyboard navigation
- [ ] Font support (including TTF loading)
- [ ] Unicode support

Rounding, old.                                                                           |  No rounding, new.
:---------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------:
![image](https://github.com/user-attachments/assets/5d340c40-5d46-4666-a45b-5933a9f7339a)| ![image](https://github.com/user-attachments/assets/11a4cfe7-e259-4a82-bde2-c8ff753d7d4c)
