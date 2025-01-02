model UserAssignList {
    id : int32;
    name: string; 
    department_id: int32;
    owner_id: int32[];
}

model ResponseOKUserAssignList {
    @example(200)
    code: int32;
    status: boolean;
    data: UserAssignList[];
}

model ResponseNoData {
    code: int32;
    status: boolean;
    data: {};
}