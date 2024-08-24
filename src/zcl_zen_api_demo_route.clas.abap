CLASS zcl_zen_api_demo_route DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_zen_api_route.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_zen_api_demo_route IMPLEMENTATION.

  METHOD zif_zen_api_route~on_request.
    " Handle incoming requests and send responses
    " For example, querying a database or processing input data

    SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).

    " Send a response with status code OK and JSON content type
    io_response->send(
        status_code = zcl_zen_api_status_codes=>c_ok
        content_type = zcl_zen_api_content_types=>c_application_json
        data = /ui2/cl_json=>serialize( data = lt_scarr pretty_name = /ui2/cl_json=>pretty_mode-camel_case )
    ).
  ENDMETHOD.

ENDCLASS.

