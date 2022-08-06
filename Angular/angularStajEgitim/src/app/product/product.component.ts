import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ProductModel } from './models/product.model';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent implements OnInit {

  title = 'angularStajEgitim';

  //DEGISKENLER

  name: string = 'ngModel ';
  name2 = 'Basri';//string olarak belirtmek zorunda degiliz
  number = 1;
  nameSurname: string = "Reactive Form ";
  year: number = 2022;
  date: Date = new Date();
  bool: boolean = false;

  form: FormGroup = new FormGroup({
    nameSurname: new FormControl('reactive form', Validators.required)//Validators.required => zorunlu alan
  });

  product: ProductModel = new ProductModel();

  constructor() { }

  ngOnInit(): void {
    this.setProduct();
    //this.setProduct2();
  }
  setProduct() {
    this.product.nameModel = 'setProduct1';
    this.product.year = 1999;
    this.date = new Date();
    this.bool = true;
  }
  setProduct2() {
    this.product = {
      nameModel: 'setProduct2',
      year: 2010,
      date: new Date(),
      bool: false,
    }
  }
}
