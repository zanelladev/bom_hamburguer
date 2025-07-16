import 'package:go_router/go_router.dart';

import 'base_route.dart';

abstract class GoRouterAdapter {
  static GoRoute toGoRouter(BaseRoute route) {
    return GoRoute(
      path: route.route.path,
      name: route.route.name,
      builder: route.builder != null
          ? (context, state) {
              final routeState = _toRouteState(state);
              return route.builder!(
                context,
                routeState,
              );
            }
          : null,
      pageBuilder: route.pageBuilder != null
          ? (context, state) {
              final routeState = _toRouteState(state);
              return route.pageBuilder!(
                context,
                routeState,
              );
            }
          : null,
    );
  }

  static RouteParams _toRouteState(GoRouterState state) {
    return RouteParams(
      extra: state.extra,
      queryParameters: state.uri.queryParameters,
      pathParameters: state.pathParameters,
    );
  }
}
