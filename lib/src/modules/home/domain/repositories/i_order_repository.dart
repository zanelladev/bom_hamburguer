import '../../../../core/core.dart';
import '../dtos/order_item_dto.dart';
import '../value_objects/order_resume_vo.dart';

abstract interface class IOrderRepository {
  AsyncResult<OrderResumeVO> getOrderResume(OrderDto dto);
}
