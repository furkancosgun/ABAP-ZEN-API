CLASS zcl_zen_api_demo_api DEFINITION
  PUBLIC
  INHERITING FROM zcl_zen_api_manager
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
      " Constructor to initialize the API routes and middleware
      constructor,

      " Define the root path for the API
      root_path
        REDEFINITION.
ENDCLASS.

CLASS zcl_zen_api_demo_api IMPLEMENTATION.

  METHOD constructor.
    " Call the superclass constructor
    super->constructor( ).

    " Create instances of route and middleware classes
    DATA(lo_route) = NEW zcl_zen_api_demo_route( ).
    DATA(lo_middleware) = NEW zcl_zen_api_demo_middleware( ).

    " Define API routes and associate them with route handlers
    me->get( path = '/users' route = lo_route ).
    me->post( path = '/' route = lo_route ).
    me->put( path = '/' route = lo_route ).
    me->patch( path = '/' route = lo_route ).
    me->delete( path = '/' route = lo_route ).
    me->head( path = '/' route = lo_route ).

    " Register the middleware for processing requests
    me->use( middleware = lo_middleware ).
  ENDMETHOD.

  METHOD root_path.
    " Set the base path for this API
    path = '/zexample'.
  ENDMETHOD.

ENDCLASS.

