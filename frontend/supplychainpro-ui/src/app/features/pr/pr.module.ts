import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PrRoutingModule } from './pr-routing.module';
import { PrComponent } from './pr.component';


@NgModule({
  declarations: [
    PrComponent
  ],
  imports: [
    CommonModule,
    PrRoutingModule
  ]
})
export class PrModule { }
