import 'package:flutter/material.dart';

import 'route_transitions.dart';
import 'routes.dart';

class RouteParams {
  final Map<String, String>? queryParameters;
  final Map<String, String>? pathParameters;
  final Object? extra;

  const RouteParams({
    this.queryParameters,
    this.pathParameters,
    this.extra,
  });
}

class BaseRoute {
  final Routes route;
  final Widget Function(BuildContext context, RouteParams params)? builder;
  final Page<dynamic> Function(BuildContext context, RouteParams params)? pageBuilder;
  final RouteTransitions transition;

  const BaseRoute({
    required this.route,
    this.builder,
    this.pageBuilder,
    this.transition = RouteTransitions.standard,
  });
}
