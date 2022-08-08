import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProductComponent } from './product/product.component';
import { KdvPipe } from './shared/pipe/kdv.pipe';
import { PipeModule } from './shared/pipe/pipe.module';
import { FormsModule } from '@angular/forms';
import { CategoryComponent } from './category/category.component';
import { ProductService } from './product/services/product.service';

@NgModule({
  declarations: [
    AppComponent,
    ProductComponent,
    CategoryComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    PipeModule,
    FormsModule,
  ],
  providers: [
    ProductService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
