import 'package:flutter/material.dart';

import 'custom_navigator.dart';

extension NavigatorExtension on BuildContext {
  CustomNavigator get navigator => CustomNavigator.of(this);
}
