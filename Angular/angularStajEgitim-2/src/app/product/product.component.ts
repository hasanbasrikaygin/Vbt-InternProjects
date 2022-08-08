import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProductModel } from './models/product.model';
import { ProductService } from './services/product.service';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent implements OnInit {

  products: ProductModel[] = [];
  //product: ProductModel = new ProductModel ();
  filteredText: string;
  constructor(private productService: ProductService, private activatedRoute: ActivatedRoute) { }

  ngOnInit() {
    // this.getProducts(0);
    // this.getProducts2();
    this.getRoteControl();

  }
  getProducts(categoryId: number) {
    if (categoryId > 0) {
      this.productService.getProductByCategoryId(categoryId).subscribe(response => {
        this.products = response;
      });
    }
    else {
      this.productService.getProducts().subscribe(response => {
        this.products = response;
      });
    }
  }
  getRoteControl() {
    this.activatedRoute.params.subscribe(param => {
      const id = param["categoryId"];
      let id2 = Number(id);

      if (isNaN(id2)) {
        id2 = 0;
      }
      this.getProducts(id2)
      //this.getProducts(isNaN(Number(id)) ? 0 : Number(id))
    });
  }
  async getProducts2() {
    await this.productService.getProducts2().then(response => {
      debugger;
    });
  }
}
