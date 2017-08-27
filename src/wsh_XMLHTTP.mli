(** https://msdn.microsoft.com/en-us/library/ms759148(v=vs.85).aspx *)
type t

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

(** Return values of the `readyState` property *)
val uninitialized : int
val loading : int
val loaded : int
val interactive : int
val completed : int

(** https://msdn.microsoft.com/en-us/library/ms753800(v=vs.85).aspx *)
external readyState : t -> int = "" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/ms763792(v=vs.85).aspx *)
external responseStream : t -> Wsh_Stream.t = "" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/ms762275(v=vs.85).aspx *)
external responseText : t -> string = "" [@@bs.get]

(** Return values of `status` property. *)
val continue : int
val switching_protocols : int
val ok : int
val created : int
val accepted : int
val non_authoritative_info : int
val no_content : int
val reset_content : int
val partial_content : int
val multiple_choices : int
val moved_permanently : int
val found : int
val see_other : int
val not_modified : int
val use_proxy : int
val temporary_redirect : int
val bad_request : int
val unauthorized : int
val payment_required : int
val forbidden : int
val not_found : int
val method_not_allowed : int
val not_acceptable : int
val proxy_auth_required : int
val req_timeout : int
val conflict : int
val gone : int
val length_required : int
val precondition_failed : int
val req_entity_too_large : int
val req_uri_too_long : int
val unsupported_media_type : int
val requested_range_not_suitable : int
val expectation_failed : int
val internal_server_error : int
val not_implemented : int
val bad_gateway : int
val service_unavailable : int
val gateway_timeout : int
val http_version_not_supported : int

(** https://msdn.microsoft.com/en-us/library/ms767625(v=vs.85).aspx *)
external status : t -> int = "" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/ms759127(v=vs.85).aspx *)
external statusText : t -> string = "" [@@bs.get]

