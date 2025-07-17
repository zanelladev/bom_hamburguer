import 'package:flutter/material.dart';

import '../colors/app_color_scheme.dart';
import '../extensions/app_text_styles_extension.dart';

class AppTheme {
  static ThemeData get() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const AppColorScheme(),
      extensions: [AppTextStylesExtension.get()],
    );
  }
}
