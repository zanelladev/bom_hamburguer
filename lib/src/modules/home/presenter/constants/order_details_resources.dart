class OrderDetailsResources {
  static const title = 'Order Details';
  static const summaryOfValues = 'Summary of Values';
  static const subtotal = 'Subtotal';
  static const discount = 'Discount';
  static const total = 'Total';
  static String orderValue(double total) => '\$ ${total.toStringAsFixed(2)}';

  static const customerName = 'Customer Name';
  static const customerNameHint = 'Enter customer name';
  static const customerNameRequired = 'Customer name is required';

  static const confirmOrder = 'Confirm Order';
}
