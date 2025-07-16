import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

class CustomNavigator {
  final BuildContext context;

  const CustomNavigator._(this.context);

  factory CustomNavigator.of(BuildContext context) {
    return CustomNavigator._(context);
  }

  Future<T?> pushNamed<T extends Object?>(
    Routes route, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    return GoRouter.of(context)
        .pushNamed(route.name, queryParameters: queryParameters, pathParameters: pathParameters, extra: extra);
  }

  Future<T?> push<T extends Object?>(
    Routes route, {
    Object? extra,
  }) {
    return GoRouter.of(context).push(route.path, extra: extra);
  }

  void goNamed(
    Routes route, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    GoRouter.of(context)
        .goNamed(route.name, queryParameters: queryParameters, pathParameters: pathParameters, extra: extra);
  }

  void go(
    Routes route, {
    Object? extra,
  }) {
    GoRouter.of(context).go(route.path, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    return GoRouter.of(context).pop(result);
  }

  bool canPop() {
    return GoRouter.of(context).canPop();
  }

  Future<T?> pushReplacementNamed<T extends Object?>(
    Routes route, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacementNamed(
      route.name,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }

  Future<T?> pushReplacement<T extends Object?>(
    Routes route, {
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacement(route.path, extra: extra);
  }

  void refresh() {
    return GoRouter.of(context).refresh();
  }

  Future<T?> replace<T extends Object?>(
    Routes route, {
    Object? extra,
  }) {
    return GoRouter.of(context).replace(route.path, extra: extra);
  }

  Future<T?> replaceNamed<T extends Object?>(
    Routes route, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    return GoRouter.of(context).replaceNamed(
      route.path,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }
}
