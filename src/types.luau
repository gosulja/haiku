--[[ haiku :: types ]]

export type Window = {
  title:      string,
  x:          number,
  y:          number,
  width:      number,
  height:     number,
  children:   {any},
  instances:  {[string]: Instance},
}

export type Context = {
  windowStack:    {Window?},
  currentWindow:  Window?,
  usedInstances:  {Instance}
}

return nil
