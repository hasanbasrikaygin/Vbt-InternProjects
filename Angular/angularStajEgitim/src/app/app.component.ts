import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  // component oldugunun anlasilmasini saglar
  selector: 'app-root',// bu tagi html tag'i gibi kullanabilecegimiz isim
  templateUrl: './app.component.html',//ustteki selector cagrildiginda bu url'yi calistir
  //html dosyasi kullanmak zorunda degiliz eger kullanmayacaksak;
  //template: '<div>{{title}}</div>',
  styleUrls: ['./app.component.scss']
  //style kullanimida zorunlu degildir
})
export class AppComponent {

}
