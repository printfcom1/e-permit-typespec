@error
model ResponseUnauthorized {
    @example(401)
    code: int32;
  
    status: boolean;
    error : ErrorUnauthorized;  
}
  
model ErrorUnauthorized {
    @example("unauthorized to access the resource")
    message: string;
    file: {};
}

@error
model ResponseUnprocessableEntit {
    @example(422)
    code: int32;
  
    status: boolean;
    error : ErrorUnprocessableEntit;
}
  
model ErrorUnprocessableEntit {
    @example("validate error")
    message: string;
    file: {
      additionalProp1: string;
      additionalProp2: string;
      additionalProp3: string;
    };
}
  
@error
model ResponseBadRequest {
    @example(400)
    code: int32;
    status: boolean;
    error : ErrorBadRequest;
}

model ErrorBadRequest {
    @example(400)
    code:int32;
    status: boolean;
    error: ResponseNotFound
}

model ResponseNotFound {
    @example("bad request error message")
    message: string;
    file: {};
}

@error
model ResponseInternalServerError {
    @example(500)
    code: int32;
    status: boolean;
    error : ErrorInternalServerError;
}

model ErrorInternalServerError {
    @example("internal server error")
    message: string;
    file: {};
}
