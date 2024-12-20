import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./models/operationModel.tsp";
import "./models/responseError.tsp";


using TypeSpec.Http;

@service({
  title: "Epermit-API",
})
@server("https://example.com", "Single server endpoint")

// highlight-next-line
@route("/api/v1")
namespace Epermit;


@tag("operation")
@route("/form_operation_inspector/check_land_title_deed")
namespace operation_inspector {
    model QueryLandTitleDeed {
      @header
      @example("Bearer <Add access token here>")
      Authorization: string;

      @query
      title_deed_number: string;
    
      @query
      land_number:string;
    }

    @get
    op ListLandTitleDeed(...QueryLandTitleDeed): {
      @statusCode statusCode: 200;
      @body data: ResponseOK[];
    } | {
      @statusCode statusCode: 401;
      @body data: ResponseUnauthorized;
    } | {
      @statusCode statusCode: 422;
      @body data: ResponseUnprocessableEntit;
    } | {
      @statusCode statusCode: 400;
      @body data: ResponseBadRequest;
    } | {
      @statusCode statusCode: 500;
      @body data: ResponseInternalServerError;
    };
}