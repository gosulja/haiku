--[[ haiku :: custom font renderer ]]
local CFont = {}

local font = nil
local atlas = nil

function CFont:Push(fontName: string)
    if script:FindFirstChild(fontName) then
        font = require(script[fontName])
        atlas = font.atlas
    end
end

function CFont:Draw(text: string)
	local len = #text
	local container = Instance.new("Frame")
	container.Size = UDim2.new(0, font["A"].width * len, 0, font["A"].height)
	container.BackgroundTransparency = 1
	
	for i = 1, len do
		local char = text:sub(i, i)
		local data = font[char]

		if data then
			local imageLabel = Instance.new("ImageLabel")
			imageLabel.Image = atlas
			imageLabel.Size = UDim2.new(0, data.width, 0, data.height)
			imageLabel.Position = UDim2.new(0, (i - 1) * data.width, 0, 0)
			imageLabel.ImageRectOffset = Vector2.new(data.x, data.y)
			imageLabel.ImageRectSize = Vector2.new(data.width, data.height)
			imageLabel.BackgroundTransparency = 1
			imageLabel.Parent = container
		end
	end
	
	return container
end

return CFont