import '../../../../core/core.dart';
import '../entities/category_entity.dart';
import '../repositories/i_category_repository.dart';

class GetCategoriesUsecase implements AsyncUsecaseContract<List<CategoryEntity>> {
  final ICategoryRepository repository;

  const GetCategoriesUsecase(this.repository);

  @override
  AsyncResult<List<CategoryEntity>> execute() {
    return repository.getCategories();
  }
}
