CLASS zcl_zen_api_manager DEFINITION
  ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_http_extension.

    METHODS:
      get_root ABSTRACT
        RETURNING
          VALUE(root) TYPE string.

    METHODS:
      get
        IMPORTING
          path  TYPE string
          route TYPE REF TO zif_zen_api_route,
      post
        IMPORTING
          path  TYPE string
          route TYPE REF TO zif_zen_api_route,
      put
        IMPORTING
          path  TYPE string
          route TYPE REF TO zif_zen_api_route,
      patch
        IMPORTING
          path  TYPE string
          route TYPE REF TO zif_zen_api_route,
      delete
        IMPORTING
          path  TYPE string
          route TYPE REF TO zif_zen_api_route,
      head
        IMPORTING
          path  TYPE string
          route TYPE REF TO zif_zen_api_route,
      use
        IMPORTING
          middleware TYPE REF TO zif_zen_api_middleware.

  PRIVATE SECTION.
    TYPES:BEGIN OF ty_route,
            path   TYPE string,
            method TYPE zcl_zen_api_http_methods=>ty_method,
            route  TYPE REF TO zif_zen_api_route,
          END OF ty_route.

    DATA:mt_routes TYPE HASHED TABLE OF ty_route WITH UNIQUE KEY path method.
    DATA:mt_middlewares TYPE STANDARD TABLE OF REF TO zif_zen_api_middleware WITH EMPTY KEY.
ENDCLASS.



CLASS ZCL_ZEN_API_MANAGER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->DELETE
* +-------------------------------------------------------------------------------------------------+
* | [--->] PATH                           TYPE        STRING
* | [--->] ROUTE                          TYPE REF TO ZIF_ZEN_API_ROUTE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:delete.
    INSERT VALUE ty_route( path = path method = zcl_zen_api_http_methods=>c_delete route = route ) INTO TABLE mt_routes.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->GET
* +-------------------------------------------------------------------------------------------------+
* | [--->] PATH                           TYPE        STRING
* | [--->] ROUTE                          TYPE REF TO ZIF_ZEN_API_ROUTE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:get.
    INSERT VALUE ty_route( path = path method = zcl_zen_api_http_methods=>c_get route = route ) INTO TABLE mt_routes.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->HEAD
* +-------------------------------------------------------------------------------------------------+
* | [--->] PATH                           TYPE        STRING
* | [--->] ROUTE                          TYPE REF TO ZIF_ZEN_API_ROUTE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:head.
    INSERT VALUE ty_route( path = path method = zcl_zen_api_http_methods=>c_head route = route ) INTO TABLE mt_routes.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->IF_HTTP_EXTENSION~HANDLE_REQUEST
* +-------------------------------------------------------------------------------------------------+
* | [--->] SERVER                         TYPE REF TO IF_HTTP_SERVER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:if_http_extension~handle_request.
    DATA:lo_request  TYPE REF TO zif_zen_api_request,
         lo_response TYPE REF TO zif_zen_api_response.

    lo_request  = NEW zcl_zen_api_request( root = me->get_root( ) http_request = server->request ).
    lo_response = NEW zcl_zen_api_response( http_response = server->response ).


    " Process middleware
    LOOP AT mt_middlewares INTO DATA(lr_middleware).
      DATA(has_next) = lr_middleware->process(
        EXPORTING
          io_request  = lo_request
          io_response = lo_response
      ).
      " If middleware decides to terminate the processing
      IF has_next NE abap_true.
        RETURN.
      ENDIF.
    ENDLOOP.

    " Check if route exists
    READ TABLE mt_routes WITH KEY path = lo_request->path TRANSPORTING NO FIELDS.
    IF sy-subrc NE 0.
      lo_response->send(
        EXPORTING
          status_code  = zcl_zen_api_status_codes=>c_not_found
      ).
      RETURN.
    ENDIF.

    " Process route
    LOOP AT mt_routes REFERENCE INTO DATA(lr_route) WHERE path   EQ lo_request->path
                                                      AND method EQ lo_request->method.
      lr_route->route->on_request(
        EXPORTING
          io_request  = lo_request
          io_response = lo_response
      ).
    ENDLOOP.
    IF sy-subrc NE 0.
      lo_response->send(
        EXPORTING
          status_code  = zcl_zen_api_status_codes=>c_method_not_allowed
      ).
      RETURN.
    ENDIF.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->PATCH
* +-------------------------------------------------------------------------------------------------+
* | [--->] PATH                           TYPE        STRING
* | [--->] ROUTE                          TYPE REF TO ZIF_ZEN_API_ROUTE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:patch.
    INSERT VALUE ty_route( path = path method = zcl_zen_api_http_methods=>c_patch route = route ) INTO TABLE mt_routes.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->POST
* +-------------------------------------------------------------------------------------------------+
* | [--->] PATH                           TYPE        STRING
* | [--->] ROUTE                          TYPE REF TO ZIF_ZEN_API_ROUTE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:post.
    INSERT VALUE ty_route( path = path method = zcl_zen_api_http_methods=>c_post route = route ) INTO TABLE mt_routes.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->PUT
* +-------------------------------------------------------------------------------------------------+
* | [--->] PATH                           TYPE        STRING
* | [--->] ROUTE                          TYPE REF TO ZIF_ZEN_API_ROUTE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:put.
    INSERT VALUE ty_route( path = path method = zcl_zen_api_http_methods=>c_put route = route ) INTO TABLE mt_routes.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_MANAGER->USE
* +-------------------------------------------------------------------------------------------------+
* | [--->] MIDDLEWARE                     TYPE REF TO ZIF_ZEN_API_MIDDLEWARE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD:use.
    APPEND middleware TO mt_middlewares.
  ENDMETHOD.
ENDCLASS.
