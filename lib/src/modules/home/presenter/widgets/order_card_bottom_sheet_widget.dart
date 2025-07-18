import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../controllers/order_controller.dart';
import '../controllers/order_state.dart';

class OrderCardBottomSheetWidget extends StatelessWidget {
  final OrderController controller;

  const OrderCardBottomSheetWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, child) {
        if (state.isInitial) return const SizedBox.shrink();

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: context.texts.paragraphMedium,
              ),
              const SizedBox(height: 8),
              Builder(builder: (context) {
                if (state is OrderErrorState) {
                  return Text(
                    state.error.message,
                    style: context.texts.paragraphMedium.copyWith(color: Colors.red),
                  );
                }

                if (state is OrderLoadedState) {
                  return Text(
                    ': ${state.orderResume.total}',
                    style: context.texts.paragraphMedium,
                  );
                }

                return const SizedBox.shrink();
              }),
            ],
          ),
        );
      },
    );
  }
}
