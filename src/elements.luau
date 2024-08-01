--[[ haiku :: elements ]]
local types = require(script.Parent.types)
local state = require(script.Parent.state)
local uis   = game:GetService("UserInputService")
local font  = require(script.Parent.font)

local Elements = {}

--[[ DEFAULTS ]]

local Defaults = {
    Style = {
        Sizes = {
            Main = {
                WindowPadding = Vector2.new(8, 8),
                FramePadding = Vector2.new(4, 3),
                ItemSpacing = Vector2.new(8, 4),
                ItemInnerSpacing = Vector2.new(4, 4),
                TouchExtraPadding = Vector2.new(0, 0),
                IndentSpacing = 21,
                ScrollbarSize = 14,
                GrabMinSize = 12,
                TextSize = 14,
            },

            Borders = {
                WindowBorderSize = 1,
                ChildBorderSize = 1,
                PopupBorderSize = 1,
                FrameBorderSize = 0,
                TabBorderSize = 0,
                TabBarBorderSize = 1,
                TabBarOverlineSize = 2,
            },

            Rounding = {
                WindowRounding = 0,
                ChildRounding = 0,
                FrameRounding = 0,
                PopupRounding = 0,
                ScrollbarRounding = 9,
                GrabRounding = 0,
                TabRounding = 4,
            },

            Tables = {
                CellPadding = Vector2.new(4, 2),
            },

            Widgets = {
                WindowMenuButtonPosition = "Left",
                ColorButtonPosition = "Right",
                ButtonTextAlign = "Center",
                SelectableTextAlign = "Center",
                SeperatorTextBorderSize = 3,
                SeperateTextAlign = "Left",
                SeperateTextPadding = Vector2.new(20, 3),
                LogSliderDeadzone = 4,
            },

            Misc = {
                DisplayWindowPadding = Vector2.new(19, 19),
                DisplaySafeAreaPadding = Vector2.new(3, 3),
            }
        },
        Colors = {
            Text = Color3.fromRGB(255, 255, 255),
            TextDisabled = Color3.fromRGB(128, 128, 128),
            
            WindowBg = Color3.fromRGB(15, 15, 15),
            WindowTrans = 0.06,
            
            ChildBg = Color3.new(0, 0, 0),
            ChildTrans = 1,
            
            PopupBg = Color3.fromRGB(20, 20, 20),
            PopupTrans = 0.06,
            
            Border = Color3.fromRGB(110, 110, 128),
            BorderTrans = 0.502,
            
            FrameBg = Color3.fromRGB(41, 74, 122),
            FrameBgHovered = Color3.fromRGB(66, 150, 250),
            FrameBgActive = Color3.fromRGB(66, 149, 250),
            FrameTrans = 0.542,
            
            TitleBg = Color3.fromRGB(10, 10, 10),
            TitleBgTrans = 0,
            TitleBgActive = Color3.fromRGB(41, 74, 122),
            TitleBgActiveTrans = 0,
            TitleBgCollapsed = Color3.fromRGB(0, 0, 0),
            TitleBgCollapsedTrans = 0.509,
            
            MenuBarBg = Color3.fromRGB(36, 36, 36),
            
            ScrollbarBg = Color3.fromRGB(5, 5, 5),
            ScrollbarGrab = Color3.fromRGB(79, 79, 79),
            ScrollbarGrabHovered = Color3.fromRGB(105, 105, 105),
            ScrollbarGrabActive = Color3.fromRGB(130, 130, 130),
            
            CheckMark = Color3.fromRGB(66, 150, 250),
            
            SliderGrab = Color3.fromRGB(61, 133, 224),
            SliderGrabActibe = Color3.fromRGB(66, 150, 250),
            
            Button = Color3.fromRGB(66, 150, 250),
            ButtonTrans = 0.4,
            ButtonHovered = Color3.fromRGB(66, 150, 250),
            ButtonHoveredTrans = 0,
            ButtonActive = Color3.fromRGB(15, 135, 250),
            ButtonActiveTrans = 0,
            
            Header = Color3.fromRGB(66, 150, 250),
            HeaderTrans = 0.7,
            HeaderHovered = Color3.fromRGB(66, 150, 250),
            HeaderHoveredTrans = 0.2,
            HeaderActive = Color3.fromRGB(66, 150, 250),
            HeaderActiveTrans = 0,
            
            Seperator = Color3.fromRGB(110, 110, 128),
            SeperatorTrans = 0.502,
            SeperatorHovered = Color3.fromRGB(26, 102, 191),
            SeperatorHoveredTrans = 0.22,
            SeperatorActive = Color3.fromRGB(26, 102, 191),
            SeperatorActiveTrans = 0,

            ResizeGrip = Color3.fromRGB(66, 150, 260),
            ResizeGripTrans = 0.67,
            ResizeGripHovered = Color3.fromRGB(66, 150, 250),
            ResizeGripHoveredTrans = 0.2,
            
            TabHovered = Color3.fromRGB(66, 150, 250),
            TabHoveredTrans = 0.2,
            Tab = Color3.fromRGB(46, 89, 148),
            TabTrans = 0.14,
            TabSelected = Color3.fromRGB(51, 105, 173),
            TabSelectedTrans = 0,
            TabSelectedOverline = Color3.fromRGB(66, 150, 250),
            TabSelectedOverlineTrans = 0,
            TabDimmed = Color3.fromRGB(17, 26, 38),
            TabDimmedTrans = 0.03,
            TabDimmedSelected = Color3.fromRGB(36, 67, 108),
            TabDimmedSelectedTrans = 0,
            TabDimmedSelectedOverline = Color3.fromRGB(128, 128, 128),
            TabDimmedSelectedOverlineTrans = 0,

            PlotLines = Color3.fromRGB(156, 156, 156),
            PlotLinesTrans = 0,
            PlotLinesHovered = Color3.fromRGB(255, 110, 89),
            PlotLinesHoveredTrans = 0,
            PlotHistogram = Color3.fromRGB(230, 179, 0),
            PlotHistogramTrans = 0,
            PlotHistogramHovered = Color3.fromRGB(255, 153, 0),
            PlotHistogramHoveredTrans = 0,

            TableHeaderBg = Color3.fromRGB(48, 48, 51),
            TableHeaderBgTrans = 0,
            TableBorderStrong = Color3.fromRGB(79, 79, 89),
            TableBorderStrongTrans = 0,
            TableBorderLight = Color3.fromRGB(59, 59, 64),
            TableBorderLightTrans = 0,
            TableRowBg = Color3.fromRGB(0, 0, 0),
            TableRowBgTrans = 1,
            TableRowBgAlt = Color3.fromRGB(255, 255, 255),
            TableRowBgAltTrans = 0.05,
        },
        Fonts = {
            Roboto = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular),
        },
        Assets = {
            WindowCollapse = "rbxassetid://18742941524",
            ResizeGrip = "rbxassetid://18744089506",
            CheckMark = "rbxassetid://18752040115",
        }
    },
}

