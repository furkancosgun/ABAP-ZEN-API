CLASS zcl_zen_api_demo_middleware DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_zen_api_middleware.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_zen_api_demo_middleware IMPLEMENTATION.

  METHOD zif_zen_api_middleware~process.
    " Middleware processing logic
    " For example, logging request details or modifying the request
    " Log the request or perform other actions

    " Indicate that processing should continue
    has_next = abap_true.
  ENDMETHOD.

ENDCLASS.

