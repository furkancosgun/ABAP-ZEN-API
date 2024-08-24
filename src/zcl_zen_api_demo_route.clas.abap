CLASS zcl_zen_api_demo_route DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_zen_api_route. " Implements the route interface for handling requests
ENDCLASS.



CLASS ZCL_ZEN_API_DEMO_ROUTE IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_DEMO_ROUTE->ZIF_ZEN_API_ROUTE~ON_REQUEST
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_REQUEST                     TYPE REF TO ZIF_ZEN_API_REQUEST
* | [--->] IO_RESPONSE                    TYPE REF TO ZIF_ZEN_API_RESPONSE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_zen_api_route~on_request.
    " Fetch data from a database table
    SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).

    " Send a response with status code OK and JSON content
    io_response->send(
        status_code = zcl_zen_api_status_codes=>c_ok
        content_type = zcl_zen_api_content_types=>c_application_json
        data = /ui2/cl_json=>serialize( data = lt_scarr pretty_name = /ui2/cl_json=>pretty_mode-camel_case )
    ).
  ENDMETHOD.
ENDCLASS.
