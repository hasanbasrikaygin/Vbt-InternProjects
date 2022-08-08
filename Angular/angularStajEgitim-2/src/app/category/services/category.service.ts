import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BehaviorSubject, map, Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { CategoryModel } from '../models/category.model';

@Injectable({ providedIn: 'root' })
export class CategoryService {

    private readonly apiUrl = environment.apiUrl;

    private readonly _categories = new BehaviorSubject<CategoryModel[]>([]);
    readonly categories$ = this._categories.asObservable();

    constructor(private http: HttpClient) { }
    getCategories(): Observable<CategoryModel[]> {
        return this.http.get(`${this.apiUrl}Categories`).pipe(map((response: CategoryModel[]) => {
            this._categories.next(response);
            return response;
        }
        )
        );
    }
}