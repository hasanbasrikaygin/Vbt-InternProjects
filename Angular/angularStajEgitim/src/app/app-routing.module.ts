import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { CategoryComponent } from './category/category.component';
import { ProductComponent } from './product/product.component';

const routes: Routes = [

  {
    path: 'product',
    component: ProductComponent //url geldiginde bu componenti cagir
  },
  {
    path: 'category',
    component: CategoryComponent //url geldiginde bu componenti cagir
  }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
