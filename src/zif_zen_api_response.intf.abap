INTERFACE zif_zen_api_response
  PUBLIC .
  METHODS:
    send
      IMPORTING
        status_code  TYPE i DEFAULT zcl_zen_api_status_codes=>c_ok
        content_type TYPE string DEFAULT zcl_zen_api_content_types=>c_application_json
        data         TYPE any OPTIONAL.
  METHODS:
    redirect
      IMPORTING
        status_code TYPE i DEFAULT zcl_zen_api_status_codes=>c_found
        url         TYPE string.
  METHODS:
    set_header
      IMPORTING
        name  TYPE string
        value TYPE string.
ENDINTERFACE.
