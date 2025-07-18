import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category_entity.dart';
import 'item_widget.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryEntity category;
  final void Function(int itemId) toggleItemSelection;

  const CategoryWidget({
    super.key,
    required this.category,
    required this.toggleItemSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category.name, style: context.texts.headingH6.copyWith(fontWeight: FontWeight.bold)),
        const AppDivider(),
        ListView.separated(
          itemCount: category.items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const AppDivider(),
          itemBuilder: (context, index) {
            return ItemWidget(
              item: category.items[index],
              toggleItemSelection: toggleItemSelection,
            );
          },
        ),
        const AppDivider(),
      ],
    );
  }
}
