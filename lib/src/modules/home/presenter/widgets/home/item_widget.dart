import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/item_entity.dart';

class ItemWidget extends StatelessWidget {
  final ItemEntity item;
  final void Function(int itemId) toggleItemSelection;

  const ItemWidget({
    super.key,
    required this.item,
    required this.toggleItemSelection,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toggleItemSelection(item.id),
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: item.isSelected ? AppColors.neutral100 : AppColors.neutral050,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: item.isSelected ? AppColors.neutral200 : AppColors.neutral050,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: context.texts.paragraphMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description ?? '',
                        style: context.texts.paragraphSmall.copyWith(
                          color: AppColors.neutral500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$ ${item.price.toStringAsFixed(2)}',
                        style: context.texts.paragraphMedium,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: item.imageUrl != null
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(item.imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
