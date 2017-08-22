type t

external close : t -> unit = "Close" [@@bs.send]
external atEndOfStream : t -> bool = "AtEndOfStream" [@@bs.get]
external readLine : t -> string = "ReadLine" [@@bs.send]

