import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { CategoryResponseModel } from 'app/models/category';
import { CategoriesService } from 'app/services/categories.service';
import { Employee, MockDataService, State } from 'app/services/mock-data.service';

@Component({
  selector: 'categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.scss']
})
export class CategoriesComponent implements OnInit {

  dataSource: Employee[];
  states: State[];

  constructor(
    private _categoriesService: CategoriesService,
    private _mockDataService: MockDataService
  ) {
    this.dataSource = _mockDataService.getEmployees();
    this.states = _mockDataService.getStates();
  }

  ngOnInit() {
   this.getAllCategories(); 
  }



  getAllCategories() {
    this._categoriesService.getAllCategories().subscribe((res) => {
      const response = res as CategoryResponseModel;
      console.log(response.data.data);
    }, (err: HttpErrorResponse) => {
      console.error("Error when getting Categories", err);
    })
  }

}
