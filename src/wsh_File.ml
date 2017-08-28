type t

module Attributes = struct
  let normal = 0
  let readOnly = 1
  let hidden = 2
  let system = 4
  let volume = 8
  let directory = 16
  let archive = 32
  let alias = 1024
  let compressed = 2048

  external get : t -> int = "Attributes" [@@bs.get]
  external set : t -> int -> unit = "Attributes" [@@bs.set]
end

external _copy : string -> Js.boolean -> unit =
  "Copy" [@@bs.send.pipe: t]

let copy ?(overwrite=true) ~destination t =
  _copy destination (Js.Boolean.to_js_boolean overwrite) t

external _delete : Js.boolean -> unit = "Delete" [@@bs.send.pipe: t]

let delete ?(force=false) t = _delete (Js.Boolean.to_js_boolean force) t

external move : string -> unit = "Move" [@@bs.send.pipe: t]

external _openAsTextStream :
  ([ `ForReading [@bs.as 1]
   | `ForWriting [@bs.as 2]
   | `ForAppending [@bs.as 8] ] [@bs.int]) ->
  ([ `TristateUseDefault [@bs.as -2]
   | `TristateTrue [@bs.as -1]
   | `TristateFalse [@bs.as 0] ] [@bs.int]) ->
  Wsh_TextStream.t =
  "OpenAsTextStream" [@@bs.send.pipe: t]

let openAsTextStream ?(iomode=`ForReading) ?(format=`TristateUseDefault) t =
  _openAsTextStream iomode format t

