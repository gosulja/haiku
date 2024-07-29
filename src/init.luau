--[[ haiku :: An immediate, declarative UI library. ]]

local types = require(script.types)
local Elements = require(script.elements)

local Haiku = {}

function Haiku:CreateContext(): types.Context
    return {
        windowStack = {},
        currentWindow = nil,
        usedInstances = {},
    }
end

local currentContext: types.Context = nil

function Haiku:SetContext(ctx: types.Context)
    assert(ctx, "Context passed in :SetContext is nil!")
    currentContext = ctx
end

function Haiku:GetContext(): types.Context
    assert(currentContext, "No context set. Please call :SetContext first.")
    return currentContext
end

function Haiku:BeginFrame()
    self:GetContext().windowStack = {}
    Elements:BeginFrame()
end

function Haiku:EndFrame()
    Elements:EndFrame()
end 

-- wrapper
function Haiku:BeginWindow(title: string, x: number, y: number, width: number, height: number)
    Elements:BeginWindow(title, x, y, width, height)
end

function Haiku:EndWindow()
    Elements:EndWindow()
end

function Haiku:Button(label: string): boolean
    return Elements:Button(label)
end

Elements.init(Haiku)

return Haiku
