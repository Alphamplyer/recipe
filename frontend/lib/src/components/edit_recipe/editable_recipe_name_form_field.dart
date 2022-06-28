
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';
import 'package:frontend/src/shared/theme.dart';

class EditableRecipeNameFormField extends StatelessWidget {
  final TextEditingController controller;

  const EditableRecipeNameFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      decoration: CustomTheme.onCardInputDecorationThemeWithoutCounterText(context),
      maxLength: kMaxRecipeNameLength,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'A name is required';
        } else if (value.length > 128) {
          return 'Name must be less than 128 characters';
        } else if (value.length < 3) {
          return 'Name must be at least 3 characters';
        }
        return null;
      },
    );
  }
}