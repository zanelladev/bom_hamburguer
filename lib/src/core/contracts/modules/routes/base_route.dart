import 'package:flutter/material.dart';

import 'route_transitions.dart';

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
  final String name;
  final String path;
  final Widget Function(BuildContext context, RouteParams params)? builder;
  final Page<dynamic> Function(BuildContext context, RouteParams params)? pageBuilder;
  final RouteTransitions transition;

  const BaseRoute({
    required this.name,
    required this.path,
    this.builder,
    this.pageBuilder,
    this.transition = RouteTransitions.standard,
  });
}
