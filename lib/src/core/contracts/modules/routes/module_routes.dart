import 'package:go_router/go_router.dart';

import 'base_route.dart';
import 'go_router_adapter.dart';

abstract class ModuleRoutes {
  List<GoRoute> getRoutes() {
    return routes.map(GoRouterAdapter.toGoRouter).toList();
  }

  List<BaseRoute> get routes;
}
