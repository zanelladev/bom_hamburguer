import '../../../../core/core.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/i_category_repository.dart';
import '../exceptions/category_exceptions.dart';

class CategoryRepository implements ICategoryRepository {
  @override
  AsyncResult<List<CategoryEntity>> getCategories() {
    try {
      final categories = <CategoryEntity>[];

      return right(categories);
    } catch (e, st) {
      return left(GetCategoriesException(
        message: 'Failed to get categories',
        stackTrace: st,
      ));
    }
  }
}
