import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { CategoryCreateModel, CategoryUpdateModel } from 'app/models/category';
import { environment } from 'environments/environment';

@Injectable({
  providedIn: 'root'
})
export class CategoriesService {
  private url = environment.apiUrl + "/categories";

  constructor(
    private _http: HttpClient
  ) { }

  getAllCategories() {
    return this._http.get(this.url);
  }

  createCategory(data: CategoryCreateModel) {
    return this._http.post(this.url, data);
  }

  updateCategory(data: CategoryUpdateModel, id: number) {
    return this._http.put(`${this.url}/${id}`, data);
  }

  deleteCategory(id: number) {
    return this._http.delete(`${this.url}/${id}`);
  }
}
