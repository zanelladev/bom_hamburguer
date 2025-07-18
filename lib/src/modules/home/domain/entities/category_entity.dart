import 'dart:convert';

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

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      type: CategoryTypeEnum.fromString(map['type'] as String),
      items: List<ItemEntity>.from(
        (map['items'] as List<int>).map<ItemEntity>(
          (x) => ItemEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory CategoryEntity.fromJson(String source) => CategoryEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
