import { NgModule } from '@angular/core';
import { NbMenuModule } from '@nebular/theme';

import { ThemeModule } from '../@theme/theme.module';
import { PagesComponent } from './pages.component';
import { DashboardModule } from './dashboard/dashboard.module';
import { PagesRoutingModule } from './pages-routing.module';
import { CategoriesComponent } from './categories/categories.component';
import { ProductsComponent } from './products/products.component';
import { TransactionsComponent } from './transactions/transactions.component';
import { ShippingComponent } from './shipping/shipping.component';
import { DiscountsComponent } from './discounts/discounts.component';
import { AdminManagementComponent } from './admin-management/admin-management.component';
import { DxDataGridModule } from 'devextreme-angular';

@NgModule({
  imports: [
    PagesRoutingModule,
    ThemeModule,
    NbMenuModule,
    DashboardModule,
    DxDataGridModule
  ],
  declarations: [
    PagesComponent,
    CategoriesComponent,
    ProductsComponent,
    TransactionsComponent,
    ShippingComponent,
    DiscountsComponent,
    AdminManagementComponent,
  ],
})
export class PagesModule {
}
