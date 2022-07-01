
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/theme.dart';

class RecipeStepContentFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  
  const RecipeStepContentFormField({
    Key? key, 
    required this.controller, 
    this.focusNode
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: CustomTheme.onCardInputDecorationTheme(context),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'A content is required';
        } else if (value.length > 1024) {
          return 'Content must be less than 1024 characters';
        } else if (value.length < 3) {
          return 'Content must be at least 3 characters';
        }
        return null;
      },
      maxLines: null,
    );
  }
}