import 'package:flutter/material.dart';

class FormFieldValidators {

  static FormFieldValidator<String> get notEmpty => (String? value) {
        return value!.trim().isEmpty ? 'This field is required' : null;
      };

}
