(** https://msdn.microsoft.com/en-us/library/ms759148(v=vs.85).aspx *)
type t

(** For internal use. *)
type xmlhttp = t

val make : unit -> t

(** https://msdn.microsoft.com/en-us/library/ms757849(v=vs.85).aspx *)
val open' :
  meth:[ `get | `post | `put ] ->
  url:string ->
  ?async:bool ->
  ?user:string ->
  ?password:string ->
  t ->
  unit

(** https://msdn.microsoft.com/en-us/library/ms763706(v=vs.85).aspx *)
val send : ?body:[ `string of string | `bytes of bytes ] -> t -> unit

(** https://msdn.microsoft.com/en-us/library/ms762767(v=vs.85).aspx *)
external onreadystatechange :
  t -> (unit -> unit [@bs.uncurry]) -> unit =
  "onreadystatechange" [@@bs.set]

(** https://msdn.microsoft.com/en-us/library/ms753800(v=vs.85).aspx *)
module ReadyState : sig
  type t

  val (=) : t -> t -> bool

  val uninitialized : t
  val loading : t
  val loaded : t
  val interactive : t
  val completed : t
  external get : xmlhttp -> t = "readyState" [@@bs.get]
end

(** https://msdn.microsoft.com/en-us/library/ms763792(v=vs.85).aspx *)
external responseStream : t -> Wsh_Stream.t = "" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/ms762275(v=vs.85).aspx *)
external responseText : t -> string = "" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/ms767625(v=vs.85).aspx *)
module Status : sig
  type t

  val continue : t
  val switchingProtocols : t
  val ok : t
  val created : t
  val accepted : t
  val nonAuthoritativeInfo : t
  val noContent : t
  val resetContent : t
  val partialContent : t
  val multipleChoices : t
  val movedPermanently : t
  val found : t
  val seeOther : t
  val notModified : t
  val useProxy : t
  val temporaryRedirect : t
  val badRequest : t
  val unauthorized : t
  val paymentRequired : t
  val forbidden : t
  val notFound : t
  val methodNotAllowed : t
  val notAcceptable : t
  val proxyAuthRequired : t
  val reqTimeout : t
  val conflict : t
  val gone : t
  val lengthRequired : t
  val preconditionFailed : t
  val reqEntityTooLarge : t
  val reqUriTooLong : t
  val unsupportedMediaType : t
  val requestedRangeNotSuitable : t
  val expectationFailed : t
  val internalServerError : t
  val notImplemented : t
  val badGateway : t
  val serviceUnavailable : t
  val gatewayTimeout : t
  val httpVersionNotSupported : t
  val (=) : t -> t -> bool

  external get : xmlhttp -> t = "status" [@@bs.get]

  (** https://msdn.microsoft.com/en-us/library/ms759127(v=vs.85).aspx *)
  external text : xmlhttp -> string = "statusText" [@@bs.get]
end

