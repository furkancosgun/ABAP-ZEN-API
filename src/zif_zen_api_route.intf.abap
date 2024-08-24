INTERFACE zif_zen_api_route
  PUBLIC .
  METHODS:
    on_request
      IMPORTING
        io_request  TYPE REF TO zif_zen_api_request
        io_response TYPE REF TO zif_zen_api_response.
ENDINTERFACE.
