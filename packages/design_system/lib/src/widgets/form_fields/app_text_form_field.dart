import 'package:flutter/material.dart';

import '../../../design_system.dart';

class AppTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const AppTextFormField({super.key, this.label, this.hint, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final InputBorder defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.neutral200),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(label ?? '', style: context.texts.paragraphSmall.copyWith(fontWeight: FontWeight.bold)),
          ),
        ),
        TextFormField(
          onChanged: onChanged,
          onFieldSubmitted: (value) => FocusManager.instance.primaryFocus?.nextFocus(),
          onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          validator: validator,
          style: context.texts.paragraphSmall,

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.texts.paragraphSmall.copyWith(
              color: AppColors.neutral400,
              overflow: TextOverflow.ellipsis,
            ),
            fillColor: AppColors.white,
            errorMaxLines: 2,
            errorStyle: context.texts.paragraphXSmall.copyWith(color: AppColors.destructive600),
            helperStyle: context.texts.paragraphSmall.copyWith(color: AppColors.neutral600),

            border: defaultBorder,
            enabledBorder: defaultBorder,
            focusedBorder: defaultBorder.copyWith(borderSide: const BorderSide(color: AppColors.neutral900)),
            errorBorder: defaultBorder.copyWith(borderSide: const BorderSide(color: AppColors.destructive300)),
            focusedErrorBorder: defaultBorder.copyWith(borderSide: const BorderSide(color: AppColors.destructive300)),
            disabledBorder: defaultBorder.copyWith(borderSide: const BorderSide(color: AppColors.neutral300)),
          ),
        ),
      ],
    );
  }
}
