INTERFACE zif_zen_api_request
  PUBLIC .
  DATA:
    root             TYPE string    READ-ONLY, "/api/v1
    path             TYPE string    READ-ONLY, "/users
    full_path        TYPE string    READ-ONLY, "/api/v1/users
    method           TYPE zcl_zen_api_http_methods=>ty_method READ-ONLY,
    query_parameters TYPE tihttpnvp READ-ONLY,
    content_type     TYPE string    READ-ONLY,
    headers          TYPE tihttpnvp READ-ONLY,
    form_data        TYPE tihttpnvp READ-ONLY,
    body             TYPE string    READ-ONLY,
    raw              TYPE xstring   READ-ONLY.
ENDINTERFACE.
