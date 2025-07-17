import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigator {
  final BuildContext context;

  const CustomNavigator._(this.context);

  factory CustomNavigator.of(BuildContext context) {
    return CustomNavigator._(context);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    return GoRouter.of(context).pushNamed(
      routeName,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }

  Future<T?> push<T extends Object?>(String routePath, {Object? extra}) {
    return GoRouter.of(context).push(routePath, extra: extra);
  }

  void goNamed(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    GoRouter.of(context).goNamed(
      routeName,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }

  void go(String routePath, {Object? extra}) {
    GoRouter.of(context).go(routePath, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    return GoRouter.of(context).pop(result);
  }

  bool canPop() {
    return GoRouter.of(context).canPop();
  }

  Future<T?> pushReplacementNamed<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacementNamed(
      routeName,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }

  Future<T?> pushReplacement<T extends Object?>(
    String routeName, {
    Object? extra,
  }) {
    return GoRouter.of(context).pushReplacement(routeName, extra: extra);
  }

  void refresh() {
    return GoRouter.of(context).refresh();
  }

  Future<T?> replace<T extends Object?>(String routeName, {Object? extra}) {
    return GoRouter.of(context).replace(routeName, extra: extra);
  }

  Future<T?> replaceNamed<T extends Object?>(
    String routeName, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? extra,
  }) {
    return GoRouter.of(context).replaceNamed(
      routeName,
      queryParameters: queryParameters,
      pathParameters: pathParameters,
      extra: extra,
    );
  }
}
