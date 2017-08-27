type t

let make () = Wsh_ActiveXObject.make "Scripting.FileSystemObject"

external _openTextFile :
  string ->
  ([ `ForReading [@bs.as 1]
   | `ForWriting [@bs.as 2]
   | `ForAppending [@bs.as 8] ] [@bs.int]) ->
  bool -> 
  ([ `TristateUseDefault [@bs.as -2]
   | `TristateTrue [@bs.as -1]
   | `TristateFalse [@bs.as 0] ] [@bs.int]) ->
   Wsh_TextStream.t = "OpenTextFile" [@@bs.send.pipe: t]

let openTextFile ~filename ?(iomode=`ForReading) ?(create=false) ?(format=`TristateUseDefault) t =
  _openTextFile filename iomode create format t

