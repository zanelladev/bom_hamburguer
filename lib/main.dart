import 'package:flutter/widgets.dart';

import 'src/app_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppInjections.initialize();
}
