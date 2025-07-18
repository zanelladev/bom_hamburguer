import '../enums/category_type_enum.dart';
import 'item_entity.dart';

class CategoryEntity {
  final int id;
  final String name;
  final CategoryTypeEnum type;
  final List<ItemEntity> items;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.items,
  });

  CategoryEntity copyWith({
    String? name,
    CategoryTypeEnum? type,
    List<ItemEntity>? items,
  }) {
    return CategoryEntity(
      id: id,
      name: name ?? this.name,
      type: type ?? this.type,
      items: items ?? this.items,
    );
  }
}
