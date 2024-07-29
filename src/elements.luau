--[[ haiku :: elements ]]
local types = require(script.Parent.types)

local Elements = {}
local Haiku = nil

local globalInstances = {}
local buttonStates = {}
local activeInstances = {}

local COLORS = {
    BACKGROUND = Color3.fromRGB(30, 30, 30),
    TITLE_BAR = Color3.fromRGB(45, 45, 45),
    TEXT = Color3.fromRGB(220, 220, 220),
    BUTTON = Color3.fromRGB(60, 60, 60),
    BUTTON_HOVER = Color3.fromRGB(80, 80, 80),
    BUTTON_TEXT = Color3.fromRGB(220, 220, 220),
    ACCENT = Color3.fromRGB(100, 149, 237),
}

local function getOrCreateInstance(key: string, instanceType: string, parent: Instance): Instance
    if not globalInstances[key] then
        globalInstances[key] = Instance.new(instanceType)
        globalInstances[key].Name = key
    end
    
    if globalInstances[key].Parent ~= parent then
        globalInstances[key].Parent = parent
    end
    
    activeInstances[key] = true
    return globalInstances[key]
end

local previousProps = {}

local function updateInstanceProps(instance: Instance, props: {[string]: any})
    local key = tostring(instance)
    if not previousProps[key] then
        previousProps[key] = {}
    end

    local shouldUpdate = false
    for prop, value in pairs(props) do
        if previousProps[key][prop] ~= value then
            previousProps[key][prop] = value
            shouldUpdate = true
        end
    end

    if shouldUpdate then
        for prop, value in pairs(props) do
            if instance[prop] ~= value then
                instance[prop] = value
            end
        end
    end
end

function Elements:BeginFrame()
    activeInstances = {}
end

function Elements:BeginWindow(title: string, x: number, y: number, width: number, height: number)
    local ctx = Haiku:GetContext()
    local window: types.Window = {
        title = title,
        x = x,
        y = y,
        width = width,
        height = height,
        children = {},
        instances = {},
    }
    table.insert(ctx.windowStack, window)
    ctx.currentWindow = window
    
    local windowKey = "WINDOW_" .. title:sub(1, 1)
    local frameInst = getOrCreateInstance(windowKey .. "_FRAME", "Frame", game.Players.LocalPlayer.PlayerGui.Freecam)
    updateInstanceProps(frameInst, {
        Position = UDim2.new(0, x, 0, y),
        Size = UDim2.new(0, width, 0, height),
        BackgroundColor3 = COLORS.BACKGROUND,
        BorderSizePixel = 0
    })

    local cornerInst = getOrCreateInstance(windowKey .. "_CORNER", "UICorner", frameInst)
    updateInstanceProps(cornerInst, {
        CornerRadius = UDim.new(0, 6)
    })
    
    local titleInst = getOrCreateInstance(windowKey .. "_TITLE", "TextLabel", frameInst)
    updateInstanceProps(titleInst, {
        Text = title,
        Size = UDim2.new(1, -20, 0, 30),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        BackgroundTransparency = 1,
        TextColor3 = COLORS.TEXT,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextSize = 18
    })

    local contentInst = getOrCreateInstance(windowKey .. "_CONTENT", "Frame", frameInst)
    updateInstanceProps(contentInst, {
        Size = UDim2.new(1, 0, 1, -30),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundTransparency = 1
    })

    window.instances["FRAME"] = frameInst
    window.instances["TITLE"] = titleInst
    window.instances["CONTENT"] = contentInst
end

function Elements:EndWindow()
    local ctx = Haiku:GetContext()
    table.remove(ctx.windowStack)
    ctx.currentWindow = ctx.windowStack[#ctx.windowStack]
end

function Elements:Button(label: string): boolean
    local ctx = Haiku:GetContext()
    local window = ctx.currentWindow
    assert(window, "ctx.currentWindow is nil! Have you called BeginWindow?")
    
    local buttonKey = "BUTTON_" .. window.title .. "_" .. label
    local buttonInst = getOrCreateInstance(buttonKey, "TextButton", window.instances["CONTENT"])
    updateInstanceProps(buttonInst, {
        Text = label,
        Size = UDim2.new(0, 100, 0, 30),
        Position = UDim2.new(0, 10, 0, 10 + (#window.children * 40)),
        BackgroundColor3 = COLORS.BUTTON,
        TextColor3 = COLORS.BUTTON_TEXT,
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
        TextSize = 14,
        AutoButtonColor = false
    })

    local buttonCornerInst = getOrCreateInstance(buttonKey .. "_CORNER", "UICorner", buttonInst)
    updateInstanceProps(buttonCornerInst, {
        CornerRadius = UDim.new(0, 4)
    })

    if not buttonStates[buttonKey] then
        buttonStates[buttonKey] = {
            wasClicked = false,
            connection = buttonInst.MouseButton1Click:Connect(function()
                buttonStates[buttonKey].wasClicked = true
            end)
        }

        buttonInst.MouseEnter:Connect(function()
            buttonInst.BackgroundColor3 = COLORS.BUTTON_HOVER
        end)

        buttonInst.MouseLeave:Connect(function()
            buttonInst.BackgroundColor3 = COLORS.BUTTON
        end)
    end
    
    local wasClicked = buttonStates[buttonKey].wasClicked
    buttonStates[buttonKey].wasClicked = false
    
    table.insert(window.children, {type = "button", label = label})
    
    return wasClicked
end

function Elements:EndFrame()
    for key, instance in pairs(globalInstances) do
        if not activeInstances[key] then
            if buttonStates[key] and buttonStates[key].connection then
                buttonStates[key].connection:Disconnect()
            end
            instance:Destroy()
            globalInstances[key] = nil
            buttonStates[key] = nil
        end
    end
end

function Elements.init(haiku)
    Haiku = haiku
end

return Elements
