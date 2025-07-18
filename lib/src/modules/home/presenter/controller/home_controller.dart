// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/core.dart';

class HomeController extends AppNotifier<HomeState> {
  HomeController() : super(HomeState(categories: [])) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    final categories = [
      const Category(
        name: 'Sandwich',
        type: CategoryType.sandwich,
        items: [
          Item(
            id: 1,
            name: 'X Burger',
            price: 5,
            description: 'A classic burger with lettuce and tomato.',
            imageUrl:
                'https://static.vecteezy.com/system/resources/previews/027/143/844/non_2x/delicious-cheese-burger-on-transparent-background-png.png',
          ),
          Item(
            id: 2,
            name: 'X Egg',
            price: 4.5,
            description: 'A burger with a fried egg on top.',
          ),
          Item(
            id: 3,
            name: 'X Bacon',
            price: 7,
            description: 'A delicious burger with crispy bacon.',
          ),
        ],
      ),
      const Category(
        name: 'Extras',
        type: CategoryType.extras,
        items: [
          Item(
            id: 4,
            name: 'Fries',
            price: 2,
            description: 'Crispy golden fries served with ketchup.',
          ),
          Item(
            id: 5,
            name: 'Soft drink',
            price: 2.5,
          ),
        ],
      ),
    ];

    setData(HomeState(
      categories: categories,
      status: AppStatus.loaded,
    ));
  }

  void toggleItemSelection(Item item) {
    final categories = value.categories.map((category) {
      if (!category.items.any((i) => i.id == item.id)) return category;

      final updatedItems = category.items.map((i) {
        if (i.id == item.id) {
          return i.copyWith(isSelected: !i.isSelected);
        }

        return category.type == CategoryType.sandwich ? i.copyWith(isSelected: false) : i;
      }).toList();

      return category.copyWith(items: updatedItems);
    }).toList();

    setData(value.copyWith(categories: categories));
  }

  double calculateDiscountedTotal() {
    final selectedItems = value.categories.expand((c) => c.items).where((item) => item.isSelected).toList();

    double total = selectedItems.fold(0, (sum, item) => sum + item.price);

    final hasSandwich = selectedItems.any((item) => _getItemCategoryType(item) == CategoryType.sandwich);
    final hasFries = selectedItems.any((item) => item.name.toLowerCase() == 'fries');
    final hasSoftDrink = selectedItems.any((item) => item.name.toLowerCase() == 'soft drink');

    if (hasSandwich && hasFries && hasSoftDrink) {
      total *= 0.8;
    } else if (hasSandwich && hasSoftDrink) {
      total *= 0.85;
    } else if (hasSandwich && hasFries) {
      total *= 0.9;
    }

    return total;
  }

  CategoryType _getItemCategoryType(Item item) {
    for (final category in value.categories) {
      if (category.items.any((i) => i.id == item.id)) {
        return category.type;
      }
    }

    throw Exception('Item category not found.');
  }
}

class HomeState extends AppState {
  final List<Category> categories;

  const HomeState({
    required this.categories,
    super.status = AppStatus.initial,
  });

  HomeState copyWith({
    List<Category>? categories,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
    );
  }
}

class Category {
  final String name;
  final CategoryType type;
  final List<Item> items;

  const Category({
    required this.name,
    required this.type,
    required this.items,
  });

  Category copyWith({
    String? name,
    CategoryType? type,
    List<Item>? items,
  }) {
    return Category(
      name: name ?? this.name,
      type: type ?? this.type,
      items: items ?? this.items,
    );
  }
}

enum CategoryType {
  sandwich,
  extras,
}

class Item {
  final int id;
  final String name;
  final double price;
  final String? description;
  final String? imageUrl;
  final bool isSelected;

  const Item({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageUrl,
    this.isSelected = false,
  });

  Item copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    bool? isSelected,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
