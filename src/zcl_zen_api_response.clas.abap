CLASS zcl_zen_api_response DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_zen_api_response .

    METHODS constructor
      IMPORTING
        !http_response TYPE REF TO if_http_response .
  PRIVATE SECTION.
    DATA: http_response TYPE REF TO if_http_response.
ENDCLASS.



CLASS ZCL_ZEN_API_RESPONSE IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_RESPONSE->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] HTTP_RESPONSE                  TYPE REF TO IF_HTTP_RESPONSE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:constructor.
    me->http_response = http_response.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_RESPONSE->ZIF_ZEN_API_RESPONSE~REDIRECT
* +-------------------------------------------------------------------------------------------------+
* | [--->] STATUS_CODE                    TYPE        I (default =ZCL_ZEN_API_STATUS_CODES=>C_FOUND)
* | [--->] URL                            TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:zif_zen_api_response~redirect.
    me->http_response->set_status( code = status_code reason = zcl_zen_api_status_codes=>get_status_message( status_code ) ).
    me->zif_zen_api_response~set_header( name = 'Location' value = url ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_RESPONSE->ZIF_ZEN_API_RESPONSE~SEND
* +-------------------------------------------------------------------------------------------------+
* | [--->] STATUS_CODE                    TYPE        I (default =ZCL_ZEN_API_STATUS_CODES=>C_OK)
* | [--->] CONTENT_TYPE                   TYPE        STRING (default =ZCL_ZEN_API_CONTENT_TYPES=>C_APPLICATION_JSON)
* | [--->] DATA                           TYPE        ANY(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
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


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_RESPONSE->ZIF_ZEN_API_RESPONSE~SET_HEADER
* +-------------------------------------------------------------------------------------------------+
* | [--->] NAME                           TYPE        STRING
* | [--->] VALUE                          TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:zif_zen_api_response~set_header.
    me->http_response->set_header_field( name = name value = value ).
  ENDMETHOD.
ENDCLASS.
