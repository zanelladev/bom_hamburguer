import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.neutral300, thickness: 1, height: 32);
  }
}
