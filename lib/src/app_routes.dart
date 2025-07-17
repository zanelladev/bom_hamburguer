import 'package:go_router/go_router.dart';

import 'core/core.dart';
import 'modules/home/home_module_routes.dart';

class AppRouter {
  static final AppRouter instance = AppRouter._internal();

  factory AppRouter() => instance;

  AppRouter._internal();

  GoRouter get router {
    return GoRouter(
      navigatorKey: AppGlobalKeys.navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: HomeRoutesEnum.home.path,
      routes: _routes,
    );
  }

  List<GoRoute> get _routes {
    return modulesRoutes.expand((module) => module.getRoutes()).toList();
  }

  List<ModuleRoutes> get modulesRoutes {
    return [HomeModuleRoutes()];
  }
}
