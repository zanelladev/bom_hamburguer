class HomeResources {
  static const homeTitle = 'Bom Hamburguer';
  static const noCategoriesAvailable = 'No categories available';
  static const detailOrder = 'Order Details';
  static const totalOrder = 'Total Order';
  static String orderValue(double total) => '\$ ${total.toStringAsFixed(2)}';
  static String orderItemsCount(int count) => '$count items';
  static String orderDiscount(double discountPercentage) => ' (${discountPercentage.toStringAsFixed(0)}% off)';
}
