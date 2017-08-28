(** https://msdn.microsoft.com/en-us/library/x4k5wbx4(v=vs.84).aspx *)
type t

val make : unit -> t

(** https://msdn.microsoft.com/en-us/library/5h92h863(v=vs.84).aspx *)
external add : string -> 'a -> unit = "Add" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/a14xez73(v=vs.84).aspx *)
module CompareMode : sig
  val binary : int
  val text : int
  val database : int

  external get : t -> int = "CompareMode" [@@bs.get]
  external set : t -> int -> unit = "CompareMode" [@@bs.set]
end

(** https://msdn.microsoft.com/en-us/library/5t9h9579(v=vs.84).aspx *)
external count : t -> int = "Count" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/57hdf10z(v=vs.84).aspx *)
external exists : string -> bool = "Exists" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/84k9x471(v=vs.84).aspx *)
external item : string -> 'a = "Item" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/45731e2w(v=vs.84).aspx *)
external removeAll : t -> unit = "RemoveAll" [@@bs.send]

(** https://msdn.microsoft.com/en-us/library/ywyayk03(v=vs.84).aspx *)
external remove_exn : string -> unit = "Remove" [@@bs.send.pipe: t]

