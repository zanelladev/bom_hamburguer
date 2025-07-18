import '../../../../core/core.dart';
import '../../data/exceptions/order_exceptions.dart';
import '../entities/order_item_entity.dart';

class OrderDto extends DTOValidate {
  final List<OrderItemEntity> items;

  const OrderDto({
    required this.items,
  });

  @override
  Result<OrderDto> validate() {
    for (final item in items) {
      if (item.id <= 0) return left(InvalidOrderId());
      if (item.count <= 0) return left(InvalidOrderCount());
    }

    return right(this);
  }
}
