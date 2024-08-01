--[[ haiku :: stateful object ]]

--[[

    == EXPLANATION ==

    We need to store a unique state for a key.
    For example:

    local State = require(...)

    local CURRENT_CTX = State.get("CURRENT_CTX") or {
        ...
    }

    State.set("CURRENT_CTX", CURRENT_CTX)

    CURRENT_CTX.current_window = window
    State.update("CURRENT_CTX", function(ctx) 
        ctx.current_window = window
        return ctx
    end)

    == DO NOT OVER COMPLICATE THIS ==

]]

local State = {}
local internalState = {}

function State.get(key)
    return internalState[key]
end

function State.set(key, value) 
    internalState[key] = value
end

function State.update(key, func) 
    internalState[key] = func(internalState[key])
end

return State