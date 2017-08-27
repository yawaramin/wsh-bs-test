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

external _send : t -> unit = "send" [@@bs.send]

external _send'body :
  ([ `string of string | `bytes of bytes ] [@bs.unwrap]) -> unit =
  "send" [@@bs.send.pipe: t]

let send ?body t =
  match body with Some body -> _send'body body t | None -> _send t

external onreadystatechange :
  t -> (unit -> unit [@bs.uncurry]) -> unit =
  "onreadystatechange" [@@bs.set]

let uninitialized = 0
let loading = 1
let loaded = 2
let interactive = 3
let completed = 4

external readyState : t -> int = "" [@@bs.get]
external responseStream : t -> Wsh_Stream.t = "" [@@bs.get]
external responseText : t -> string = "" [@@bs.get]

let continue = 100
let switching_protocols = 101
let ok = 200
let created = 201
let accepted = 202
let non_authoritative_info = 203
let no_content = 204
let reset_content = 205
let partial_content = 206
let multiple_choices = 300
let moved_permanently = 301
let found = 302
let see_other = 303
let not_modified = 304
let use_proxy = 305
let temporary_redirect = 307
let bad_request = 400
let unauthorized = 401
let payment_required = 402
let forbidden = 403
let not_found = 404
let method_not_allowed = 405
let not_acceptable = 406
let proxy_auth_required = 407
let req_timeout = 408
let conflict = 409
let gone = 410
let length_required = 411
let precondition_failed = 412
let req_entity_too_large = 413
let req_uri_too_long = 414
let unsupported_media_type = 415
let requested_range_not_suitable = 416
let expectation_failed = 417
let internal_server_error = 500
let not_implemented = 501
let bad_gateway = 502
let service_unavailable = 503
let gateway_timeout = 504
let http_version_not_supported = 505

external status : t -> int = "" [@@bs.get]
external statusText : t -> string = "" [@@bs.get]

