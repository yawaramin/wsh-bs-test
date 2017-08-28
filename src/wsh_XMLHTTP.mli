(** https://msdn.microsoft.com/en-us/library/ms759148(v=vs.85).aspx *)
type t
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

  val (=) : t -> t -> bool

  val continue : t
  val switching_protocols : t
  val ok : t
  val created : t
  val accepted : t
  val non_authoritative_info : t
  val no_content : t
  val reset_content : t
  val partial_content : t
  val multiple_choices : t
  val moved_permanently : t
  val found : t
  val see_other : t
  val not_modified : t
  val use_proxy : t
  val temporary_redirect : t
  val bad_request : t
  val unauthorized : t
  val payment_required : t
  val forbidden : t
  val not_found : t
  val method_not_allowed : t
  val not_acceptable : t
  val proxy_auth_required : t
  val req_timeout : t
  val conflict : t
  val gone : t
  val length_required : t
  val precondition_failed : t
  val req_entity_too_large : t
  val req_uri_too_long : t
  val unsupported_media_type : t
  val requested_range_not_suitable : t
  val expectation_failed : t
  val internal_server_error : t
  val not_implemented : t
  val bad_gateway : t
  val service_unavailable : t
  val gateway_timeout : t
  val http_version_not_supported : t
  external get : xmlhttp -> t = "status" [@@bs.get]

  (** https://msdn.microsoft.com/en-us/library/ms759127(v=vs.85).aspx *)
  external text : xmlhttp -> string = "statusText" [@@bs.get]
end

