import { NgModule } from '@angular/core';
import { FilterPipe } from './filter.pipe';
import { KdvPipe } from './kdv.pipe';

@NgModule({

    exports: [KdvPipe, FilterPipe],
    declarations: [KdvPipe, FilterPipe],

})
export class PipeModule { }
