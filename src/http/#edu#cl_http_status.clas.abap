class /edu/cl_http_status definition
  public
  final
  create public .

  public section.
    interfaces /edu/if_http_status.

    aliases is_success for /edu/if_http_status~is_success.
    aliases is_error for /edu/if_http_status~is_error.
    aliases is_client_error for /edu/if_http_status~is_client_error.
    aliases is_server_error for /edu/if_http_status~is_server_error.
    aliases is_redirection for /edu/if_http_status~is_redirection.
    aliases get_reason for /edu/if_http_status~get_reason.
    aliases get_status for /edu/if_http_status~get_status.

    methods constructor
      importing status_code type /edu/if_http_status=>ty_status_code.

  protected section.
  private section.
    data status_code type /edu/if_http_status=>ty_status_code.
endclass.


class /edu/cl_http_status implementation.

  method constructor.
    me->status_code = status_code.
  endmethod.


  method /edu/if_http_status~is_success.
    result = boolc( me->status_code between 200 and 299 ).
  endmethod.


  method /edu/if_http_status~is_error.
    result = boolc( me->/edu/if_http_status~is_client_error( ) or me->/edu/if_http_status~is_server_error( ) ).
  endmethod.


  method /edu/if_http_status~is_client_error.
    result = boolc( me->status_code between 400 and 499 ).
  endmethod.


  method /edu/if_http_status~is_redirection.
    result = boolc( me->status_code between 300 and 399 ).
  endmethod.


  method /edu/if_http_status~is_server_error.
    result = boolc( me->status_code between 500 and 599 ).
  endmethod.


  method /edu/if_http_status~get_reason.
    data(reason_var) = |reason-status_{ me->status_code }|.

    assign /edu/if_http_status=>(reason_var) to field-symbol(<reason>) .

    if <reason> is assigned.
      reason = <reason>.
    endif.
  endmethod.


  method /edu/if_http_status~get_status.
    status = me->status_code.
  endmethod.

endclass.
