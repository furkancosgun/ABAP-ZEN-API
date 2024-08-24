CLASS zcl_zen_api_status_codes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CONSTANTS:
      " Informational responses (1xx)
      c_continue                   TYPE i VALUE 100,
      c_switching_protocols        TYPE i VALUE 101,
      c_processing                 TYPE i VALUE 102,
      c_early_hints                TYPE i VALUE 103,

      " Successful responses (2xx)
      c_ok                         TYPE i VALUE 200,
      c_created                    TYPE i VALUE 201,
      c_accepted                   TYPE i VALUE 202,
      c_non_authoritative_info     TYPE i VALUE 203,
      c_no_content                 TYPE i VALUE 204,
      c_reset_content              TYPE i VALUE 205,
      c_partial_content            TYPE i VALUE 206,
      c_multi_status               TYPE i VALUE 207,
      c_already_reported           TYPE i VALUE 208,
      c_im_used                    TYPE i VALUE 226,

      " Redirection messages (3xx)
      c_multiple_choices           TYPE i VALUE 300,
      c_moved_permanently          TYPE i VALUE 301,
      c_found                      TYPE i VALUE 302,
      c_see_other                  TYPE i VALUE 303,
      c_not_modified               TYPE i VALUE 304,
      c_use_proxy                  TYPE i VALUE 305,
      c_temp_redirect              TYPE i VALUE 307,
      c_permanent_redirect         TYPE i VALUE 308,

      " Client error responses (4xx)
      c_bad_request                TYPE i VALUE 400,
      c_unauthorized               TYPE i VALUE 401,
      c_payment_required           TYPE i VALUE 402,
      c_forbidden                  TYPE i VALUE 403,
      c_not_found                  TYPE i VALUE 404,
      c_method_not_allowed         TYPE i VALUE 405,
      c_not_acceptable             TYPE i VALUE 406,
      c_proxy_auth_required        TYPE i VALUE 407,
      c_request_timeout            TYPE i VALUE 408,
      c_conflict                   TYPE i VALUE 409,
      c_gone                       TYPE i VALUE 410,
      c_length_required            TYPE i VALUE 411,
      c_precondition_failed        TYPE i VALUE 412,
      c_payload_too_large          TYPE i VALUE 413,
      c_uri_too_long               TYPE i VALUE 414,
      c_unsupported_media_type     TYPE i VALUE 415,
      c_range_not_satisfiable      TYPE i VALUE 416,
      c_expectation_failed         TYPE i VALUE 417,
      c_misdirected_request        TYPE i VALUE 421,
      c_unprocessable_entity       TYPE i VALUE 422,
      c_locked                     TYPE i VALUE 423,
      c_failed_dependency          TYPE i VALUE 424,
      c_upgrade_required           TYPE i VALUE 426,
      c_precondition_required      TYPE i VALUE 428,
      c_unavailable_legal_reasons  TYPE i VALUE 451,

      " Server error responses (5xx)
      c_internal_server_error      TYPE i VALUE 500,
      c_not_implemented            TYPE i VALUE 501,
      c_bad_gateway                TYPE i VALUE 502,
      c_service_unavailable        TYPE i VALUE 503,
      c_gateway_timeout            TYPE i VALUE 504,
      c_http_version_not_supported TYPE i VALUE 505,
      c_variant_also_negotiates    TYPE i VALUE 506,
      c_insufficient_storage       TYPE i VALUE 507,
      c_loop_detected              TYPE i VALUE 508,
      c_not_extended               TYPE i VALUE 510,
      c_network_auth_required      TYPE i VALUE 511.

    CLASS-METHODS:
      get_status_message
        IMPORTING
          status_code           TYPE i
        RETURNING
          VALUE(status_message) TYPE string.
ENDCLASS.



