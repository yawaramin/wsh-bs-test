type t

let make () = Wsh_ActiveXObject.make "Scripting.Dictionary"
external add : string -> 'a -> unit = "" [@@bs.send.pipe: t]
external count : t -> int = "Count" [@@bs.get]
external exists : string -> bool = "Exists" [@@bs.send.pipe: t]
external item : string -> 'a = "Item" [@@bs.send.pipe: t]
external remove_exn : string -> unit = "Remove" [@@bs.send.pipe: t]

