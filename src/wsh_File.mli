(** https://msdn.microsoft.com/en-us/library/1ft05taf(v=vs.84).aspx *)
type t

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

