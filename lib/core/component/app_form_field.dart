import 'package:flutter/material.dart';
import 'package:santa/core/helper/app_colors.dart';
import 'package:santa/core/theme/app_styles.dart';

class AppFormField extends StatelessWidget {
  final Function()? onTap;

  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool? hideErrorText;

  const AppFormField(
      {super.key,
      this.onTap,
      this.hideErrorText,
      this.validator,
      required this.controller,
      this.onChanged,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged ?? (value) {},
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          errorStyle: const TextStyle(color: AppColors.red),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.green, width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 5, 8, 5), width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.green, width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.red, width: 0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          isDense: true,
          hintText: hintText,
          hintStyle: AppStyles.text18W600,
        ),
      ),
    );
  }
}
