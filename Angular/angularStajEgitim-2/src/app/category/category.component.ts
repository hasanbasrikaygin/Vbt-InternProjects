import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';

import { CategoryService } from './services/category.service';

@Component({
    selector: 'app-category',
    templateUrl: 'category.component.html'
})
export class CategoryComponent implements OnInit {
    // categories: CategoryModel[ ] =[ ];
    categories$ = this.categoryService.categories$;

    constructor(private categoryService: CategoryService) { }
    ngOnInit() {
        this.getCatogories();
    }
    getCatogories() {
        this.categoryService.getCategories().subscribe();
    }
}