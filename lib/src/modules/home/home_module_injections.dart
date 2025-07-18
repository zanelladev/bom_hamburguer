import '../../core/core.dart';
import 'data/repositories/category_repository.dart';
import 'domain/repositories/i_category_repository.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'presenter/controllers/categories_controller.dart';

class HomeModuleInjections extends ModuleInjections {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory<ICategoryRepository>(
      () => CategoryRepository(),
    );

    ServiceLocator.instance.bindFactory<GetCategoriesUsecase>(
      () => GetCategoriesUsecase(ServiceLocator.instance.get<ICategoryRepository>()),
    );

    ServiceLocator.instance.bindFactory<CategoriesController>(() => CategoriesController(
          ServiceLocator.instance.get<GetCategoriesUsecase>(),
        ));
  }
}
