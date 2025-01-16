

model FormUploadImage {
    upload_ids : int32[];
}

model Files {
    id: int32;
    name: string;
    size: int32;
    type: string;
    @example("https:test.com/image.jpg")
    url: string;
    ext: string;
    createdBy: int32;
    createdAt: utcDateTime; 
}


model ResponseImagesOK {
    @example(200)
    code: int32;
    status: boolean;
    data: Files[];
}