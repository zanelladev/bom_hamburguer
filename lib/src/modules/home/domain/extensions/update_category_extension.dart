import '../entities/category_entity.dart';
import '../entities/item_entity.dart';

extension UpdateCategoryExtension on CategoryEntity {
  CategoryEntity selectItem(int itemId) {
    final containsSelectedItem = items.any((item) => item.id == itemId);

    if (!containsSelectedItem) return this;

    final updatedItems = _getUpdatedItems(this, itemId);
    return copyWith(items: updatedItems);
  }

  List<ItemEntity> _getUpdatedItems(CategoryEntity category, int itemId) {
    return category.items.map((item) {
      if (itemId == item.id) return item.copyWith(isSelected: !item.isSelected);

      return category.type.isSandwich ? item.copyWith(isSelected: false) : item;
    }).toList();
  }
}
