import 'package:flutter/foundation.dart';

class AppNotifier<T extends Object> extends ValueNotifier<T> {
  final T initialValue;

  AppNotifier(this.initialValue) : super(initialValue);

  void setData(T data) => value = data;
  void reset() => value = initialValue;
}
