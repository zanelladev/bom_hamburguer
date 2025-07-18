import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AppDivider extends StatelessWidget {
  final double height;

  const AppDivider({super.key, this.height = 32});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.neutral300, thickness: 1, height: height);
  }
}
