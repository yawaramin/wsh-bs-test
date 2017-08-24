external echo : string -> unit = "WScript.Echo" [@@bs.val]
external stdIn : Wsh_TextStream.t = "WScript.StdIn" [@@bs.val]
external quit : unit -> 'a = "WScript.Quit" [@@bs.val]

