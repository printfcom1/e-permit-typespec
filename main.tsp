import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./models/operationModel.tsp";
import "./models/userModel.tsp";
import "./models/responseError.tsp";
import "./models/formImageModel.tsp";

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
      ref_title_deed_type_id: int32;

      @query
      title_deed_number: string;
    
      @query
      land_number:string;
    }

    @get
    op ListLandTitleDeed(...QueryLandTitleDeed): {
      @statusCode statusCode: 200;
      @body data: ResponseFormLandTitleDeedOK[];
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

@tag("users")
@route("users/new_assign")
namespace User {
  model QueryUserNewAssign {
    @header
    @example("Bearer <Add access token here>")
    Authorization: string;

    @query
    from_user_id: int32;
  }

  @get
  op ListUserNewAssign(...QueryUserNewAssign): {
    @statusCode statusCode: 200;
    @body data: ResponseOKUserAssignList[];
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


  model BodyUserNewAssign {
    @body
    data :{
      form_user_id: int32;
      assign_user_id: int32;
    };
  }

  @put
  op CreateUserNewAssign(...BodyUserNewAssign): {
    @statusCode statusCode: 202;
    @body data: ResponseNoData;
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

@tag("form")
@route("form/{id}/images")
namespace Form {
  model Header {
    @header
    @example("Bearer <Add access token here>")
    Authorization: string;
  }

  model PathImages {
    @path
    id :int32;
  }

  @get
  op GetImages(...Header,...PathImages): {
    @statusCode statusCode: 200;
    @body data: ResponseImagesOK;
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

  
  model createImage {
    @body data : FormUploadImage;
  }

  @post
  op CreareImages(...Header,...PathImages,...createImage):{
    @statusCode statusCode: 201;
    @body data: ResponseNoData;
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