import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../controllers/categories_controller.dart';
import '../controllers/categories_state.dart';
import '../controllers/order_controller.dart';
import '../widgets/category_widget.dart';
import '../widgets/order_card_bottom_sheet_widget.dart';

class HomePage extends StatefulWidget {
  final CategoriesController categoriesController;
  final OrderController orderController;

  const HomePage({
    super.key,
    required this.categoriesController,
    required this.orderController,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    widget.categoriesController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: OrderCardBottomSheetWidget(widget.orderController),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ValueListenableBuilder(
          valueListenable: widget.categoriesController,
          builder: (context, state, child) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CategoriesErrorState) {
              return Center(
                child: Text(
                  state.error.message,
                  style: context.texts.paragraphMedium.copyWith(color: Colors.red),
                ),
              );
            }

            if (state.isEmpty) {
              return Center(
                child: Text(
                  'No categories available',
                  style: context.texts.paragraphMedium,
                ),
              );
            }

            if (state is CategoriesLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryWidget(
                          category: state.categories[index],
                          toggleItemSelection: widget.categoriesController.toggleItemSelection,
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }

  void toggleItemSelection(int itemId) {
    widget.categoriesController.toggleItemSelection(itemId);

    final itemsId = widget.categoriesController.value.categories
        .expand((category) => category.items)
        .where((item) => item.isSelected)
        .map((item) => item.id)
        .toList();

    widget.orderController.getOrder(itemsId);
  }
}
