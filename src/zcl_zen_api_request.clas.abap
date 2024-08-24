CLASS zcl_zen_api_request DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_zen_api_request .

    METHODS constructor
      IMPORTING
        root_path    TYPE string
        http_request TYPE REF TO if_http_request .
  PRIVATE SECTION.
    DATA:http_request TYPE REF TO if_http_request.
    METHODS:
      prepare_method,
      prepare_path,
      prepare_headers,
      prepare_query_parameters,
      prepare_content_type,
      prepare_form_data,
      prepare_body,
      prepare_raw.
ENDCLASS.



CLASS zcl_zen_api_request IMPLEMENTATION.


  METHOD constructor.
    me->zif_zen_api_request~root_path    = root_path.
    me->http_request = http_request.
    me->prepare_method( ).
    me->prepare_path( ).
    me->prepare_headers( ).
    me->prepare_query_parameters( ).
    me->prepare_content_type( ).
    me->prepare_form_data( ).
    me->prepare_body( ).
    me->prepare_raw( ).
  ENDMETHOD.


  METHOD prepare_body.
    me->zif_zen_api_request~body = me->http_request->get_cdata( ).
  ENDMETHOD.


  METHOD prepare_content_type.
    me->zif_zen_api_request~content_type = me->http_request->get_header_field( name = 'Content-Type' ).
  ENDMETHOD.


  METHOD prepare_form_data.
    me->http_request->get_form_fields(
      CHANGING
        fields             = me->zif_zen_api_request~form_data
    ).
  ENDMETHOD.


  METHOD prepare_headers.
    me->http_request->get_header_fields(
      CHANGING
        fields = me->zif_zen_api_request~headers
    ).
  ENDMETHOD.


  METHOD prepare_method.
    me->zif_zen_api_request~method = http_request->get_method( ).
  ENDMETHOD.


  METHOD prepare_path.
    me->zif_zen_api_request~full_path = http_request->get_header_field( name = '~path' ).
    me->zif_zen_api_request~path      = me->zif_zen_api_request~full_path.
    REPLACE FIRST OCCURRENCE OF REGEX |^{ me->zif_zen_api_request~root_path }| IN me->zif_zen_api_request~path WITH ''.
  ENDMETHOD.


  METHOD prepare_query_parameters.
    DATA(query_string) = me->http_request->get_header_field( name = '~query_string' ).
    SPLIT query_string AT '&' INTO TABLE DATA(lt_query_splits).
    LOOP AT lt_query_splits INTO DATA(query).
      SPLIT query AT '=' INTO TABLE DATA(lt_query_name_value).
      CHECK lines( lt_query_name_value ) EQ 2.
      APPEND VALUE ihttpnvp(
          name  = cl_http_utility=>if_http_utility~unescape_url( lt_query_name_value[ 1 ] )
          value = cl_http_utility=>if_http_utility~unescape_url( lt_query_name_value[ 2 ] )
      ) TO me->zif_zen_api_request~query_parameters.
    ENDLOOP.
  ENDMETHOD.


  METHOD prepare_raw.
    me->zif_zen_api_request~raw = me->http_request->get_data( ).
  ENDMETHOD.
ENDCLASS.
