import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.get(),
      title: 'AJAPRA',
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.instance.router,
    );
  }
}
