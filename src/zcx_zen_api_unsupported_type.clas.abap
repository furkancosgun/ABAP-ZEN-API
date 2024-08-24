CLASS zcx_zen_api_unsupported_type DEFINITION
  INHERITING FROM cx_static_check
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.
    METHODS:
      get_text REDEFINITION.
    METHODS:
      constructor
        IMPORTING
          previous LIKE previous OPTIONAL
          message  TYPE string OPTIONAL.
    DATA:message TYPE string.
ENDCLASS.



CLASS zcx_zen_api_unsupported_type IMPLEMENTATION.

  METHOD constructor  ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    me->message = message.
  ENDMETHOD.

  METHOD get_text.
    result = message.
  ENDMETHOD.
ENDCLASS.
