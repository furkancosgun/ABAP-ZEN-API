CLASS zcl_zen_api_http_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES:ty_method TYPE char10.
    CONSTANTS:c_get    TYPE ty_method VALUE 'GET',
              c_post   TYPE ty_method VALUE 'POST',
              c_put    TYPE ty_method VALUE 'PUT',
              c_patch  TYPE ty_method VALUE 'PATCH',
              c_delete TYPE ty_method VALUE 'DELETE',
              c_head   TYPE ty_method VALUE 'HEAD'.
ENDCLASS.



CLASS zcl_zen_api_http_methods IMPLEMENTATION.
ENDCLASS.
