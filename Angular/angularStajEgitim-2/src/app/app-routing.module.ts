import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductComponent } from './product/product.component';

const routes: Routes = [
  {
    path: '', redirectTo: 'product', pathMatch: 'full'
  },
  {
    path: 'product',
    component: ProductComponent
  },
  {
    path: 'product/:categoryId',
    component: ProductComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
