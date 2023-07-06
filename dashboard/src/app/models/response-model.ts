export class ResponseModel {
    meta: MetaModel;
}

class MetaModel {
    code: number;
    status: string;
    message: string;
}

export class DataModel {
    current_page: number;
    first_page_url: string;
    from: number;
    last_page: number;
    last_page_url: number;
    links: LinkModel;
    next_page_url: number;
    path: string;
    per_page: number;
    to: number;
    total: number;
}

class LinkModel {
    url: string;
    label: string;
    active: boolean;
}