CLASS ZCL_ZEN_API_STATUS_CODES IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_ZEN_API_STATUS_CODES=>GET_STATUS_MESSAGE
* +-------------------------------------------------------------------------------------------------+
* | [--->] STATUS_CODE                    TYPE        I
* | [<-()] STATUS_MESSAGE                 TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_status_message.
    CASE status_code.
      WHEN c_continue.
        status_message = '100 Continue'.
      WHEN c_switching_protocols.
        status_message = '101 Switching Protocols'.
      WHEN c_processing.
        status_message = '102 Processing'.
      WHEN c_early_hints.
        status_message = '103 Early Hints'.

      WHEN c_ok.
        status_message = '200 OK'.
      WHEN c_created.
        status_message = '201 Created'.
      WHEN c_accepted.
        status_message = '202 Accepted'.
      WHEN c_non_authoritative_info.
        status_message = '203 Non-Authoritative Information'.
      WHEN c_no_content.
        status_message = '204 No Content'.
      WHEN c_reset_content.
        status_message = '205 Reset Content'.
      WHEN c_partial_content.
        status_message = '206 Partial Content'.
      WHEN c_multi_status.
        status_message = '207 Multi-Status'.
      WHEN c_already_reported.
        status_message = '208 Already Reported'.
      WHEN c_im_used.
        status_message = '226 IM Used'.

      WHEN c_multiple_choices.
        status_message = '300 Multiple Choices'.
      WHEN c_moved_permanently.
        status_message = '301 Moved Permanently'.
      WHEN c_found.
        status_message = '302 Found'.
      WHEN c_see_other.
        status_message = '303 See Other'.
      WHEN c_not_modified.
        status_message = '304 Not Modified'.
      WHEN c_use_proxy.
        status_message = '305 Use Proxy'.
      WHEN c_temp_redirect.
        status_message = '307 Temporary Redirect'.
      WHEN c_permanent_redirect.
        status_message = '308 Permanent Redirect'.

      WHEN c_bad_request.
        status_message = '400 Bad Request'.
      WHEN c_unauthorized.
        status_message = '401 Unauthorized'.
      WHEN c_payment_required.
        status_message = '402 Payment Required'.
      WHEN c_forbidden.
        status_message = '403 Forbidden'.
      WHEN c_not_found.
        status_message = '404 Not Found'.
      WHEN c_method_not_allowed.
        status_message = '405 Method Not Allowed'.
      WHEN c_not_acceptable.
        status_message = '406 Not Acceptable'.
      WHEN c_proxy_auth_required.
        status_message = '407 Proxy Authentication Required'.
      WHEN c_request_timeout.
        status_message = '408 Request Timeout'.
      WHEN c_conflict.
        status_message = '409 Conflict'.
      WHEN c_gone.
        status_message = '410 Gone'.
      WHEN c_length_required.
        status_message = '411 Length Required'.
      WHEN c_precondition_failed.
        status_message = '412 Precondition Failed'.
      WHEN c_payload_too_large.
        status_message = '413 Payload Too Large'.
      WHEN c_uri_too_long.
        status_message = '414 URI Too Long'.
      WHEN c_unsupported_media_type.
        status_message = '415 Unsupported Media Type'.
      WHEN c_range_not_satisfiable.
        status_message = '416 Range Not Satisfiable'.
      WHEN c_expectation_failed.
        status_message = '417 Expectation Failed'.
      WHEN c_misdirected_request.
        status_message = '421 Misdirected Request'.
      WHEN c_unprocessable_entity.
        status_message = '422 Unprocessable Entity'.
      WHEN c_locked.
        status_message = '423 Locked'.
      WHEN c_failed_dependency.
        status_message = '424 Failed Dependency'.
      WHEN c_upgrade_required.
        status_message = '426 Upgrade Required'.
      WHEN c_precondition_required.
        status_message = '428 Precondition Required'.
      WHEN c_unavailable_legal_reasons.
        status_message = '451 Unavailable For Legal Reasons'.

      WHEN c_internal_server_error.
        status_message = '500 Internal Server Error'.
      WHEN c_not_implemented.
        status_message = '501 Not Implemented'.
      WHEN c_bad_gateway.
        status_message = '502 Bad Gateway'.
      WHEN c_service_unavailable.
        status_message = '503 Service Unavailable'.
      WHEN c_gateway_timeout.
        status_message = '504 Gateway Timeout'.
      WHEN c_http_version_not_supported.
        status_message = '505 HTTP Version Not Supported'.
      WHEN c_variant_also_negotiates.
        status_message = '506 Variant Also Negotiates'.
      WHEN c_insufficient_storage.
        status_message = '507 Insufficient Storage'.
      WHEN c_loop_detected.
        status_message = '508 Loop Detected'.
      WHEN c_not_extended.
        status_message = '510 Not Extended'.
      WHEN c_network_auth_required.
        status_message = '511 Network Authentication Required'.
      WHEN OTHERS.
        status_message = 'Unknown Status Code'.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
