import 'package:flutter/widgets.dart';

import 'src/app_injections.dart';
import 'src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppInjections.initialize();

  runApp(const AppWidget());
}
