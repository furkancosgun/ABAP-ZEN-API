INTERFACE zif_zen_api_middleware
  PUBLIC .
  METHODS:
    process
      IMPORTING
        io_request      TYPE REF TO zif_zen_api_request
        io_response     TYPE REF TO zif_zen_api_response
      RETURNING
        VALUE(has_next) TYPE boolean.
ENDINTERFACE.
