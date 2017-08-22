type t

let make () = Wsh_ActiveXObject.make "MSXML2.XMLHTTP"

external _open :
  ([ `get | `post | `put ] [@bs.string]) ->
  string ->
  bool ->
  string ->
  string ->
  unit =
  "open" [@@bs.send.pipe: t]

let open' ~meth ~url ?(async=true) ?(user="") ?(password="") t =
  _open meth url async user password t

external send : t -> unit -> unit = "" [@@bs.send]

external send'string : string -> unit = "send" [@@bs.send.pipe: t]

external send'bytes : bytes -> unit = "send" [@@bs.send.pipe: t]

external set'onreadystatechange :
  t -> (unit -> unit [@bs.uncurry]) -> unit =
  "onreadystatechange" [@@bs.set]

let uninitialized = 0
let loading = 1
let loaded = 2
let interactive = 3
let completed = 4

external readyState : t -> int = "" [@@bs.get]

external responseText : t -> string = "" [@@bs.get]

