enum CategoryTypeEnum {
  sandwich,
  extras;

  bool get isSandwich => this == CategoryTypeEnum.sandwich;
  bool get isExtras => this == CategoryTypeEnum.extras;

  static CategoryTypeEnum fromString(String value) {
    return switch (value) {
      'sandwich' => CategoryTypeEnum.sandwich,
      'extras' => CategoryTypeEnum.extras,
      _ => throw ArgumentError('Unknown category type: $value')
    };
  }
}
