(** https://msdn.microsoft.com/en-us/library/hww8txat(v=vs.84).aspx *)
type t

val make : unit -> t

(** https://msdn.microsoft.com/en-us/library/sheydkke(v=vs.84).aspx *)
external getFile : string -> Wsh_File.t = "GetFile" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/314cz14s(v=vs.84).aspx *)
val openTextFile :
  filename:string ->
  ?iomode:Wsh_TextStream.iomode ->
  ?create:bool ->
  ?format:Wsh_TextStream.format ->
  t ->
  Wsh_TextStream.t