local CURRENT_CTX: types.Context = state.get("CURRENT_CTX") or nil
local global_instances = {}
local active_instances = {}
local component_states = {}
local window_states    = {}
local previous_props   = {}
local cfont_loaded     = false

state.set("CURRENT_CTX", CURRENT_CTX)

local function get_or_create_instance(key: string, class_name: string, parent: Instance, pre_existing_instance: Instance?): Instance -- cool
    if not global_instances[key] then
        if pre_existing_instance then
            global_instances[key] = pre_existing_instance
            global_instances[key].Name = key
        else
            local new_instance = Instance.new(class_name)
            new_instance.Name = key
            global_instances[key] = new_instance
        end
    end

    if global_instances[key].Parent ~= parent then
        global_instances[key].Parent = parent
    end

    active_instances[key] = true

    return global_instances[key]
end


local function update_instance_props(instance: Instance, props: {[string]: any})
    local key = tostring(instance)
    if not previous_props[key] then
        previous_props[key] = {}
    end

    local should_update = false
    for prop, value in next, props do 
        if previous_props[key][prop] ~= value then
            previous_props[key][prop] = value
            should_update = true
        end
    end

    if should_update then
        for prop, value in next, props do 
            if typeof(instance[prop]) == "RBXScriptSignal" then
                if typeof(value) == "function" then
                    if previous_props[key][prop .. "_connection"] then
                        previous_props[key][prop .. "_connection"]:Disconnect()
                    end

                    previous_props[key][prop .. "_connection"] = (instance[prop] :: RBXScriptSignal):Connect(function(...) 
                        value(instance, ...) 
                    end)
                end
            elseif instance[prop] ~= value then
                instance[prop] = value
            end
        end
    end
