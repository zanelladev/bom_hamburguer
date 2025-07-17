import 'package:flutter/material.dart';

import 'app_text_styles_extension.dart';

extension ContextThemeExtension on BuildContext {
  AppTextStylesExtension get texts => Theme.of(this).extension<AppTextStylesExtension>()!;
  ColorScheme get colors => Theme.of(this).colorScheme;
}
