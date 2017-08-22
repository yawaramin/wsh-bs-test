type t

let make () = Active_x_object.make "MSXML2.XMLHTTP"

external open' :
  ([ `get | `post | `put ] [@bs.string]) -> string -> unit =
  "open" [@@bs.send.pipe: t]

external send : unit -> unit = "" [@@bs.send]
external send_string : string -> unit = "send" [@@bs.send.pipe: t]
external send_bytes : bytes -> unit = "send" [@@bs.send.pipe: t]

external set_onreadystatechange :
  t -> (unit -> unit [@bs.uncurry]) -> unit =
  "onreadystatechange" [@@bs.set]

let uninitialized = 0
let loading = 1
let loaded = 2
let interactive = 3
let completed = 4

external ready_state : t -> int = "readyState" [@@bs.get]
external response_text : t -> string = "responseText" [@@bs.get]

