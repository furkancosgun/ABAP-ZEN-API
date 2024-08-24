class ZCL_ZEN_API_RESPONSE definition
  public
  final
  create public .

public section.

  interfaces ZIF_ZEN_API_RESPONSE .

  methods CONSTRUCTOR
    importing
      !HTTP_RESPONSE type ref to IF_HTTP_RESPONSE .
  PRIVATE SECTION.
    DATA: http_response TYPE REF TO if_http_response.
ENDCLASS.



CLASS ZCL_ZEN_API_RESPONSE IMPLEMENTATION.


  METHOD:constructor.
    me->http_response = http_response.
  ENDMETHOD.


  METHOD:zif_zen_api_response~redirect.
    me->http_response->set_status( code = status_code reason = zcl_zen_api_status_codes=>get_status_message( status_code ) ).
    me->zif_zen_api_response~set_header( name = 'Location' value = url ).
  ENDMETHOD.


  METHOD:zif_zen_api_response~send.
    " Set the status code and reason phrase
    me->http_response->set_status( code = status_code reason = zcl_zen_api_status_codes=>get_status_message( status_code = status_code ) ).

    " Set the content type
    me->http_response->set_content_type( content_type = content_type ).

    " Check if data is supplied
    CHECK data IS SUPPLIED.

    " Describe field to determine type
    DESCRIBE FIELD data TYPE DATA(type).

    " Handle different data types
    CASE type.
      WHEN cl_abap_typedescr=>typekind_string OR cl_abap_typedescr=>typekind_char.
        me->http_response->set_cdata( data = data ).
      WHEN cl_abap_typedescr=>typekind_xstring.
        me->http_response->set_data( data = data ).
      WHEN OTHERS.
        RAISE EXCEPTION TYPE zcx_zen_api_unsupported_type
          EXPORTING
            message = |Unsupported data type: { type }|.
    ENDCASE.
  ENDMETHOD.


  METHOD:zif_zen_api_response~set_header.
    me->http_response->set_header_field( name = name value = value ).
  ENDMETHOD.
ENDCLASS.
