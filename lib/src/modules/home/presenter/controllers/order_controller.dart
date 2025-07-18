import '../../../../core/core.dart';
import '../../domain/dtos/order_item_dto.dart';
import '../../domain/usecases/get_order_resume_usecase.dart';
import 'order_state.dart';

class OrderController extends AppNotifier<OrderState> {
  final GetOrderResumeUsecase getOrderResumeUsecase;

  OrderController(this.getOrderResumeUsecase) : super(OrderInitialState());

  Future<void> fetchCategories() async {
    setData(OrderLoadingState());

    final result = await getOrderResumeUsecase.execute(
      OrderDto(
        items: [],
      ),
    );

    result.fold(
      (failure) {
        setData(OrderErrorState(error: failure));
      },
      (orderResume) {
        setData(OrderLoadedState(orderResume: orderResume));
      },
    );
  }
}
