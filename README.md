# ABAP Zen API

Zen API is a flexible and straightforward HTTP framework designed specifically for ABAP environments. It enables efficient handling of HTTP requests and responses using routes, middleware, and API definition classes.

## License

This project is licensed under the [MIT License](LICENSE). See the LICENSE file for details.

## Contents

- [API Definition Example](#api-definition-example)
- [Route Example](#route-example)
- [Middleware Example](#middleware-example)
- [Request Interface](#request-interface)
- [Response Interface](#response-interface)

### API Definition Example

This section explains how to define an API using the Zen API Framework. By extending the `zcl_zen_api_manager` class, you can configure routes for different HTTP methods and register middleware to handle requests. Additionally, you will set the base path for the API.

**Steps to Define an API:**

1. **Create a New API Class**: Inherit from the `zcl_zen_api_manager` class and override its methods to set up routes and middleware.

2. **Define Routes**: In the `constructor` method, create instances of route handler classes and associate them with HTTP methods (GET, POST, PUT, etc.). This allows your API to manage requests across various endpoints.

3. **Register Middleware**: Middleware processes requests before they reach the route handlers. Register your middleware using the `me->use( middleware = ... )` statement.

4. **Specify the Base Path**: Override the `get_root` method to set the base path for the API. Ensure this path matches the configuration in the SICF transaction code.

Here’s an example implementation of an API class:

```abap
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

CLASS zcl_zen_api_demo_api IMPLEMENTATION.

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

  METHOD get_root.
    " Set the base path for this API
    " This path should match the one configured in SICF
    root = '/zen_api/demo'.
  ENDMETHOD.

ENDCLASS.
```

### Route Example

In the Zen API Framework, a route class handles incoming HTTP requests and generates responses based on the request data. To implement a route class, you need to use the `zif_zen_api_route` interface, which includes the `on_request` method for processing requests.

**Steps to Create a Route Class:**

1. **Define the Route Class**: Create a new class that implements the `zif_zen_api_route` interface. This interface requires you to implement the `on_request` method.

2. **Implement the `on_request` Method**: This method is where you handle the HTTP request, perform necessary data retrieval, and prepare the response. Use `io_request` to access request details and `io_response` to send the response.

Here’s an example implementation of a route class:

```abap
CLASS zcl_zen_api_demo_route DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_zen_api_route. " Implements the route interface for handling requests
ENDCLASS.

CLASS zcl_zen_api_demo_route IMPLEMENTATION.

  METHOD zif_zen_api_route~on_request.
    " Fetch data from a database table
    SELECT * FROM scarr INTO TABLE @DATA(lt_scarr).

    " Send a response with status code OK and JSON content
    io_response->send(
        status_code = zcl_zen_api_status_codes=>c_ok
        content_type = zcl_zen_api_content_types=>c_application_json
        data = /ui2/cl_json=>serialize( data = lt_scarr pretty_name = /ui2/cl_json=>pretty_mode-camel_case )
    ).
  ENDMETHOD.

ENDCLASS.
```

### Middleware Example

Middleware processes HTTP requests and responses before they reach the route handlers or after the responses are generated. Implement middleware by extending the `zif_zen_api_middleware` interface, which provides the `process` method for handling requests.

**Steps to Create a Middleware Class:**

1. **Define the Middleware Class**: Create a new class that implements the `zif_zen_api_middleware` interface. This interface requires the implementation of the `process` method.

2. **Implement the `process` Method**: This method allows you to perform operations such as logging or modifying requests. Use the `has_next` parameter to decide whether to continue processing with the next middleware or route handler.

Here’s an example implementation of a middleware class:

```abap
CLASS zcl_zen_api_demo_middleware DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_zen_api_middleware. " Implements the middleware interface for processing requests
ENDCLASS.

CLASS zcl_zen_api_demo_middleware IMPLEMENTATION.

  METHOD zif_zen_api_middleware~process.
    " Perform actions such as logging the request or modifying it
    " Example: Log the request details or perform other tasks

    " Decide whether to continue processing the request
    has_next = abap_true.
  ENDMETHOD.

ENDCLASS.
```

### Request Interface

The `zif_zen_api_request` interface defines the available properties and methods for handling HTTP requests.

**Properties:**

- `root`: The base path of the API. (e.g., `/api/v1`)
- `path`: The endpoint path of the current request. (e.g., `/users`)
- `full_path`: The full path of the request, combining `root` and `path`. (e.g., `/api/v1/users`)
- `method`: The HTTP method of the request (GET, POST, etc.).
- `query_parameters`: The query parameters of the request.
- `content_type`: The content type of the request.
- `headers`: The headers of the request.
- `form_data`: The form data submitted with the request.
- `body`: The body of the request.
- `raw`: The raw request data.

### Response Interface

The `zif_zen_api_response` interface defines the available methods for sending HTTP responses.

**Methods:**

- `send`: Sends the response with a specified status code, content type, and optional data. The `data` parameter can be of type `string` or `xstring`.

  ```abap
  METHODS:
    send
      IMPORTING
        status_code  TYPE i DEFAULT zcl_zen_api_status_codes=>c_ok
        content_type TYPE string DEFAULT zcl_zen_api_content_types=>c_application_json
        data         TYPE any OPTIONAL. " Should be of type string or xstring
  ```

- `redirect`: Redirects the request to a different URL with a specified status code.

  ```abap
  METHODS:
    redirect
      IMPORTING
        status_code TYPE i DEFAULT zcl_zen_api_status_codes=>c_found
        url         TYPE string.
  ```

- `set_header`: Sets a response header with a specified name and value.

  ```abap
  METHODS:
    set_header
      IMPORTING
        name  TYPE string
        value TYPE string.
  ```

These interfaces provide the essential functionalities for handling and responding to HTTP requests in the Zen API Framework.

Feel free to adjust any details according to your specific needs or preferences.
