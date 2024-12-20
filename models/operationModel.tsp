
model FormLandTitleDeed {
    form_id : int32;
    authoerize_number: string;
    authoerize_date: utcDateTime;
    file: FileAttachment;
}

model FileAttachment {
    id: int32;
    name: string;
    size: int32;
    type: string;
    url: string;
    ext: string;
    createdBy: int32;
    createdAt: utcDateTime; 
}

model ResponseOK {
    @example(200)
    code: int32;
    status: boolean;
    data: FormLandTitleDeed[];
}
