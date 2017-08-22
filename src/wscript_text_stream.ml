type t

external close : t -> unit = "Close" [@@bs.send]
external at_end_of_stream : t -> bool = "AtEndOfStream" [@@bs.get]
external read_line : t -> string = "ReadLine" [@@bs.send]

