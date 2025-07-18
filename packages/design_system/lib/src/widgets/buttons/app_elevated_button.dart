import 'package:flutter/material.dart';

import '../../common/extensions/context_theme_extensions.dart';

class AppElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const AppElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: isLoading
          ? CircularProgressIndicator()
          : Text(
              label,
              style: context.texts.paragraphSmall.copyWith(color: textColor, fontWeight: FontWeight.bold),
            ),
    );
  }
}
