import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../home_module_routes.dart';
import '../../controllers/order_controller.dart';
import '../../controllers/order_state.dart';

class OrderCardBottomSheetWidget extends StatelessWidget {
  final VoidCallback onOrderConfirmed;
  final OrderController controller;

  const OrderCardBottomSheetWidget({
    super.key,
    required this.controller,
    required this.onOrderConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (!state.isLoaded) return const SizedBox.shrink();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.neutral900.withValues(alpha: 0.2),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total Order',
                      style: context.texts.paragraphSmall.copyWith(
                        color: AppColors.neutral600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 24,
                      child: Builder(builder: (context) {
                        if (state is OrderLoadingState) {
                          return SizedBox(
                            height: 24,
                            width: 24,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.neutral400),
                            ),
                          );
                        }

                        if (state is OrderLoadedState) {
                          return Row(
                            children: [
                              Text(
                                '\$ ${state.orderResume.total.toStringAsFixed(2)} ',
                                style: context.texts.paragraphMedium.copyWith(
                                  color: AppColors.success500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '/ ${state.orderResume.items.length} items',
                                style: context.texts.paragraphSmall.copyWith(
                                  color: AppColors.neutral600,
                                ),
                              ),
                              Visibility(
                                visible: state.orderResume.discountPercentage > 0,
                                child: Text(
                                  ' (${state.orderResume.discountPercentage.toStringAsFixed(0)}% off)',
                                  style: context.texts.paragraphSmall.copyWith(
                                    color: AppColors.neutral600,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }

                        return const SizedBox.shrink();
                      }),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Visibility(
                visible: state is OrderLoadedState,
                child: AppElevatedButton(
                  label: 'Detail Order',
                  onPressed: () {
                    context.pushNamed(HomeRoutesEnum.orderDetails.name).then((value) {
                      if (value == true) {
                        onOrderConfirmed();
                      }
                    });
                  },
                  isLoading: state.isLoading,
                  backgroundColor: AppColors.success500,
                  textColor: AppColors.neutral050,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
