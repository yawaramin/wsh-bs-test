type t

let make () = Wsh_ActiveXObject.make "MSXML2.XMLHTTP"

external _open :
  ([ `get | `post | `put ] [@bs.string]) ->
  string ->
  Js.boolean ->
  string ->
  string ->
  unit =
  "open" [@@bs.send.pipe: t]

let open' ~meth ~url ?(async=true) ?(user="") ?(password="") t =
  _open meth url (Js.Boolean.to_js_boolean async) user password t

external send : t -> unit = "" [@@bs.send]

external send'body :
  ([ `string of string | `bytes of bytes ] [@bs.unwrap]) -> unit =
  "send" [@@bs.send.pipe: t]

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

