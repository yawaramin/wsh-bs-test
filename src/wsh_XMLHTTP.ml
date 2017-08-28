type t
type xmlhttp = t

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

module ReadyState = struct
  type t = int

  let (=) t1 t2 = t1 = t2

  let uninitialized = 0
  let loading = 1
  let loaded = 2
  let interactive = 3
  let completed = 4
  external get : xmlhttp -> t = "readyState" [@@bs.get]
end

external responseStream : t -> Wsh_Stream.t = "" [@@bs.get]
external responseText : t -> string = "" [@@bs.get]

module Status = struct
  type t = int

  let (=) t1 t2 = t1 = t2

  let continue = 100
  let switchingProtocols = 101
  let ok = 200
  let created = 201
  let accepted = 202
  let nonAuthoritativeInfo = 203
  let noContent = 204
  let resetContent = 205
  let partialContent = 206
  let multipleChoices = 300
  let movedPermanently = 301
  let found = 302
  let seeOther = 303
  let notModified = 304
  let useProxy = 305
  let temporaryRedirect = 307
  let badRequest = 400
  let unauthorized = 401
  let paymentRequired = 402
  let forbidden = 403
  let notFound = 404
  let methodNotAllowed = 405
  let notAcceptable = 406
  let proxyAuthRequired = 407
  let reqTimeout = 408
  let conflict = 409
  let gone = 410
  let lengthRequired = 411
  let preconditionFailed = 412
  let reqEntityTooLarge = 413
  let reqUriTooLong = 414
  let unsupportedMediaType = 415
  let requestedRangeNotSuitable = 416
  let expectationFailed = 417
  let internalServerError = 500
  let notImplemented = 501
  let badGateway = 502
  let serviceUnavailable = 503
  let gatewayTimeout = 504
  let httpVersionNotSupported = 505

  external get : xmlhttp -> t = "status" [@@bs.get]
  external text : xmlhttp -> string = "statusText" [@@bs.get]
end

