import '../../../../core/core.dart';
import '../entities/category_entity.dart';

abstract interface class ICategoryRepository {
  AsyncResult<List<CategoryEntity>> getCategories();
}
