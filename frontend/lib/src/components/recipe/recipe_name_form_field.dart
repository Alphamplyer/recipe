

import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeNameFormField extends StatelessWidget {
  final TextEditingController controller;

  const RecipeNameFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Name',
      ),
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