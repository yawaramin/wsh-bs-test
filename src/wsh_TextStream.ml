(** https://msdn.microsoft.com/en-us/library/aa242724(v=vs.60).aspx *)
type t

(** https://msdn.microsoft.com/en-us/library/aa242862(v=vs.60).aspx *)
external atEndOfLine : t -> bool = "AtEndOfLine" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/aa242864(v=vs.60).aspx *)
external atEndOfStream : t -> bool = "AtEndOfStream" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/aa265269(v=vs.60).aspx *)
external close : t -> unit = "Close" [@@bs.send]

(** https://msdn.microsoft.com/en-us/library/aa242872(v=vs.60).aspx *)
external column : t -> int = "Column" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/aa265790(v=vs.60).aspx *)
external line : t -> int = "Line" [@@bs.get]

(** https://msdn.microsoft.com/en-us/library/aa265364(v=vs.60).aspx *)
external read : int -> string = "Read" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/aa265365(v=vs.60).aspx *)
external readAll : t -> string = "ReadAll" [@@bs.send]

(** https://msdn.microsoft.com/en-us/library/aa265367(v=vs.60).aspx *)
external readLine : t -> string = "ReadLine" [@@bs.send]

(** https://msdn.microsoft.com/en-us/library/aa265375(v=vs.60).aspx *)
external skip : int -> unit = "Skip" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/aa265376(v=vs.60).aspx *)
external skipLine : t -> unit = "SkipLine" [@@bs.send]

(** https://msdn.microsoft.com/en-us/library/aa265378(v=vs.60).aspx *)
external write : string -> unit = "Write" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/aa242677(v=vs.60).aspx *)
external writeBlankLines : int -> unit = "WriteBlankLines" [@@bs.send.pipe: t]

(** https://msdn.microsoft.com/en-us/library/aa242679(v=vs.60).aspx *)
external writeLine : t -> unit = "WriteLine" [@@bs.send]

(** See `writeLine` *)
external writeLine'string : string -> unit = "WriteLine" [@@bs.send.pipe: t]
