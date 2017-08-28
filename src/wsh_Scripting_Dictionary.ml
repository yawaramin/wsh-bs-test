type t

let make () = Wsh_ActiveXObject.make "Scripting.Dictionary"
external add : string -> 'a -> unit = "Add" [@@bs.send.pipe: t]

module CompareMode = struct
  let binary = 0
  let text = 1
  let database = 2

  external get : t -> int = "CompareMode" [@@bs.get]
  external set : t -> int -> unit = "CompareMode" [@@bs.set]
end

external count : t -> int = "Count" [@@bs.get]
external exists : string -> bool = "Exists" [@@bs.send.pipe: t]
external item : string -> 'a = "Item" [@@bs.send.pipe: t]
external removeAll : t -> unit = "RemoveAll" [@@bs.send]
external remove_exn : string -> unit = "Remove" [@@bs.send.pipe: t]

