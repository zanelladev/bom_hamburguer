import '../../../../core/core.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/enums/category_type_enum.dart';
import '../../domain/extensions/update_category_extension.dart';
import 'home_state.dart';

class HomeController extends AppNotifier<HomeState> {
  HomeController() : super(HomeState(categories: [])) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    final categories = [
      const CategoryEntity(
        id: 1,
        name: 'Sandwich',
        type: CategoryTypeEnum.sandwich,
        items: [
          ItemEntity(
            id: 1,
            name: 'X Burger',
            price: 5,
            description: 'A classic burger with lettuce and tomato.',
            imageUrl:
                'https://static.vecteezy.com/system/resources/previews/027/143/844/non_2x/delicious-cheese-burger-on-transparent-background-png.png',
          ),
          ItemEntity(
            id: 2,
            name: 'X Egg',
            price: 4.5,
            description: 'A burger with a fried egg on top.',
          ),
          ItemEntity(
            id: 3,
            name: 'X Bacon',
            price: 7,
            description: 'A delicious burger with crispy bacon.',
          ),
        ],
      ),
      const CategoryEntity(
        id: 2,
        name: 'Extras',
        type: CategoryTypeEnum.extras,
        items: [
          ItemEntity(
            id: 4,
            name: 'Fries',
            price: 2,
            description: 'Crispy golden fries served with ketchup.',
          ),
          ItemEntity(
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

  void toggleItemSelection(int itemId) {
    final categories = value.categories.map((category) {
      return category.selectItem(itemId);
    }).toList();

    setData(
      value.copyWith(
        categories: categories,
      ),
    );
  }
}
