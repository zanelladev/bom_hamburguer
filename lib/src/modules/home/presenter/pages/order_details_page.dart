import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/order_details_resources.dart';
import '../controllers/order_controller.dart';
import '../controllers/order_state.dart';
import '../widgets/details/cart_item_widget.dart';

class OrderDetailsPage extends StatefulWidget {
  final OrderController orderController;

  const OrderDetailsPage({
    super.key,
    required this.orderController,
  });

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.neutral900,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          OrderDetailsResources.title,
          style: context.texts.headingH6.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.sizeMd),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: widget.orderController,
                    builder: (context, state, child) {
                      if (state.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is OrderErrorState) {
                        return Center(
                          child: Text(
                            state.error.message,
                            style: context.texts.paragraphMedium.copyWith(color: AppColors.destructive500),
                          ),
                        );
                      }

                      if (state is OrderLoadedState) {
                        final orderItems = state.orderResume.items;

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemCount: orderItems.length,
                                separatorBuilder: (context, index) => AppDivider(height: AppSizes.sizeMd),
                                itemBuilder: (context, index) {
                                  return CartItemWidget(
                                    item: orderItems[index],
                                  );
                                },
                              ),
                              const SizedBox(height: AppSizes.sizeMd),
                              Text(
                                OrderDetailsResources.summaryOfValues,
                                style: context.texts.paragraphMedium.copyWith(
                                  color: AppColors.neutral900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppSizes.sizeSm),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    OrderDetailsResources.subtotal,
                                    style: context.texts.paragraphMedium.copyWith(
                                      color: AppColors.neutral600,
                                    ),
                                  ),
                                  Text(
                                    OrderDetailsResources.orderValue(state.orderResume.subtotal),
                                    style: context.texts.paragraphMedium.copyWith(
                                      color: AppColors.neutral900,
                                    ),
                                  ),
                                ],
                              ),
                              Visibility(
                                visible: state.orderResume.discount > 0,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: AppSizes.sizeSm),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        OrderDetailsResources.discount,
                                        style: context.texts.paragraphMedium.copyWith(
                                          color: AppColors.neutral600,
                                        ),
                                      ),
                                      Text(
                                        '- ${OrderDetailsResources.orderValue(state.orderResume.discount)} (${state.orderResume.discountPercentage.toStringAsFixed(0)}% off)',
                                        style: context.texts.paragraphMedium.copyWith(
                                          color: AppColors.success500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppSizes.sizeSm),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    OrderDetailsResources.total,
                                    style: context.texts.paragraphMedium.copyWith(
                                      color: AppColors.neutral900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    OrderDetailsResources.orderValue(state.orderResume.total),
                                    style: context.texts.paragraphMedium.copyWith(
                                      color: AppColors.neutral900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.sizeMd),
                              AppTextFormField(
                                label: OrderDetailsResources.customerName,
                                hint: OrderDetailsResources.customerNameHint,
                                onChanged: widget.orderController.onCustomerNameChanged,
                                validator: (value) {
                                  if (value == null || value.isEmpty) return OrderDetailsResources.customerNameRequired;

                                  return null;
                                },
                              ),
                            ],
                          ),
                        );
                      }

                      return SizedBox();
                    },
                  ),
                ),
                const SizedBox(height: AppSizes.sizeMd),
                Row(
                  children: [
                    Expanded(
                      child: AppElevatedButton(
                        label: OrderDetailsResources.confirmOrder,
                        backgroundColor: AppColors.success500,
                        textColor: AppColors.neutral050,
                        onPressed: () {
                          if (_formKey.currentState?.validate() != true) return;

                          widget.orderController.confirmOrder();
                          context.pop(true);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.sizeMd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
