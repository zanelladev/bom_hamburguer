import '../../../../core/core.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/item_entity.dart';
import '../../domain/enums/category_type_enum.dart';
import '../../domain/repositories/i_category_repository.dart';
import '../exceptions/category_exceptions.dart';

class CategoryRepository implements ICategoryRepository {
  @override
  AsyncResult<List<CategoryEntity>> getCategories() {
    try {
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

      return right(categories);
    } catch (e, st) {
      return left(GetCategoriesException(
        message: 'Failed to get categories',
        stackTrace: st,
      ));
    }
  }
}
