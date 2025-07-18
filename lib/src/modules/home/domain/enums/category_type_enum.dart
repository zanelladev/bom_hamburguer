enum CategoryTypeEnum {
  sandwich,
  extras;

  bool get isSandwich => this == CategoryTypeEnum.sandwich;
  bool get isExtras => this == CategoryTypeEnum.extras;
}
