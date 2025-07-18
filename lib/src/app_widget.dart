import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _router = AppRouter.instance.router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.get(),
      title: 'Bom Hamburguer',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
