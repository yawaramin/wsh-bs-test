(** https://msdn.microsoft.com/en-us/library/hww8txat(v=vs.84).aspx *)
type t

val make : unit -> t

(** https://msdn.microsoft.com/en-us/library/314cz14s(v=vs.84).aspx *)
val openTextFile :
  filename:string ->
  ?iomode:[ `ForReading | `ForWriting | `ForAppending ] ->
  ?create:bool ->
  ?format:[ `TristateUseDefault | `TristateTrue | `TristateFalse ] ->
  t ->
  Wsh_TextStream.t

