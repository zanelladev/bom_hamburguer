import '../../../../core/core.dart';
import '../../domain/dtos/order_item_dto.dart';
import '../../domain/repositories/i_order_repository.dart';
import '../../domain/value_objects/order_resume_vo.dart';
import '../exceptions/category_exceptions.dart';

class OrderRepository implements IOrderRepository {
  @override
  AsyncResult<OrderResumeVO> getOrderResume(OrderDto dto) {
    try {
      return right(OrderResumeVO(
        total: 1,
        subtotal: 1,
        discount: 0,
      ));
    } catch (e, st) {
      return left(GetCategoriesException(
        message: 'Failed to get categories',
        stackTrace: st,
      ));
    }
  }
}
