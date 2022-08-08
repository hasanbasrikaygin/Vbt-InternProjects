import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
    name: 'kdv'
})

export class KdvPipe implements PipeTransform {
    transform(value: number, kdv: number = 18): any {
        return value + ((value / 100) * kdv);
    }
}