end

local function updateWindowCollapsedState(window: types.Window)
    local iFrame = window.instances["FRAME"]
    local iContent = window.instances["CONTENT"]
    local iWinCollapsIcon = window.instances["COLLAPSE_ICON"]

    local currentPosition = iFrame.Position

    if window.isCollapsed then
        iFrame.Size = UDim2.new(iFrame.Size.X.Scale, iFrame.Size.X.Offset, 0, 20)
        iContent.Visible = false
        iWinCollapsIcon.Rotation = -90
    else
        iFrame.Size = UDim2.new(iFrame.Size.X.Scale, iFrame.Size.X.Offset, 0, window.size.Y)
        iContent.Visible = true
        iWinCollapsIcon.Rotation = 0
    end

    iFrame.Position = currentPosition
end

function Elements:CreateView()
    if not CURRENT_CTX.current_view then
        CURRENT_CTX.current_view = get_or_create_instance("View", "ScreenGui", game:GetService("Players").LocalPlayer.PlayerGui)
        update_instance_props(CURRENT_CTX.current_view :: any, {
            Enabled = true,
            ResetOnSpawn = false,
            IgnoreGuiInset = true,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        })
    end
end

function Elements:Begin(title: string, x: number?, y: number?, width: number?, height: number?)
    if window_states[title] == nil then
        window_states[title] = { 
            isCollapsed = false,
            position = if (x and y) then Vector2.new(x, y) else Vector2.new(0, 30)
        }
    end

    if not cfont_loaded then
        cfont_loaded = true
        font:Push("ProggyClean16")
    end
    
    local window: types.Window = {
        title = title,
        position = window_states[title].position,
        size = if (width and height) then Vector2.new(width, height) else Vector2.new(300, 200),
        children = {},
        instances = {},
        padding = Defaults.Style.Sizes.Main.WindowPadding,
        isOpen = true,
        isDragging = false,
        isCollapsed = false,
        completed = false,
        zIndex = #CURRENT_CTX.window_stack + 1,
        noTitlebar = false,
        noScrollbar = false,
        noMenu = false,
        noMove = false,
        noResize = false,
        noCollapse = false,
        noClose = false,
        noNav = false,
        noBackground = false,
        noBringToFront = false,
    }

    window.isCollapsed = window_states[title].isCollapsed

    table.insert(CURRENT_CTX.window_stack, window)
    state.update("CURRENT_CTX", function(ctx)
        ctx.current_window = window
        return ctx
    end)

    local iFrame = get_or_create_instance("WINDOW_", "CanvasGroup", CURRENT_CTX.current_view)
    update_instance_props(iFrame, {
        Position = UDim2.fromOffset(window.position.X, window.position.Y),
        Size = if window.isCollapsed then UDim2.fromOffset(window.size.X, 20) else UDim2.fromOffset(window.size.X, window.size.Y),
        BackgroundColor3 = Defaults.Style.Colors.WindowBg,
        BackgroundTransparency = if window_states[title].isCollapsed then 1 else Defaults.Style.Colors.WindowTrans,
    })

    local iStroke = get_or_create_instance("WINDOW_" .. window.title .. "_STROKE", "UIStroke", iFrame)
    update_instance_props(iStroke, {
        Color = Defaults.Style.Colors.Border,
        Transparency = Defaults.Style.Colors.BorderTrans,
        Thickness = Defaults.Style.Sizes.Borders.WindowBorderSize,
    })

    local iCorner = get_or_create_instance("WINDOW_" .. window.title .. "_CORNER", "UICorner", iFrame)
    update_instance_props(iCorner, {
        CornerRadius = UDim.new(0, Defaults.Style.Sizes.Rounding.WindowRounding)
    })

    local drag_start, start_pos = nil, nil
    local iTitleBar = get_or_create_instance("WINDOW_" .. window.title .. "_TITLEBAR", "Frame", iFrame)
    update_instance_props(iTitleBar, {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.fromOffset(0, 0),

        BackgroundColor3 = if window_states[title].isCollapsed then Defaults.Style.Colors.TitleBgCollapsed else Defaults.Style.Colors.TitleBgActive,

        BackgroundTransparency = if window_states[title].isCollapsed then Defaults.Style.Colors.TitleBgCollapsedTrans else Defaults.Style.Colors.TitleBgActiveTrans,

        InputBegan = function(rbx, i: InputObject)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                drag_start = i.Position
                start_pos = iFrame.Position

                local drag_connection
                drag_connection = uis.InputChanged:Connect(function(io: InputObject)
                    if io.UserInputType == Enum.UserInputType.MouseMovement or io.UserInputType == Enum.UserInputType.Touch then
                        local delta = io.Position - drag_start
                        iFrame.Position = UDim2.new(
                            start_pos.X.Scale,
                            start_pos.X.Offset + delta.X,
                            start_pos.Y.Scale,
                            start_pos.Y.Offset + delta.Y
                        )

                        window_states[title].position = Vector2.new(iFrame.Position.X.Offset, iFrame.Position.Y.Offset)
                    end
                end)

                uis.InputEnded:Connect(function(io: InputObject) 
                    if io.UserInputType == Enum.UserInputType.MouseButton1 or io.UserInputType == Enum.UserInputType.Touch then
                        drag_connection:Disconnect()
                    end
                end)
            end
        end
    })

    local iTitle = get_or_create_instance("WINDOW_" .. window.title .. "_TITLE", nil, iTitleBar, font:Draw(window.title))
    update_instance_props(iTitle, {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0, 0.5)
    })

    local iWinKey = "WINDOW_" .. window.title .. "_COLLAPSE"
    local iWinCollapse = get_or_create_instance(iWinKey, "Frame", iTitleBar)
    if not component_states[iWinKey] then
        component_states[iWinKey] = { hovered = false }
    end

    update_instance_props(iWinCollapse, {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, Defaults.Style.Sizes.Main.FramePadding.X, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        BackgroundColor3 = Defaults.Style.Colors.ButtonHovered,
        BackgroundTransparency = if component_states[iWinKey].hovered then 0 else 1,
        BorderSizePixel = 0,

        MouseEnter = function()
            component_states[iWinKey].hovered = true
        end,

        MouseLeave = function()
            component_states[iWinKey].hovered = false
        end,

        InputBegan = function(_, input: InputObject)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                window_states[title].isCollapsed = not window_states[title].isCollapsed
                window.isCollapsed = window_states[title].isCollapsed
                updateWindowCollapsedState(window)
            end
        end
    })

    iWinCollapse.MouseEnter:Connect(function() 
        iWinCollapse.BackgroundTransparency = 0
    end)

    iWinCollapse.MouseLeave:Connect(function() 
        iWinCollapse.BackgroundTransparency = 1
    end)

    local iWinCollapsIcon = get_or_create_instance("WINDOW_" .. window.title .. "_COLLAPSE_ICON", "ImageLabel", iWinCollapse)
    update_instance_props(iWinCollapsIcon, {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = Defaults.Style.Assets.WindowCollapse
    })

    window.instances["COLLAPSE_ICON"] = iWinCollapsIcon

    local iTitlePadding = get_or_create_instance("WINDOW_TITLEPADDING", "UIPadding", iTitle)
    update_instance_props(iTitlePadding, {
        PaddingLeft = UDim.new(0, Defaults.Style.Sizes.Main.FramePadding.X + 22)
    })

    local iContent = get_or_create_instance("WINDOW_" .. title .. "_CONTENT", "Frame", iFrame)
    update_instance_props(iContent, {
        Size = UDim2.new(1, 0, 1, -20),
        Position = UDim2.new(0, 0, 0, 20),
        BackgroundTransparency = 1
    })

    local iContentPadding = get_or_create_instance("WINDOW_CONTENTPADDING", "UIPadding", iContent)
    update_instance_props(iContentPadding, {
        PaddingLeft = UDim.new(0, Defaults.Style.Sizes.Main.WindowPadding.X),
        PaddingRight = UDim.new(0, Defaults.Style.Sizes.Main.WindowPadding.X),
        PaddingTop = UDim.new(0, Defaults.Style.Sizes.Main.WindowPadding.Y),
        PaddingBottom = UDim.new(0, Defaults.Style.Sizes.Main.WindowPadding.Y),
    })

    local iSep = get_or_create_instance("WINDOW_" .. title .. "_SEP", "Frame", iFrame)
    update_instance_props(iSep, {
        Size = UDim2.new(1, 0, 0, Defaults.Style.Sizes.Borders.FrameBorderSize),
        Position = UDim2.fromOffset(0, 20),
        BackgroundColor3 = Defaults.Style.Colors.Border,
        BackgroundTransparency = Defaults.Style.Colors.BorderTrans,
        BorderSizePixel = 0,
    })

    local iResizeGrip = get_or_create_instance("WINDOW_" .. title .. "_GRABRESIZE", "ImageButton", iFrame)
    update_instance_props(iResizeGrip, {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.fromScale(1, 1),
        Size = UDim2.fromOffset(14, 14),
        BackgroundTransparency = 1,
        ImageColor3 = Defaults.Style.Colors.ResizeGrip,
        ImageTransparency = Defaults.Style.Colors.ResizeGripTrans,
        Rotation = 180,
        Image = Defaults.Style.Assets.ResizeGrip,

        Visible = not window_states[title].isCollapsed,

        MouseEnter = function(rbx)
            rbx.ImageColor3 = Defaults.Style.Colors.ResizeGripHovered
            rbx.ImageTransparency = Defaults.Style.Colors.ResizeGripHoveredTrans
        end,

        MouseLeave = function(rbx)
            rbx.ImageColor3 = Defaults.Style.Colors.ResizeGrip
            rbx.ImageTransparency = Defaults.Style.Colors.ResizeGripTrans
        end
    })

    assert(CURRENT_CTX.current_window, "Window was not created properly")

    window.instances["FRAME"] = iFrame
    window.instances["TITLE"] = iTitle
    window.instances["CONTENT"] = iContent


    return window.isCollapsed
