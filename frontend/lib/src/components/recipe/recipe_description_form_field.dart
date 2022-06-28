
import 'package:flutter/material.dart';

class RecipeDescriptionFormField extends StatelessWidget {
  final TextEditingController controller;
  const RecipeDescriptionFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Description (Optional)',
      ),
      maxLength: 256,
      maxLines: null,
      enableSuggestions: true,
      validator: (value) {
        if (value != null && value.length > 256) {
          return 'Description must be less than 256 characters';
        }
        return null;
      },
    );
  }
}