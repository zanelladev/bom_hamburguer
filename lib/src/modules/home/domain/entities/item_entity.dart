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
    int? id,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    bool? isSelected,
  }) {
    return ItemEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
