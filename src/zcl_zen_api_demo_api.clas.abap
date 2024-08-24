CLASS zcl_zen_api_demo_api DEFINITION
  PUBLIC
  INHERITING FROM zcl_zen_api_manager
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor,            " Initializes API routes and middleware
      get_root REDEFINITION.  " Defines the base path for the API
ENDCLASS.



CLASS ZCL_ZEN_API_DEMO_API IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_DEMO_API->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD constructor.
    " Initialize the base API settings
    super->constructor( ).

    " Create instances of route and middleware classes
    DATA(lo_route) = NEW zcl_zen_api_demo_route( ).
    DATA(lo_middleware) = NEW zcl_zen_api_demo_middleware( ).

    " Define API routes and associate them with route handlers
    me->get( path = '' route = lo_route ).
    me->post( path = '' route = lo_route ).
    me->put( path = '' route = lo_route ).
    me->patch( path = '' route = lo_route ).
    me->delete( path = '' route = lo_route ).
    me->head( path = '' route = lo_route ).

    " Register the middleware for request processing
    me->use( middleware = lo_middleware ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ZEN_API_DEMO_API->GET_ROOT
* +-------------------------------------------------------------------------------------------------+
* | [<-()] ROOT                           TYPE        STRING
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD get_root.
    " Set the base path for this API
    " This path should match the one configured in SICF
    root = '/zen_api/demo'.
  ENDMETHOD.
ENDCLASS.
