--[[ haiku :: types ]]

export type Value<T> = {
    name: string,
    value: T,
    default: T,
}

export type Window = {
    title: string,
    position: Vector2,
    size: Vector2,
    children: {any},
    instances: {[string]: Instance},
    padding: Vector2,
    isOpen: boolean,
    isDragging: boolean,
    zIndex: number,
}

export type HaikuElement = {
    type: string,
    id: string,
    position: Vector2,
    size: Vector2,
    visible: boolean,
    parent: Window,
}

export type Context = {
    window_stack: {Window},
    current_window: Window?,
    used_instances: {Instance},
    run_render: boolean,
    id_stack: {string},
    next_item_pos: Vector2,
    values: {[string]: Value<any>},
    current_view: ScreenGui | Instance | any,
    current_line_height: number,
    cursor_pos: Vector2,
    last_item_width: number,
    line_height: number,
    same_line: boolean,
}


return nil