end

function Elements:FinalizeWindow(window: types.Window)
    local contentHeight = #window.children * (Defaults.Style.Sizes.Main.ItemSpacing.Y + Defaults.Style.Sizes.Main.FramePadding.Y * 2)
    local minHeight = 20 + contentHeight + Defaults.Style.Sizes.Main.WindowPadding.Y * 2

    if not window.isCollapsed and window.size.Y < minHeight then
        window.size = Vector2.new(window.size.X, minHeight)
        local iFrame = window.instances["FRAME"]
        update_instance_props(iFrame, {
            Size = UDim2.fromOffset(window.size.X, window.size.Y)
        })
    end
end

function Elements:SameLine()
    CURRENT_CTX.same_line = true
    CURRENT_CTX.cursor_pos = Vector2.new(
        CURRENT_CTX.cursor_pos.X + CURRENT_CTX.last_item_width + Defaults.Style.Sizes.Main.ItemSpacing.X,
        CURRENT_CTX.cursor_pos.Y
    )
end

function Elements:Label(label: string)
    local window = CURRENT_CTX.current_window
    assert(window, "Haiku::ERROR:: No active window")

    local key = "LABEL_" .. window.title .. "_" .. label

    get_or_create_instance(key, nil, window.instances["CONTENT"], font:Draw(label))

    table.insert(window.children, { type = "label", label = label })

    return label
