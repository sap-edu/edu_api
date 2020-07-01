interface /edu/if_http_status
  public .

  types ty_status_code type i.

  constants begin of reason.
  constants status_100 type string value 'Continue' .
  constants status_101 type string value 'Switching Protocols' .
  constants status_200 type string value 'OK' .
  constants status_201 type string value 'Created' .
  constants status_202 type string value 'Accepted' .
  constants status_203 type string value 'Non-Authoritative Information'.
  constants status_204 type string value 'No Content'.
  constants status_205 type string value 'Reset Content'.
  constants status_206 type string value 'Partial Content'.
  constants status_300 type string value 'Multiple Choices'.
  constants status_301 type string value 'Moved Permanently'.
  constants status_302 type string value 'Found' .
  constants status_303 type string value 'See Other'.
  constants status_304 type string value 'Not Modified'.
  constants status_305 type string value 'Use Proxy'.
  constants status_307 type string value 'Temporary Redirect'.
  constants status_308 type string value 'Permanent Redirect'.
  constants status_400 type string value 'Bad Request'.
  constants status_401 type string value 'Unauthorized'.
  constants status_402 type string value 'Payment Required'.
  constants status_403 type string value 'Forbidden'.
  constants status_404 type string value 'Not Found'.
  constants status_405 type string value 'Method Not Allowed'.
  constants status_406 type string value 'Not Acceptable'.
  constants status_407 type string value 'Proxy Authentication Required'.
  constants status_408 type string value 'Request Timeout'.
  constants status_409 type string value 'Conflict'.
  constants status_410 type string value 'Gone'.
  constants status_411 type string value 'Length Required'.
  constants status_412 type string value 'Precondition Failed'.
  constants status_413 type string value 'Request Entity Too Large'.
  constants status_414 type string value 'Request-URI Too Long'.
  constants status_415 type string value 'Unsupported Media Type'.
  constants status_416 type string value 'Requested Range Not Satisfiable'.
  constants status_417 type string value 'Expectation Failed'.
  constants status_500 type string value 'Internal Server Error'.
  constants status_501 type string value 'Not Implemented'.
  constants status_502 type string value 'Bad Gateway'.
  constants status_503 type string value 'Service Unavailable'.
  constants status_504 type string value 'Gateway Timeout'.
  constants status_505 type string value 'HTTP Version Not Supported'.
  constants end of reason.

  methods is_success
    returning value(result) type abap_bool.

  methods is_error
    returning value(result) type abap_bool.

  methods is_client_error
    returning value(result) type abap_bool.

  methods is_server_error
    returning value(result) type abap_bool.

  methods is_redirection
    returning value(result) type abap_bool.

  methods get_reason
    returning value(reason) type string.

  methods get_status
    returning value(status) type ty_status_code.

endinterface.
