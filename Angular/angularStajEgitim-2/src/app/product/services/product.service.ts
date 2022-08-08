import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { lastValueFrom, map, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';

@Injectable()
export class ProductService {

  private readonly apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getProducts(): Observable<any> {
    return this.http.get(`${this.apiUrl}Products`).pipe(map(response => response));
  }

  getProductByCategoryId(categoryId: number): Observable<any> {
    return this.http.get(`${this.apiUrl}Categories/${categoryId}/Products`).pipe(map(response => response));
  }
  //https://demodata.grapecity.com/northwind/api/v1/Categories/1/Products
  async getProducts2(): Promise<any> {
    return await lastValueFrom(this.http.get(`${this.apiUrl}Products`).pipe(map(response => response)));
  }

}