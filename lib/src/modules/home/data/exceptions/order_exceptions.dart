import '../../../../core/core.dart';

sealed class OrderException extends AppException {
  const OrderException({
    required super.message,
    required super.code,
    super.stackTrace = StackTrace.empty,
  });
}

class InvalidOrderCount extends OrderException {
  const InvalidOrderCount()
      : super(code: 'invalid_order_count', message: 'Order item count must be greater than zero.');
}

class InvalidOrderId extends OrderException {
  const InvalidOrderId() : super(code: 'invalid_order_id', message: 'Order item must have a valid id.');
}
