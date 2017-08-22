let () =
  let module WScript = Wsh_WScript in
  let module XMLHTTP = Wsh_XMLHTTP in
  let req = XMLHTTP.make () in

  XMLHTTP.open'
    ~meth:`get ~url:"http://www.example.com" req ~async:false;

  XMLHTTP.set'onreadystatechange req (fun () ->
    if XMLHTTP.readyState req = XMLHTTP.completed then
      WScript.echo (XMLHTTP.responseText req));

  XMLHTTP.send req;
  WScript.echo "Press Enter"