end

function Elements:Button(label: string)
    local window = CURRENT_CTX.current_window
    assert(window, "Haiku::ERROR:: No active window")

    if window.isCollapsed then
        return false
    end

    local key = "BUTTON_" .. window.title .. "_" .. label
    local iButton = get_or_create_instance(key, "Frame", window.instances["CONTENT"])

    local params = Instance.new("GetTextBoundsParams")
    params.Text = label
    params.Size = Defaults.Style.Sizes.Main.TextSize
    params.Font = Defaults.Style.Fonts.Roboto
    params.Width = (CURRENT_CTX.current_window :: types.Window).size.X
    local textBounds = game:GetService("TextService"):GetTextBoundsAsync(params)

    local buttonWidth = textBounds.X + (Defaults.Style.Sizes.Main.FramePadding.X * 2)
    local buttonHeight = Defaults.Style.Sizes.Main.FramePadding.Y * 2 + Defaults.Style.Sizes.Main.TextSize

    update_instance_props(iButton, {
        Position = UDim2.fromOffset(0, (#window.children * (buttonHeight + Defaults.Style.Sizes.Main.ItemSpacing.Y))),
        Size = UDim2.fromOffset(buttonWidth, buttonHeight),
        BackgroundColor3 = Defaults.Style.Colors.Button,
        BackgroundTransparency = Defaults.Style.Colors.ButtonTrans,
        BorderSizePixel = 0,
    })

    local iText = get_or_create_instance(key .. "_ACTIVATOR", nil, iButton, font:Draw(label))
    update_instance_props(iText, {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    })

    local iStroke = get_or_create_instance(key .. "_STROKE", "UIStroke", iButton)
    update_instance_props(iStroke, {
        Color = Defaults.Style.Colors.Border,
        Transparency = Defaults.Style.Colors.BorderTrans,
        Thickness = Defaults.Style.Sizes.Borders.FrameBorderSize,
    })

    local iCorner = get_or_create_instance(key .. "_CORNER", "UICorner", iButton)
    update_instance_props(iCorner, {
        CornerRadius = UDim.new(0, Defaults.Style.Sizes.Rounding.FrameRounding),
    })

    if not component_states[key] then
        component_states[key] = {
            was_clicked = false,
            connection = iButton.InputBegan:Connect(function(i: InputObject)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    component_states[key].was_clicked = true
                    iButton.BackgroundColor3 = Defaults.Style.Colors.ButtonActive
                    iButton.BackgroundTransparency = Defaults.Style.Colors.ButtonActiveTrans

                    component_states[key].end_connection = iButton.InputEnded:Connect(function(io: InputObject)
                        if io.UserInputType == Enum.UserInputType.MouseButton1 then
                            component_states[key].was_clicked = false
                            iButton.BackgroundColor3 = Defaults.Style.Colors.ButtonHovered
                            iButton.BackgroundTransparency = Defaults.Style.Colors.ButtonHoveredTrans -- you

                            component_states[key].end_connection:Disconnect()
                        end
                    end)
                end
            end)
        }

        iButton.MouseEnter:Connect(function()
            iButton.BackgroundColor3 = Defaults.Style.Colors.ButtonHovered
            iButton.BackgroundTransparency = Defaults.Style.Colors.ButtonHoveredTrans
        end)
        
        iButton.MouseLeave:Connect(function()
            iButton.BackgroundColor3 = Defaults.Style.Colors.Button
            iButton.BackgroundTransparency = Defaults.Style.Colors.ButtonTrans
        end)
    end
    
    local was_clicked = component_states[key].was_clicked
    component_states[key].was_clicked = false
    
    table.insert(window.children, {type = "button", label = label})
    
    return was_clicked
end

function Elements:CheckBox(label: string, default: boolean?)
    local window = CURRENT_CTX.current_window
    assert(window, "Haiku::ERROR:: No active window")

    if window.isCollapsed then
        return false
    end

    local key = "CHECKMARK_" .. window.title .. "_" .. label
    local iCheckMark = get_or_create_instance(key, "Frame", window.instances["CONTENT"])
    if not component_states[key] then
        component_states[key] = {
            checked = default or false
        }
    end

    local checkMarkSize = Defaults.Style.Sizes.Main.TextSize
    local containerWidth = checkMarkSize + Defaults.Style.Sizes.Main.FramePadding.X * 2 + Defaults.Style.Sizes.Main.ItemInnerSpacing.X
    local containerHeight = checkMarkSize + Defaults.Style.Sizes.Main.FramePadding.Y * 2

    update_instance_props(iCheckMark, {
        Position = UDim2.fromOffset(0, (#window.children * (containerHeight + Defaults.Style.Sizes.Main.ItemSpacing.Y))),
        Size = UDim2.fromOffset(containerWidth, containerHeight),
        BackgroundTransparency = 1,
    })

    local iCheckBox = get_or_create_instance(key .. "_BOX", "Frame", iCheckMark)
    update_instance_props(iCheckBox, {
        Size = UDim2.fromOffset(checkMarkSize, checkMarkSize),
        Position = UDim2.fromOffset(Defaults.Style.Sizes.Main.FramePadding.X, Defaults.Style.Sizes.Main.FramePadding.Y),
        BackgroundColor3 = Defaults.Style.Colors.FrameBg,
        BackgroundTransparency = Defaults.Style.Colors.FrameTrans,
        BorderSizePixel = 0,
    })

    local iCheckMarkImage = get_or_create_instance(key .. "_MARK", "ImageLabel", iCheckBox)
    update_instance_props(iCheckMarkImage, {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1, -- hello
        Image = Defaults.Style.Assets.CheckMark,
        ImageColor3 = Defaults.Style.Colors.CheckMark,
        ImageTransparency = if component_states[key].checked then 0 else 1,
    })

    local iLabel = get_or_create_instance(key .. "_LABEL", "TextLabel", iCheckMark)
    update_instance_props(iLabel, {
        Text = label,
        Position = UDim2.new(0, containerWidth, 0, 0),
        Size = UDim2.new(1, -containerWidth, 1, 0),
        TextColor3 = Defaults.Style.Colors.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
        BackgroundTransparency = 1,
        FontFace = Defaults.Style.Fonts.Roboto,
        TextSize = Defaults.Style.Sizes.Main.TextSize,
    })

    iCheckMark.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            component_states[key].checked = not component_states[key].checked
            iCheckMarkImage.ImageTransparency = if component_states[key].checked then 0 else 1
        end
    end)

    table.insert(window.children, {type = "checkmark", label = label})

    return component_states[key].checked
end

function Elements:EndFrame()
    for key, instance in pairs(global_instances) do
        if not active_instances[key] then
            instance:Destroy()
            global_instances[key] = nil
        end
    end
end

function Elements:End()
    local window = CURRENT_CTX.current_window
    assert(window, "Haiku::ERROR:: No active window to end")

    self:FinalizeWindow(window)

    window.completed = true
end

function Elements.init(ctx)
    CURRENT_CTX = ctx
end

return Elements
