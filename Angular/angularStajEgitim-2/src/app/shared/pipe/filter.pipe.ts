import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
    name: 'filter'
})
export class FilterPipe implements PipeTransform {
    transform(list: any[], prop: string, filterText: string = ''): any {
        if (!filterText) {
            return list;
        }
        filterText = filterText.toLocaleLowerCase();
        return list.filter(x => x[prop]?.toLocaleLowerCase().indexOf(filterText) !== -1);
    }
}