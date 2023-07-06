import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';

import { PagesComponent } from './pages.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ProductsComponent } from './products/products.component';
import { CategoriesComponent } from './categories/categories.component';
import { ShippingComponent } from './shipping/shipping.component';
import { TransactionsComponent } from './transactions/transactions.component';
import { DiscountsComponent } from './discounts/discounts.component';
import { AdminManagementComponent } from './admin-management/admin-management.component';

const routes: Routes = [{
  path: '',
  component: PagesComponent,
  children: [
    {
      path: 'dashboard',
      component: DashboardComponent,
    },
    {
      path: 'products',
      component: ProductsComponent
    },
    {
      path: 'categories',
      component: CategoriesComponent
    },
    {
      path: 'shipping',
      component: ShippingComponent
    },
    {
      path: 'transactions',
      component: TransactionsComponent
    },
    {
      path: 'discounts',
      component: DiscountsComponent
    },
    {
      path: 'admin-management',
      component: AdminManagementComponent,
    },
    {
      path: '',
      redirectTo: 'dashboard',
      pathMatch: 'full',
    }
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PagesRoutingModule {
}
