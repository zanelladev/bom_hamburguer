import '../../core/core.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/order_repository.dart';
import 'domain/repositories/i_category_repository.dart';
import 'domain/repositories/i_order_repository.dart';
import 'domain/usecases/get_categories_usecase.dart';
import 'domain/usecases/get_order_resume_usecase.dart';
import 'presenter/controllers/categories_controller.dart';
import 'presenter/controllers/order_controller.dart';

class HomeModuleInjections extends ModuleInjections {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory<ICategoryRepository>(
      () => CategoryRepository(),
    );

    ServiceLocator.instance.bindFactory<GetCategoriesUsecase>(
      () => GetCategoriesUsecase(ServiceLocator.instance.get<ICategoryRepository>()),
    );

    ServiceLocator.instance.bindSingleton<CategoriesController>(CategoriesController(
      ServiceLocator.instance.get<GetCategoriesUsecase>(),
    ));

    ServiceLocator.instance.bindFactory<IOrderRepository>(
      () => OrderRepository(),
    );

    ServiceLocator.instance.bindFactory<GetOrderResumeUsecase>(
      () => GetOrderResumeUsecase(ServiceLocator.instance.get<IOrderRepository>()),
    );

    ServiceLocator.instance.bindFactory<OrderController>(() => OrderController(
          ServiceLocator.instance.get<GetOrderResumeUsecase>(),
        ));
  }
}
