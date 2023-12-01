import 'package:flutter/material.dart';
import 'package:santa/core/component/app_form_field.dart';
import 'package:santa/core/helper/app_colors.dart';
import 'package:santa/core/helper/space.dart';
import 'package:santa/core/helper/validators.dart';
import 'package:santa/core/theme/app_styles.dart';

class TitledFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyBoardType;
  final bool needDiscriptionField;

  const TitledFormField(
      {super.key,
      required this.title,
      required this.controller,
      required this.hintText,
      this.needDiscriptionField = false,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.text16.copyWith(color: AppColors.black),
        ),
        verticalSpace(5),
        AppFormField(
          hideErrorText: false,
          validator: FormFieldValidators.notEmpty,
          hintText: hintText,
          controller: controller,
        ),
      ],
    );
  }
}
