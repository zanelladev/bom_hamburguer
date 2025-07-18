import '../../../../core/core.dart';
import '../dtos/order_item_dto.dart';
import '../repositories/i_order_repository.dart';
import '../value_objects/order_resume_vo.dart';

class GetOrderResumeUsecase implements AsyncUsecaseWithParamsContract<OrderResumeVO, OrderDto> {
  final IOrderRepository repository;

  const GetOrderResumeUsecase(this.repository);

  @override
  AsyncResult<OrderResumeVO> execute(OrderDto dto) {
    final validation = dto.validate();
    if (validation.isError) return left(validation.error);

    return repository.getOrderResume(dto);
  }
}
