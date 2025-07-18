import '../../../../core/core.dart';
import '../../domain/value_objects/order_resume_vo.dart';

sealed class OrderState {
  bool get isInitial => this is OrderInitialState;
  bool get isLoading => this is OrderLoadingState;
  bool get isError => this is OrderErrorState;
  bool get isLoaded => this is OrderLoadedState;

  const OrderState();
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderLoadedState extends OrderState {
  final OrderResumeVO orderResume;
  final String customerName;

  const OrderLoadedState({
    required this.orderResume,
    this.customerName = '',
  });
}

class OrderConfirmedState extends OrderState {
  final OrderResumeVO order;
  final String customerName;

  const OrderConfirmedState({
    required this.order,
    this.customerName = '',
  });
}

class OrderErrorState extends OrderState {
  final AppError error;

  OrderErrorState({
    required this.error,
  });
}
