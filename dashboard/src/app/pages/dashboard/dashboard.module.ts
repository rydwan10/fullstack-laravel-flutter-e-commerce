import { NgModule } from '@angular/core';
import { NbCardModule } from '@nebular/theme';
import { DxButtonModule } from 'devextreme-angular';

import { ThemeModule } from '../../@theme/theme.module';
import { DashboardComponent } from './dashboard.component';

@NgModule({
  imports: [
    NbCardModule,
    ThemeModule,
    DxButtonModule
  ],
  declarations: [
    DashboardComponent,
  ],
})
export class DashboardModule { }
