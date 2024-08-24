CLASS zcl_zen_api_demo_middleware DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_zen_api_middleware. " Implements the middleware interface for processing requests
ENDCLASS.



CLASS ZCL_ZEN_API_DEMO_MIDDLEWARE IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_DEMO_MIDDLEWARE->ZIF_ZEN_API_MIDDLEWARE~PROCESS
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_REQUEST                     TYPE REF TO ZIF_ZEN_API_REQUEST
* | [--->] IO_RESPONSE                    TYPE REF TO ZIF_ZEN_API_RESPONSE
* | [<-()] HAS_NEXT                       TYPE        BOOLEAN
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD zif_zen_api_middleware~process.
    " Perform actions such as logging the request or modifying it
    " Example: Log the request details or perform other tasks

    " Decide whether to continue processing the request
    has_next = abap_true.
  ENDMETHOD.
ENDCLASS.
