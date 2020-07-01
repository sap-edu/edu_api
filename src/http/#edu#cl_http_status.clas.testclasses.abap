*&---------------------------------------------------------------------*
*& SUCCESS
*&---------------------------------------------------------------------*
class ltc_success definition final for testing
  duration short
  risk level harmless.

  private section.
    data cut type ref to /edu/cl_http_status.

    methods setup.
    methods is_success for testing raising cx_static_check.
    methods get_reason for testing raising cx_static_check.
    methods get_status for testing raising cx_static_check.
endclass.


class ltc_success implementation.

  method setup.
    me->cut = new #( if_web_http_status=>ok ).
  endmethod.

  method is_success.
    cl_abap_unit_assert=>assert_true( me->cut->/edu/if_http_status~is_success( ) ).
  endmethod.

  method get_reason.
    cl_abap_unit_assert=>assert_equals( act = me->cut->/edu/if_http_status~get_reason( ) exp = /edu/if_http_status=>reason-status_200 ).
  endmethod.

  method get_status.
    cl_abap_unit_assert=>assert_equals( act = me->cut->/edu/if_http_status~get_status( ) exp = if_web_http_status=>ok ).
  endmethod.

endclass.


*&---------------------------------------------------------------------*
*& ERROR
*&---------------------------------------------------------------------*
class ltc_error definition final for testing
  duration short
  risk level harmless.

  private section.
    data cut type ref to /edu/cl_http_status.

    methods setup.
    methods is_error for testing raising cx_static_check.
    methods is_client_error for testing raising cx_static_check.
    methods is_server_error for testing raising cx_static_check.
    methods get_reason for testing raising cx_static_check.
    methods get_status for testing raising cx_static_check.
endclass.


class ltc_error implementation.

  method setup.
    me->cut = new #( if_web_http_status=>bad_request ).
  endmethod.

  method is_error.
    cl_abap_unit_assert=>assert_true( me->cut->/edu/if_http_status~is_error( ) ).
  endmethod.

  method is_client_error.
    cl_abap_unit_assert=>assert_true( me->cut->/edu/if_http_status~is_client_error( ) ).
  endmethod.

  method is_server_error.
    me->cut = new #( if_web_http_status=>internal_server_error ).
    cl_abap_unit_assert=>assert_true( me->cut->/edu/if_http_status~is_server_error( ) ).
  endmethod.

  method get_reason.
    cl_abap_unit_assert=>assert_equals( act = me->cut->/edu/if_http_status~get_reason( ) exp = /edu/if_http_status=>reason-status_400 ).
  endmethod.

  method get_status.
    cl_abap_unit_assert=>assert_equals( act = me->cut->/edu/if_http_status~get_status( ) exp = if_web_http_status=>bad_request ).
  endmethod.

endclass.


*&---------------------------------------------------------------------*
*& REDIRECTION
*&---------------------------------------------------------------------*
class ltc_redirection definition final for testing
  duration short
  risk level harmless.

  private section.
    data cut type ref to /edu/cl_http_status.

    methods setup.
    methods is_redirection for testing raising cx_static_check.
    methods get_reason for testing raising cx_static_check.
    methods get_status for testing raising cx_static_check.
endclass.


class ltc_redirection implementation.

  method setup.
    me->cut = new #( if_web_http_status=>temporary_redirect ).
  endmethod.

  method is_redirection.
    cl_abap_unit_assert=>assert_true( me->cut->/edu/if_http_status~is_redirection( ) ).
  endmethod.

  method get_reason.
    cl_abap_unit_assert=>assert_equals( act = me->cut->/edu/if_http_status~get_reason( ) exp = /edu/if_http_status=>reason-status_307 ).
  endmethod.

  method get_status.
    cl_abap_unit_assert=>assert_equals( act = me->cut->/edu/if_http_status~get_status( ) exp = if_web_http_status=>temporary_redirect ).
  endmethod.

endclass.
