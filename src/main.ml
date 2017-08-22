let () =
  let req = Xml_http_req.make () in

  Xml_http_req.open' `get "http://www.example.com" req;

  Xml_http_req.set_onreadystatechange req (fun () ->
    if Xml_http_req.ready_state req = Xml_http_req.completed then
      Wscript.echo (Xml_http_req.response_text req));

  Xml_http_req.send req;
  Wscript.echo "Press Enter"

