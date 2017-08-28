type t
type iomode = [ `ForReading | `ForWriting | `ForAppending ]
type format = [ `TristateUseDefault | `TristateTrue | `TristateFalse ]

external atEndOfLine : t -> bool = "AtEndOfLine" [@@bs.get]
external atEndOfStream : t -> bool = "AtEndOfStream" [@@bs.get]
external close : t -> unit = "Close" [@@bs.send]
external column : t -> int = "Column" [@@bs.get]
external line : t -> int = "Line" [@@bs.get]
external read : int -> string = "Read" [@@bs.send.pipe: t]
external readAll : t -> string = "ReadAll" [@@bs.send]
external readLine : t -> string = "ReadLine" [@@bs.send]
external skip : int -> unit = "Skip" [@@bs.send.pipe: t]
external skipLine : t -> unit = "SkipLine" [@@bs.send]
external write : string -> unit = "Write" [@@bs.send.pipe: t]
external writeBlankLines : int -> unit = "WriteBlankLines" [@@bs.send.pipe: t]
external _writeLine : t -> unit = "WriteLine" [@@bs.send]
external _writeLine'string : string -> unit = "WriteLine" [@@bs.send.pipe: t]

let writeLine ?string t =
  match string with
    | Some string -> _writeLine'string string t
    | None -> _writeLine t

