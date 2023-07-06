import { DataModel, ResponseModel } from "./response-model";

export class CategoryResponseModel extends ResponseModel {
    data: CategoryDataModel
}

class CategoryDataModel extends DataModel {
    data: CategoryViewModel;
}

class CategoryViewModel {
    id: number;
    name: string;
    created_at: Date;
    updated_at: Date;
}

export class CategoryCreateModel {
    name: string;
}

export class CategoryUpdateModel {
    name: string;
}
