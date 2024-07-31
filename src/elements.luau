--[[ haiku :: elements ]]
local types = require(script.Parent.types)
local uis   = game:GetService("UserInputService")

local Elements = {}

--[[ DEFAULTS ]]

local Defaults = {
    Style = {
        Sizes = {
            Main = {
                WindowPadding = Vector2.new(8, 8),
                FramePadding = Vector2.new(3, 3),
                ItemSpacing = Vector2.new(8, 4),
                ItemInnerSpacing = Vector2.new(4, 4),
                TouchExtraPadding = Vector2.new(0, 0),
                IndentSpacing = 21,
                ScrollbarSize = 14,
                GrabMinSize = 12,
                TextSize = 13,
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
                WindowRounding = 3,
                ChildRounding = 0,
                FrameRounding = 3,
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
            TitleBgActive = Color3.fromRGB(41, 74, 122),
            TitleBgCollapsed = Color3.fromRGB(0, 0, 0),
            TitleTransCollapsed = 0.509,
            
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
            ResizeGripTrans = 0.2,
            ResizeGripHovered = Color3.fromRGB(66, 150, 250),
            ResizeGripHoveredTrans = 0.67,
            
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
            ResizeGrip = "rbxassetid://18743487846",
        }
    },
}

local CURRENT_CTX: types.Context = nil
local global_instances = {}
local active_instances = {}
local component_states = {}
local previous_props   = {}

local function get_or_create_instance(key: string, class_name: string, parent: Instance): Instance
    if not global_instances[key] then
        global_instances[key] = Instance.new(class_name)
        global_instances[key].Name = key
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
    local window: types.Window = {
        title = title,
        position = if (x and y) then Vector2.new(x, y) else Vector2.new(0, 30),
        size = if (width and height) then Vector2.new(width, height) else Vector2.new(300, 200),
        children = {},
        instances = {},
        padding = Defaults.Style.Sizes.Main.WindowPadding,
        isOpen = true,
        isDragging = false,
        zIndex = #CURRENT_CTX.window_stack + 1
    }

    table.insert(CURRENT_CTX.window_stack, window)
    CURRENT_CTX.current_window = window

    local iFrame = get_or_create_instance("WINDOW_", "CanvasGroup", CURRENT_CTX.current_view)
    update_instance_props(iFrame, {
        Position = UDim2.fromOffset(window.position.X, window.position.Y),
        Size = UDim2.fromOffset(window.size.X, window.size.Y),
        BackgroundColor3 = Defaults.Style.Colors.WindowBg,
        BackgroundTransparency = Defaults.Style.Colors.WindowTrans,
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
        BackgroundColor3 = Defaults.Style.Colors.TitleBgActive,
        BackgroundTransparency = 0,

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

    local iTitle = get_or_create_instance("WINDOW_" .. window.title .. "_TITLE", "TextLabel", iTitleBar)
    update_instance_props(iTitle, {
        Text = window.title,
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        TextColor3 = Defaults.Style.Colors.Text,
        TextTransparency = 0,
        TextXAlignment = Enum.TextXAlignment.Left,
        FontFace = Defaults.Style.Fonts.Roboto,
        TextSize = Defaults.Style.Sizes.Main.TextSize,
        BorderSizePixel = 0,
    })

    local iWinCollapse = get_or_create_instance("WINDOW_" .. window.title .. "_COLLAPSE", "Frame", iTitleBar)
    update_instance_props(iWinCollapse, {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, Defaults.Style.Sizes.Main.FramePadding.X, 0.5, 0),
        Size = UDim2.fromOffset(14, 14),
        BackgroundTransparency = 1,
        BackgroundColor3 = Defaults.Style.Colors.ButtonHovered,
        BorderSizePixel = 0,

        MouseEnter = function(rbx)
            rbx.BackgroundTransparency = 0
        end,

        MouseLeave = function(rbx)
            rbx.BackgroundTransparency = 1
        end
    })

    local iWinCollapsIcon = get_or_create_instance("WINDOW_" .. window.title .. "_COLLAPSE_ICON", "ImageLabel", iWinCollapse)
    update_instance_props(iWinCollapsIcon, {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundTransparency = 1,
        Image = Defaults.Style.Assets.WindowCollapse
    })

    local iTitlePadding = get_or_create_instance("WINDOW_TITLEPADDING", "UIPadding", iTitle)
    update_instance_props(iTitlePadding, {
        PaddingLeft = UDim.new(0, Defaults.Style.Sizes.Main.FramePadding.X + 17)
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
        Image = Defaults.Style.Assets.ResizeGrip,
    })

    do
        iResizeGrip.MouseEnter:Connect(function() 
            iResizeGrip.ImageColor3 = Defaults.Style.Colors.ResizeGripHovered
            iResizeGrip.ImageTransparency = Defaults.Style.Colors.ResizeGripHoveredTrans
        end)

        iResizeGrip.MouseLeave:Connect(function() 
            iResizeGrip.ImageColor3 = Defaults.Style.Colors.ResizeGrip
            iResizeGrip.ImageTransparency = Defaults.Style.Colors.ResizeGripTrans
        end)
    end

    window.instances["FRAME"] = iFrame
    window.instances["TITLE"] = iTitle
    window.instances["CONTENT"] = iContent
end

function Elements:SameLine()
    CURRENT_CTX.same_line = true
    CURRENT_CTX.cursor_pos = Vector2.new(
        CURRENT_CTX.cursor_pos.X + CURRENT_CTX.last_item_width + Defaults.Style.Sizes.Main.ItemSpacing.X,
        CURRENT_CTX.cursor_pos.Y
    )
end

function Elements:Button(label: string)
    local window = CURRENT_CTX.current_window
    assert(window, "Haiku::ERROR:: No active window")

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

    local iText = get_or_create_instance(key .. "_ACTIVATOR", "TextLabel", iButton)
    update_instance_props(iText, {
        Text = label,
        Active = false,
        Size = UDim2.fromScale(1, 1),
        TextColor3 = Defaults.Style.Colors.Text,
        TextTransparency = 0,
        BackgroundTransparency = 1,
        FontFace = Defaults.Style.Fonts.Roboto,
        TextSize = Defaults.Style.Sizes.Main.TextSize,
        AutomaticSize = Enum.AutomaticSize.X,
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

function Elements:EndFrame()
    for key, instance in pairs(global_instances) do
        if not active_instances[key] then
            instance:Destroy()
            global_instances[key] = nil
        end
    end
end

function Elements:End()
    CURRENT_CTX.current_window = nil
end

function Elements.init(ctx)
    CURRENT_CTX = ctx
end

return Elements
