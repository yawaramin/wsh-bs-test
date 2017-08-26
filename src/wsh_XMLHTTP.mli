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
external send : t -> unit = "" [@@bs.send]

(** See `send` *)
external send'body :
  ([ `string of string | `bytes of bytes ] [@bs.unwrap]) -> unit =
  "send" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/ms762767(v=vs.85).aspx *)
external set'onreadystatechange :
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

(** https://msdn.microsoft.com/en-us/library/ms762275(v=vs.85).aspx *)
external responseText : t -> string = "" [@@bs.get]

