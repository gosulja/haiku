--[[ haiku :: a stateful value system. ]]

export type State<T> = {
  get: () -> T,
  set: (T) -> (),
  subscribe: (callback: (T) -> ()) -> () -> (),
}

