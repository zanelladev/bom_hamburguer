import '../../../../core/core.dart';
import '../../domain/dtos/order_item_dto.dart';
import '../../domain/entities/order_item_entity.dart';
import '../../domain/usecases/get_order_resume_usecase.dart';
import 'order_state.dart';

class OrderController extends AppNotifier<OrderState> {
  final GetOrderResumeUsecase getOrderResumeUsecase;

  OrderController(this.getOrderResumeUsecase) : super(OrderInitialState());

  Future<void> getOrder(List<int> itemsId) async {
    setData(OrderLoadingState());

    final result = await getOrderResumeUsecase.execute(
      OrderDto(
        items: itemsId.map((id) => OrderItemEntity(id: id, count: 1)).toList(),
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

  void onCustomerNameChanged(String name) {
    if (value is! OrderLoadedState) return;

    final currentState = value as OrderLoadedState;
    setData(OrderLoadedState(
      orderResume: currentState.orderResume,
      customerName: name,
    ));
  }

  void confirmOrder() {
    if (value is! OrderLoadedState) return;

    final order = (value as OrderLoadedState).orderResume;

    setData(OrderConfirmedState(order: order));
  }
}
