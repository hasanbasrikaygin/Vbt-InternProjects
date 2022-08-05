export class ProductModel {
  nameModel: string;

  year: number;

  date: Date;

  bool: boolean;

  constructor() {
    this.nameModel = '';
    this.bool = false;
    this.date = new Date();
    this.year = 2022;

  }
}