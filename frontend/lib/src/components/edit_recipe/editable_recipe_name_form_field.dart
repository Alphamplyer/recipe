
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';
import 'package:frontend/src/shared/theme.dart';

class EditableRecipeNameFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String?)? onValidate;

  const EditableRecipeNameFormField({Key? key, required this.controller, this.onValidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      decoration: CustomTheme.onCardInputDecorationThemeWithoutCounterText(context),
      keyboardAppearance: Theme.of(context).brightness,
      maxLength: kMaxRecipeNameLength,
      validator: (value) {
        onValidate?.call(value);
        return null;
      },
    );
  }
}