import '../../core/core.dart';
import 'presenter/controllers/categories_controller.dart';
import 'presenter/pages/home_page.dart';

class HomeModuleRoutes extends ModuleRoutes {
  @override
  List<BaseRoute> get routes => [
        BaseRoute(
          name: HomeRoutesEnum.home.name,
          path: HomeRoutesEnum.home.path,
          builder: (context, state) => HomePage(controller: ServiceLocator.instance.get<CategoriesController>()),
        ),
      ];
}

enum HomeRoutesEnum {
  home('/home', 'home');

  final String path;
  final String name;

  const HomeRoutesEnum(this.path, this.name);
}
