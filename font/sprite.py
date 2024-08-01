import os
from PIL import Image, ImageDraw, ImageFont

def create_spritesheet(path, output, module_output, font_size=13, padding=5):
    font = ImageFont.truetype(path, font_size)

    characters = [chr(i) for i in range(32, 127)]

    max_width, max_height = 0, 0
    for char in characters:
        bbox = font.getbbox(char)
        max_width = max(max_width, bbox[2] - bbox[0])
        max_height = max(max_height, bbox[3] - bbox[1])

    max_width += padding
    max_height += padding

    columns = 16
    rows = (len(characters) + columns - 1) // columns
    spritesheet_width = columns * max_width
    spritesheet_height = rows * max_height

    spritesheet = Image.new("RGBA", (spritesheet_width, spritesheet_height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(spritesheet)
    data = {}

    for i, char in enumerate(characters):
        x = (i % columns) * max_width
        y = (i // columns) * max_height

        draw.text((x, y), char, font=font, fill="white")

        data[char] = {
            "x": x,
            "y": y,
            "width": max_width - padding,
            "height": max_height - padding
        }

    os.makedirs(os.path.dirname(output), exist_ok=True)
    
    spritesheet.save(output)

    with open(module_output, 'w') as f:
        lua_table = "return {\n"
        for char, metrics in data.items():
            lua_table += f'    ["{char}"] = {{x = {metrics["x"]}, y = {metrics["y"]}, width = {metrics["width"]}, height = {metrics["height"]}}},\n'
        lua_table += "}"
        f.write(lua_table)
