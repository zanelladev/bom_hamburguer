import 'dart:convert';

class ItemEntity {
  final int id;
  final String name;
  final double price;
  final String? description;
  final String? imageUrl;
  final bool isSelected;

  const ItemEntity({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
    this.isSelected = false,
  });

  ItemEntity copyWith({
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    bool? isSelected,
  }) {
    return ItemEntity(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory ItemEntity.fromMap(Map<String, dynamic> map) {
    return ItemEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      description: map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  factory ItemEntity.fromJson(String source) => ItemEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
