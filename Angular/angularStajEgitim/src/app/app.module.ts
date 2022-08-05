import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProductComponent } from './product/product.component';
import { CategoryComponent } from './category/category.component';
//main.ts te cagrilan ilk modül
@NgModule({
  declarations: [//kullanilan componentlerin tanimlandigi kisim
    AppComponent, ProductComponent, CategoryComponent//olusturulan product componenti
  ],
  imports: [//angular icerisindeki veya thirdpart paketleri kullanabilmek icin cagirdigimiz yer
    BrowserModule,
    AppRoutingModule,
    FormsModule,//ngModel'in bagli oldugu kutuphaneyi tanimliyoruz
    ReactiveFormsModule,//reactive form kullanilabilmesi icin kutuphane tanimlama
  ],
  exports: [],//eger componenti disariya acacaksak burada tanimlamamiz gerekiyor yani farklı yerlerde de kullanacaksak
  providers: [],//servisleri tanimladigimiz kisim
  bootstrap: [AppComponent]//baslangi componentini icerir
})
export class AppModule { }
