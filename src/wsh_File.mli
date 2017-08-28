(** https://msdn.microsoft.com/en-us/library/1ft05taf(v=vs.84).aspx *)
type t

(**
https://msdn.microsoft.com/en-us/library/5tx15443(v=vs.84).aspx

Note: in OCaml the bitwise operators are: land, lor, lxor, lnot, lsl,
and lsr.
*)
module Attributes : sig
  val normal : int
  val readOnly : int
  val hidden : int
  val system : int
  val volume : int
  val directory : int
  val archive : int
  val alias : int
  val compressed : int

  external get : t -> int = "Attributes" [@@bs.get]
  external set : t -> int -> unit = "Attributes" [@@bs.set]
end

(** https://msdn.microsoft.com/en-us/library/6973t06a(v=vs.84).aspx *)
val copy : ?overwrite:bool -> destination:string -> t -> unit

(** https://msdn.microsoft.com/en-us/library/0k4wket3(v=vs.84).aspx *)
val delete : ?force:bool -> t -> unit

(** https://msdn.microsoft.com/en-us/library/kxtftw67(v=vs.84).aspx *)
external move : string -> unit = "Move" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/hwfw5c59(v=vs.84).aspx *)
val openAsTextStream :
  ?iomode:Wsh_TextStream.iomode ->
  ?format:Wsh_TextStream.format ->
  t ->
  Wsh_TextStream.t

